---
title: Skills
---

# Skills

In agentic tools, a skill is a reusable instruction pack: a playbook,
checklist, or workflow that the tool can load when needed.

Skills matter because they let you stop repeating the same long instructions in
every session. Instead of pasting the same review checklist or writing guide
over and over, you can turn it into a skill.

This page uses Claude Code as the main concrete example because its skill system
is well documented. OpenCode also supports skills, but the exact discovery
locations, frontmatter, and invocation flow differ.

## When a skill is a good idea

Create a skill when you keep repeating the same procedure, for example:

- explaining code in a particular style
- reviewing changes with the same checklist
- turning notes into a fixed output format
- running a standard research or debugging workflow

## Use the right layer

A useful rule in Claude Code is:

- put always-on project facts in `CLAUDE.md`
- put reusable multi-step procedures in skills
- put cross-agent project instructions in `AGENTS.md`

If something should be loaded in every Claude Code session, it probably belongs
in `CLAUDE.md`. If it is a reusable playbook you only need sometimes, it
probably belongs in a skill.

## Where skills live

In Claude Code, the main locations are:

- personal skills in `~/.claude/skills/<skill-name>/SKILL.md`
- project skills in `.claude/skills/<skill-name>/SKILL.md`

Personal skills follow you across projects. Project skills travel with the
repository and help your teammates too.

OpenCode also supports skills, but it documents more locations, including
`.opencode/skills/<skill-name>/SKILL.md`,
`~/.config/opencode/skills/<skill-name>/SKILL.md`, and compatible
`.claude/skills/...` or `.agents/skills/...` directories.

## A minimal example

A skill is a directory containing `SKILL.md`. For example:

```text
~/.claude/skills/explain-code/SKILL.md
```

```yaml
---
name: explain-code
description: Explain code with an analogy and a small ASCII diagram. Use when the user asks how code works.
---

When explaining code:

1. Start with a short analogy.
2. Draw a small ASCII diagram.
3. Walk through the flow step by step.
4. Mention one likely mistake or misconception.
```

In Claude Code, the `name` becomes the slash command, so you can invoke this
skill with `/explain-code`.

## How skills are used

In Claude Code, a skill can be used in two ways:

- automatically, when the description matches what you are asking for
- directly, by calling `/skill-name`

In OpenCode, agents discover available skills through the skill system and load
them when relevant, but the documented mechanics are not the same slash-command
flow as Claude Code.

That means a good description matters. It tells the tool when the skill should
be loaded.

## Good habits for writing skills

- keep each skill focused on one task or pattern
- write concrete instructions, not vague aspirations
- move long reference material into supporting files when the tool supports it
- use manual-only skills for workflows you do not want triggered automatically
- review and simplify skills that stop being useful

For example, deployment or commit skills are often better as manual-only
commands, while explanation or review skills often benefit from automatic
invocation.

## Be careful with third-party skills

Public skill directories can be useful, but read skills before you install
them.

A skill is not just metadata. It is a package of instructions that can
influence what an agent does, which tools it uses, and what files it touches.
Treat third-party skills with the same caution you would use for shell scripts
or other workflow automation.

## Why students should care

Skills are one of the easiest ways to go from "chatting with a tool" to
building a repeatable workflow.

Once you notice that you keep giving the same instructions again and again, that
is often the signal that you should create a skill instead.

## Next step

- [Get started with Claude Code](claude-code.html)
- [Learn what `AGENTS.md` is for](agents-md.html)
- [Get started with OpenCode](opencode.html)

## Official links

- [Claude Code skills](https://docs.anthropic.com/en/docs/claude-code/skills)
- [How Claude remembers your project](https://docs.anthropic.com/en/docs/claude-code/memory)
- [skills.sh](https://skills.sh)
