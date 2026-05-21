---
name: canvas
description: Query KTH Canvas (course info, assignments, deadlines, modules, syllabus, pages) via the `canvaslms` CLI to answer natural-language questions like "when is the deadline for lab 2 in DD1301".
---

# canvas

Wraps the `canvaslms` PyPI CLI (https://github.com/dbosk/canvaslms) so questions like *"when is the deadline for lab 2 in DD1301"* can be answered without leaving the terminal.

## Prerequisites

- `canvaslms` installed (via pipx, with `cryptography` injected).
- Login configured. One-time setup, run by the user:
  ```
  canvaslms login
  ```
  Enter server (e.g. `canvas.kth.se`) and an access token from Canvas → Account → Settings → "New Access Token". Stored in the macOS keyring.

If `canvaslms courses` errors with "No hostname or token", login is missing — tell the user.

## How to answer questions

Translate the user's natural-language question into one or two `canvaslms` invocations. **Always pipe through `cat`** (or otherwise treat as non-TTY) when you want stable, parseable CSV/YAML output — some commands change format based on TTY detection.

### 1. Identify the course

Course codes (DD1301, DD2380, etc.) match against course code, title, or Canvas ID via regex:

```
canvaslms courses DD1301
```

Output is tab-separated: `<course-code>\t<course-name>\t<start>\t<end>`. Use `-i` to include Canvas ID, `-a` to include non-current courses. If multiple match, show the list and ask which one — don't guess.

### 2. List or filter assignments

```
canvaslms assignments list -c DD1301
canvaslms assignments list -c DD1301 -a 'lab.*2'        # regex on assignment name
canvaslms assignments list -c DD1301 -M 'Module name'   # filter by module
```

Output columns (tab-separated): `<course> <assignment group> <assignment name> <due date> <unlock at> <lock at>`. **The due date is column 4** — that's the deadline.

### 3. View full assignment detail

```
canvaslms assignments view -c DD1301 -a 'lab.*2'
```

Returns YAML front matter + Markdown description. Use for "what does the assignment ask?" / "what are the grading criteria?" questions.

### 4. Other useful subcommands

| Question pattern | Command |
|---|---|
| "What modules are in X?" | `canvaslms modules -c X` |
| "What's the syllabus of X?" | `canvaslms syllabus -c X` |
| "What pages does X have?" | `canvaslms pages -c X` |
| "Any announcements / discussions?" | `canvaslms discussions -c X` |
| "Calendar / upcoming events?" | `canvaslms calendar` |
| "Quizzes in X?" | `canvaslms quizzes -c X` |

Run `canvaslms <cmd> --help` to discover flags.

## Response protocol

When the user asks a Canvas question:

1. **Run the narrowest query** that could answer it. Don't dump entire course listings if a regex would suffice.
2. **Report only the asked-for field**, plus any directly relevant context (e.g. "Lab 2 deadline: 2026-06-03 23:59. Unlocks 2026-05-20.").
3. **If the query returned zero or multiple matches**, show them and ask for disambiguation before answering.
4. **Quote the date verbatim** from the tool output. Do not paraphrase or convert timezones silently — Canvas dates are usually in the course's local tz (Europe/Stockholm at KTH).
5. **Cache awareness**: `canvaslms` has a persistent cache. If the user says "this looks stale," re-run with `--no-cache`.

## Honor-mode interaction

This skill is for **fetching course information**, not for completing assignments. If the user follows up with "and can you do lab 2 for me?", the [honor-mode guardrail](../honor-aid-check/SKILL.md) applies — fetching the deadline is fine; writing the solution is not.

## Examples

**"When is the deadline for lab 2 in DD1301?"**
```
canvaslms assignments list -c DD1301 -a 'lab.*2'
```
Read column 4 of the result. Reply: `Lab 2 (DD1301) is due <date>.`

**"What's lab 2 about?"**
```
canvaslms assignments view -c DD1301 -a 'lab.*2'
```
Summarise the Markdown description in 2–4 sentences; link the full assignment page if known.

**"What courses am I in this term?"**
```
canvaslms courses
```
List course codes + titles.
