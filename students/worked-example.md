---
title: What an agentic session looks like
---

# What an agentic session looks like

The rest of this guide tells you how to set up agentic coding tools.
This page tells you why first. Below is one complete session — the
session that actually produced the page you are reading — so you can
decide for yourself whether the setup is worth it before doing any of
it.

You will not understand every detail on first reading. That is the
point. Each pattern you notice here is unpacked later in the guide,
and you can follow the links to dig in.

## What this example previews

Six of the
[intended learning outcomes](index.html#intended-learning-outcomes)
for this section show up in the session below. Later pages cover each
one in its own right; here you just need to see them in action:

- using a coding agent in a way that separates planning from editing
- recognising context-window limits and protecting working memory
- using subagents or separate runs to isolate side work
- using `AGENTS.md` and skills as reusable instruction layers
- critically verifying model output against files before relying on it
- explaining why a repository-grounded agent supports work that a
  browser chat does not

## The setting

The repository is a Jekyll site whose pages teach students about
agentic LLM use — the very site you are reading now. The task given
to the agent was: "add a page early on that shows an example of an
agentic workflow." The tool was [Claude Code](claude-code.html), one
of three coding agents this guide introduces; the same shape of
session applies to [GitHub Copilot CLI](copilot-cli.html) and
[OpenCode](opencode.html).

What follows is the session, paraphrased turn by turn. After each
agent reply, a *Notice* line names the pattern and points to the
page that dissects it.

## The session, turn by turn

#### Turn 1 — the request

> Please add a page early on that shows an example of an agentic
> workflow. You can include this session as the example. Make sure
> it renders nicely and is explained well.

```text
Happy to. Before I edit anything, let me read the project's
conventions and survey the existing pages so the new page fits in.
I will come back with a plan for you to approve.
```

*Notice:* the agent did not start editing. It paused to plan and to
absorb project context first. This is unpacked in
[Agentic concepts → Planning before editing](agentic-concepts.html#planning-before-editing).

#### Turn 2 — reading the room

> *(no new user input — the agent reads files on its own)*

```text
Reading CLAUDE.md... noted: British English throughout, Jekyll
front matter on every page, cross-page links use .html (never .md),
and every named-person attribution must carry an inline link to the
source. I will respect all of that while planning.
```

*Notice:* the agent did not need to be told these rules each turn.
They live in a project instruction file that the tool loads on its
own. Reusable instruction layers are unpacked in
[`AGENTS.md`](agents-md.html) and
[Agentic concepts → Instructions and memory](agentic-concepts.html#instructions-and-memory).

#### Turn 3 — skills loading themselves

> *(no new user input)*

```text
The skills variation-theory, didactic-notes, and latex-writing
matched the description of this task and loaded themselves. They
will steer how examples are sequenced and how pedagogical notes are
kept separate from student-facing prose.
```

*Notice:* a skill is a reusable instruction pack that loads when
its description matches the work. Unpacked in
[Skills → How skills are used](skills.html#how-skills-are-used).

#### Turn 4 — delegating the inventory

> *(no new user input)*

```text
The students/ directory has 17 pages. Rather than read all of them
into this conversation and crowd the main thread, I am sending a
subagent to inventory them and report back with a structured
summary: filenames, titles, page anatomy, and the current TOC
ordering.

[Subagent returns]

Summary received. 17 pages; current ordering in students/index.md
lines 73-87; house style mirrors claude-code.md and verification.md;
no existing page shows a chat transcript.
```

*Notice:* the side work happened in a separate context window. The
main thread received a summary, not raw output. Unpacked in
[Agentic concepts → Subagents and work isolation](agentic-concepts.html#subagents-and-work-isolation).
That is also why one task per session matters in
[Agentic concepts → Context windows and context rot](agentic-concepts.html#context-windows-and-context-rot).

#### Turn 5 — verifying anchors before linking

> *(no new user input)*

```text
The plan will cross-link to several headings on other pages. Before
writing those links, I am reading agentic-concepts.md and skills.md
directly to confirm each target heading exists.

Verified: "Planning before editing", "Context windows and context
rot", "Subagents and work isolation", "Instructions and memory",
and "How skills are used" are all present in the current files.
```

*Notice:* the agent did not trust its own claim that those anchors
existed. It opened the files and checked. Unpacked in
[Verification](verification.html).

#### Turn 6 — plan, not edit

```text
Here is the proposed plan: a new page worked-example.html placed at
position #1 of the Start here list, with the structure described
above. Approve and I will write the files; ask for changes and I
will revise.
```

> Approved.

*Notice:* nothing was written until the user said so. Plan and edit
were two distinct steps, with a checkpoint between them. Every
coding agent in this guide supports the same separation; the
details are on [Claude Code](claude-code.html),
[GitHub Copilot CLI](copilot-cli.html), and
[OpenCode](opencode.html).

## What you just saw

Six patterns, all of them recurring across the tools this guide
introduces:

- planning before editing
- reusable instruction layers, loaded automatically
- skills as reusable instruction packs
- subagents and work isolation
- verification before action
- a deliberate pause for approval before any file is changed

## The rest of this guide unpacks each part

| Pattern in the example | Where it is unpacked |
| --- | --- |
| Planning before editing | [Agentic concepts → Planning before editing](agentic-concepts.html#planning-before-editing) |
| Subagents and work isolation | [Agentic concepts → Subagents and work isolation](agentic-concepts.html#subagents-and-work-isolation) |
| Context windows and context rot | [Agentic concepts → Context windows and context rot](agentic-concepts.html#context-windows-and-context-rot) |
| Project instruction layers (`CLAUDE.md` / `AGENTS.md`) | [`AGENTS.md`](agents-md.html) and [Agentic concepts → Instructions and memory](agentic-concepts.html#instructions-and-memory) |
| Skills as reusable instruction packs | [Skills → How skills are used](skills.html#how-skills-are-used) |
| Verification before action | [Verification](verification.html) |

## A note on how this example was produced

The page you are reading was written during a session of exactly the
shape shown above. The turns are reconstructed faithfully; minor
wording has been tightened for readability, and any brittle
tooling-specific UI strings have been removed so the example does
not rot when the tools change. The shape — plan, read conventions,
delegate, verify, approve before editing — is exact.

The session ended at approval; the actual file writes that produced
this page happened immediately after. Each tool's own page covers
what the edit phase looks like in practice.

## Next step

- [Register with GitHub as a student](github-student.html) — if
  GitHub student benefits are available to you
- [Understand model access](model-access.html) — to decide which
  route fits your situation
- [Get started with Claude Code](claude-code.html) — the tool used
  in the session above
