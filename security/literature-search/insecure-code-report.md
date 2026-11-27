# insecure-code: report

**Status: final (stage 2), 2026-11-27, 18:45 CET.** Screened by an AI agent
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
   the tasks chosen (another field study found no detectable weakness in
   87.9 % of AI-attributed files [Schreiber2025GitHub]), so say "a quarter
   to two fifths in these studies", never one general rate. Do not say that
   AI code is less secure than human code: the direct comparisons found it
   similar or better [Asare2023Copilot; Hamer2024Copy;
   Belozerov2026Repair].*
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
   [Cannavale2026Smarter (abstract)], and in 2023 the models better at
   coding were more prone to insecure suggestions [Bhatt2023CyberSecEval].
   *Evidence: moderate (benchmark studies, two not peer-reviewed).*
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

## Search protocol

- **Date and route.** 2026-11-27. First searches 09:51-12:06 UTC on the
  direct route (KTH tunnel down: Scopus standard view without abstracts, no
  closed-access full texts). The tunnel came back at about 13:30 UTC; the
  redo of failed cells, the repair queries S9/C9 and one closed-access fetch
  (Springer) went through it (13:35-14:24 UTC). ACM, IEEE and Elsevier
  refused automated access through the tunnel too (403/bot check), so
  their papers stay abstract-level.
- **Providers** (`scholar providers check`): OpenAlex ok; Web of Science ok;
  Scopus ok (standard view on the direct route); arXiv ok but HTTP 500 on
  long queries; Semantic Scholar rate-limited (HTTP 429) much of the day;
  IEEE Xplore daily quota spent before half the queries (resets 01:00 CET);
  DBLP failed every query (non-JSON anti-bot page) and is recorded as not
  searched.
- **Session** `insecure-code`, one session for the claim; 18 queries
  (S1-S9, C1-C9), all with `-l 0`, on all seven providers. Full query
  strings and the matrix: `insecure-code-queries.md`. Scripts:
  `insecure-code-queries-ph.sh` (S7, S8, C8), `insecure-code-queries-redo.sh`,
  `insecure-code-queries-repair.sh` (S9, C9).
- **Matrix** (hits; -- = failed, not searched; 0* = doubtful zero, treated
  as not searched):

| Q | OA | WoS | Scopus | IEEE | S2 | arXiv |
|---|---|---|---|---|---|---|
| S1 user study | 1884 | 510 | 792 | 433 | -- | 463 |
| S2 confidence/trust | 2134 | 343 | 537 | 835 | -- | 728 |
| S3 generated code | 1187 | 340 | 541 | 417 | -- | 447 |
| S4 agents | 3572 | 120 | 252 | 194 | 2338 | 882 |
| S5 in the wild | 3498 | 960 | 1744 | 1022 | 2216 | -- |
| S6 students/novices | 1303 | 257 | 418 | 742 | 582 | 190 |
| S7 package halluc. (named) | 97 | 13 | 23 | -- | 53 | 30 |
| S8 package halluc. (described) | 80 | 11 | 21 | -- | 42 | 24 |
| S9 generated code (repair) | 5630 | 1535 | 2570 | -- | -- | -- |
| C1 | 952 | 266 | 284 | 197 | 786 | -- |
| C2 | 678 | 70 | 110 | 204 | 254 | 226 |
| C3 | 647 | 184 | 202 | 238 | 701 | -- |
| C4 repair/fix | 4972 | 1391 | 1881 | -- | 3326 | -- |
| C5 | 2467 | 81 | 135 | -- | 1854 | 0* |
| C6 | 1800 | 504 | 580 | -- | 1613 | -- |
| C7 | 762 | 136 | 115 | -- | 449 | 164 |
| C8 | 929 | 221 | 247 | -- | 583 | -- |
| C9 | 3016 | 819 | 897 | -- | 2814 | -- |

  DBLP: failed for all 18. The arXiv C5 zero was tested: arXiv answered a
  known-item query (session `insecure-code-zerotest`: "coding agents" AND
  vulnerabilities AND "code bases" returned Sun2026Propagate), but S4, of
  which C5 is a subset, returned 882, so the zero is not credible.
- **Known studies that had to come back**: Perry2023Users, Sandoval2023LostC,
  Pearce2022Asleep, Spracklen2025Package: all returned by several queries
  and databases.
