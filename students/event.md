---
title: Student Life Agentic 2026-05-20
---

<img src="https://daniel.bosk.se/introagents/ric-and-daniel.png"
 alt="Ric and Daniel" width="720">

# Extracurricular workshop: Student Life Agentic

*This event ran on 2026-05-20. The rest of this page lets you follow it on
your own — see [Follow the event on your own](#follow-the-event-on-your-own)
below.*

- **Date:** 2026-05-20 (Wednesday)
- **Time:** 09:15
- **Location:** D1, D37, E32 or [on Zoom](https://kth-se.zoom.us/j/68711734309)
- **Format:** Hybrid lecture/workshop
- **Duration:** Until we're satisfied, you can leave when you've gotten what 
  you need.

## What this event is about

Most students have by now tried something like ChatGPT. However, the vast 
majority have only interacted with LLMs through a web interface. That interface 
severely limits the potential of LLMs. In this workshop, we will show you how 
to use LLMs in a more powerful way.

We will cover agentic use of LLMs. Particularly, we'll illustrate the agentic 
use of LLMs by showing how you can improve your study efficiency for the coming 
exam period.

## Who should come

Anyone who will work with computers in the future should attend. Anyone who has 
taken a course on introductory programming should be able to follow along.

## What to bring or prepare

You don't have to do anything before attending; you can just enjoy the show.
However, if you want to try to follow along with what we do (to save time 
later), you should bring a laptop and start to set up your environment, 
particularly registering for the necessary accounts.
See [Model access](model-access.html) for an overview of the services you
can register for. We'll use GitHub Copilot and Claude Pro as examples.

## After the event

The slides, the skills we built, and the session transcripts are all
preserved further down the page — see [Follow the event on your
own](#follow-the-event-on-your-own).

If you want to get started with the tools we cover in this course, see the
[student guide](./) for practical setup instructions on GitHub student
benefits, model access, Claude Code, Copilot CLI, OpenCode, skills,
`AGENTS.md`, and the Python `llm` package.

# Agenda: Student Life Agentic

This is a brief outline of the agenda for the event. We will cover these 
topics, but we will also be flexible and adjust the agenda as we go.

## 1. Set up and introduction

We'll start by giving an overview of the setup.
Accounts and software needed.

## 2. The needed skills

We'll write skills for:

1. working according to the [EECS honour code (hederskodexen)](https://www.kth.se/en/eecs/utbildning/hederskodex/inledning-1.17237),
2. getting info out of Canvas,
3. studying effectively for the coming exam period.

## 3. Trying our new skills

We'll try the skills as we develop them. We'll also refine them as we go. 
Development is always an iterative process towards perfection.

## 4. The future

We'll also look at other examples and finish with a reflection on how this will 
impact your future career and how you might be expected to use or not use AI in 
the future.

# Follow the event on your own

If you missed the event, you can still recreate most of it. You will need
the slides for the framing, the transcripts to see how the skills were built,
the skills themselves to install and use, and the broader
[student guide](./) for tool setup. Plan on about an hour or two.

Everything we produced lives next to this page under
[`event-202605/`](https://github.com/dbosk/introagents/tree/main/students/event-202605)
on GitHub — browse or clone it from there if you want the whole folder
in one go. Individual files are linked from the sections below.

## The slides

- [Student Life Agentic — slides](https://docs.google.com/presentation/d/17QaRktJpyMbxP0cAh6wwodOvA7xxXsxGFJxhgc_Xc_Q/edit?usp=sharing)
  (Google Slides)

The Beamer source — including the [Mentipy](https://github.com/dbosk/mentipy)
interactive polls we ran live — lives in
[`students/slides/`](https://github.com/dbosk/introagents/tree/main/students/slides)
for anyone who wants to rebuild the deck.

## The skills we built

We built two clusters of skills. One is a single Canvas-integration
helper (`canvas`); the other is a five-skill suite encoding the
[KTH EECS Code of Honour](https://www.kth.se/en/eecs/utbildning/hederskodex/inledning-1.17237).
The
[`skills/README.md`](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/README.md)
maps each honour-code skill onto the specific rules it addresses.

- [**`canvas`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/canvas/SKILL.md)
  — natural-language Canvas queries via the
  [`canvaslms`](https://github.com/dbosk/canvaslms) CLI. Use it to ask
  things like "when is lab 2 in DD1301 due?", "what assignments do I
  have in this course?", or "what's the syllabus of X?" Requires
  `canvaslms` installed (we used `pipx` with `cryptography` injected)
  and a one-time `canvaslms login`.
- [**`honor-disclose`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/honor-disclose/SKILL.md)
  — produce an honest "what was my own work / what help did I use"
  block before submitting an assignment. The guiding principle is that
  it is not the receipt of help that violates the honour code, but the
  failure to disclose it.
- [**`honor-aid-check`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/honor-aid-check/SKILL.md)
  — gate a help request against the assignment's permitted-aids policy
  *before* the help is given. It normalises the policy into a grid,
  classifies the request, and refuses, narrows, or permits accordingly.
  Anything unclear in the policy defaults to *not permitted*.
- [**`honor-defense-prep`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/honor-defense-prep/SKILL.md)
  — rehearse every defendable unit of your submission via paraphrase,
  design-choice, boundary, trace, and provenance questions. If you
  cannot defend a part cold, you do not own it, regardless of who or
  what produced it.
- [**`honor-audit`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/honor-audit/SKILL.md)
  — a pre-submission read-through that flags concrete honour-code
  risks: stylistic shifts that suggest copying, undisclosed AI or
  source contributions, group-attribution gaps, attendance issues.
- [**`honor-policy-draft`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/skills/honor-policy-draft/SKILL.md)
  — *teacher-side*: write an unambiguous permitted-aids policy in the
  same grid form that `honor-aid-check` consumes, so students and tools
  end up reading the same artefact.

The most pedagogically interesting moment of the build is not a skill
at all. After the five `honor-*` skills were in place, the workshop
also produced a **"honour-mode" feedback memory** — a self-applied
guardrail telling Claude to route study-help requests through
`honor-aid-check` first rather than just answering. It does not live in
`skills/`; you can read how it was written and why in the workshop-core
transcript below.

## How to install and use these skills

A skill is a directory containing a `SKILL.md` file. To install:

1. Copy a skill directory (for example `honor-aid-check/`) into
   `~/.claude/skills/`. That makes it personal and follows you across
   projects. Alternatively, drop it in `.claude/skills/` inside a
   specific project.
2. In [Claude Code](claude-code.html), run `/skills` to verify the
   skill is loaded.
3. Use it either by description — Claude will auto-load it when the
   description matches what you are asking for — or by calling
   `/<skill-name>` directly, for example `/honor-aid-check`.

See the [Skills](skills.html) page for the conceptual background on
when a skill is a good idea, where skills live in different tools, and
how OpenCode's flow differs from Claude Code's.

## The transcripts (worked examples)

The
[`transcripts/`](https://github.com/dbosk/introagents/tree/main/students/event-202605/transcripts)
folder holds the raw Claude Code session logs from the workshop. Keep
them around as worked examples of how the skills were produced — the
prompts we used, the iterations, the dead ends we hit live. They are
not polished documentation.

- [**`42a13f21-…md`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/transcripts/42a13f21-fbb5-4e71-af4d-5bf3c21ddfa2.md)
  — the workshop core (54 KB). A guided reading list:
    - `08:22–08:26` — the honour-code build: fetching the KTH page,
      writing the five `honor-*` skills plus the README in one pass.
    - around `08:26` — the "honour-mode" feedback memory: the
      conceptual punch line of the build, where the skills become a
      habit Claude applies to itself.
    - `08:52–09:08` — the Canvas skill build, including the live
      install hiccup (`ModuleNotFoundError: No module named
      'cryptography'`) and how we fixed it with `pipx inject`.
    - `09:07–09:08` — a live test against real KTH data: "what are the
      assignments I have to do in DD1301 from HT25?"
- [**`5b359137-…md`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/transcripts/5b359137-bf63-4b1d-b946-1c9922009530.md)
  — the meta-step (7 KB): zipping the skills directory and recovering
  the session logs that became these transcripts. Worth skimming as a
  small example of using Claude Code on itself.
- [**`d22eb7a1-…md`**](https://github.com/dbosk/introagents/blob/main/students/event-202605/transcripts/d22eb7a1-bfe2-406e-ad8c-8e8da88d2924.md)
  — a model-selection snippet (1 KB). Kept for completeness; nothing
  to learn from here on its own.

## Try it yourself

Concrete exercises that mirror what attendees did live. This is the part
that makes "follow the event on your own" actually equivalent to
attending — please do at least the first two.

1. **Install the `canvas` skill.** Run `canvaslms login` against
   `canvas.kth.se` with your own access token (Canvas → *Account →
   Settings → "+ New Access Token"*). Then ask Claude Code something
   like *"what assignments do I have due in <your course> in the next
   two weeks?"* and let the skill answer.
2. **Use `/honor-aid-check` before your next study session.** Paste in
   the assignment's permitted-aids policy and the help you are about
   to ask for. Notice what the skill refuses or narrows, and how the
   "unclear in policy → not permitted" default behaves.
3. **Try `/honor-defense-prep` on something you already submitted.**
   Watch for the gap between *"I wrote this"* and *"I can defend this
   cold."* Anything that turns out to be `borrowed` is a flag, not a
   judgement — fix the understanding before the next submission.
4. **(If you are a teacher reading along.)** Run `/honor-policy-draft`
   on your next assignment. Then read each cell of the produced grid
   as a student would, looking for a loophole. Narrow any cell where
   you find one.
