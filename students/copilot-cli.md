---
title: GitHub Copilot CLI
---

# GitHub Copilot CLI

GitHub Copilot CLI lets you use GitHub's agentic AI tools directly from the
terminal. The command is `copilot`.

For students, this is often the easiest next step when GitHub Education and
current Copilot availability line up: you can use GitHub's AI tooling from the
command line instead of only through a web page or editor.

If GitHub student access is unavailable or you want a different route to model
access, see [Model access](model-access.html) and
[Claude Code](claude-code.html).

## What it is good for

GitHub Copilot CLI can help you:

- ask questions about a codebase from the terminal
- make small changes to files in a repository
- explain code or shell commands
- help with git and GitHub tasks
- work interactively in a project directory

It is a good starting point for agentic workflows because it can inspect files,
propose edits, and ask for permission before using tools that change the
repository.

## Before you install it

You should already have:

1. a personal GitHub account
2. active Copilot access, whether that comes through GitHub Education or
   another Copilot subscription
3. a terminal you are comfortable using

The official installation page is here:

- [Installing GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli)

## Installation

GitHub documents several installation methods. Common choices are:

### Homebrew on macOS or Linux

```sh
brew install copilot-cli
```

### npm on any platform

```sh
npm install -g @github/copilot
```

This installation path currently requires Node.js 22 or newer.

### Install script on macOS or Linux

```sh
curl -fsSL https://gh.io/copilot-install | bash
```

If you are unsure, use whichever package manager you already use for the rest of
your tools.

## First start

Start the CLI with:

```sh
copilot
```

When you launch it, GitHub Copilot CLI will typically ask you to do two things:

1. confirm that you trust the current directory
2. log in with your GitHub account if you are not already authenticated

That trust prompt matters. Only start `copilot` inside a directory that you
understand and trust.

## A simple first workflow

Open a repository or a practice directory and try prompts like these:

```text
Explain the structure of this project.
```

```text
Show me which files I should read first to understand this codebase.
```

```text
Find the main entry point and explain how the program starts.
```

```text
Suggest a small improvement to the README.
```

These are good first prompts because they help you learn the tool without giving
it a risky task.

## How approvals work

When Copilot wants to use a tool that may change files or run commands, it asks
for approval.

That is an important safety feature. Read the request before approving it.

As a beginner, a good rule is:

- approve read-like actions freely only when you understand the context
- be more careful with actions that write files, run package managers, or invoke
  git commands
- avoid blanket approval until you are comfortable with the tool

## Good habits

- run `copilot` from a project directory, not from your home directory
- start with explanation and exploration tasks before asking it to edit code
- read any proposed command before approving it
- use version control so you can inspect what changed
- treat the output as useful but fallible

## Useful features to learn early

The official docs describe a few features that are especially relevant for
students:

- interactive mode by starting `copilot`
- plan mode for discussing an implementation before code is written
- `@path/to/file` to include a file in the prompt
- `/compact` and `/context` for context management
- custom instructions from repository files such as
  [`AGENTS.md`](agents-md.html)

## Notice the pattern

If you compare Copilot CLI with the other coding-agent tools in this guide, a
few recurring ideas start to appear:

- `Planning before editing:` Copilot exposes this directly as plan mode.
- `Limited context:` `/context`, `/compact`, and automatic compaction all exist
  because the session has a limited context window.
- `Work isolation:` Copilot CLI puts less visible emphasis on subagents in the
  beginner workflow than Claude Code or OpenCode. That contrast matters too.
- `Instructions and memory:` repository instructions such as
  [`AGENTS.md`](agents-md.html) guide behavior, while Copilot Memory is a
  separate layer for reusable context.

After you have seen the three main coding-agent guides, the page on
[Agentic concepts](agentic-concepts.html) reconnects these recurring ideas.

## Short version

1. Make sure you have active Copilot access, either through GitHub Education or
   another Copilot subscription.
2. Install GitHub Copilot CLI.
3. Run `copilot` inside a repository you trust.
4. Start with exploratory prompts.
5. Approve tool use carefully.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Get started with Claude Code](claude-code.html)
- [Learn what `AGENTS.md` is for](agents-md.html)
- [Get started with OpenCode](opencode.html)
- [Understand the shared agentic concepts](agentic-concepts.html)
- [Which tool should I use?](which-tool.html)

## Official links

- [About GitHub Copilot CLI](https://docs.github.com/en/copilot/concepts/agents/about-copilot-cli)
- [Installing GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli)
- [Using GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/use-copilot-cli)
