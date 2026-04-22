---
title: Claude Code
---

# Claude Code

`claude` is Anthropic's agentic coding tool for the terminal.

For students who want one strong paid option, Claude Code with a `Claude Pro`
subscription is the clearest place to start. It is a good fit when GitHub
student access is unavailable, when you want to start immediately, or when you
want a polished default workflow for repository work.

If you are comparing Claude Code with GitHub Copilot, direct APIs, OpenCode
Zen, or local models, see [Model access](model-access.html).

## What it is good for

- exploring an unfamiliar repository
- planning a change before editing files
- making multi-file changes with approval prompts
- reviewing diffs, commits, and pull requests
- working with reusable instructions through `CLAUDE.md` and skills

## Before you install it

You should already have:

1. a terminal you are comfortable using
2. a repository or project directory you trust
3. an account that includes Claude Code access

For most students paying themselves, `Claude Pro` is the simplest starting
point. Claude Code also works with `Claude Max`, team plans, Console accounts,
and some cloud-provider setups, but those are not usually the first thing to
learn.

## Installation

Claude documents several installation methods. Common choices are:

### Native install on macOS, Linux, or WSL

```sh
curl -fsSL https://claude.ai/install.sh | bash
```

### Homebrew on macOS or Linux

```sh
brew install --cask claude-code
```

### Windows PowerShell

```powershell
irm https://claude.ai/install.ps1 | iex
```

## First start

Start Claude Code inside a repository or project directory:

```sh
claude
```

On first launch it will usually ask you to log in in the browser. After that,
you can reopen it with `claude` in any project you trust.

## A safe first workflow

A good beginner workflow is:

1. ask Claude Code to explain the project before you ask it to edit anything
2. ask for a plan before making a non-trivial change
3. approve file edits and shell commands carefully
4. inspect the resulting diff yourself

Good first prompts are:

```text
Explain the structure of this project.
```

```text
Find the main entry point and explain how the program starts.
```

```text
Plan a small improvement to the README, but do not change any files yet.
```

## Approvals and session hygiene

Claude Code is much more useful when you treat a session as one task at a time.

Good habits:

- start with explanation or planning prompts
- read permission requests before approving them
- use version control so you can inspect what changed
- keep one task per session when possible
- if a session gets long or messy, use `/compact` or exit and start a fresh one
- treat the output as capable but fallible

## `CLAUDE.md`, skills, and `AGENTS.md`

Three related ideas matter quickly:

- `CLAUDE.md` gives Claude Code persistent instructions that load every session
- skills give Claude reusable playbooks that load only when relevant or when
  you invoke them
- `AGENTS.md` is a more general cross-agent instructions file used by many
  tools

Claude Code reads `CLAUDE.md`, not `AGENTS.md`, directly. If a project already
uses `AGENTS.md`, the usual bridge is to create a `CLAUDE.md` that imports it.

See also:

- [Skills](skills.html)
- [AGENTS.md](agents-md.html)

## Short version

1. Get a Claude plan that includes Claude Code access.
2. Install `claude`.
3. Start it inside a repository you trust.
4. Begin with explanation and planning tasks.
5. Approve write actions carefully.
6. Learn `CLAUDE.md`, skills, and `AGENTS.md` once the basics feel natural.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Learn what skills are](skills.html)
- [Learn what `AGENTS.md` is for](agents-md.html)
- [Get started with OpenCode](opencode.html)
- [Which tool should I use?](which-tool.html)

## Official links

- [Claude Code quickstart](https://docs.anthropic.com/en/docs/claude-code/quickstart)
- [Claude Code setup](https://docs.anthropic.com/en/docs/claude-code/setup)
- [How Claude remembers your project](https://docs.anthropic.com/en/docs/claude-code/memory)
- [Claude Code skills](https://docs.anthropic.com/en/docs/claude-code/skills)
