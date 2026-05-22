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

## What you see in a session — annotated

The transcripts above are the source of truth. This section walks
through them in paraphrase so you can recognise the patterns when you
open the raw `.md` files. Each turn below is followed by a *Notice:*
line that names the pattern and links to the page that unpacks it —
the same shape as
[What an agentic session looks like](worked-example.html). The aim is
not to memorise these prompts but to learn to *see* what is happening
on screen, so you can intervene when the agent strays.

### Building the honour-code skills

This happens in
[`42a13f21-…`](https://github.com/dbosk/introagents/blob/main/students/event-202605/transcripts/42a13f21-fbb5-4e71-af4d-5bf3c21ddfa2.md),
around `08:22–08:26`.

#### Turn 1 — the opening prompt

> We are going to develop some skills to help us adhere to the KTH
> Honor system. Here's the honor system: `<URL to the KTH page>`.

```text
[The agent fetches the URL itself with WebFetch, asking the page for
"all principles, rules, expectations for students, expectations for
teachers, and any specifics about what constitutes cheating,
plagiarism, collaboration rules, AI/tool use, citation, and exam
conduct." A summary of the seven rules comes back.]
```

*Notice:* the user's prompt did three things — named the goal, handed
over the raw material as a URL, and stopped. The agent decided on its
own to fetch the page and to phrase a thorough extraction sub-prompt.
Tool uses themselves carry prompts; what you write inside them shapes
what comes back. Unpacked in
[Agentic concepts → Planning before editing](agentic-concepts.html#planning-before-editing).

#### Turn 2 — a plan before any file is written

> *(no new user input)*

```text
Before writing any skill, here is the suite I'm building. Each
skill maps to specific rules:

| Skill              | Rules addressed |
|--------------------|-----------------|
| honor-disclose     | 2, 7            |
| honor-aid-check    | 4, 6, 7         |
| honor-defense-prep | 3               |
| honor-audit        | 1, 2, 4, 5      |
| honor-policy-draft | (teacher-side)  |

Building them now.
```

*Notice:* the agent planned the whole suite before writing a single
file. The table *is* the plan, made visible so you could object before
five files existed. Unpacked in
[Agentic concepts → Planning before editing](agentic-concepts.html#planning-before-editing).

#### Turn 3 — five Writes in a row

> *(no new user input)*

```text
[Six Write tool uses in succession: skills/README.md and one
SKILL.md for each of honor-disclose, honor-aid-check,
honor-defense-prep, honor-audit, honor-policy-draft.]
```

*Notice:* every `Write` you see in the raw transcript is a file being
created on disk. The agent did not paste the skills into the chat —
each skill is a directory with a `SKILL.md` you can install and
re-use. Unpacked in
[Skills → How skills are used](skills.html#how-skills-are-used).

### The honour-mode redirection

Same transcript, around `08:26`. This is the pedagogical punch line
of the build, and a textbook case of *injecting a prompt when the
agent is about to stray*.

#### The redirect

> *(the user's prompt arrived between turns; the captured form is the
> agent's reading-back of it)* — use this skill so that you don't help
> too much while studying.

```text
Got it — the skills are written, and you want me to actually use
honor-aid-check (and friends) as a guardrail when you're studying.
Saving that as feedback so it sticks across sessions.

[Writes a feedback memory at .../memory/feedback_honor_mode.md
describing exactly when to enter "honour-mode" and what to refuse.]
```

*Notice:* one sentence changed the role of the skills. They went from
"files Claude could load if asked" to "things Claude applies to
itself, automatically, whenever the user is studying." This is the
redirect to watch for: if you let the agent finish the build and walk
away, you get artefacts; if you ask "now apply this to yourself," you
get a habit. The guardrail itself is now an instruction layer the
tool loads on its own — unpacked in
[Agentic concepts → Instructions and memory](agentic-concepts.html#instructions-and-memory)
and [`AGENTS.md`](agents-md.html).

### The Canvas skill build and the install hiccup

Same transcript, around `08:52–09:08`.

#### Turn 1 — a bundled prompt

> We want another skill. There is this CLI command `canvaslms`. It's
> on PyPI. Check if it's installed already, otherwise help me install
> it. Then I want a skill for accessing course information in Canvas.
> Then you can use that tool to look around and fetch the info.

```text
[A chain of Bash tool uses: `which canvaslms` (not found),
`python3 -m pip show canvaslms` (not found), `pipx list` (pipx not
found either), `brew install pipx`, then `pipx install canvaslms`.]
```

*Notice:* this prompt bundled four things — check, install, write a
skill, then use it. Bundling is fine when the steps are genuinely
sequential and the agent can verify between them. It is *not* fine
when a step needs you (your access tokens, your choices); we will
see that two turns down.

#### Turn 2 — a mid-stream clarification

> *(the user clarified that the skill should answer natural-language
> questions like "deadline for lab 2 in DD1301")*

```text
Good clarification — the skill needs to support natural-language
queries like that. I'll design it around that. Continuing install.
```

*Notice:* the clarification arrived **before** the agent had committed
to a design. That is the cheapest moment to redirect. When you read
the raw transcript, watch for short user messages that add intent the
opening prompt did not carry — they are easy to miss and they steer
the next ten tool uses.

#### Turn 3 — the visible recovery

```text
[pipx install canvaslms succeeds. Running canvaslms --help fails
with: ModuleNotFoundError: No module named 'cryptography'.]
[Next Bash tool use: `pipx inject canvaslms cryptography` — then
re-runs canvaslms --help, which now works.]
```

*Notice:* the error was visible in the conversation; the recovery was
one targeted command followed by a re-run to confirm. This is what
"the agent verifies its own work" looks like in practice — and why
*not hiding* tool errors is a feature, not noise. Unpacked in
[Verification](verification.html).

#### Turn 4 — the prompt only you can run

```text
Login is not yet configured. One step for you (needs your Canvas
access token):

    ! canvaslms login

You'll be prompted for server (canvas.kth.se) and an access token
you create in Canvas → Account → Settings → "+ New Access Token".
```

*Notice:* not every step in an agentic session can be done by the
agent. Anything that needs your secrets, your two-factor device, or
your judgement is handed back to you. The `!` prefix runs the command
in the same session so the output lands in the conversation and the
agent can continue from it.

### A real query against real data

Same transcript, around `09:07–09:08`. The student question becomes a
shell command becomes a *corrected* shell command — without you
having to learn the CLI.

#### Turn 1 — the question

> What are the assignments I have to do in DD1301 from HT25?

```text
[Bash tool use: `canvaslms assignments list -c datintro25` returns
many lines, most labelled "Learning material" rather than actual
deliverables.]
```

#### Turn 2 — the iteration

```text
[Without being asked, the agent runs a follow-up Bash command:
`canvaslms assignments list -c datintro25 | awk -F'\t' '{print $2}' | sort -u`
to discover that the assignment groups are just LAB1 and "Learning
material". A third Bash command then filters to LAB1 only.]

Here are the actual assignments (everything else is "Learning
material"):

1. Guide to accessing the terminal
2. The terminal
3. Git
4. Writing a report in LaTeX

No due dates are set in Canvas — deadlines are likely on the course
page rather than per-assignment in Canvas. Want me to pull the
syllabus or a specific assignment's full description?
```

*Notice:* the first command returned noise. The agent iterated on its
own commands rather than asking you to interpret the raw output. Watch
for this pattern: when you see two or three `Bash` tool uses in a row
with no user prompt between them, the agent is filtering its own
output for you. Cross-checking that filtered answer against the source
artefact is unpacked in [Verification](verification.html).

### What you just read for

Four prompting patterns, all of them recurring:

| Pattern in the event | Where it is unpacked |
| --- | --- |
| Prompt with raw material, then stop | [Agentic concepts → Planning before editing](agentic-concepts.html#planning-before-editing) |
| Redirect with intent ("now apply this to yourself") | [Agentic concepts → Instructions and memory](agentic-concepts.html#instructions-and-memory) and [`AGENTS.md`](agents-md.html) |
| Recover visibly from tool errors | [Verification](verification.html) |
| Iterate on your own output instead of asking the user | [Verification](verification.html) |

The raw transcripts linked above contain dozens more turns than these
four moments. As you read them, the goal is not to copy the prompts
verbatim — it is to recognise the *shape* a useful prompt takes, and
to spot the moment when a one-sentence correction would save the next
ten tool uses.

## Try it yourself

The payoff of [building the honour-code skills](#building-the-honour-code-skills)
shows up a few paragraphs above, in the `09:07–09:08` moment of
[a real query against real data](#a-real-query-against-real-data): you
stop working like a web-UI user. Instead of pasting assignment briefs,
policy text, or your own submission into a chat box, you let the agent
fetch from Canvas and read your local files directly. That no-paste
behaviour is what makes the setup worth the install effort, so in the
exercises below watch the tool uses before you read the answer.

1. **Install the `canvas` skill, log in, and run one pure Canvas query.**
   Run `canvaslms login` against `canvas.kth.se` with your own access
   token (Canvas → *Account → Settings → "+ New Access Token"*). Then ask
   Claude Code something like *"what assignments do I have due in <your
   course> in the next two weeks?"* Notice that the answer should come
   from Canvas directly; you should not need to paste an assignment
   description first.
2. **Use `/honor-aid-check` with `canvas` before your next study session.**
   Ask in natural language, for example *"check what aids are permitted
   for lab 2 in DD1301 — I want to ask Claude to help me with the
   recursion part."* The agent should fetch the policy from the
   assignment with `canvaslms assignments view -c <course> -a <pattern>`,
   or fall back to `canvaslms syllabus -c <course>` if the assignment page
   has no explicit policy, before `honor-aid-check` turns it into the
   grid. Watch for a `Bash` tool use against `canvaslms` before the grid
   appears.
3. **Use `/honor-defense-prep` on something you already submitted.** Tell
   Claude Code to fetch the assignment brief from Canvas and read your
   local submission directly, for example `./report.tex` or the lab repo
   you are sitting in. The agent should fetch the grading criteria with
   `canvaslms assignments view -c <course> -a <pattern>` and then use
   `Read` on your own files before asking any defence questions. Watch
   for one `Bash` tool use against `canvaslms`, followed by `Read` tool
   uses on your files, before the interrogation starts. Anything that
   turns out to be `borrowed` is a flag, not a judgement — fix the
   understanding before the next submission.
4. **(If you are a teacher reading along.)** Run `/honor-policy-draft`
   on your next assignment. Then read each cell of the produced grid as a
   student would, looking for a loophole. Narrow any cell where you find
   one. This is the teacher-side mirror of exercise 2: if you publish the
   policy in the grid form that `honor-aid-check` consumes, the student's
   Canvas-fetched check works without ambiguity.
