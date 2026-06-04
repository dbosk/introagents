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

## Intended learning outcomes covered on this page

After working through this page, students should be better able to:

- distinguish between an LLM tool, an underlying model, and a model-access
  route
- choose an appropriate access route based on availability, cost, and desired
  workflow
- explain when local models via Ollama are a good fit and when hosted tools are
  the better choice

## Short version

- use GitHub Copilot when student benefits are available and you want the
  simplest course path
- use Claude Code with `Claude Pro` or `Claude Max` when you want one clear
  paid coding-tool path
- use direct APIs when you want provider choice, scripting, or automation
- use Mistral when you want an EU-based hosted alternative with a student plan
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
- Mistral API

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

If you want an EU-based hosted alternative, Mistral is worth knowing. For
student-facing planning, the main tiers to remember are `Free`, `Education`,
and `Pro`. `Education` is the student-discounted plan, whilst `Pro` is the
paid personal tier with more headroom. For stronger coding through the API,
the practical Mistral pair to remember is `Mistral Small 4` for cheaper work
and `Mistral Medium 3.5` for stronger work.

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

1. If GitHub student benefits work, start there. Note that the GitHub Copilot
   billing model has been tightening recently, so do not assume the limits
   you see today will last.
2. If you want one paid coding tool, start with Claude Code. Expect strong
   output but some session-limit anxiety.
3. If you want predictable per-request cost, consider OpenCode Zen or Go.
4. If you want scripts or provider choice, learn direct API access.
5. If you want local or offline use and have enough hardware, consider Ollama.

Once you know how to reach a model, the next question is which model to
actually use for a given task. See
[Which model should I use?](which-model.html).

## Self-check

Try these before reading the suggested answers:

1. You have GitHub student benefits, want the simplest course path, and do not
   care much about provider choice yet. Which access route is the best first
   step?
2. You want to write Python scripts that call a model repeatedly with your own
   billing and keys. Which access route fits best?
3. You want local or offline use on your own machine and enough hardware is
   available. Which access route fits best?
4. You installed `llm`, but it still cannot answer prompts. Which critical
   distinction should you check first?

Suggested answers:

1. GitHub Copilot access.
2. Direct API access.
3. Ollama.
4. The distinction between installing a tool and actually having model access.

## Subscription experience and fairness

The table above compares access *routes* abstractly. In practice, students
also want to know which subscriptions feel fair, predictable, and worth the
money. The table below collects current pricing, usage limits, and
practitioner experience reported in the course discussion channel. Prices,
limits, and policies change often, so verify the source links before
committing.

