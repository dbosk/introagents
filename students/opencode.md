---
title: OpenCode
---

# OpenCode

`opencode` is an open source AI coding agent that works in the terminal. For
students in this course, it is a good next step after GitHub Copilot CLI or
Claude Code when you want a more configurable, open source workflow. It can use
several providers and is strong for longer agentic coding sessions.

One especially useful point for students is that OpenCode can connect to GitHub
Copilot. That means you can often use your GitHub student benefits inside
`opencode` instead of paying for a separate provider immediately.

OpenCode can also use OpenCode Zen, direct API-backed providers, and local
models. For the overall picture, see [Model access](model-access.html).

## What it is good for

- exploring an unfamiliar repository
- planning a change before editing files
- making larger multi-file changes
- working with file references from the terminal
- using an open source agent with a clearer configuration model

## Before you install it

You should already have:

1. a terminal you are comfortable using
2. a Git repository or project directory
3. access to a model provider

One common starting route is GitHub Copilot through your GitHub student
benefits. OpenCode can also use OpenCode Zen, direct APIs, and local models
such as Ollama.

## Installation

OpenCode documents several installation methods. Common choices are:

### Install script on macOS or Linux

```sh
curl -fsSL https://opencode.ai/install | bash
```

### npm

```sh
npm install -g opencode-ai
```

### Homebrew on macOS or Linux

```sh
brew install anomalyco/tap/opencode
```

Use whichever package manager you already use for the rest of your tools.

## First start

Start OpenCode in the project directory you want to work in:

```sh
opencode
```

You can also start it for a specific directory:

```sh
opencode /path/to/project
```

## Connect it to a model

OpenCode is not tied to one provider. A few common student paths are:

### GitHub Copilot

If you want to use your GitHub Copilot student access, the common path is:

1. Start `opencode`.
2. Run `/connect`.
3. Choose `GitHub Copilot`.
4. Complete the device login flow in your browser.
5. Run `/models` and select a model.

### OpenCode Zen

If you want OpenCode's own curated model list:

1. Start `opencode`.
2. Run `/connect`.
3. Choose `OpenCode Zen`.
4. Sign in, add billing details, and copy your API key.
5. Paste the key into OpenCode.
6. Run `/models` and select a model.

### Direct APIs

If you want a direct provider route such as OpenAI or Anthropic API access:

1. Start `opencode`.
2. Run `/connect`.
3. Choose the provider.
4. Authenticate or paste the API key.
5. Run `/models` and select a model.

### Local models such as Ollama

If you want a local route:

1. Make sure your local model server is running.
2. Start `opencode`.
3. Run `/connect`.
4. Choose the local provider, such as `Ollama`.
5. Confirm the local server address if OpenCode asks for it.
6. Run `/models` and select a model.

If you want the deeper local workflow, read
[Local models and Ollama](local-models.html).

For tool-calling local models, you may need a larger context setting.

Whichever route you use, finish with `/models` so you know which models are
actually available in your current session. See [Model access](model-access.html)
for the broader overview.

## A simple first workflow

A safe beginner workflow is:

1. Start `opencode` in a repository you understand.
2. Ask it to explain the project before asking it to edit anything.
3. Switch to the built-in `Plan` agent when you want help designing a change.
   It plays a role similar to plan mode in other tools, but OpenCode implements
   it as a separate agent rather than a toggle.
4. Only approve write or shell actions after reading them.

Good first prompts are:

```text
Explain the structure of this project.
```

```text
Read @README.md and tell me what I should look at next.
```

```text
Plan how to add a small feature, but do not make any changes yet.
```

## Useful things to learn early

A few OpenCode features matter quickly:

- `@path/to/file` to include a file in your prompt
- `!command` to run a shell command and include its output
- `/connect` to add or manage a provider
- `/models` to inspect available models
- `/init` to create or update [`AGENTS.md`](agents-md.html)
- `/compact` to shrink conversation context during a long session

If you want a one-shot non-interactive command, OpenCode also supports:

```sh
opencode run "Explain the purpose of this repository"
```

## Safety and habits

OpenCode is more powerful than a simple chat interface, so good habits matter:

- run it inside a project directory, not from your home directory
- start with explanation and planning tasks
- read permission prompts before approving them
- use version control so you can inspect what changed
- treat the tool as capable but fallible

## When to use it instead of GitHub Copilot CLI

Use OpenCode when you want:

- a stronger open source coding agent
- longer multi-file workflows
- more choice about model providers
- more explicit control over permissions and configuration

If you mainly want the quickest path from GitHub student benefits to a working
terminal agent, GitHub Copilot CLI is still the simpler first step. If you want
one polished paid tool first, [Claude Code](claude-code.html) is another good
starting point.

## Short version

1. Install `opencode`.
2. Start it inside a repository.
3. Use `/connect` to attach GitHub Copilot, OpenCode Zen, or another provider.
4. Start with explanation and planning prompts.
5. Approve file edits and shell commands carefully.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Learn when local models and Ollama make sense](local-models.html)
- [Get started with Claude Code](claude-code.html)
- [Learn what skills are](skills.html)
- [Learn what `AGENTS.md` is for](agents-md.html)
- [Which tool should I use?](which-tool.html)
- [Get started with the Python package `llm`](llm.html)

## Official links

- [OpenCode intro](https://opencode.ai/docs)
- [OpenCode TUI](https://opencode.ai/docs/tui)
- [OpenCode CLI](https://opencode.ai/docs/cli)
- [OpenCode providers](https://opencode.ai/docs/providers)
- [OpenCode Zen](https://opencode.ai/docs/zen)
- [OpenCode permissions](https://opencode.ai/docs/permissions)
