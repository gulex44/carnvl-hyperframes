#!/usr/bin/env python3
"""The Gemini pass: send a video URL to Gemini, which watches it natively
(its own frames, its own audio), and write timestamped notes.

Usage: scripts/gemini_review.py <url> <out_file> [--focus "what to extract"]
Needs GEMINI_API_KEY. Model defaults to GEMINI_MODEL or gemini-2.5-pro.
Install: pip install google-genai
"""
import argparse
import os
import sys

from google import genai
from google.genai import types

PROMPT = """Watch this video closely, using both the picture and the audio.

Write notes in Markdown with one bullet per observation, in time order.
Start every bullet with a timestamp in the form [mm:ss], then a tag:
  (screen) for something visible on screen: UI, code, text, diagrams, layout
  (audio)  for something only said aloud
Be literal and specific: exact on-screen text, labels, values, colors, order
of steps. Don't guess; if something is unreadable, say so.

Focus: {focus}

End with a section "## Summary" of at most 5 bullets."""


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("url")
    p.add_argument("out_file")
    p.add_argument("--focus", default="everything needed to reproduce what the video shows")
    args = p.parse_args()

    if not os.environ.get("GEMINI_API_KEY"):
        print("GEMINI_API_KEY is not set", file=sys.stderr)
        return 1

    client = genai.Client()
    resp = client.models.generate_content(
        model=os.environ.get("GEMINI_MODEL", "gemini-2.5-pro"),
        contents=types.Content(parts=[
            types.Part(file_data=types.FileData(file_uri=args.url)),
            types.Part(text=PROMPT.format(focus=args.focus)),
        ]),
    )

    os.makedirs(os.path.dirname(os.path.abspath(args.out_file)), exist_ok=True)
    with open(args.out_file, "w") as f:
        f.write(f"# Gemini notes\n\nSource: {args.url}\n\n{resp.text}\n")
    print(f"wrote {args.out_file}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
