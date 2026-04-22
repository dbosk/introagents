---
title: Model Access
---

# Model access

Installing a tool is not the same thing as getting access to a model.

For example:

- `copilot`, `claude`, `opencode`, and `llm` are tools
- GitHub Copilot, Claude subscriptions, direct provider APIs, OpenCode Zen, and
  Ollama are access routes

If a tool installs correctly but still cannot answer prompts, missing model
access is often the reason.

## Short version

- use GitHub Copilot when student benefits are available and you want the
  simplest course path
- use Claude Code with `Claude Pro` or `Claude Max` when you want one clear
  paid coding-tool path
- use direct APIs when you want provider choice, scripting, or automation
- use OpenCode Zen when you want a curated set of models inside OpenCode
- use Ollama when you want local or offline models and have enough hardware

## Comparison

| Route | Good when | Works well with | Main tradeoff |
| --- | --- | --- | --- |
| GitHub Copilot | student benefits are available | GitHub Copilot CLI, OpenCode, `llm-github-copilot` | access, quotas, and plan details can change |
| Claude subscription | you want one paid coding tool quickly | Claude Code | mainly a Claude Code route, not the general answer for every other tool |
| Direct APIs | you want provider choice or scripts | `llm`, OpenCode | you manage billing, keys, and cost yourself |
| OpenCode Zen | you want tested models inside OpenCode | OpenCode | pay-as-you-go and mostly specific to the OpenCode ecosystem |
| Ollama | you want local or offline models | OpenCode, `llm-ollama` | requires local setup and enough hardware |

## GitHub Copilot

GitHub Copilot is often the easiest route when student benefits are active.

In this course, that route can be reused in several places:

- GitHub Copilot CLI directly
- OpenCode through `/connect`
- `llm` through the `llm-github-copilot` plugin

GitHub-backed access often uses browser or device login rather than copying a
plain API key. That is normal.

GitHub is still worth trying, but do not assume approval, quotas, or model
availability will stay fixed forever.

## Claude Code with a Claude plan

If you want one polished paid coding agent and do not want to wait on GitHub
approval, Claude Code is the clearest path.

Claude Code access requires a plan that includes it, such as `Claude Pro`,
`Claude Max`, team or enterprise access, or a Console account. The free
Claude.ai plan does not include Claude Code.

This is best understood as a Claude Code route. It is not the same thing as
setting up a general API key for every other tool.

## Direct API access

Direct APIs are the flexible route when you want scripting, provider choice, or
repeatable automation.

Common examples are:

- OpenAI API
- Anthropic API for Claude models

With direct APIs, you normally:

1. create an account with the provider
2. enable billing or credits
3. create an API key
4. connect that key to your tool

In `llm`, this usually means installing the matching plugin and using
`llm keys set ...` or environment variables.

In OpenCode, this usually means using `/connect` and then `/models`.

Important: subscriptions and APIs are different. Paying for a chat app or a
coding subscription does not automatically mean you have a separate
general-purpose API key.

## OpenCode Zen

OpenCode Zen is an optional provider from the OpenCode team.

Its main idea is simple: instead of making you compare many providers yourself,
Zen offers a curated list of models that the OpenCode team has tested and
verified to work well with OpenCode.

The usual flow is:

1. sign in to Zen
2. add billing details
3. create or copy an API key
4. connect Zen in OpenCode with `/connect`
5. choose a model with `/models`

Zen is pay-as-you-go. It also has some free models, monthly limits, and
auto-reload settings. It can also coexist with your own OpenAI or Anthropic
keys, but you do not need that to get started.

## Ollama and local models

Ollama is the main local option worth knowing early.

It lets you run open models on your own machine, which can be useful when you
want:

- local or offline use
- more control over where data goes
- experiments without signing into another remote provider

Ollama can be used with OpenCode and with `llm` through the `llm-ollama`
plugin.

If you want the deeper local track, read
[Local models and Ollama](local-models.html).

The tradeoff is that local models depend on your own hardware. This is not the
default route for most students, but it is a good option if you have enough RAM
or GPU and want to learn local workflows. In OpenCode, tool-calling with Ollama
may need a larger `num_ctx` setting.

## A simple decision rule

1. If GitHub student benefits work, start there.
2. If you want one paid coding tool, start with Claude Code.
3. If you want scripts or provider choice, learn direct API access.
4. If you want OpenCode with less provider hunting, consider Zen.
5. If you want local or offline use and have enough hardware, consider Ollama.

## Keep expectations flexible

Plans, model lists, prices, and quotas change often.

Before you rely on a route for a course project or a long workflow, verify the
current provider docs and current subscription details.

## Next step

- [Register with GitHub as a student](github-student.html)
- [Learn when local models and Ollama make sense](local-models.html)
- [Get started with Claude Code](claude-code.html)
- [Get started with OpenCode](opencode.html)
- [Get started with the Python package `llm`](llm.html)
- [Which tool should I use?](which-tool.html)

## Official links

- [GitHub Education for students](https://github.com/education/students)
- [Plans for GitHub Copilot](https://docs.github.com/en/copilot/about-github-copilot/subscription-plans-for-github-copilot)
- [Claude Code setup](https://docs.anthropic.com/en/docs/claude-code/setup)
- [OpenCode providers](https://opencode.ai/docs/providers)
- [OpenCode Zen](https://opencode.ai/docs/zen)
- [LLM setup](https://llm.datasette.io/en/stable/setup.html)
- [LLM plugin directory](https://llm.datasette.io/en/stable/plugins/directory.html)
- [Ollama](https://ollama.com)