- **Check by meaning** (`scholar sessions check`, openalex-semantic, top 50,
  six questions; output in `insecure-code-check/`). Gaps: package
  hallucination (35/50 in no session; queries S7, S8, C8 added); six bearing
  works on generated code in no session (CyberSecEval, A.S.E 2.0, DualGauge,
  a vibe-coding twin-prompt study, "Illusion of Secure LLM Code", a
  row-level-security poster). Cause: the generated-code concept lacked the
  verb/noun forms and the objects applications/benchmarks; repaired by
  concept in S9/C9, after which three of the six are in the session. The
  other three use security words outside the vulnerability block (not
  repaired: a limitation).
- **Complementary sources (non-scholar), recorded verbatim**:
  - curl `https://api.openalex.org/works/doi:<doi>` for OA locations of
    10.1145/3576915.3623157, 10.1145/3772318.3791693,
    10.1145/3672608.3707778, 10.1186/s13643-020-01542-z,
    10.1145/3706598.3713989, 10.1145/3748522.3779860,
    10.1145/3793302.3793584, 10.1145/3842650.3843174,
    10.1145/3832783.3837555, 10.1016/j.jss.2026.112971,
    10.1007/978-981-95-3537-8_9, 10.1109/saner64311.2025.00068,
    10.1109/pdp66500.2025.00011: found the arXiv/repository copies used.
  - arXiv API title searches (`ti:password AND ti:storage AND ti:AI`;
    `ti:"agentic software changes"`; `ti:"AI-attributed code"`;
    `ti:"Securing web apps with ChatGPT"`): no preprints of the CHI 2026,
    MSR 2026, workshop and JSS papers (0 results each).
  - curl of the USENIX pages for Sandoval (usenixsecurity23/presentation/
    sandoval) and Spracklen (usenixsecurity25/presentation/spracklen):
    pages and ISBNs.
  - Zenodo API `api/records/21199426`: the PDF of Okwor2026Registration.
  - curl through the tunnel of
    `link.springer.com/content/pdf/10.1007/978-3-032-29723-5_35.pdf`:
    ZareAssal2026Copilot full text (200, application/pdf).
  - curl `https://doi.org/<doi>` with Accept: application/x-bibtex for
    the bibliography metadata.
  - No WebSearch or WebFetch was used.
