---
title: Local Models and Ollama
---

# Local models and Ollama

If you want to run models on your own machine instead of depending on GitHub,
Claude, or a direct API provider, Ollama is the main route worth learning
early.

This is not the simplest default path for most students. It becomes attractive
when local or offline use, privacy, open-weight experimentation, or avoiding
per-prompt API billing matters more than using the strongest hosted model.

## When this route makes sense

- you want local or offline use
- you want more control over where data goes
- you want to experiment with open-weight models
- you do not want every prompt to depend on a remote subscription or API
- you are willing to trade convenience for more control

## When not to start here

- you want the quickest path to a strong coding agent
- you mainly need reliable repository help, not model experimentation
- your machine already struggles with development tools
- you do not want to think about local servers, model downloads, or hardware
  limits

If that sounds like you, start with [Model access](model-access.html),
[GitHub Copilot CLI](copilot-cli.html), or [Claude Code](claude-code.html)
instead.

## Realistic expectations

Local does not automatically mean better. The tradeoffs are simply different:

- smaller models are easier to run than larger coding models
- speed and quality depend heavily on your machine
- local models can be useful for drafting, summarizing, classification, and
  simple code help
- for harder repository work or ambiguous debugging, hosted tools are often
  still easier and stronger

Ollama also offers cloud options, but this page focuses on the local-first
workflow.

## A basic Ollama workflow

1. Install Ollama from the official download page.
2. Pull a model.
3. Make sure it runs locally.

For example:

```sh
ollama pull gemma3
ollama list
ollama run gemma3
```

If one model feels too slow, switch to a smaller one before you keep tuning
settings.

On most systems, Ollama exposes a local server that tools can connect to.

## Use it with `llm`

The simplest local path for `llm` is the `llm-ollama` plugin:

```sh
llm install llm-ollama
llm ollama models
llm -m gemma3 "Explain what this repository is about"
```

By default, `llm-ollama` talks to a local Ollama server at `localhost:11434`.
If your server is elsewhere, set `OLLAMA_HOST`.

## Use it with OpenCode

The local OpenCode route is:

1. Make sure Ollama is running and has at least one model pulled.
2. Start `opencode`.
3. Run `/connect`.
4. Choose `Ollama`.
5. Confirm the local server address if OpenCode asks for it.
6. Run `/models` and select a model.

If tool-calling does not work well, OpenCode recommends increasing `num_ctx`,
starting around `16k` to `32k`.

## Hardware and workflow caveats

- disk space, RAM, and GPU availability matter
- a model that technically runs may still be too slow to be pleasant
- larger coding models are often the hardest to run well on student hardware
- start with one small model and one simple prompt before building a bigger
  workflow on top of it

This is a good route for learning and experimentation, but it is not a promise
that your laptop will handle every model comfortably.

## Where this fits in this course

- use [GitHub Copilot CLI](copilot-cli.html) or [Claude Code](claude-code.html)
  if you want the easiest strong hosted coding workflow
- use [OpenCode](opencode.html) when you want an open source coding agent that
  can connect to Ollama
- use [the Python package `llm`](llm.html) when you want local models inside
  shell pipelines, chats, or Python code

## Good habits

- verify `ollama run ...` works before adding another tool on top
- keep one or two models installed at first
- use `ollama list`, `llm ollama models`, or OpenCode `/models` to check what is
  actually available
- remember that local models still need verification; local does not mean
  correct

## Short version

1. Install Ollama.
2. Pull one model and make sure `ollama run ...` works.
3. Connect it to `llm` or OpenCode.
4. Use local models when privacy, offline use, or open-weight experimentation
   matters.
5. Prefer hosted tools when you want the easiest or strongest repository
   workflow.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Get started with OpenCode](opencode.html)
- [Get started with the Python package `llm`](llm.html)
- [Which tool should I use?](which-tool.html)

## Official links

- [Ollama](https://ollama.com)
- [Download Ollama](https://ollama.com/download)
- [Ollama documentation](https://docs.ollama.com)
- [Ollama integration for OpenCode](https://docs.ollama.com/integrations/opencode)
- [OpenCode providers](https://opencode.ai/docs/providers)
- [llm-ollama](https://github.com/taketwo/llm-ollama)
