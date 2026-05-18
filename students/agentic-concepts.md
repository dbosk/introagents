---
title: Agentic Concepts
---

# Agentic concepts across the tools

By now you have seen several tools that feel different in practice. GitHub
Copilot CLI, Claude Code, and OpenCode do not expose the same commands or
defaults, but they keep solving the same recurring problems in agentic work.

This page reconnects those examples. The point is not that every tool is
identical. The point is that the differences make the shared ideas easier to
see.

## Intended learning outcomes covered on this page

After working through this page, students should be better able to:

- choose an appropriate tool for a task by distinguishing between
  coding-agent workflows and scripting or pipeline workflows
- explain why repository-grounded terminal agents support different kinds of
  work than ordinary browser chat
- use a coding agent in a way that separates planning from editing
- recognise context-window limits and use strategies such as fresh sessions or
  compaction when context quality degrades
- explain how subagents or separate runs can isolate side work and keep a main
  task focused
- distinguish between persistent instructions and reusable memory or context
- use `AGENTS.md` and skills appropriately as reusable instruction layers in a
  project workflow
- critically verify model output against files, tools, and project context
  before relying on it

## Planning before editing

When an agent starts editing too early, it often makes the wrong change faster.
Good agentic tools therefore create some separation between understanding a
task and writing files.

In the tools you have already seen:

- [GitHub Copilot CLI](copilot-cli.html) exposes this directly as plan mode.
- [Claude Code](claude-code.html) encourages planning prompts and read-only
  planning before edits.
- [OpenCode](opencode.html) separates this into a built-in `Plan` agent.

Generalisation: in agentic coding, planning is not just extra caution. It is
part of how the tool stays reliable.

## Context windows and context rot

Every interactive agent works inside a limited context window. Only part of the
total conversation, files, instructions, and tool output can stay in active
view at once.

When a session gets too long or too noisy, useful signal becomes harder to
maintain. In this course we call that `context rot`. That is course language,
not a universal vendor term.

In the tools you have already seen:

- GitHub Copilot CLI has `/context`, `/compact`, and automatic compaction near
  the context limit.
- Claude Code encourages one task per session, plus `/compact` or a fresh
  session when the conversation gets messy.
- OpenCode also offers `/compact` and gives you more explicit control in longer
  interactive sessions.

Generalisation: context is a working-memory bottleneck. Good agentic use is
partly about protecting it.

## Subagents and work isolation

Complex work creates side quests: explore this directory, summarise that API,
compare two approaches, or check whether a fix already exists. If all of that
happens in one conversation, the main thread gets crowded.

In the tools you have already seen:

- Claude Code can use subagents with their own context windows, so side work
  can return as a summary instead of filling the main thread.
- OpenCode exposes specialised agents and subagents, including a separate
  planning agent.
- GitHub Copilot CLI is less explicit about this pattern in the beginner
  workflow. That contrast matters too: not every tool surfaces work isolation
  equally directly.

Generalisation: subagents are not magic extra intelligence. They are a
context-management strategy. They isolate side work so the main thread stays
focused.

## Instructions and memory

You have also already seen several instruction layers: [`AGENTS.md`](agents-md.html),
`CLAUDE.md`, and [skills](skills.html). Those tell a tool how to work. Agentic
memory is a different idea: reusable context that a tool keeps or reloads
across sessions.

In the tools you have already seen:

- In Claude Code, `CLAUDE.md` and skills are instructions, while project memory
  is a separate layer.
- In GitHub Copilot CLI, repository instructions and Copilot Memory are
  separate layers.
- In OpenCode, instruction files such as `AGENTS.md` and reusable skills are
  explicit, while the current session carries the working context. That is a
  useful reminder that instructions and live context are not the same thing.

Generalisation: instructions tell the tool what rules and procedures to follow.
Agentic memory carries forward context that might be useful later. Treating
those as the same thing causes confusion.

## One task, four instruction layers

To make the difference clearer, keep one repository and one task fixed.

Imagine the same repository throughout:

- `README.md`
- `src/demo_app/cli.py`
- `tests/test_cli.py`

And imagine the same standing goal throughout:

> When explaining code in this repository to beginners, use simple language and
> run `pytest -q` before finishing if code changed.

Now vary only where that guidance lives.

### Layer 1: `AGENTS.md`

Use `AGENTS.md` for shared repository instructions that should travel with the
project:

```markdown
## Teaching repo conventions

- Explain code in beginner-friendly language.
- If you change code, run `pytest -q` before finishing.
- Mention any remaining limitations clearly.
```

This is the right layer when the guidance is about the repository itself and
should apply across tools.

### Layer 2: a tool-specific always-loaded file

Use `CLAUDE.md` when the instruction is Claude-specific rather than generally
repository-specific:

```markdown
@AGENTS.md

## Claude Code

- Use plan mode for non-trivial changes.
- Prefer subagents for side investigations.
```

The key contrast is that `Use plan mode` belongs in a Claude-specific layer,
not in the cross-agent repository file.

### Layer 3: a skill

Use a skill when the guidance is a reusable procedure that should load only when
relevant, not in every session:

