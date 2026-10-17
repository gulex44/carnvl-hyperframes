---
name: watch
description: Watch a video with two independent readers (Claude via frames and captions, Gemini natively) and reconcile them into a labeled SPEC.md. Use when the user gives a video URL and wants notes, a spec, or a reproduction of what it shows.
argument-hint: <video-url> [focus]
---

Run the two-reader pipeline on: $ARGUMENTS

The first argument is the URL. Anything after it is the focus (what the spec
is for); if there is none, use "everything needed to reproduce what the
video shows".

1. Pick a run directory: `runs/<slug>/`, where slug is the video ID or a
   short name from the URL. Create it.
2. Launch both passes **in parallel, in a single message**, each given the
   URL, run directory and focus:
   - the `video-watcher` agent → `<run_dir>/claude_notes.md`
   - the `gemini-watcher` agent → `<run_dir>/gemini_notes.md`
3. When both finish:
   - Both succeeded: launch the `spec-reconciler` agent on the run directory.
   - One failed: tell the user which one and why. Offer to produce a
     single-reader SPEC.md, with every line labeled with that reader only, and
     say plainly that nothing in it has been cross-checked.
4. Report the path to SPEC.md, the coverage line, and list the
   `[CONFLICT]` items, since they're the only ones the user has to check.
