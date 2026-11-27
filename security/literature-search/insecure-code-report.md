# insecure-code: report

**Status: stage 2 (complete report), 2026-11-27.** Screened by an AI agent
(an LLM classifier plus the agent's own reading); no decision has been
reviewed by the author. Sources cited here were all opened in this session.

Research question: *Do people who program with an LLM-based coding assistant
produce less secure code, and are they more confident in its security, than
people without one?*

## What the lecture may say

1. **AI coding tools often produce code with security flaws.** When GitHub
   Copilot completed 89 security-relevant scenarios in 2021, about 40 % of
   the 1,689 programs were vulnerable [Pearce2022Asleep]; with a newer
   Copilot the share of vulnerable Python suggestions fell from 37 % to 27 %
   [Majdinasab2024Replication]; in real GitHub projects 29.5 % of the Python
   and 24.2 % of the JavaScript snippets attributed to AI tools had a
   security weakness [Fu2025Weaknesses]. *Evidence: strong for "often"
   (several independent measurements, peer-reviewed). The rate depends on
   the tasks chosen, so say "a quarter to two fifths in these studies",
   never one general rate.*
2. **Coding agents are not secure by default either.** On 186 real-world
   feature tasks, 57 % of one agent's solutions (SWE-Agent with Claude 4
   Sonnet) worked but only 11.8 % were also secure [Zhao2026VibeCoding].
   *Evidence: moderate (one peer-reviewed benchmark of
   security-sensitive tasks; corroborated by preprints [Sun2026Propagate]).*
3. **Newer models are somewhat safer, but the problem has not gone away.**
   Across 32 models from seven families, newer models wrote more secure code,
   yet no family closed the gap between code that works and code that is
   also secure [SantosdeMoura2026Newer]; another study of four versions of
   three families found only marginal improvement or stagnation
   [Cannavale2026Smarter (abstract)]. *Evidence: moderate (two benchmark
   studies, one a preprint).*
4. **Whether people *with* an AI assistant write less secure code than
   people *without* one is not settled.** In one experiment (47
   participants, mostly university students, a 2022 OpenAI model), those
   with the assistant wrote significantly less secure code and were more
   likely to believe it was secure [Perry2023Users]. The largest comparison,
   159 freelance developers with no AI or with Google's Gemini, found no
   significant difference [Jost2026Gemini (preprint)], and four smaller
   studies found a small difference, none, or more secure code with Copilot
   on a harder task [Sandoval2023LostC; Asare2024UserCentered;
   ZareShahneh2025Copilot; Yardim2026Password (abstract)]. *Evidence: weak to
   moderate: six comparisons with 13 to 159 participants, several mainly
   students, models from 2021 to 2024.*
5. **Over-confidence has been found once, not established.** Perry et al.
   found it [Perry2023Users]; a 2026 study of 100 AI users found that they
   could not tell secure from insecure AI suggestions, but that their
   confidence tracked how secure their final code was [Khalid2026Trust
   (preprint)]. *Evidence: weak (two studies in different directions).*
6. **AI tools sometimes recommend software packages that do not exist.**
   Across 16 models and 576,000 code samples, at least 5.2 % (commercial
   models) and 21.7 % (open-source models) of the suggested packages did not
   exist [Spracklen2025Package]; 2026 frontier models still invent 3.6 to
   5.0 % of the packages they mention [Churilov2026Range (preprint)]. An
   attacker can register such a name ("slopsquatting"), but so far this has
   rarely been observed: about 1 % of invented names were registered within
   six months, one with malware [Churilov2026Range], and none of 22
   registered names in another census was malicious
   [Okwor2026Registration (preprint)]. *Evidence: strong that it happens;
   weak (two single-author preprints) on how often it is exploited.*

**The lecture must NOT say** that "research shows that people who program
with AI write less secure code and are overconfident" as a settled fact: it
rests on one small 2022 experiment with mostly students [Perry2023Users],
and the later and larger comparisons found little or no difference. Nor
should it give "40 % of AI code is vulnerable" as today's rate, or say that
slopsquatting attacks are common.

Suggested slide wording (every line backed above):

- AI coding tools often write code with security flaws: in studies, a
  quarter to two fifths of generated programs were vulnerable.
- Newer models do better, but not well enough to skip checking.
- Do people using AI write less secure code? One well-known study said yes,
  and that they felt more confident; larger later studies found little or
  no difference. Most participants were students or freelancers, with
  models older than today's.
- AI tools sometimes suggest packages that do not exist: check that a
  package is real before you install it.

INSECURE-CODE-REPORT-REST
