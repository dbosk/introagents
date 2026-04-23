---
title: Which Tool Should I Use?
---

# Which tool should I use?

If GitHub student benefits work for you, start with GitHub Copilot CLI.

If you want a paid general-purpose coding agent, start with Claude Code.
Then move to OpenCode when you want more provider choice and control, and use
`llm` when you want scripting or Python integration.

If you are unsure how you actually get access to a model, read
[Model access](model-access.html) first.

If you specifically want a local or offline route, read
[Local models and Ollama](local-models.html) next.

## Short answer

- use GitHub Copilot CLI (`copilot`) if you want the simplest student setup
- use Claude Code if you want one strong paid coding tool
- use `opencode` if you want a more capable open source coding agent
- use `llm` if you want repeatable prompts, shell pipelines, or Python scripts

## Comparison

| Tool | Best when | Main strength | Main limitation |
| --- | --- | --- | --- |
| GitHub Copilot CLI (`copilot`) | you want to get started quickly with GitHub student benefits | simplest onboarding and strong GitHub integration | less flexible than the more configurable tools |
| Claude Code (`claude`) | you want one strong paid coding tool for repo work | polished workflow, strong repository help, skills and `CLAUDE.md` | paid subscription and less open or configurable than OpenCode |
| OpenCode (`opencode`) | you want longer, more agentic coding sessions in a repository | stronger project workflow, more providers, more control | more setup and more power means more care is needed |
| Python package `llm` | you want scripts, structured output, or Python integration | best fit for automation and reproducible workflows | not primarily a full coding agent |

## Suggested path for this course

1. If GitHub student benefits are available, start with GitHub Copilot CLI.
2. If you want a paid fallback or a single paid coding tool, start with Claude
   Code.
3. Move to OpenCode when you want a more configurable open source repo
   workflow.
4. Learn `llm` when you want reproducible command-line or Python workflows.

## Common situations

- "I just got GitHub student benefits and want something that works quickly."
  Use GitHub Copilot CLI.
- "I want one paid tool and do not want to depend on GitHub approval first."
  Use Claude Code.
- "I want an agent to inspect a repository, plan a change, and edit several
   files."
  Use OpenCode.
- "I want to put LLM use inside a shell pipeline or a Python script."
  Use `llm`.
- "I want structured JSON output or a script I can rerun later."
  Use `llm`.
- "I want an open source terminal agent that can use GitHub Copilot or other
   providers."
  Use OpenCode.
- "I want local or offline workflows with open-weight models."
  Read [Local models and Ollama](local-models.html), then use OpenCode or
  `llm`.

## The important difference

The biggest difference is not just model quality. It is workflow.

Browser chat often depends on copy-paste and your own description of the
project. Terminal agents can inspect files and use tools directly, which is why
they are usually much more effective for repository work.

- GitHub Copilot CLI is the easiest entry point.
- Claude Code is the strongest polished paid general coding tool.
- OpenCode is the strongest choice for interactive agentic coding in a
  project.
- `llm` is the best choice when you want repeatable prompts and programming
  access.

If you want to understand why the coding-agent tools feel similar in some ways
and different in others, read [Agentic concepts](agentic-concepts.html). That
page reconnects planning, context windows, subagents, and memory across the
main coding-agent tools, then uses `llm` as a contrast case.

## Three important things that are not tools

- [Model access](model-access.html) explains how you actually reach a model.
- [Skills](skills.html) let you reuse playbooks or procedures with an agent.
- [`AGENTS.md`](agents-md.html) gives agents project instructions in a standard
  place.

## Pages in this section

- [Register with GitHub as a student](github-student.html)
- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Learn when local models and Ollama make sense](local-models.html)
- [Get started with Claude Code](claude-code.html)
- [Get started with GitHub Copilot CLI](copilot-cli.html)
- [Get started with OpenCode](opencode.html)
- [Understand the shared agentic concepts](agentic-concepts.html)
- [Learn what skills are](skills.html)
- [Learn what `AGENTS.md` is for](agents-md.html)
- [Get started with the Python package `llm`](llm.html)