```markdown
---
name: explain-beginner-code
description: Explain code to beginners with a short analogy, step-by-step flow,
  and one likely misconception. Use when the user asks for a pedagogical code
  explanation.
---

When explaining code:

1. Start with a short analogy.
2. Walk through the control flow.
3. Mention one likely misconception.
```

This does not belong in `AGENTS.md` because it is not an always-on repository
rule. It is a reusable playbook for one kind of task.

### Layer 4: session context or memory

Use session context or memory for information that is temporary or evolving.

For example:

> The student already understands loops, but not decorators.

That may matter right now, but it should usually not be frozen into
`AGENTS.md`. It is about the current interaction, not the permanent repository
workflow.

## What varies and what stays fixed

Across the four cases above:

- the repository stays fixed
- the standing task stays fixed
- what varies is the layer where the guidance lives

That is the important contrast. If the repository and task changed at the same
time, it would be harder to see why one instruction belongs in `AGENTS.md`
while another belongs in a skill or only in session context.

## A common anti-example

Suppose you discover during one session that:

> Today we only need a rough answer for [Sofia](https://www.kth.se/profile/sofbob) before the meeting.

That is usually not an `AGENTS.md` instruction. It is temporary session context.
Putting it in a permanent project file would mix up stable repository rules with
short-lived circumstances.

Generalisation: stable project conventions belong in persistent instruction
files; reusable procedures belong in skills; temporary or evolving facts belong
in session context or memory.

## Verification is part of the workflow

Planning, context management, and instruction layers matter because they help
the tool work more effectively. Verification matters because effective work is
not the same thing as correct work.

If an agent claims it found the entry point, changed the right files, or fixed
the behaviour, that claim should be checked against the repository, the diff, or
the relevant tests. For a reusable student workflow, read
[Verification](verification.html).

## `llm` as a contrast case

The page on [`llm`](llm.html) is useful here precisely because it is different.
It is strong for prompts, scripts, shell pipelines, structured output, and
Python integration, but it is not mainly trying to be a full interactive coding
agent.

Across the same dimensions:

- Planning: there is no built-in plan mode or separate planning agent. You
  structure the prompt or script yourself.
- Context: chats and logs exist, but you choose what context to send and when
  to start fresh.
- Work isolation: there is no central subagent workflow. If you want
  separation, you usually create separate prompts, chats, or scripts.
- Instructions and memory: saved prompts, plugins, logs, and scripts are
  useful, but they are not the same thing as a coding agent with built-in
  project instructions and memory behaviour.

Generalisation: `llm` shows that these concepts are design choices of agentic
tools, not automatic properties of every LLM interface.

## Why the browser comparison matters

By this point, you have seen several alternatives to ordinary browser chat.
Many students already know tools such as ChatGPT from the browser.

Keep the task fixed when you compare the workflows. Suppose you want help with
brainstorming, answering a question, understanding a repository, planning a
change, or deciding how to implement something in the project. In a browser
chat, you usually have to describe the relevant files and situation yourself,
paste code manually, and keep deciding which details to include. In a local
agentic CLI workflow, the tool can inspect the actual files, search the
project, run commands, and use tools in the environment directly.

That means the agent is often more useful even for brainstorming or questions
when those depend on the project itself, such as what the repository already
contains, how one part connects to another, or which implementation approach
fits the code that is already there.

That changes the whole workflow. The agent is not only predicting text from a
description of your project. It can ground its work in the project itself and
in the outputs of tools. That is why planning, context management, subagents,
and instruction layers matter so much in these tools: they are acting inside a
real working environment, not only inside a chat box.

This is also why the course keeps returning to local terminal workflows. The
goal is not to say that browser chat is useless. The goal is to help you see
why agentic CLI work is faster, better grounded, and easier to verify when the
task depends on the actual repository, files, commands, and tools.

## Putting it together

When choosing and using a tool, a useful mental checklist is:

1. Do I need a coding agent or a scripting interface?
2. Should I plan first before any file changes happen?
3. Is the current session still focused, or is context rot starting?
4. Would a separate agent, subagent, or fresh run keep side work out of the
   main thread?
5. Am I using instructions for stable rules and memory for reusable context,
   instead of mixing them up?
6. What evidence would verify the current claim before I trust it?

If you answer those questions clearly, the differences between
[GitHub Copilot CLI](copilot-cli.html), [Claude Code](claude-code.html),
[OpenCode](opencode.html), and [`llm`](llm.html) become much easier to reason
about.

## Self-check

Try these short prompts before looking back at the page:

1. An agent starts editing files before it has shown a plan for a non-trivial
   change. Which critical aspect is being missed?
2. A session has become long, noisy, and less reliable, so you start a fresh
   session or use compaction. Which critical aspect is this about?
3. You send side research to another agent so the main thread stays focused.
   Which critical aspect is this about?
4. You discover that `Use plan mode for non-trivial changes` belongs in a
   tool-specific file, while `Run pytest before finishing` belongs in a
   cross-agent repository file. Which distinction are you making?

Suggested answers:

1. Planning before editing.
2. Context-window limits and context rot.
3. Work isolation through subagents or separate runs.
4. The distinction between tool-specific instructions and shared project
   instructions.
