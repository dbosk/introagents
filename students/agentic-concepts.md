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

## Planning before editing

When an agent starts editing too early, it often makes the wrong change faster.
Good agentic tools therefore create some separation between understanding a
task and writing files.

In the tools you have already seen:

- [GitHub Copilot CLI](copilot-cli.html) exposes this directly as plan mode.
- [Claude Code](claude-code.html) encourages planning prompts and read-only
  planning before edits.
- [OpenCode](opencode.html) separates this into a built-in `Plan` agent.

Generalization: in agentic coding, planning is not just extra caution. It is
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

Generalization: context is a working-memory bottleneck. Good agentic use is
partly about protecting it.

## Subagents and work isolation

Complex work creates side quests: explore this directory, summarize that API,
compare two approaches, or check whether a fix already exists. If all of that
happens in one conversation, the main thread gets crowded.

In the tools you have already seen:

- Claude Code can use subagents with their own context windows, so side work
  can return as a summary instead of filling the main thread.
- OpenCode exposes specialized agents and subagents, including a separate
  planning agent.
- GitHub Copilot CLI is less explicit about this pattern in the beginner
  workflow. That contrast matters too: not every tool surfaces work isolation
  equally directly.

Generalization: subagents are not magic extra intelligence. They are a
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

Generalization: instructions tell the tool what rules and procedures to follow.
Agentic memory carries forward context that might be useful later. Treating
those as the same thing causes confusion.

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
  project instructions and memory behavior.

Generalization: `llm` shows that these concepts are design choices of agentic
tools, not automatic properties of every LLM interface.

## Why the browser comparison matters

By this point, you have seen several alternatives to ordinary browser chat.
That comparison matters because many students already know tools such as
ChatGPT from the browser, and those tools are often useful for brainstorming,
explanations, or generic questions.

Project work is different. In a browser chat, you usually have to describe the
repository yourself, paste code manually, and keep deciding which details to
include. A local agentic CLI workflow is more efficient because the tool can
inspect the actual files, search the project, run commands, fetch
documentation, and use tools in the environment directly.

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

If you answer those questions clearly, the differences between
[GitHub Copilot CLI](copilot-cli.html), [Claude Code](claude-code.html),
[OpenCode](opencode.html), and [`llm`](llm.html) become much easier to reason
about.