| Subscription | Price | Usage / limits | Notes | Sources | Experience and fairness |
| --- | ---: | --- | --- | --- | --- |
| OpenAI Codex via ChatGPT Plus | $20/mo | Codex included; lighter use; suitable for select projects throughout the week | Codex is bundled into ChatGPT, not sold as a separate consumer subscription | [Codex CLI docs](https://platform.openai.com/docs/codex/cli), [ChatGPT Pro help](https://help.openai.com/en/articles/9793128-what-is-chatgpt-pro) | Feels good right now. [Ric](https://www.kth.se/profile/glassey) reports that Codex via ChatGPT Plus finally made the subscription worthwhile and that it feels like working without running out of gas. Currently positive, with explicit expectation that this could tighten later. |
| OpenAI Codex via ChatGPT Pro | $100/mo or $200/mo | Higher Codex usage than Plus; OpenAI currently describes roughly 5x or 20x higher limits than Plus depending on tier | Still bundled into ChatGPT Pro tiers rather than standalone Codex plans | [ChatGPT Pro help](https://help.openai.com/en/articles/9793128-what-is-chatgpt-pro) | No direct first-hand experience reported in the course discussion. Likely fair if you truly need the headroom, but the strongest praise was for Plus-value, not the higher tiers specifically. |
| Claude Pro | $20/mo monthly or $17/mo annual | More usage; includes Claude Code and Claude Cowork | Claude Code Pro is not a separate SKU on the pricing page | [Claude Pro pricing](https://claude.com/pricing/pro) | Mixed but still strong. Earlier off-peak promos were popular, and [Daniel](https://www.kth.se/profile/dbosk) and Ric both get good work out of Claude, but there is recurring session-limit anxiety and active planning around resets. Productive, but not very predictable. |
| Claude Max 5x | $100/mo | 5x more usage than Pro | Includes Claude Code | [Claude Max pricing](https://claude.com/pricing/max) | Likely better if you value continuity more than price, but the course discussion did not include concrete hands-on Max feedback. The appeal is mainly buying relief from limits. |
| Claude Max 20x | $200/mo | 20x more usage than Pro | Includes Claude Code | [Claude Max pricing](https://claude.com/pricing/max) | Same caveat as Max 5x. Probably attractive only for very heavy use. Claude is admired for output quality, but the pricing and limit model still seems to create more mental overhead than the alternatives. |
| Mistral Free | $0 | Limited Vibe access: limited messages, web searches, and coding sessions; API pricing is separate PAYG | Good for trying Mistral quickly without upfront cost | [Mistral pricing](https://mistral.ai/pricing), [Vibe overview](https://mistral.ai/products/le-chat) | Initially looked generous enough to try, but Daniel reported exhausting the free allowance quickly and not liking the quality enough to justify depending on it. |
| Mistral Education | $5.99 | Verified-student plan; max 12 months; only for students who have not used Vibe or Le Chat before | Most student-relevant Mistral paid tier if you are eligible | [Mistral pricing](https://mistral.ai/pricing) | Sensible if you specifically want to try Mistral as an EU-based option, but not discussed as a clear Claude replacement for hard coding work. |
| Mistral Pro | $14.99/mo | Up to 6x Free messages, up to 5x web searches, up to 40x image generation; positioned as all-day coding; beyond plan limits, usage continues at API rate | Best understood as the paid personal Mistral tier | [Mistral pricing](https://mistral.ai/pricing) | More explicit than some fuzzy plans, but the in-thread feeling was still that the quality/headroom tradeoff looked clearly worse than Anthropic for Daniel's use case. |
| GitHub Copilot Pro+ | $39/mo | 1,500 premium requests/mo; unlimited agent mode and chats with GPT-5 mini; unlimited inline suggestions | Extra premium requests at $0.04/request; usage-based billing changes are coming June 1 | [Copilot plans](https://github.com/features/copilot/plans), [Copilot billing docs](https://docs.github.com/en/copilot/concepts/billing/copilot-requests) | Sentiment turned negative after the billing change announcement. Daniel and Ric both reacted as if the old deal had been unusually generous and was now getting worse. Predictability seems worse after the multiplier and usage-based billing news. |
| OpenCode Go | $5 first month, then $10/mo | Hard limits: $12 per 5 hours, $30/week, $60/month | Beta | [OpenCode Go docs](https://opencode.ai/docs/go/) | Positive on workflow. Daniel explicitly praised OpenCode for dynamic context pruning and uses it strategically when Claude is near its limit. The usage model is understandable and the product helps extend productive time rather than creating more anxiety. |
| OpenCode Zen | pay-as-you-go | No fixed monthly cap; per-request billing, free models available, spend limits configurable | More prepaid or PAYG than a normal monthly subscription | [OpenCode Zen docs](https://opencode.ai/docs/zen/) | Probably the most predictable in accounting terms because it is explicit PAYG, but that also means less of the cosy all-you-can-eat feeling. Respectable and transparent, though not discussed emotionally in the same way as Claude or Codex. |
| Google AI Plus | from $7.99/mo | More access; current help pages list up to 30 Pro prompts/day, 90 Thinking/day, 12 Deep Research/day, 50 images/day, 2 videos/day; 128K context | Region-specific pricing | [Gemini subscriptions](https://gemini.google/us/subscriptions/?hl=en), [Gemini usage limits](https://support.google.com/gemini/answer/16275805?hl=en) | Mentioned as a plan to include, but no first-hand experience was shared in the course discussion. Fairness unknown. |
| Google AI Pro | $19.99/mo | Higher access; up to 100 Pro/day, 300 Thinking/day, 20 Deep Research/day, 100 images/day, 3 videos/day; 1M context | Region-specific pricing | [Gemini subscriptions](https://gemini.google/us/subscriptions/?hl=en), [Gemini usage limits](https://support.google.com/gemini/answer/16275805?hl=en) | Same caveat: included for completeness, but no real usage impressions in the course discussion. Fairness unknown. |
| Google AI Ultra | $249.99/mo | Highest access; up to 500 Pro/day, 1500 Thinking/day, 120 Deep Research/day, 1000 images/day, 5 videos/day, plus Deep Think; 1M context | Region-specific pricing and availability | [Gemini subscriptions](https://gemini.google/us/subscriptions/?hl=en), [Gemini usage limits](https://support.google.com/gemini/answer/16275805?hl=en) | No first-hand evidence in the course discussion. Hard to rate fairly. |

A few naming caveats:

- Claude Code Pro and Claude Code Max are really Claude Pro and Claude Max
  plans that include Claude Code.
- Mistral's chat assistant is now called Vibe (formerly Le Chat), but the API
  model layer is still separate.
- For student work, the main Mistral API pair to remember is `Mistral Small 4`
  for cheaper work and `Mistral Medium 3.5` for stronger coding work.
- `Devstral 2` is deprecated, so do not learn it as a current default.
- OpenAI Codex is currently bundled into ChatGPT plans rather than sold as
  its own consumer subscription.
- OpenCode Zen is pay-as-you-go rather than a normal monthly plan.

### Short ranked summary

From the course discussion:

- **Best value right now:** OpenAI Codex via ChatGPT Plus. Ric's feedback is
  the strongest positive signal: it finally made the subscription feel
  worthwhile, and it currently feels generous.
- **Best output quality:** Claude. Still treated as the strongest worker
  overall, but with more session-limit anxiety and more operational friction.
- **Best predictability and transparency:** OpenCode Zen, then OpenCode Go.
  Zen is explicit PAYG, and Go has visible hard caps. They may feel less
  luxurious than "unlimited-ish" plans, but they are easier to reason about.
- **Best EU-based hosted alternative:** Mistral. Useful to know about if you
  want an EU-based provider plus a student discount, but the course discussion
  still treated it as a weaker coding option than Claude.
- **Best workflow complement:** OpenCode as a harness. Independent of
  provider, Daniel explicitly likes OpenCode for dynamic context pruning and
  for extending productive time when Claude is near its limit.
- **Best for heavy users if you just want headroom:** probably Claude Max or
  ChatGPT Pro tiers, but the course discussion does not contain enough
  first-hand evidence to rank those confidently beyond "you pay to reduce
  interruptions".
- **Biggest fairness downgrade recently:** GitHub Copilot Pro+. The billing
  and multiplier changes shifted the mood from "great deal" to "that was too
  good to last".
- **Most undersampled in the discussion:** Gemini. Included for
  completeness, but not enough first-hand usage to rate fairly.

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
- [Which model should I use?](which-model.html)

## Official links

- [GitHub Education for students](https://github.com/education/students)
- [Plans for GitHub Copilot](https://docs.github.com/en/copilot/about-github-copilot/subscription-plans-for-github-copilot)
- [Claude Code setup](https://docs.anthropic.com/en/docs/claude-code/setup)
- [OpenCode providers](https://opencode.ai/docs/providers)
- [OpenCode Zen](https://opencode.ai/docs/zen)
- [LLM setup](https://llm.datasette.io/en/stable/setup.html)
- [LLM plugin directory](https://llm.datasette.io/en/stable/plugins/directory.html)
- [Ollama](https://ollama.com)
