# who-gains: Who gains more from generative-AI assistance at work?

Status: stage 2 report, 2026-11-27. Screened by AI agents; awaiting human
review. Sources are cited by the keys in `who-gains.bib`, where every key
has a provenance block with its verbatim quote.

Research question: "Who gains more from generative-AI assistance at work:
less-skilled or novice workers, or more-skilled and expert workers?"
Claim under test (the lecturer's thesis): "AI is a skill amplifier: it
complements competent people, and amplifies incompetence too."

## What the lecture may say

These sentences are written so they can go on a slide. Strength is given
after each one.

1. **On everyday tasks the AI handles well, beginners gain the most.** In
   customer support, writing, consulting, programming and tutoring,
   randomised and field studies find the largest gains for the least
   experienced or lowest performers, and small or no gains for the best.
   Keys: Brynjolfsson2025Generative, Noy2023Experimental,
   DellAcqua2026Navigating, Cui2026Effects, Peng2023Impact,
   Ni2026Generative, Zhang2026Engaging, Wang2024Tutor, Cruces2026Does,
   Caplin2026ABCs, Hou2025DoubleEdged, Chen2024Large; reviews
   DelRioChanona2025AI, Khandare2026Short. *Strength: strong.* At least
   ten independent experiments point the same way, across occupations.
   Most of them used well-defined, short tasks, so the finding applies to
   such tasks.
2. **The gap narrows but does not close: skilled people stay ahead and
   use the tool better.** With AI, the education gap shrank by about
   three quarters. The more educated still used the tool more
   effectively, and the gap came back once the AI was removed
   (Cruces2026Does). The stronger keep an absolute lead
   (Bierbrauer2026Is). Among patent lawyers, juniors gained more quality
   while using AI. Only seniors were better afterwards without it
   (Autor2026Does). *Strength: moderate.* Two RCTs say it directly, and
   one small classroom study agrees.
3. **On open-ended work, on tasks the AI does badly, and wherever its
   output must be checked, those who cannot judge the output can lose.**
   Kenyan entrepreneurs given a GPT-4 adviser are one case: low performers
   did nearly 10 % worse, while high performers may have gained over 15 %
   (Otis2026Uneven). In a lab test, ChatGPT lowered maths scores because
   low-ability subjects could not tell hallucinated answers from correct
   ones (Kim2024Helping). On a consulting task outside the AI's
   competence, AI users were 19 percentage points less likely to be right
   (DellAcqua2026Navigating). Untrained law students who used an LLM
   scored no better (Chen2026Training). *Strength: moderate.* There is
   one field RCT, one lab RCT, one task inside a field RCT and one small
   RCT, and the reviews agree that complex tasks give mixed results
   (DelRioChanona2025AI).
4. **Experts on their home ground may gain nothing and still feel
   faster.** Experienced open-source developers working on their own
   projects were 19 % slower with AI tools. Afterwards they believed AI
   had made them 20 % faster (Becker2025Measuring). Experienced managers
   gained quality without overconfidence, while highly educated ones
   gained confidence but no quality (Camuffo2026Beyond). *Strength:
   moderate for "felt gain is not measured gain" and weak for "experts
   are slowed down".* The developer study had 16 people, and its authors
   limit how far it generalises.
5. **Outside experiments, one large study of programmers points the other
   way.** Across about 170,000 GitHub developers, experienced programmers
   captured nearly all of the measured gains (Daniotti2026Who). *Strength:
   moderate but observational.* People chose for themselves whether to
   adopt AI, and output was measured in commits.

**Answer for the slide "who can do what with AI".** The studies support
this sentence: what a person gets out of AI depends on what that person
can do without it, but the direction depends on the task. On routine,
well-specified tasks inside what the model does well, AI lifts the weakest
most (levelling). On open-ended tasks, tasks outside the model's
competence, and tasks whose output must be verified, the gain depends on
being able to judge the output. Those who cannot judge it can be made
worse off (amplification). Durable skill without the AI also stays with
those who had it (Autor2026Does, Cruces2026Does). The mathematician's
case belongs to the second kind of task: an expert who can check every
step. It is an example of that kind of task and says nothing about the
average worker.

**The lecture must NOT say** that research shows AI to be in general a
"skill amplifier that helps strong workers more". The best experimental
evidence on everyday knowledge-work tasks shows the opposite, namely that
novices gain the most. Amplification is supported only for open-ended,
out-of-frontier or must-be-verified tasks, for durable skill, and in one
observational study.

## Search protocol

**Date and route.** All searches ran on 2026-11-27, between 09:51 and
12:52 UTC (`scholar sessions show who-gains`). The KTH tunnel (port 1081)
was down the whole time, so everything ran over the direct route. As a
result, Scopus answered in its standard view (no abstracts, first author
only), and no closed-access full text could be fetched.

**Providers** (`scholar providers check`, about 12:00 UTC):

| Provider | Status |
|---|---|
| s2 | live, with rate limits; Boolean `-l 0` queries go to the bulk search ("s2 (via bulk)") |
| openalex | live; every query ran `--in title-abstract` |
| wos | live |
| scopus | live, standard view (no abstracts) |
| ieee | live until its daily quota (200 requests) ran out; later cells are skipped |
| dblp | unavailable: it returns an anti-bot HTML page (HTTP 202) |

**Inherited sessions.** `who-gains` held 14,577 records when this restart
began. `who-gains-fulltext` holds 19,395 records from the same seven
queries, sent to OpenAlex without `--in title-abstract`, so OpenAlex
matched full text. Four of those answers were capped at about 9,950 of
214k to 528k hits, and three failed with HTTP 429. That session was
therefore **not used**: its title-and-abstract versions in `who-gains`
supersede it. No search was redone except the failed cells.

**Query x provider x hits** (session `who-gains`; "N of M" means N records
returned of M reported; "failed" means not searched, never 0). S marks
queries phrased toward amplification, C marks queries phrased toward
levelling or toward a moderator.

| Query | s2 | openalex | scopus | wos | ieee | dblp |
|---|---|---|---|---|---|---|
| S1 amplify | 614 | 1,473 of 1,477 | 352 | 391 | 125 | failed (anti-bot page) |
| S2 harm / over-reliance | 1,060 | 2,194 of 2,208 | 580 | 613 | 173 | failed (anti-bot page) |
| C1 equalise | 2,000 of 2,002 | 4,118 of 4,137 | 203 | 1,327 | 672 | failed (anti-bot page) |
| C2 heterogeneity | 263 of 264 | 606 of 608 | 216 | 201 | 71 | failed (anti-bot page) |
| C3 verification / task | 3,896 of 3,902 | 7,054 of 7,088 | 1,701 of 1,715 | 2,235 of 2,237 | 945 (773 reported) | failed (anti-bot page) |
| C4 perceived | 1,445 | 3,183 of 3,197 (redo) | 1,003 of 1,009 | 1,232 of 1,233 | 403 | failed (anti-bot page) |
| C5 reviews | 378 | 840 of 846 | 273 of 278 | 220 of 221 | failed (skipped: quota) | failed (anti-bot page) |
| C6 repair: designs | 94 | 196 of 202 | 98 of 99 | 108 | failed (skipped: quota) | failed (anti-bot page) |
| C7 repair: experiment x ability | 3,995 of 6,679, incomplete (rate limited) | 9,477 of 9,594 | 4,925 of 6,132, incomplete (HTTP 400) | 4,035 of 4,039 | failed (skipped: quota) | failed (anti-bot page) |

There are no 0 cells, so no zero test was needed. Web of Science
received each query as `TS=(...)` and Scopus as `TITLE-ABS-KEY(...)`.
The keywords were the same on every provider.

Query strings. The common prefix of S1 to C5 is
`("generative AI" OR "generative artificial intelligence" OR "large language model" OR "large language models" OR LLM OR LLMs OR ChatGPT OR "GPT-4" OR Copilot OR "AI assistance" OR "AI assistant" OR "AI assistants") AND (novice OR novices OR beginner OR beginners OR inexperienced OR experienced OR expert OR experts OR expertise OR skill OR skills OR skilled OR "less skilled" OR "low-skilled" OR "high-skilled" OR "skill level" OR junior OR senior OR "early-career" OR tenure OR "human capital") AND (worker OR workers OR employee OR employees OR professional OR professionals OR "knowledge work" OR "knowledge workers" OR workplace OR labor OR labour OR developer OR developers OR programmer OR programmers OR "software engineers" OR consultants OR "customer support" OR "customer service" OR writing)`.
S1 to C5 except S2 then add `AND (productivity OR productive OR performance OR quality OR speed OR efficiency OR gains OR benefit OR benefits OR output)`, and each ends with its own facet:

- S1: `AND (amplify OR amplifies OR amplified OR amplifier OR amplification OR complement OR complements OR complementary OR complementarity OR complementarities OR widen OR widens OR widening OR widened OR "skill-biased" OR exacerbate OR exacerbates OR "high performers" OR "more experienced" OR "most skilled" OR "returns to skill")`
- S2: `AND (overreliance OR "over-reliance" OR "automation bias" OR slower OR slowdown OR "slowed down" OR "slows down" OR worse OR "decreased performance" OR "lower performance" OR harm OR harms OR harmful OR deskilling OR "skill decay" OR "skill atrophy" OR "jagged frontier" OR "outside the frontier" OR "cognitive offloading")` (no outcome facet)
- C1: `AND (equalizer OR equaliser OR equalize OR equalise OR equalizing OR equalising OR leveling OR levelling OR "skill gap" OR "skill gaps" OR "productivity gap" OR "productivity gaps" OR "performance gap" OR "performance gaps" OR inequality OR inequalities OR narrow OR narrows OR narrowing OR narrowed OR compress OR compresses OR compression OR "low performers" OR "less experienced" OR "least skilled")`
- C2: `AND (heterogeneous OR heterogeneity OR differential OR "who benefits" OR "benefit most" OR "benefited most" OR "gain most" OR "largest gains" OR "larger gains" OR "greater gains")`
- C3: `AND (verification OR verify OR verifying OR evaluate OR evaluating OR judge OR judging OR "task complexity" OR "task difficulty" OR "task type" OR "type of task" OR moderator OR moderates OR moderating)`
- C4: `AND (perceived OR perception OR perceptions OR "self-reported" OR believed OR belief OR expected OR expectations OR forecast OR forecasts)`
- C5: `AND ("meta-analysis" OR "meta-analytic" OR "systematic review" OR "systematic literature review" OR "scoping review" OR "evidence synthesis")`
- C6 (repair; written after the check by meaning showed that randomised studies using the words "AI tools", "AI mentor" or "AI advice" were missing): `("generative AI" OR "large language model" OR "large language models" OR LLM OR ChatGPT OR "GPT-4" OR Copilot OR "AI tools" OR "AI tool" OR "AI assistant" OR "AI assistance" OR "AI-assisted" OR "AI advice" OR "AI mentor" OR "AI coding") AND (novice OR novices OR experienced OR expertise OR "low performers" OR "high performers" OR "baseline performance" OR "low-skilled" OR "less skilled" OR "skill gap" OR upskilling OR "prior experience") AND ("randomized controlled trial" OR "randomised controlled trial" OR "field experiment" OR "randomized experiment" OR "randomised experiment" OR RCT OR "natural experiment" OR "difference-in-differences") AND (productivity OR performance OR revenues OR profits OR "completion time" OR output OR quality)`
- C7 (repair: experiments that name ability, junior/senior or performance gaps): the same AI facet as C6 `AND ("skill level" OR "skill levels" OR ability OR "high-ability" OR "low-ability" OR "baseline ability" OR junior OR juniors OR senior OR "performance gap" OR "performance gaps" OR "productivity gap" OR expertise OR "career stage") AND (experiment OR experiments OR experimental OR trial) AND (productivity OR performance OR quality OR output)`

**Known studies that must come back.** These were named before the check:
Brynjolfsson et al. (customer support), Noy and Zhang (writing),
Dell'Acqua et al. (consultants), Cui et al. (developers), Otis et al.
(entrepreneurs) and Becker et al. (METR). The first four were in the
session from the start. Otis et al. and Becker et al. came back only
after repair query C6.

**Check by meaning** (`scholar sessions check`, OpenAlex semantic search,
4 questions x 50 works). The questions covered levelling, amplification,
expert slowdown and the jagged frontier. Works it returned that were in
the session but outside tier 1 were added to tier 1 (36, together with
the two named studies Noy and Zhang and Dell'Acqua et al., which sat
outside the top 100 of every answer). Relevant works it returned that no
session holds, even after repair, are these:

- Peng et al. 2023 (Copilot RCT; its abstract names no skill term; verified and cited as Peng2023Impact);
- Wiles et al. 2026 (*Nature Human Behaviour*, "temporary upskilling");
- Haslberger et al. 2023 ("No Great Equalizer");
- Li 2026 ("AI amplifies experts, not expertise");
- Goulas et al. 2026 (PNAS Nexus).

OpenAlex has no abstract for any of the last four, so no
title-and-abstract keyword search can reach them. They are listed under
"to fetch".

**Screening in tiers.**

- Session after repair: 27,431 distinct records.
- Tier 1, part 1: the first 100 records of each relevance-ordered answer
  at the time of the restart (`--top 100`), 1,237 records.
- Tier 1, part 2, after the repair queries: 421 more top-100 records,
  plus 36 from the check by meaning and the named studies, 457 records.
- Tier 1 screened in total: **1,694 records**, in 18 batches of at most
  100. Each batch went to one agent screener (Claude Sonnet) with the
  skill's brief: verdict, category, labelled exclusion and theme, a
  reason quoting the abstract, and a confidence per row. Every batch
  passed `validate_screen.py`. Repairs (12 paraphrased quotes stripped of
  their quote marks, 1 unsupported quote re-screened by the lead agent)
  are logged in `who-gains-screen/repair-log.tsv`.
- Result of tier 1: **103 kept** (24 supports-claim, 79 qualifies-claim),
  plus **74 discards that bear on the claim**, each discarded by an
  exclusion (30 no-evidence, 20 no-abstract, 14 not-genai, 8
  not-work-task, 2 model-only; the 20 bearing no-abstract records are on
  the look-up list); 1,334 adjacent and 183 off-topic.
- Themes of the keeps: levelling 56, amplification 17, task-frontier 9,
  verification 7, synthesis 7, no-difference 5, perceived-vs-measured 2.
- Sample of the rest: a seeded random sample of 60 of the 13,340 records
  outside tier 1 at the restart (seed 20261127, draw recorded in the
  session). It held **0 bearing records**, all 52 adjacent and 8
  off-topic (95 % interval roughly 0 to 6 %; see Limitations).
- Rest of the session: classified by `scholar llm classify --no-examples`
  (see "LLM classification" below).

**Complementary searches (not scholar)**, recorded verbatim:

| Tool | Query or URL | Outcome |
|---|---|---|
| WebSearch | `"Uneven Impact of Generative AI on Entrepreneurial Performance" Kenya pdf high performers low performers` | found the NBER conference copy (conference.nber.org/conf_papers/f194654.pdf), fetched and read; the eScholarship copy refused (403) |
| WebSearch | `"AI amplifies experts, not expertise" Nature Human Behaviour` | no copy found; paper listed as to fetch |
| WebSearch | `"Navigating the Jagged Technological Frontier" working paper pdf below average performers 43% outside the frontier` | found the MIT Sloan copy of SSRN 4573321, fetched and read |
| OpenAlex REST `works/doi:` | 25 DOIs (metadata and abstracts) | abstracts read for abstract-level entries |
| doi.org content negotiation (BibTeX) | the DOIs of all bib entries | metadata for the bib |

## Supports the claim (amplification) — verified

- **Otis2026Uneven**: field RCT, 640 Kenyan entrepreneurs, GPT-4 adviser.
  Low performers did nearly 10 % worse and high performers may have
  gained over 15 %. Read: published abstract plus the full text of the
  2024 working paper. The two versions explain the result differently:
  harder tasks (2024) versus which advice was implemented (2026).
- **Kim2024Helping**: lab RCT. ChatGPT lowered maths scores because
  low-ability subjects could not detect hallucinations. Read: full text
  (CESifo WP).
- **Daniotti2026Who**: observational, about 170,000 GitHub developers.
  Experienced programmers capture nearly all the gains. Read: full text
  (arXiv v2).
- **Chen2026Training**: RCT, 164 law students. Without training,
  lower-ability users adopt the LLM unproductively. Read: full text.
  Most differences are not significant.
- **Autor2026Does** (second half): the lasting unassisted gain went to
  senior lawyers only. Read: full text.

## Refutes or narrows the claim (levelling) — verified

- **Brynjolfsson2025Generative**: 5,172 support agents. Novices and the
  low-skilled gain most, and the most skilled see small quality declines.
  Read: WP full text plus QJE abstract.
- **Noy2023Experimental**: RCT, 453 professionals. Inequality between
  workers decreased. Read: abstract only.
- **DellAcqua2026Navigating** (inside the frontier): bottom half +43 %,
  top half +17 %. Read: WP full text. The published abstract omits the
  split.
- **Cui2026Effects**: 3 field RCTs, 4,867 developers. Less experienced
  developers gained more. Read: abstract only.
- **Peng2023Impact**: Copilot RCT. Less experienced developers benefited
  most. Read: full text.
- **Ni2026Generative**: Alibaba field RCT. Lower performers benefit most,
  and top performers lose quality. Read: full text.
- **Zhang2026Engaging**: field RCT in customer service. Benefits are
  largest for less-experienced agents. Read: abstract only.
- **Wang2024Tutor**: RCT with more than 700 tutors. The largest gains
  went to students of lower-rated tutors. Read: full text.
- **Cruces2026Does**: RCT, 1,174 adults. Gains are larger for the less
  educated, the gap narrows by three quarters, but the more educated use
  the tool better. Read: full text.
- **Caplin2026ABCs**: experiment. Gains are larger for low ability, and
  larger for calibrated users. Read: abstract only.
- **Hou2025DoubleEdged**: designers. Novices keep gaining while experts
  lose efficiency. Read: abstract only.
- **Chen2024Large**: ad copy. LLM feedback closes the gap for
  non-experts, while ghostwriting harms experts. Read: abstract only.
- **Autor2026Does** (first half): juniors gained more quality while
  using AI. Read: full text.
- **Bierbrauer2026Is**: the gap is compressed in relative terms and kept
  in absolute terms. Read: abstract only.

## Qualifies (moderators, mixed) — verified

- **DellAcqua2026Navigating** (outside the frontier): 19 points less
  likely to be correct with AI.
- **Becker2025Measuring**: 16 experienced developers were 19 % slower and
  believed they were 20 % faster.
- **Camuffo2026Beyond**: experience gives quality without overconfidence;
  education gives confidence without quality. Read: abstract only.
- **Aparicio2026Generative**: 276 researchers. Gains across the expertise
  ladder, with larger but imprecise point estimates for seniors. Read:
  full text.
- **DelRioChanona2025AI** (review): novices benefit more in simple tasks,
  and evidence is mixed for complex tasks. Read: full text.
- **Khandare2026Short** (systematic review, 157 studies): gains are
  typically largest for less experienced workers, and are task-dependent.
  Read: full text. Low evidence grade, since it is a single-author
  preprint.

## Other tier-1 keeps (agent screen, not verified, not cited)

The other kept rows (103 in all) are in the exported table
(`who-gains-full.tex`) with the screeners' reasons. Most are small
studies, surveys or proceedings with self-reported outcomes, all on the
levelling side. Among them are studies of junior engineers, physicians,
designers, Stack Overflow and freelancers.

Some are theme or category inconsistencies to fix on human review:

- `doi:10.1287/isre.2024.0937` is kept as supports-claim with theme
  levelling, but its content is levelling (qualifies-claim).
- `doi:10.3386/w35720` is kept as qualifies/levelling, but it holds both
  directions.

## DROPPED (could not be verified or not usable)

- Li 2026, "AI amplifies experts, not expertise" (*Nat. Hum. Behav.*,
  10.1038/s41562-026-02604-3): closed access, no abstract, not in any
  session. Not cited.
- Wiles et al. 2026, "Generative AI and the temporary upskilling of
  knowledge workers" (10.1038/s41562-026-02566-6; SSRN 4944588 refused,
  403): no abstract available. Not cited.