- **Screening** (tiers per the skill's appendix guide):
  - Retrieved: 21,436 distinct records (23,393 session records incl.
    copies).
  - Tier 1 = place <= 100 in any relevance-ordered list: 2,644 records
    (2,454 before the repair queries, 190 added by S9/C9 and the redo),
    all classified by `scholar llm classify --top 100 --no-examples`
    (anthropic/claude-sonnet-5-5) in batches of 100, with the research
    context and the exclusion criteria; 258 kept as supporting, 66 as
    qualifying (324 bearing, 12.3 %).
  - 3,008 records placed only in answers not ordered by relevance (WoS,
    Scopus) are outside tier 1.
  - Agent reading: every qualifying row (abstract read), the titles of all
    low-confidence keeps, the kept-adjacent rows; 4 keeps overturned
    (a survey, a breaking-changes study, an interview thesis, a memory-file
    attack study); every cited source recorded with a `cited-<theme>` tag
    (`sessions decide --source agent`).
  - Rest sample (all queries): 60 of the 20,723 pending outside tier 1,
    seed 20261127, screened by the classifier: 2 bearing (3.3 %; 95 %
    modified Wilson interval 0.6-11.4 %).
  - Counter sample: 60 of the 14,126 pending outside tier 1 returned by
    a counter-query (C1-C9), seed 20261128, screened by the agent
    (`insecure-code-screen/counter-sample.tsv`, decisions with per-record
    reasons): 1 bearing (1.7 %; 0.1-8.9 %), a comparison of LLM and human
    smart-contract code whose abstract gives no direction.
  - Unscreened: 20,595 records.
  - Exclusion criteria on the 2,432 discards: off-topic 910, detection-only
    477, attack-on-model 327, new-technique 314, no-evidence 263,
    no-security-outcome 150, no-abstract 26 (a record can carry two).
  - Scopus enrichment through the tunnel after the screen (`scholar enrich
    insecure-code --fields abstract --enrich-providers scopus`, log
    `insecure-code-screen/enrich-scopus.log`): records without abstract
    1,441 -> 1,254 (187 gained one); 27 records discarded as no-abstract
    gained one, were re-read by the agent and stayed discarded under
    no-evidence (13 proceedings front matter), off-topic (11) or
    detection-only (3); none bears on the claim.
  - Who screened: classifier 2,655 decisions, agent 143 (incl. the 27 re-tagged after enrichment), author 0. No
    `scholar llm sample` has been reviewed by the author yet, so the
    machine's error rate is unknown.
- **Export**: `insecure-code-export.csv` (raw, all records),
  `insecure-code-full.tex` (`scholar sessions export -f table --bearing-only
  --lang en`, 0 cited because no decision is author-confirmed, 238
  supporting and 63 qualifying rows listed).

## Supports (cited; all opened in this session)

(a) people with an assistant: Perry2023Users (full text; 47 participants,
mostly students, codex-davinci-002: less secure and more confident);
Yuan2025Mindset (abstract; students' AI use often insecure);
Park2025Aware (full text; 61 undergraduates accepted insecure suggestions
from a poisoned model). Confidence: Serafini2025Manipulated (abstract; high
trust in a manipulated assistant).
(b) generated code: Pearce2022Asleep (~40 % of 1,689), Fu2025Weaknesses
(29.5 % Python, 24.2 % JS in GitHub projects), Wang2025Wild (CWE families
over-represented in AI-tagged commits), Blain2026Broken (vendor preprint,
55.8 %), Patir2026SoK (knowledge-action gap), Cannavale2026Smarter
(abstract; little improvement over versions), Bhatt2023CyberSecEval (more
capable 2023 models more insecure), Zhao2026VibeCoding (agents: 11.8 %
secure), Sun2026Propagate (agents copy vulnerabilities).
(c) package hallucination: Spracklen2025Package (>= 5.2 % / 21.7 %),
Krishna2025Phantoms (rate depends on model, language, size, task).

## Refutes or qualifies (cited)

(a) Sandoval2023LostC (<= 10 % more critical bugs), Asare2024UserCentered
(more secure with Copilot on the hard problem), ZareShahneh2025Copilot and
ZareAssal2026Copilot (no overall effect; 13 participants), Jost2026Gemini
(159 freelancers, no significant difference), Yardim2026Password (abstract;
instructions matter more than the AI). Confidence: Khalid2026Trust
(confidence calibrated), Kudriavtseva2025Perceptions (only a quarter
confident).
(b) Majdinasab2024Replication (rate fell to 27.25 %), Schreiber2025GitHub
(87.9 % of AI files without CWE), Asare2023Copilot, Hamer2024Copy,
Belozerov2026Repair, Licorish2025Jury, CaballeroIgnacio2026Trends
(abstract), Lee2026HumanAI (abstract): generated code similar to or better
than human code; SantosdeMoura2026Newer (newer models safer, gap open);
agents: DectotLeMonnier2026Agentic (abstract; neither uniformly secure nor
insecure vs humans), ChenJiang2025Agents (most patches avoid new
vulnerabilities), Siddiq2026Agentic (agents mostly harden).
(c) Djire2026Defenses (earlier rates inflated by up to 9.4 points),
Churilov2026Range (3.6-5.0 % in 2026 models; ~1 % registered),
Okwor2026Registration (0 of 22 registered names malicious).

Method reference: Rethlefsen2021PRISMAS (deduplication item).

Not cited but read at abstract level and bearing (in the table as
candidates): prompting studies (security depends on the prompt), "The
Effect of Security-Focused Prompts ... 400 AI-Generated Web Applications"
(agentic tools, prompts reduce findings), "Securing web apps with ChatGPT:
a teaching plan" (JSS 2026; students with ChatGPT fixed more vulnerabilities
but also made more incorrect fixes), SPECTER SLOPSQUAT (an offensive tool
demonstrating that hallucinated packages can be exploited; grey
literature), "Helpful or Harmful? LLM-assisted vulnerability patching"
(a registered study protocol with a pilot only, no results yet). They do not change any of the
sentences above; reading them in full is future work.

## DROPPED (not cited)

- Veracode 2026 GenAI code security report (cited by Khalid2026Trust for
  "roughly 45%" of generated code vulnerable and flat security over time):
  not opened in this session; dropped. Not to be used on a slide without
  opening it.
- Sergeyuk et al. 2026, "Human-AI experience in IDEs: a systematic
  literature review" (EMSE): full text opened; it summarises the user
  studies cited here and adds no security finding of its own; not cited.
- "Premature Trust: How Student Overreliance on GenAI is Seeding Tomorrow's
  Security Gaps" (SIGITE 2025): abstract read; case analysis and a
  framework, no measurement; not cited.
- "Insecure by design?" (Computers & Security 2026): briefing paper
  without its own evidence; not cited.
- Security Degradation in Iterative AI Code Generation (ISTAS 2025, arXiv
  2506.11022): full text fetched, not needed for any sentence; not cited.

## Papers to fetch by hand (closed access, ACM/IEEE/Elsevier refuse
automated access)

