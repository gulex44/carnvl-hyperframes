# youtube-tutorial-to-claude-agent — @jens-heitmann

**Source:** https://www.instagram.com/reel/Db1USzsMNnZ/
**Duration:** 66.11s
**Aspect:** 9:16
**Resolution:** 1440x2560 (60fps)
**Studied:** 2026-10-17
**Engagement (at time of study):** 51,544 likes · 44,328 comments (posted 2026-08-09) — the huge comment count comes from the "comment YouTube" keyword CTA
**Sample rate:** 1fps extraction (66 frames), every frame reviewed as numbered contact sheets — sampled, not every source frame

## Hook (0–2s)
Tight selfie face-cam, dark cap, warm home office behind. A fixed black-box title at the top for the first ~12s: "Create any Claude Code Agent from YouTube". First words: "Most people don't realize that you can actually teach your Claude Code to have almost any real-life skill set…" A big promise plus "most people don't realize" curiosity gap.

## Pacing
- Total scenes: ~10 sections
- Average scene length: ~6s
- Shortest / longest scene: ~4s / ~12s
- Distribution feel: medium; one idea per section, numbered "First / Secondly / Lastly"
- Pace shift: speeds up through the three steps (screens change every 2–3s), slows for the CTA

## Captions
- Style: phrase chunks, 2–4 words, synced to speech
- Font feel: bold white sans with soft shadow, no box
- Active-word treatment: none
- Position: lower-middle (~38–42% from bottom); moves to sit just under the face when the screen-share is above
- Size relative to frame: small/medium
- Title/keyword boxes: white text on a black rounded box ("Create any Claude Code Agent from YouTube", "Youtube" at the CTA)

## Scene types
1. 0–12s — face-cam + top title box (talking-head + title)
2. 12–16s — "save and share this video to your Claude Code": animated save/share icons, then a terminal bar typing an instagram.com/reel link, his cut-out at the bottom pointing up (green-screen-style overlay)
3. 16–26s — Step 1: screenshots of the GitHub page for the /watch video skill (bradautomates/claude-video) with its install commands; he points at them from below
4. 26–36s — Step 2: Google AI Studio sidebar with a red hand-drawn arrow to the API-key area; a correction label "Google AI Studio*" because he misspoke "GitHub Studio"; then the Google AI Studio logo card
5. 36–45s — Step 3: an Apple Notes screenshot of his prompt for turning a /watch output into a structured timeline before writing the agent
6. 45–51s — back to full face-cam, social proof ("the ones I'm seeing use this are getting far ahead")
7. 51–55s — three thumbnails of his previous reels fan in (video editor, social media manager, marketing specialist) as he lists them
8. 55–62s — screenshot of his written guide document
9. 62–66s — CTA: "comment YouTube", a black "Youtube" keyword box pops in at the top

## Transitions
- Flavors observed: hard cuts; screenshots slide/pop in above a cut-out of him; thumbnails fan in
- Rotation cadence: face-cam ↔ screen-share split every section
- Signature transition: switching from full face-cam to "screen on top, me cut out at the bottom pointing at it"

## Face treatment
- Mode mix: fullscreen selfie face-cam; bottom-third cut-out (background removed) under screen content
- Grading feel: warm, slightly soft indoor light
- Camera motion: none (phone on a stand); he leans in
- Framing consistency: always centered, tight, eyes in the upper third

## Audio reactivity
- Text pulses on beat: no
- Background reactivity: no
- Voice only, no noticeable music

## Palette
- #111111 black (title boxes, screen-share background)
- #FFFFFF white text
- #C9A27A warm wall / lamp tones
- #E03A2F red annotation arrow
- #1F6FEB GitHub link blue

## Signature move
"Pointing at the proof": he's cut out at the bottom of the frame and physically points up at a real screenshot (repo, API page, his own prompt) for every claim, then closes with a one-word comment-to-get-the-guide CTA.

## What to steal (actionable for Hyperframes builds)
- **Comment-keyword CTA** ("comment YouTube and I'll send it") drives comments massively (44K here) — for CARNVL: "comment DEMIARD for early access / the discount code".
- **Top title box** for the first seconds: black rounded box, white condensed text — simple kinetic-type title.
- **Screen-on-top, creator cut-out at bottom** layout for showing products/screens while talking — background removal + layered layout (same technique used for the DEMIARD covers).
- **Numbered structure** (First / Secondly / Lastly) with one visual per step.
- **On-screen correction** ("Google AI Studio*") instead of reshooting a slip.

## What's creator-specific (don't copy literally)
- His AI-agent niche, his guide, his exact prompts, his face/branding.

## The method he teaches (content, not editing)
1. Give Claude Code a video-watching skill (the open-source `/watch` skill from bradautomates/claude-video: frames + transcript via yt-dlp/ffmpeg).
2. Get a free Gemini API key in Google AI Studio and send the same link to Gemini, which watches video natively.
3. Merge both reads into one spec (confirmed / single-source / conflict), check only the conflicts, then hand the spec to a skill-writing step to build the agent.
This is the same pipeline as the diagram the user shared at the start of the session, and the one built in `/home/user/video-spec`.

## Transcript
See `transcript.json` in this folder. Whisper wrote "cloud code" for "Claude Code" and "CloudWatch" for "Claude Watch"; he also says "GitHub Studio" where he means Google AI Studio (corrected on screen).
