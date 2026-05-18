---
title: Reflections
---

# Reflections on agentic AI

Earlier pages in this section teach how to operate agentic tools and how to
avoid the immediate risks they create on your project. This page is
different. It collects writing from people who have been using these tools
long enough to start *reflecting* on the consequences — for skill, for
comprehension, for ownership of what you build, and for the wider social
context of software work.

The point is not to convert you to any one position. The point is to make
sure you have read at least some of the public discussion before forming
your own view. Most of the writing linked here was published while the
situation was still moving — the canonical sources you would normally reach
for in a more settled field do not yet exist.

A pragmatic suggestion: read at least one piece from each section. The
reflection prompts at the end of each section are short and intentionally
open; they work best after you have read.

## Intended learning outcomes covered on this page

After working through this page, students should be better able to:

- reflect critically on the wider consequences of agentic LLM use — on
  skill, comprehension, ownership, and the social context of software work
  — and engage informedly with the public discussion
- recognise the main legal, privacy, and reliability risks of using LLM
  tools on real work (this page extends the operational treatment in
  [Problematic cases of using AI](problematic-cases.html))

## Generation is hallucination; verification is the default

A useful reframing comes from practitioners at Thoughtworks: every
generation is, in a strict sense, a hallucination. The model is always
producing plausible text by predicting the next likely token, and the
interesting question is not *whether* it is hallucinating but *which*
generations happen to be true.
[Rebecca Parsons has been making that case for some years](https://www.thoughtworks.com/en-us/insights/blog/generative-ai/we-need-to-treat-AI-hallucinations-as-a-feature-not-a-bug);
the in-house Thoughtworks article puts it as "AI hallucination
isn't a system failure; it's the natural result of a new kind of computing
that works on probability, not on strict logic."
[Martin Fowler discusses the same reframing in his own essay](https://martinfowler.com/articles/202508-ai-thoughts.html)
on LLMs and software development.

If you accept the reframing, verification stops being a special step you
take when something looks wrong; it is the default mode of using the tool.
That is also how the [Verification](verification.html) page in this section
is structured.

### Further reading

- Abhishek Roy, [*We need to treat AI hallucinations as a feature, not a
  bug*](https://www.thoughtworks.com/en-us/insights/blog/generative-ai/we-need-to-treat-AI-hallucinations-as-a-feature-not-a-bug),
  Thoughtworks Insights, 20 August 2025.
- Martin Fowler, [*Some thoughts on LLMs and Software
  Development*](https://martinfowler.com/articles/202508-ai-thoughts.html),
  martinfowler.com, August 2025.

### Reflection prompts

- When did you last verify a model output only because you noticed something
  off, rather than as a default?
- What practical habits would change if you treated every model output as
  a hallucination by default?

## Cognitive debt, comprehension debt, decoupled comprehension

The longer-term cost of agentic coding may not be in the code at all; it may
be in what happens to the people who use the tools.
[Margaret-Anne Storey proposes the term *cognitive debt*](https://margaretstorey.com/blog/2026/02/09/cognitive-debt/)
for the erosion of shared mental models that builds up when AI generates
code faster than a team can understand it. Technical debt lives in the
code; cognitive debt lives in people, and it is harder to measure because
none of the usual velocity metrics capture it.

[Addy Osmani names a closely related effect *comprehension debt*](https://addyosmani.com/blog/comprehension-debt/):
the gap between how much code exists in your system and how much of it any
human being genuinely understands. He points to
[a randomised study by Judy Shen and Alex Tamkin, *How AI Impacts Skill Formation*](https://arxiv.org/abs/2601.20245),
which finds that AI assistance to learn a new programming library impairs
developers' later conceptual understanding, code reading, and debugging —
without delivering significant efficiency gains on average. The cost is
paid in skill, not in clock time.

[Joshua Bloom, writing about scientific work rather than software per se, captures the personal side of the same drift](https://medium.com/@profjsb/mis-adventures-of-genai-in-the-scientific-workflow-d2ff1d804850).
After a week of working with agents, he wrote, "I started to get this
nagging sense I was being slowly led into a state of stuporous acquiescence,
that the whole package was working even if I couldn't understand all of it." A useful umbrella term for
all three observations is *decoupled comprehension* — the code and your
grasp of it have drifted apart. The mitigation, as
[Problematic cases](problematic-cases.html#over-reliance) puts it, is the
verification workflow: recoupling claim to evidence, deliberately.

### Further reading

- Margaret-Anne Storey, [*How Generative and Agentic AI Shift Concern from
  Technical Debt to Cognitive
  Debt*](https://margaretstorey.com/blog/2026/02/09/cognitive-debt/),
  margaretstorey.com, 9 February 2026.
- Addy Osmani, [*Comprehension Debt — the hidden cost of AI generated
  code*](https://addyosmani.com/blog/comprehension-debt/),
  addyosmani.com, 14 March 2026.
- Joshua Bloom, [*(Mis)Adventures of GenAI in the Scientific
  Workflow*](https://medium.com/@profjsb/mis-adventures-of-genai-in-the-scientific-workflow-d2ff1d804850),
  Medium, 29 December 2025.
- Judy Hanwen Shen and Alex Tamkin, [*How AI Impacts Skill
  Formation*](https://arxiv.org/abs/2601.20245), arXiv:2601.20245, January
  2026. The empirical study Osmani draws on; useful as the primary source.
- Joseph Weizenbaum, *Computer Power and Human Reason: From Judgment to
  Calculation*, W. H. Freeman, 1976. The classic 1976 critique of
  unreflective reliance on computational tools — written half a century
  before any of the above and still uncomfortably relevant.

### Reflection prompts

- What is something you used to do confidently that you would now reach for
  an agent to help with?
- How would you notice if your understanding of a codebase had drifted
  behind the agent's?

## Context, attention, and the long session

[Teresa Torres writes about *context rot*](https://www.producttalk.org/context-rot/):
as a session gets longer and noisier, the value of each individual detail
in the agent's context diminishes, and eventually the agent's behaviour
degrades in ways that look like sloppiness or forgetfulness. The pattern is the same one
[Agentic concepts](agentic-concepts.html#context-windows-and-context-rot)
describes in operational terms; Torres's article frames it from the user's
side — when to suspect context rot, why "start a fresh session" is cheaper
than it feels, and how it shapes the rhythm of working with an agent over
the course of a day.

### Further reading

- Teresa Torres, [*Context Rot: Why AI Gets Worse the Longer You Chat (And
  How to Fix It)*](https://www.producttalk.org/context-rot/), Product Talk,
  4 February 2026.

### Reflection prompts

- In your own work, what signal first tells you a session has gone stale?
- Is "start a fresh session" cheaper or more expensive than you think it is?

## The lethal trifecta and the new security shape

[Simon Willison's *lethal trifecta*](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/)
names the conditions under which prompt injection becomes especially
dangerous: an agent that simultaneously has access to your private data,
exposure to untrusted content, and the ability to communicate externally. Each leg on its own is usually manageable;
together they let an attacker hidden inside something the agent reads
exfiltrate private data through the agent itself. The operational version of
this — and the practical defaults that follow from it — lives on the
[Problematic cases](problematic-cases.html#prompt-injection-and-the-lethal-trifecta)
page. Read Willison's original post for the underlying argument and for why
it matters more in agentic settings than in single-turn chat. His longer
[*Agentic engineering patterns* guide](https://simonwillison.net/guides/agentic-engineering-patterns/)
is a useful companion piece on how practitioners are working with these
constraints in practice.

### Further reading

- Simon Willison, [*The lethal trifecta for AI agents: private data,
  untrusted content, and external
  communication*](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/),
  simonwillison.net, 16 June 2025.
- Simon Willison, [*Agentic engineering
  patterns*](https://simonwillison.net/guides/agentic-engineering-patterns/),
  simonwillison.net, ongoing.

### Reflection prompts

- Which of your normal agentic sessions today touches all three legs of the
  trifecta?
- What kinds of inputs do you currently treat as "trusted" without checking?

## Building without purpose, building for joy, building wastelands

Two related observations sit in tension here. On the one hand, agentic tools
genuinely lower the barrier to *starting* a project.
[Thomas Ptacek's piece *The Emacsification of Software*](https://sockpuppet.org/blog/2026/05/12/emacsification/)
describes a culture in which AI-pilled developers are finally finishing the
long list of personal tools they always wanted but never had time to write
— building small, idiosyncratic software the same way long-time Emacs users
build personal text-editor extensions.
[Lalit Maganti's account of building *syntaqlite*](https://lalitm.com/post/building-syntaqlite-ai/)
is a concrete worked example of this: eight years of wanting to build a
particular tool, three months of actually building it with AI help. Practitioners sometimes call
this pattern *SLIP* — *solves lingering but important problems* — because
it is one of the clearest reasons agentic tools win sceptics over.

On the other hand, the same friction-lowering makes it easy to accumulate
half-finished projects nobody is maintaining. Among the wider discussion you
will hear *productive uncertainty* (making progress without being sure what
just happened), *compulsive construction* (building without a clear goal
because the agent makes it cheap to), *cognitive overflow* (development
velocity exceeding developer comprehension), and *project wasteland* (the
graveyard of started-but-abandoned agentic projects). None of these are
formal terms, but they are recognisable in conversation.

### Further reading

- Thomas Ptacek, [*The Emacsification of
  Software*](https://sockpuppet.org/blog/2026/05/12/emacsification/),
  sockpuppet.org, 12 May 2026.
- Lalit Maganti, [*Eight years of wanting, three months of building with
  AI*](https://lalitm.com/post/building-syntaqlite-ai/), lalitm.com,
  5 April 2026.

### Reflection prompts

- Of the side-projects you have started in the last year, which would you
  actually maintain?
- What is the difference, for you, between productive uncertainty and
  compulsive construction?

## Education, literacy, and the duty of care

[Mary Kalantzis and Bill Cope argue that generative AI is, more than anything, a *technology of writing*](https://ila.onlinelibrary.wiley.com/doi/full/10.1002/rrq.591),
and that the consequences for literacy and education may be on the scale of
the invention of moveable type. Their
article is the most ambitious of the readings on this page and is worth
reading slowly; they end with a proposal for what they call *cyber-social
literacy learning*. One small observation worth holding on to is their
remark that teachers may, ironically, dodge some of the displacement
pressure that other knowledge-economy workers face — precisely because part
of their job is the *duty of care* of being with students in person.

### Further reading

- Mary Kalantzis and Bill Cope, [*Literacy in the Time of Artificial
  Intelligence*](https://ila.onlinelibrary.wiley.com/doi/full/10.1002/rrq.591),
  *Reading Research Quarterly* 60(1), Article e591, 2025.
  DOI: 10.1002/rrq.591.

### Reflection prompts

- Where in your education has AI displaced a kind of practice that mattered?
- Where has it cleared room for a kind of practice that mattered more?

## Does AI broaden or narrow the literature you read?

One of the more interesting empirical questions is whether LLM-assisted
research broadens or narrows the literature people actually read. The answer
so far is "both, depending on scale". At the level of a single researcher,
AI-aided search tools surface newer papers, more books, and sources that
traditional keyword search misses; researchers using these tools publish
more and cite more broadly. At the level of the field as a whole, however,
LLM-suggested references concentrate heavily on already well-cited papers,
and the topics that get studied appear to converge. The same tool that
expands one person's reading can contract the collective conversation.

This is not a contradiction; it is a difference of scale. It is worth
holding both findings at once when you reason about your own use of these
tools.

The clearest single statement of the paradox is in the title of
[a recent preprint by Hao, Xu, Li and Evans: *Artificial Intelligence Tools Expand Scientists' Impact but Contract Science's Focus*](https://arxiv.org/abs/2412.07727).
Their study reports that scientists using AI publish around three times
more papers and receive nearly five times more citations — and that the
collective volume of scientific topics shrinks measurably.
[The Cornell Chronicle's lay summary, reporting on a 2025 *Science* paper by Kusumegi and colleagues](https://news.cornell.edu/stories/2025/12/ai-gives-scientists-boost-cost-too-many-mediocre-papers),
makes the same individual-level finding: AI-using scientists produced
roughly a third more papers on arXiv, with non-native English speakers
gaining the largest boost, and AI-powered search tools surfaced newer and
more diverse sources than traditional keyword search. A more pessimistic
reading comes from
[Algaba and colleagues, who analysed nearly 275,000 LLM-generated references](https://arxiv.org/abs/2504.02767)
and found that LLMs systematically reinforce the Matthew effect in
citations — they overwhelmingly suggest already-popular papers.
[Traberg, Roozenbeek, and van der Linden go further still, arguing in *Communications Psychology* that the rush to study and use AI is producing a *scientific monoculture*](https://www.nature.com/articles/s44271-026-00428-5)
of methods, questions, and viewpoints. Whichever reading
persuades you, the takeaway is the same: notice what your own LLM-aided
literature search is and is not surfacing.

### Further reading

- Qianyue Hao, Fengli Xu, Yong Li and James Evans, [*Artificial Intelligence
  Tools Expand Scientists' Impact but Contract Science's
  Focus*](https://arxiv.org/abs/2412.07727), arXiv:2412.07727, 2024
  (forthcoming in *Nature*).
- Patricia Waldron, [*AI gives scientists a boost, but at the cost of too
  many mediocre
  papers*](https://news.cornell.edu/stories/2025/12/ai-gives-scientists-boost-cost-too-many-mediocre-papers),
  Cornell Chronicle, 19 December 2025. Reports on Keigo Kusumegi *et al.*,
  *Scientific Production in the Era of Large Language Models*, *Science*,
  18 December 2025.
- Jialin Liu, Yongyuan He, Zhihan Zheng, Yi Bu and Chaoqun Ni,
  [*AI-Assisted Writing Is Growing Fastest Among Non-English-Speaking and
  Less Established Scientists*](https://arxiv.org/abs/2511.15872),
  arXiv:2511.15872, 2025.
- Andres Algaba *et al.*, [*How Deep Do Large Language Models Internalize
  Scientific Literature and Citation
  Practices?*](https://arxiv.org/abs/2504.02767), arXiv:2504.02767, 2025.
- Cecilie S. Traberg, Jon Roozenbeek and Sander van der Linden,
  [*AI is turning research into a scientific
  monoculture*](https://www.nature.com/articles/s44271-026-00428-5),
  *Communications Psychology*, 2026. DOI: 10.1038/s44271-026-00428-5.

### Reflection prompts

- In your own literature searches with an LLM, do you notice it pulling you
  toward classics or toward newer work — and how would you tell?
- Whose interests does the individual-broadens / field-narrows split serve,
  and whose does it not?

## Where this page goes next

The list above is not complete and will not stay current on its own. If you
come across a piece worth adding — or one that has aged badly and should
come down — let the course know. For the operational counterparts to the
reflective writing collected here, see
[Problematic cases of using AI](problematic-cases.html) and
[Verification](verification.html).