- Haslberger et al. 2023, "No Great Equalizer" (SSRN 4594466, 403): no
  abstract available. Not cited.
- Goulas et al. 2026, "Why do experts miss AI's errors?" (PNAS Nexus):
  this is about deference to AI scores, not about who gains. Abstract
  read, judged adjacent, not cited.
- An 2026, "AI as Equalizer or Amplifier?" (FAIA; arXiv 2512.10961): a
  position paper from structured observations of one small team, with no
  outcome data (exclusion no-evidence). Not cited, although it states
  the lecturer's thesis almost word for word.
- Tier-1 discards with a bearing category for non-generative AI
  (endoscopy, dermatology, radiology detection systems): excluded as
  not-genai. Several show the same levelling pattern, but they are
  outside scope.

## Papers to fetch by hand (tunnel needed)

| Paper | DOI / URL | What to check |
|---|---|---|
| Noy and Zhang 2023, *Science* | 10.1126/science.adh2586 | the skill split (Fig. on initial grade x treatment); was inequality reduced by low-ability gains, or did high-ability workers substitute effort? |
| Cui et al. 2026, *Management Science* | 10.1287/mnsc.2025.00535 | size and precision of the experience interaction; tenure vs seniority |
| Dell'Acqua et al. 2026, *Organization Science* | 10.1287/orsc.2025.21838 | whether the published version keeps the bottom-half 43 % / top-half 17 % split |
| Otis et al. 2026, *Management Science* | 10.1287/mnsc.2024.06909 | the published mechanism (advice implemented vs task difficulty) |
| Caplin et al. 2026, *Management Science* | 10.1287/mnsc.2024.08994 | task type (is it inside the model's competence?) |
| Hou et al. 2025, *ISR* | 10.1287/isre.2024.0937 | effect sizes for novices vs experts in execution |
| Chen and Chan 2024, *Management Science* | 10.1287/mnsc.2023.03014 | how expertise was defined; the ghostwriter penalty |
| Zhang and Narayandas 2026, *Management Science* | 10.1287/mnsc.2022.03920 | the size of the experience gradient |
| Camuffo et al. 2026, *Strategy Science* | 10.1287/stsc.2025.0432 | the quality measure; experience vs education split |
| Li 2026, *Nature Human Behaviour* | 10.1038/s41562-026-02604-3 | what kind of article it is (comment?) and whether it reports data |
| Wiles et al. 2026, *Nature Human Behaviour* | 10.1038/s41562-026-02566-6 | whether "temporary upskilling" gains vanish without AI, and by skill |
| Haslberger et al. 2023 | 10.2139/ssrn.4594466 | does it find no levelling in a UK sample? (title suggests a counter-result) |
| Esnaola et al. 2026, *Empir. Softw. Eng.* | 10.1007/s10664-026-10813-7 | non-programmers with AI vs programmers without AI (abstract read: comparable on small tasks) |
| Tier-1 no-abstract records with a bearing category (20) | `who-gains-screen/out/*.tsv`, exclusion no-abstract | look up abstracts; e.g. SSRN 6381580 "Risks Create a Jagged Frontier of LLM Productivity Gains Across Computer Occupations", SSRN 6366218 (systematic review), SSRN 5228176 (central-banking field experiment), SSRN 5462694 ("GenAI Wall Effect") |

## Limitations

- **The tunnel was down.** Scopus records carry no abstracts, and eight
  cited sources are abstract-level only (Otis2026Uneven: published
  abstract plus an earlier working paper) (marked in the bib). Their
  numbers are taken from abstracts.
- **Some providers could not be searched.** DBLP could not be searched
  at all. IEEE missed C5 to C7 because of its quota. The s2 and Scopus
  answers to C7 are incomplete. The four relevant works in no session
  have no indexed abstract.
- **Most experiments use short, well-defined tasks.** This is said
  outright by one review (DelRioChanona2025AI). Evidence on complex,
  open-ended expert work is thin and mixed. The levelling finding should
  not be stretched to such work.
- **Skill is measured in different ways.** It is tenure in some studies,
  baseline performance, education or self-rating in others. "Novice" in
  one study is not "novice" in another.
- **The screening was done by machines.** Tier 1 was screened by agent
  screeners and the rest by an LLM classifier. No human has reviewed a
  sample yet, so there is no error rate. Agent keeps are candidates, not
  cited rows.
- **The tier-2 sample was drawn before the repairs.** It covers the
  13,340 records outside tier 1 at the restart, not the about 12,900
  added by C6/C7. The interval for 0 of 60 is roughly 0 to 6 %. The
  exact modified Wilson bound is in the chapter.
- **Some cited studies are preprints or working papers.** Ni, Becker,
  Peng, Wang, del Rio-Chanona, Chen and Bao, Cruces, Autor, Aparicio and
  Khandare are among them.
