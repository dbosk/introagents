---
title: AGENTS.md
---

# AGENTS.md

`AGENTS.md` is a simple Markdown file that tells coding agents how to work in a
project.

Think of it as a README for agents: a predictable place for setup commands,
test commands, code style notes, security warnings, and other project-specific
instructions that would be awkward to repeat in every chat.

## What belongs in it

Common things to include are:

- setup, build, and test commands
- where important code lives
- code style or naming conventions
- testing expectations
- security or data-handling constraints
- commit or pull request expectations

## Why not put this in `README.md`?

`README.md` is mainly for humans.
`AGENTS.md` is mainly for coding agents.

That separation keeps the human README shorter while still giving agents the
practical instructions they need.

## A minimal example

`AGENTS.md` has no required schema. It is just Markdown.

```markdown
# AGENTS.md

## Setup commands

- Install dependencies: `uv sync`
- Run tests: `pytest`

## Code style

- Use small functions.
- Prefer explicit names over clever abbreviations.

## Before finishing

- Run the relevant tests.
- Summarize any limitations or follow-up risks.
```

## How precedence works

Two rules are especially useful:

- the closest `AGENTS.md` in the directory tree wins
- explicit user instructions in chat override the file

That means a monorepo can have one top-level `AGENTS.md` plus smaller nested
files for subprojects.

## `AGENTS.md` and Claude Code

`AGENTS.md` is cross-agent. `CLAUDE.md` is Claude Code's own always-loaded
instructions file.

Claude Code reads `CLAUDE.md`, not `AGENTS.md`, directly. If a repository
already uses `AGENTS.md`, the usual Claude Code pattern is to create a
`CLAUDE.md` that imports it:

```markdown
@AGENTS.md

## Claude Code

- Use plan mode for larger changes.
```

That way you keep one shared set of project instructions for many tools, while
still allowing Claude-specific additions.

## When students should create one

Create `AGENTS.md` when:

- you keep repeating the same build, test, or style instructions
- several people or several tools work in the same repository
- you want project instructions in version control instead of hidden in chat
- you want a cleaner handoff between humans and agents

## Next step

- [Get started with Claude Code](claude-code.html)
- [Learn what skills are](skills.html)
- [Get started with OpenCode](opencode.html)

## Official links

- [AGENTS.md](https://agents.md)
- [How Claude remembers your project](https://docs.anthropic.com/en/docs/claude-code/memory)
