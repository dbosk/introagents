---
title: Which Model Should I Use?
---

# Which model should I use?

Once you have picked a tool (see [Which tool should I use?](which-tool.html)),
the next question is which model to run inside it. Most modern coding tools
let you switch between several models, and the right choice depends on the
task, not just on which model is "best" in the abstract.

If you are unsure how you actually reach a model, start with
[Model access](model-access.html) first. If you specifically want a local or
offline route, see [Local models and Ollama](local-models.html).

## Intended learning outcomes covered on this page

After working through this page, students should be better able to:

- distinguish between an LLM tool, an underlying model, and a model-access
  route
- explain when local models via Ollama are a good fit and when hosted tools are
  the better choice
- choose an appropriate model family for a task by weighing quality, speed,
  cost, and local-versus-hosted constraints

## Short answer

- use Claude Opus when the task is hard, ambiguous, or needs deep reasoning
- use Claude Sonnet or GPT-5.4 for everyday serious coding work
- use GPT-5 mini for cheap helpers, subagents, and narrow mechanical tasks
- use a larger Qwen model via Ollama if you want a local or self-hosted route
- use a small Ollama model for quick utility help when frontier models are
  overkill or unavailable

## Comparison

The table below is a rough practical map, optimized for actual work rather
than benchmark bragging.

| Model family | Best use | Relative quality | Main tradeoff |
| --- | --- | --- | --- |
| Claude Opus | hardest debugging, architecture, forensics, ambiguous root-cause work, long chains of reasoning | usually the strongest overall reasoning and writing in this set | slower, more expensive, more session-limit anxiety |
| Claude Sonnet | everyday serious coding, implementation, reviews, normal debugging | close to Opus on many tasks, but less reliable on the nastiest multi-step cases | cheaper and faster, but gives up some depth |
| GPT-5.4 | strong general coding agent, implementation, edits across a repo, good default when you want throughput plus solid quality | roughly in the top working tier; usually not as prose-heavy as Opus, but very capable | quality can depend more on harness and provider policy |
| GPT-5 mini | cheap and faster helper for boilerplate, small transforms, grep-and-fix style tasks, subagents | clearly below the big frontier models, but often good enough for scoped tasks | weaker judgment, easier to drift on larger changes |
| Qwen larger open models | local or self-hosted coding help, decent code generation, useful when privacy, control, or cost matter | surprisingly strong for open weights, but usually below top proprietary models on hard reasoning | more setup, more variance by size and quantization, weaker long-horizon reliability |
| Kimi or Kimi K2 style models | long-context reading, broad synthesis, sometimes very good value | can be excellent for some analysis and synthesis workloads | availability and deployment path is less universal; coding reliability still depends on task and harness |
| Small Ollama local models (7B-ish class) | quick snippet help, toy examples, autocomplete-style assistance, introductory-course use | good for lightweight help, not frontier-class | weak on difficult repo work, planning, and deep debugging |
| Mid or large Ollama open models (14B, 32B, 70B-ish class) | better local coding assistant, document reading, medium-difficulty implementation | much better than tiny local models; still usually below top proprietary models on the hardest work | hardware hungry, slower, and still less reliable than Opus or top GPTs on tough tasks |

## How to choose in practice

A short practical ranking by task:

- hardest reasoning, debugging, or architecture: Claude Opus
- best balance for normal serious work: Claude Sonnet or GPT-5.4
- best cheap helper, subagent, or mechanical worker: GPT-5 mini
- best if you want local or open-weight control: larger Qwen-class models via
  Ollama
- best for cheap local classroom or quick utility use: small Ollama models,
  but keep expectations modest

A simple decision rule:

1. If the task is scary or ambiguous, start with Opus.
2. If the task is real but not pathological, use Sonnet or GPT-5.4.
3. If the task is narrow and repetitive, use GPT-5 mini.
4. If the task must stay local or self-hosted, use Qwen or another larger
   open model via Ollama.
5. If the task is for students, toy help, or no-budget inference, use smaller
   Ollama models.

## Expected quality ladder

Very roughly, from strongest to weakest on hard work:

1. Claude Opus
2. Claude Sonnet ~= GPT-5.4
3. strong open-weight models / Kimi-tier (depending on task)
4. mini models
5. small local Ollama models

## Harness matters more than people think

The biggest caveat is that the harness around the model matters a lot. A
good client with good context handling, subagents, and tooling can easily
make a slightly weaker model feel better in practice than a stronger model in
a worse harness.

In other words:

- a strong model in a weak harness can still feel frustrating
- a slightly weaker model in a strong harness (such as Claude Code or
  OpenCode with good `AGENTS.md` and skills) often beats a stronger model in
  browser chat
- model choice and tool choice interact, so it is worth reading
  [Which tool should I use?](which-tool.html) and
  [Agentic concepts](agentic-concepts.html) alongside this page

## A common everyday pattern

A practical pattern several practitioners in this course use is:

1. plan a hard change with Opus inside Claude Code
2. switch to GPT-5.4 inside OpenCode to actually implement the plan
3. delegate small mechanical edits or searches to GPT-5 mini as subagents
4. fall back to a local model for offline work or when subscription limits
   are hit

This is not the only pattern, but it illustrates that model choice is rarely
"pick one and stick with it". Most serious workflows mix models depending on
the task.

## Self-check

Try these short scenarios before looking at the suggested answers:

1. You need the strongest reasoning for an ambiguous debugging or architecture
   problem. Which model family should you try first?
2. You want a good everyday default for serious coding work without always
   paying for the strongest model. Which model family fits best?
3. You need a cheap helper for narrow, repetitive edits or subagent work. Which
   model family fits best?
4. Privacy or local control matters more than frontier quality. Which model
   family fits best?

Suggested answers:

1. Claude Opus.
2. Claude Sonnet or GPT-5.4.
3. GPT-5 mini.
4. A larger open model through Ollama, such as Qwen.

## Short version

1. Match the model to the task, not to the hype.
2. Use Opus for hard work, Sonnet or GPT-5.4 for everyday work, mini models
   for cheap helpers, and Ollama models for local use.
3. Remember that the harness around the model matters at least as much as
   the model itself.
4. Mix models across a workflow when it makes sense.

## Next step

- [Understand model access: GitHub, Claude, APIs, Zen, and Ollama](model-access.html)
- [Learn when local models and Ollama make sense](local-models.html)
- [Which tool should I use?](which-tool.html)
- [Understand the shared agentic concepts](agentic-concepts.html)