| Key / paper | DOI | What to check |
|---|---|---|
| Yardim2026Password | 10.1145/3772318.3791693 | security outcomes per condition (AI vs no AI, with/without instructions), effect sizes, the students' results |
| Serafini2025Manipulated | 10.1145/3706598.3713989 | the 32 % figure and how confidence was measured |
| Cannavale2026Smarter | 10.1109/ICSME67971.2026.00039 | per-family security trajectories, which versions regressed |
| Yuan2025Mindset | 10.1109/TE.2025.3610340 | sample size, design, whether there was a no-AI group |
| Lee2026HumanAI | 10.1145/3748522.3779860 | which models, how "more dangerously" was measured |
| DectotLeMonnier2026Agentic | 10.1145/3793302.3793584 | per-task agent vs human differences |
| CaballeroIgnacio2026Trends | 10.1145/3842650.3843174 | how AI attribution was done; the 21.08 % vs 11.15 % comparison |
| Securing web apps with ChatGPT (teaching plan) | 10.1016/j.jss.2026.112971 | the 105 students' results with and without ChatGPT (directly relevant to the course) |

## Limitations

- DBLP not searched; IEEE Xplore failed 9/18, Semantic Scholar 4/18, arXiv
  9/18 (incl. the doubtful C5 zero): their columns undercount. IEEE's quota
  resets at 01:00 CET; the failed IEEE cells should be redone.
- Scopus had no abstracts for the first searches; OpenAlex searches only
  the part of an abstract it holds.
- Only tier 1 (2,644 of 21,436 distinct records) was screened in full; the
  rest were only counted, apart from two seeded samples of 60 (2 bearing,
  3.3 %, 95 % interval 0.6-11.4 %; counter sample 1 bearing, 1.7 %,
  0.1-8.9 %). The share is not near zero, so the search is not exhaustive:
  at the point estimate several hundred of the 20,595 unscreened records
  may bear on the question. By the user's decision (2026-11-27) no further
  classification was run; the share is below one in ten, so no extra
  sample of 300 was drawn.
- Screening by a language model and an agent; no author review; no
  reviewed `llm sample`, so the error rate is unknown.
- Seven cited sources abstract-only; several preprints (Jost2026Gemini,
  Khalid2026Trust, SantosdeMoura2026Newer, Sun2026Propagate,
  Churilov2026Range, Okwor2026Registration, Bhatt2023CyberSecEval); one
  vendor study (Blain2026Broken).
- The ZareAssal2026Copilot PDF was fetched with curl through the tunnel
  (the publisher refused scholar's fetcher) and imported into scholar's PDF
  cache with `scholar pdf import`.
- No education database was searched.
- Most user-study participants were students or freelancers, with 2021-2024
  models; nothing compares people with and without a current coding agent.

## Bibliography checks (final, 2026-11-27 evening)

- `scholar prov check insecure-code.bib --quotes --metadata`: 39 entries,
  44 quotes found in the cached full texts or abstract fields, 0 not found,
  0 not checked. Metadata: 22 agree with Crossref; 1 differs (Cannavale2026Smarter:
  Crossref splits the particles of "De Roover" and "De Lucia" into the given
  names; the bib keeps the names as the authors write them); 16 not checked
  by Crossref and checked by hand instead: 14 arXiv/Zenodo DOIs against
  DataCite (titles and author lists agree, except that DataCite gives
  "de Moura" as the family name of Thiago Santos de Moura, whose paper
  header reads "Thiago Santos de Moura"; Zhao2026VibeCoding is dated 2026
  for its ICML version, 2025 in DataCite for the arXiv deposit), and 2
  DOI-less USENIX papers (Sandoval2023LostC, Spracklen2025Package) against
  the USENIX presentation pages (title, pages, ISBN).
- `scripts/check_provenance.py --quotes --text KEY=FILE`: Result OK.
- Fixes made for these checks: `%` in abstract fields escaped (BibTeX had
  cut two abstracts at the percent sign, so their quotes were not found);
  the Siddiq2026Agentic quote split at a page break with "..."; the
  ZareAssal2026Copilot PDF imported into scholar's cache; author names
  aligned with Crossref (Yardim; the PRISMA-S Group added).
- The failed IEEE Xplore cells can only be redone after 01:00 CET:
  `insecure-code-queries-ieee.sh` runs them; they were not run.
