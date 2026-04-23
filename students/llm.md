---
title: Python LLM
---

# The Python package `llm`

`llm` is both a command-line tool and a Python library for working with large
language models. It is a good tool when you want prompts, chats, shell
pipelines, or Python scripts that you can rerun and adapt.

Compared to GitHub Copilot CLI or OpenCode, `llm` is less of a full coding
agent and more of a flexible interface for model access.

## What it is good for

- quick prompts from the terminal
- interactive chat with a chosen model
- repeatable shell workflows
- structured output such as JSON
- using language models from Python code

## Before you install it

You need two separate things:

1. the `llm` package itself
2. access to a model

That second part is important. Installing `llm` does not automatically give you
model access. One common course path is to use the `llm-github-copilot` plugin
so `llm` can use your GitHub Copilot access. But `llm` can also use direct API
plugins and local-model plugins. See [Model access](model-access.html).

## Installation

The official docs list several installation methods:

### pip

```sh
pip install llm
```

### pipx

```sh
pipx install llm
```

### uv

```sh
uv tool install llm
```

### Homebrew

```sh
brew install llm
```

Use the method that fits how you normally install Python tools.

## One common first setup: GitHub Copilot

A common student setup is:

1. install `llm`
2. install the GitHub Copilot plugin
3. log in with GitHub device authentication
4. pick a model
5. run prompts or start a chat

Install the plugin:

```sh
llm install llm-github-copilot
```

Then log in:

```sh
llm github_copilot auth login
```

After that, list the available models:

```sh
llm models
```

Then try a prompt with one of the `github_copilot/...` models:

```sh
llm -m github_copilot/model-name "Give me three short study tips for learning a new CLI tool"
```

The plugin uses GitHub device login and can reuse GitHub Copilot access instead
of requiring a separate API key for a different provider.

If you are using another access route, the exact plugin and authentication flow
will differ. See [Model access](model-access.html) for the overview.

## Other common access routes

### OpenAI API

OpenAI models work directly in `llm` once you set a key:

```sh
llm keys set openai
llm models
llm -m gpt-4o-mini "Give me three short study tips for learning a new CLI tool"
```

### Anthropic API

Claude models usually mean installing the Anthropic plugin first:

```sh
llm install llm-anthropic
llm keys set anthropic
llm models
llm -m claude-haiku-4.5 "Give me three short study tips for learning a new CLI tool"
```

### Local models with Ollama

If you want a local route, install the Ollama plugin and use a model that is
available on your Ollama server:

```sh
llm install llm-ollama
llm ollama models
llm -m gemma3 "Give me three short study tips for learning a new CLI tool"
```

The exact model name depends on what is available from your provider or local
server. `llm models` is the quickest way to check.

If you want the deeper local workflow, read
[Local models and Ollama](local-models.html).

## A simple first workflow

These examples use the GitHub-backed route above. If you are using another
provider, replace `github_copilot/model-name` with one returned by `llm models`.

Some good starter patterns are:

### A one-shot prompt

```sh
llm -m github_copilot/model-name "Summarize the difference between Copilot CLI and OpenCode in three bullet points"
```

### Use a file as input

```sh
cat README.md | llm -m github_copilot/model-name -s "Explain this project to a new student"
```

### Start an interactive chat

```sh
llm chat -m github_copilot/model-name
```

### See which models are available

```sh
llm models
```

Look for model names that start with `github_copilot/`.

## Why students often like it

`llm` is especially useful when you want work that is easy to rerun or turn
into a script. With `llm-github-copilot`, students can often do that using the
same GitHub account they already set up for student access. It is often the
best choice when you want to:

- put LLM use inside shell pipelines
- keep a prompt as part of a reproducible workflow
- ask for structured output
- call a model from Python code

## A small Python example

After installing `llm` and configuring access to a model, a minimal Python
script can look like this:

```python
import llm

model = llm.get_model("your-model-name")
response = model.prompt(
    "Explain when a student should use OpenCode instead of GitHub Copilot CLI."
)
print(response.text())
```

Use one of the model names returned by `llm models`, such as a
`github_copilot/...` model, `claude-haiku-4.5`, `gpt-4o-mini`, or a local
Ollama model.

That same package also supports attachments, tools, JSON schemas, and async
usage.

## Course-specific note about model names

In course material you may see examples such as:

```sh
llm chat -m kth-gpt-5.2
```

A model name like `kth-gpt-5.2` is not part of the default `llm` installation.
It is an example of a locally configured model or alias.

If you are following the GitHub-backed setup on this page, you will probably
start with a model name under `github_copilot/...`.

If you use a direct API or local route instead, you may see names such as
`claude-haiku-4.5`, `gpt-4o-mini`, or a local Ollama model name.

So there are two separate questions:

1. how to install and learn `llm`
2. which provider, plugin, or local model configuration you will actually use

The first part is general. A common second step in this course is the
`llm-github-copilot` plugin, but it is not the only route.

## Privacy and logging

By default, `llm` logs prompts and responses to a local SQLite database. That
is useful for experimentation, but it also means you should think about what
data you send to it.

Useful commands are:

```sh
llm logs status
```

```sh
llm logs off
```

```sh
llm logs on
```

## Good habits

- prefer `llm-github-copilot` if you already have GitHub Copilot access
- otherwise pick one clear route such as OpenAI, Anthropic, or Ollama before
  you start scripting
- use `llm models` so you know which model you are actually calling
- keep prompts and scripts in files when the workflow matters
- remember that model access and package installation are separate steps
- turn logging off if you are working with sensitive material

## How it differs from the coding agents

`llm` helps most when you want direct control over prompts, scripts, logs, and
structured output. That makes it a useful contrast case:

- `Planning before editing:` there is no built-in plan mode or separate
  planning agent. You structure the prompt or script yourself.
- `Limited context:` chats and logs exist, but you decide what context to send
  and when to start a fresh run.
- `Work isolation:` there is no central subagent workflow. If you want
  separation, you usually create separate prompts, chats, or scripts.
- `Instructions and memory:` saved prompts, plugins, and logs are useful, but
  they are not the same thing as a coding agent that loads project instructions
  and manages its own memory layer.

If you want the shared concepts across the coding-agent tools, read
[Agentic concepts](agentic-concepts.html).

## Short version

1. Install `llm`.
2. Choose one access route: GitHub Copilot, direct API, or local plugin.
3. Authenticate or set keys for that route.
4. Run `llm models` and use one of the listed model names.
5. Use the Python API when you want scripts or applications.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Learn when local models and Ollama make sense](local-models.html)
- [Understand the shared agentic concepts](agentic-concepts.html)
- [Which tool should I use?](which-tool.html)

## Official links

- [LLM documentation](https://llm.datasette.io/en/stable/)
- [LLM setup](https://llm.datasette.io/en/stable/setup.html)
- [LLM usage](https://llm.datasette.io/en/stable/usage.html)
- [LLM Python API](https://llm.datasette.io/en/stable/python-api.html)
- [LLM plugins](https://llm.datasette.io/en/stable/plugins/index.html)
- [LLM plugin directory](https://llm.datasette.io/en/stable/plugins/directory.html)
- [llm-github-copilot](https://github.com/jmdaly/llm-github-copilot)
- [llm-anthropic](https://github.com/simonw/llm-anthropic)
- [llm-ollama](https://github.com/taketwo/llm-ollama)
