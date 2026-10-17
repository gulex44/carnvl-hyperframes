#!/usr/bin/env bash
# Pull a video's frames and captions onto local disk for the Claude pass.
# Usage: scripts/extract.sh <url> <out_dir> [seconds_between_frames]
set -euo pipefail

url="${1:?usage: extract.sh <url> <out_dir> [interval]}"
out="${2:?usage: extract.sh <url> <out_dir> [interval]}"
interval="${3:-5}"

command -v yt-dlp >/dev/null || { echo "yt-dlp not found: pip install yt-dlp" >&2; exit 1; }
command -v ffmpeg >/dev/null || { echo "ffmpeg not found" >&2; exit 1; }

mkdir -p "$out/frames"

# Video capped at 720p (frames only need to be legible) plus captions,
# preferring human-written subs and falling back to auto-generated ones.
yt-dlp -q --no-playlist \
  -f "bv*[height<=720]+ba/b[height<=720]/b" \
  --merge-output-format mp4 \
  --write-subs --write-auto-subs --sub-langs "en.*,en" --sub-format vtt \
  -o "$out/video.%(ext)s" "$url"

# One frame every $interval seconds. File names carry the timestamp (in
# seconds) so both passes can be aligned on time later.
ffmpeg -loglevel error -i "$out/video.mp4" \
  -vf "fps=1/${interval},scale=1280:-2" -q:v 3 "$out/frames/tmp_%05d.jpg"

for f in "$out"/frames/tmp_*.jpg; do
  n=$(basename "$f" .jpg); n=$((10#${n#tmp_}))
  printf -v t "%05d" $(( (n - 1) * interval ))
  mv "$f" "$out/frames/t${t}s.jpg"
done

# Flatten the VTT into "[mm:ss] text" lines with duplicate rolling lines removed.
vtt=$(ls "$out"/video*.vtt 2>/dev/null | head -n1 || true)
if [[ -n "$vtt" ]]; then
  awk '
    /-->/ { split($1, a, ":"); ts = (length(a) == 3) ? a[2] ":" substr(a[3], 1, 2) : a[1] ":" substr(a[2], 1, 2); next }
    /^(WEBVTT|Kind:|Language:|[0-9]+$|$)/ { next }
    { gsub(/<[^>]*>/, ""); if ($0 != last) { print "[" ts "] " $0; last = $0 } }
  ' "$vtt" > "$out/captions.txt"
else
  echo "(no captions available)" > "$out/captions.txt"
fi

echo "frames:   $(ls "$out/frames" | wc -l) in $out/frames"
echo "captions: $out/captions.txt"
