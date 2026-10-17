# video-spec

Two readers, one video. Claude reads frames and captions it pulls locally;
Gemini watches the same URL natively. A third agent reconciles both into a
`SPEC.md` where every line is labeled, so you only check the conflicts.

```
/watch https://www.youtube.com/watch?v=... "the UI and every setting changed"
```

| Piece | What it does |
|---|---|
| `.claude/skills/watch/SKILL.md` | `/watch`: runs both passes in parallel, then the reconcile |
| `.claude/agents/video-watcher.md` | Claude pass: `scripts/extract.sh`, then reads frames and captions → `claude_notes.md` |
| `.claude/agents/gemini-watcher.md` | Gemini pass: `scripts/gemini_review.py` → `gemini_notes.md` |
| `.claude/agents/spec-reconciler.md` | Merge → `SPEC.md` labeled `[BOTH]` / `[CLAUDE ONLY]` / `[GEMINI ONLY]` / `[CONFLICT]` |

Output lands in `runs/<video>/`.

## Setup

```
pip install yt-dlp google-genai   # ffmpeg must be on PATH too
export GEMINI_API_KEY=...          # optional: GEMINI_MODEL (default gemini-2.5-pro)
```

The agents also work on their own, e.g. "use the video-watcher agent on <url>".
