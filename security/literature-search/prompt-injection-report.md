# Can prompt injection against LLM-integrated applications and agents be reliably prevented?

**Status: full report (stage 2), 27 Nov 2026. Screened by an AI agent;
awaiting human review.** No decision in the session has been reviewed by
the author. This replaces the preliminary version of 13:08. Its six
statements stand, with two corrections listed under "Changes since the
preliminary version".

Files:

- `prompt-injection.bib`: 39 entries with provenance blocks;
  `check_provenance.py --quotes` passes.
- `prompt-injection-chapter.tex`: the appendix chapter.
- `prompt-injection-full.tex`: the hit-list table; the raw export
  `prompt-injection-full.csv` is beside it.
- `prompt-injection-queries.sh`: all queries (`--print` lists them).
- `prompt-injection-screen/`: the tier-1 sheets and the rest sample.
- `prompt-injection-progress.md`: the progress log.
- `prompt-injection-classify.log`: the classification log.

## What the lecture may say

1. **A language model has no reliable way to tell the instructions it should
   follow from the data it should only read. So text that an application
   feeds it (a web page, an e-mail, a tool result) can steer it.**
   [Greshake2023Signed, Zverev2025Separate, Debenedetti2024AgentDojo,
   Chen2025StruQ]
   Strength: strong. A formal measurement at ICLR 2025 found that "all models
   fail to achieve high separation". The peer-reviewed paper that first
   described the attack says the same, as do a benchmark paper and a defence
   paper.

2. **This "indirect prompt injection" works against real products, not only
   in the lab.** Researchers steered Bing's GPT-4 chat through web content. A
   black-box attack found 31 of 36 commercial LLM applications susceptible.
   In a 2026 public competition, attackers succeeded against every one of 13
   frontier models; the success rate per attempt was 0.5 to 8.5 %.
   [Greshake2023Signed, Liu2023HouYi (preprint), Fu2024Imprompter (preprint),
   Zhan2024InjecAgent, Dziemian2026Competition (preprint),
   Khodayari2026Wild (preprint)]
   Strength: strong. Real systems, benchmarks, a competition with 272,000
   attempts and injections found on the open web all point the same way.
   Qualification: attacks work, but they do not always succeed. End-to-end
   attacks on RAG applications succeed in about 40 % of cases
   [DeStefano2026RagnRoll]. In a realistic retrieval pipeline, earlier
   protocols overstate success, although LLM-driven injections still work
   [Yin2026Generator (preprint)]. Some benchmark numbers are inflated
   [Shaw2026SilentFailures, Bhagwatkar2025Firewalls (preprints)]. The slide
   should therefore say "works against real systems", not "always works".

3. **Published defences lower the success rate of the attacks they were
   tested against, but attackers who adapt to the defence get through.**
   This covers filters and detectors, prompt tricks such as delimiters or
   "spotlighting", and specially trained models. One peer-reviewed study
   bypassed all eight agent defences it tested, with over 50 % success. A
   USENIX Security 2026 paper bypassed twelve recent defences against jailbreaks and prompt
   injections, with over 90 % success for most of them; most of these
   defences had reported near-zero attack success. The authors of a leading
   trained defence write that their model "remains vulnerable to strong
   adaptive attacks" and that "PI is not solved".
   [Zhan2025Adaptive, Nasr2026AttackerSecond (USENIX Security 2026),
   Choudhary2025NotDetect, Chen2025MetaSecAlign (preprint); the defences'
   own claims: Hines2024Spotlighting, Chen2025SecAlign, Wallace2024Hierarchy]
   Strength: strong. Three independent peer-reviewed groups agree (NAACL
   Findings, USENIX Security, AISec), and so do the authors of a defence
   about their own work.
   Qualification: a few 2026 defences claim robustness against adaptive
   attacks, and others have not yet tested them. They are
   Zhong2026Rennervate (NDSS), Zhao2026LTBD (preprint) and
   Peng2026SecOPD (EMNLP; 9.0 % success for one adaptive attack). The
   slide should therefore say "have been bypassed", not "will always be
   bypassed".

4. **Guarantees come only from designing the system so that what the model
   reads cannot decide what the system does.** The trusted request fixes the
   plan. Ordinary code, not the model, checks every tool call against a
   policy, and asks the user when a call would break the policy. Such designs
   give provable security against a defined class of attacks, but at a price.
   CaMeL solved 77 % of benchmark tasks with provable security, against 84 %
   with no defence. The authors of the design patterns deliberately
   "constrain the actions of agents to explicitly prevent them from solving
   arbitrary tasks".
   [Debenedetti2026CaMeL, BeurerKellner2025Patterns (preprint),
   Costa2026FIDES (accepted, NeurIPS 2026), Shi2025Progent (preprint), Wu2024IFC
   (preprint)]
   Strength: moderate. There are few studies; CaMeL is peer-reviewed
   (SaTML 2026) and FIDES is accepted at NeurIPS 2026; the rest are
   preprints. The guarantees hold only under the stated assumptions; for
   example, CaMeL "cannot defend against text-to-text attacks".

5. **So: assume that anything the model reads can steer it, and limit what
   a successful injection can do.** Give tools the least privilege they need,
   enforce authorisation in ordinary code outside the model, and have a human
   confirm actions that have consequences. Confirmation costs usability.
   [BeurerKellner2025Patterns, Debenedetti2026CaMeL, Shi2025Progent,
   Kim2025PFI (preprint); agrees with the attributions OWASP2026LLM and
   Willison2025Trifecta, which the known-items agent verified]
   Strength: moderate. This is a design recommendation drawn from the
   system-level literature. No study measures it in deployed business
   systems.
   Qualification: the enforcing code must itself be correct. A
   deterministic system-call gate was beaten by a race in about one attempt
   in five, while kernel-level confinement held [Erisen2026Seccomp
   (preprint)].

6. **Hidden system prompts are not secret.** Simple text attacks reveal them
   "with high probability" across 11 models. The same study extracted
   prompts from Claude 3 and ChatGPT, which, in its words, "suggest that
   system prompts can be revealed by an adversary despite existing defenses
   in place". Defences reduce extraction, but none has been shown to prevent
   it.
   [Zhang2024Extraction, Liang2024Leaked (preprint), Wang2024Raccoon;
   qualifying: Zhuang2026ProxyPrompt]
   Strength: moderate to strong. A peer-reviewed measurement (COLM 2024) and
   a peer-reviewed benchmark agree.

**What the lecture must NOT say:** that prompt injection "cannot be
prevented", or that "no defence works". The evidence supports a narrower
statement: no known filter, detector, prompt technique or trained model
reliably prevents injection against an attacker who adapts to it. System-
level designs (CaMeL, information-flow control, the design patterns) do give
provable guarantees for a defined class of attacks, because they restrict
what the agent can do. Nor may the lecture say that a vendor's injection
classifier, or a fine-tuned "secure" model, makes an application safe.

**Does the literature agree with OWASP and Willison?** Yes, with one
refinement. It agrees with OWASP 2025 ("unclear if there are fool-proof
methods of prevention"), with OWASP 2026 ("no reliable prevention mechanism
exists today"; "Defense is therefore architectural rather than
interceptive") and with Willison ("we still don't know how to 100% reliably
prevent this from happening"). The refinement: architectural defences can be
*provably* secure against a defined class of attacks, though not for an
unconstrained general-purpose agent [BeurerKellner2025Patterns].

### Changes since the preliminary version

- Nasr et al. is no longer a preprint. It was published at USENIX Security
  2026, and the open-access PDF was checked. The published abstract adds
  "(under adaptive attacks)" after "above 90%". Its key is now
  Nasr2026AttackerSecond.

- The twelve defences that Nasr et al. bypass are defences against
  jailbreaks *and* prompt injections. The wording now says so. Checked in the
  full text, the prompt-injection defences among them include spotlighting,
  prompt sandwiching, StruQ, MetaSecAlign, Data Sentinel, MELON and several
  detectors.
- InjecAgent says that "agents are vulnerable", not that all 30 agents are.
  The wording now follows the paper.

## Search protocol

### Providers and health

| Check (time CET) | Route | Result |
|---|---|---|
| 10:46 (earlier agent, `prompt-injection-providers-check.txt`) | KTH proxy | all ok except dblp (HTTP 202 anti-bot page); Scopus COMPLETE view |
| 13:03 (`prompt-injection-providers-check-2.txt`) | direct (tunnel down after the reboot) | s2 rate limited (transient); ieee daily quota spent (resets 01:00); dblp HTTP 202; wos and openalex ok; Scopus standard view (no abstracts) |
| 13:41 (`prompt-injection-providers-check-3.txt`) | KTH proxy (tunnel back) | s2, openalex and wos ok; ieee quota spent; Scopus COMPLETE view |

Without the proxy:

- R1, R2, CR1 and CR2 (13:00-13:04).
- The s2 reruns of S2, S3 and S8 (13:04-13:10).
- R3 and CR3 (13:12).

The Scopus cells of R1-R3 and CR1-CR3 were then rerun through the proxy
(13:42-13:45). These were fresh fetches, not cache hits. The counts were the
same, and 4 records were added. Every full text cited is an open copy (arXiv, ACL
Anthology, USENIX, Zenodo); nothing closed-access is cited.

Other steps without the proxy:

- The abstract enrichment of pending records (14:28-15:16). Through the
  proxy it hit SOCKS timeouts, so it was rerun directly and stopped at
  6,400 of 8,813 records.
- The classification of the 300-record sample (17:04-17:10), whose
  per-batch abstract look-ups went directly.

In both, Scopus abstracts were unavailable. That affects only records
whose abstract no other database held.

### Query x provider x hits

Everything ran in the scholar session `prompt-injection`, with
`-l 0 -y 2022-2026 --in title-abstract` and the same Boolean query on every
provider. `./prompt-injection-queries.sh --print` lists the queries
verbatim. "failed" means not searched, never 0. No cell is 0, so no zero test
was needed. All searches ran on 2026-11-27, 10:52-13:45 CET.

| Label | wos | ieee | openalex | scopus | s2 (bulk) | dblp |
|---|---|---|---|---|---|---|
| S1 | 449 | 476 | 3703 | 878 | 2065 of 2072 | failed (HTTP 202) |
| S2 | 433 | 435 | 3292 | 787 | 1811 of 1816 | failed |
| S3 | 377 | 436 | 3044 of 3060 | 748 | 1687 of 1692 | failed |
| S4 | 123 | 175 | 1095 | 233 | 617 | failed |
| S5 | 238 | 314 | 1966 | 485 | 1206 | failed |
| S6 | 82 | 99 | 1250 | 150 | 828 | failed |
| S7 | 112 | 151 | 1445 | 201 | 811 | failed |
| S8 | 91 | 46 | 575 | 130 | 338 of 339 | failed |
| S9 | 508 | 844 | 1376 | 3013 | 1488 of 1492 | failed |
| C1 | 16 | 13 | 120 | 24 | 981 | failed |
| C2 | 88 | 131 | 656 | 165 | 395 | failed |
| C3 | 53 | 109 | 677 | 104 | 744 | failed |
| C4 | 31 | 35 | 334 | 44 | 250 | failed |
| C5 | 49 | 24 | 281 | 61 | 170 | failed |
| C6 | 67 | 123 | 319 | 366 | 613 | failed |
| C7 | 71 | 106 | 674 | 123 | 430 | failed |
| R1 | 15 | failed (quota) | 180 | 28 | 127 | failed |
| R2 | 16 | failed (quota) | 131 | 25 | 101 of 102 | failed |
| CR1 | 6 | failed (quota) | 74 | 7 | 72 | failed |
| CR2 | 11 | failed (quota) | 81 | 18 | 65 of 66 | failed |
| R3 | 72 | failed (quota) | 848 | 114 | 584 | failed |
| CR3 | 50 | failed (quota) | 167 | 73 | 395 | failed |

Labels: S = support, C = counter, R = repair (added after the check by
meaning), CR = counter-query of a repair query. The concept blocks and their
wordings are in the chapter (table `prompt-injection:concepts`) and in the
script.

Oddity: s2 returns 981 hits for C1, although C1 is S2 AND more terms; the
other providers return 13-120 for C1. Why S2's bulk search matches so loosely here
was not investigated. Its extra records were treated like all others:
screened if they fell in tier 1 or a sample, otherwise counted.

### Studies the queries had to return

The concept queries returned all seven named studies:

- Greshake et al. 2023.
- Zhan et al. 2025 (adaptive attacks).
- Nasr et al. 2025.
- Beurer-Kellner et al. 2025.
- Wu et al. 2024 (information-flow control).
- Debenedetti et al. 2026 (CaMeL).
- Zhang et al. 2024 (prompt extraction).

This was checked by title in the session JSON. The earlier agent's `sessions check` output marks five of them "not in any
session", but the session does hold them (checked by title). Why the check
missed them was not investigated.

### Check by meaning

The earlier agent ran six questions against openalex-semantic at 12:09, top
50 each; the output is in `prompt-injection-check/`. Works that the session
did not then hold:

- Prompt Flow Integrity (2503.15547) and Imprompter (2410.14923): repaired
  by R1 and R2; both are now in the session.
- SoK on prompt security (2510.15476): repaired by R3; now in the session.
- PARASITE (system-prompt poisoning), ASPIRER (a backdoor attack), a book
  chapter on elicitation attacks, and Prompt Adversarial Tuning (a jailbreak
  defence): outside the question, not repaired.

### Screening

The session holds 11,360 records (10,370 distinct works after folding
copies). Three numbers describe the screen:

- **Screened in full: 2,276 records.**
  - Tier 1, every record at place 100 or better in at least one
    relevance-ordered answer: 2,192 records.
  - The 79 check-by-meaning hits outside tier 1, screened by the agent
    from title and abstract.
  - The 5 cited works outside tier 1.
  - Result: 637 supporting, 436 qualifying, 1,203 discarded (668
    adjacent, 470 off-topic, 65 bearing on the topic but excluded by a
    criterion).
  - Exclusion tags on the discards: no-evidence 326, other-field 299,
    llm-as-tool 286, jailbreak-only 231, other-question 43, no-abstract
    28.
- **Sampled: 360 records**, drawn at random from outside tier 1 and
  screened the same way:
  - Sample 1: 60 records (seed 20261127, id
    `2026-11-27T12:14:28+00:00/rest/seed=20261127/8951c76c1ee1`, drawn from
    9,167 pending). 13 bear on the claim.
  - Sample 2: 300 records (seed 20261128, id
    `2026-11-27T16:04:18+00:00/rest/seed=20261128/69f64e8c6fdd`, drawn from
    9,024 pending after the corrections). 67 bear on the claim (22.3 %;
    modified Wilson interval 18.0-27.4 %).
  - Combined: **80 of 360 = 22.2 % (95 % Wilson interval 18.2-26.8 %)**.
  - The two draws are not one simple random sample. The second excluded
    the first and the 84 agent-decided records. The combined rate is
    therefore an approximation; the two separate rates agree.
- **Only counted: 8,724 records** (7,910 distinct works). If the sample is
  representative, an estimated **1,600 to 2,300** of them (1,400 to 2,100
  distinct works) bear on the claim and were not screened.

The search is therefore **not exhaustive**. The conclusions rest on tier 1,
the named studies, the check by meaning and the 360-record sample. No
"nothing exists" statement is made.

**What the sample showed.** I read all 80 bearing sample records. None
reports an independent break of a system-level or "provable" design. None
adds a defence that others have shown to hold against adaptive attacks;
several authors claim adaptive robustness for their own defence, among
them LocalAlign (ACM CCS 2026 per its artefact record). Two records that
qualify statements 5 and 6 were read in full and added to the bib:
Erisen2026Seccomp and Sidot2026Verify (both industry preprints). No
statement changes.

**Who screened.**

- The classifier was `scholar llm classify --no-examples` against
  `prompt-injection-context.txt`, with four categories and the exclusion
  labels other-field, jailbreak-only, llm-as-tool, no-evidence and
  no-abstract. The agent added the label other-question.
- Model anthropic/claude-sonnet-5-5 for tier 1 and both samples. Prompt
  versions: d083432dc30e599c for the first 20 records, f1869bb1af5461a5
  for the rest of tier 1 and sample 1, and 31bb9a9387e4118d for sample 2.
  The vocabulary then also held the theme tags.
- The agent, lit-prompt-injection (`--source agent`):
  - read all qualifying and low-confidence rows of tier 1;
  - corrected 102 decisions (50 kept rows tagged no-evidence and 3 tagged
    no-abstract were discarded; 13 kept-but-adjacent rows were discarded;
    36 discards without a criterion received one);
  - screened the 79 check-by-meaning hits;
  - tagged the 48 cited works with themes.
- Side effect: because session tags form the classifier's vocabulary,
  sample 2 also received theme tags such as pi-by-design. These are
  machine notes, not citations; the table counts "0 cited", because only
  an author-confirmed decision counts as cited.
- Before the sampling design was fixed, 592 tier-2 records had been
  classified by claude-haiku-5-5, not at random. They were reset to pending
  with the history kept and are counted among the 8,724.
- Nothing has been reviewed by the author. Two review samples are drawn
  for the author: 50 of 1,471 machine discards (seed 20261129, sample
  `2026-11-27T16:19:06+00:00/seed=20261129/71f24f4b47b0`) and 30 of 1,165
  machine inclusions (seed 20261130). Review them with `scholar sessions
  decide prompt-injection --source human ...` or in the TUI (filter s);
  `scholar llm sample prompt-injection --report` then gives the
  disagreement rate.

**Cost.**

- Sonnet 5.5: about 2.35 M input and 0.42 M output tokens.
- Haiku 5.5, for the 592 records later reset: about 0.4 M input and
  0.08 M output tokens.
- At the cached list prices of 2026-11-03 ($2/$10 and $0.10/$0.50 per M
  tokens) that is about $9 in all.
- The team lead stopped whole-session classification for cost reasons.

### Non-scholar sources (all recorded)

All of these were look-ups for works the session had already found, used
to check venues and published versions; none was used for discovery.

- WebSearch (standard mode), 27 Nov 2026, about 14:40, each with its
  verbatim query and outcome:
  - `"The Attacker Moves Second" adaptive attacks bypass defenses LLM
    jailbreaks prompt injections conference`: found the USENIX Security
    2026 presentation page; retained (verified, see below).
  - `"Design Patterns for Securing LLM Agents against Prompt Injections"
    published venue`: arXiv only; no venue found.
  - `"Meta SecAlign" OR "Meta-SecAlign" prompt injection conference paper
    2026`: arXiv only (v3, Feb 2026); no venue found.
  - `"Progent: Securing AI Agents with Privilege Control" accepted
    conference`: arXiv only; no venue found.
  - `"Securing AI Agents with Information-Flow Control" FIDES Costa accepted
    conference`: found a NeurIPS 2026 poster page; retained (verified, see
    below).
  - `"Prompt Injection attack against LLM-integrated Applications" HouYi
    published conference version`: arXiv only; no venue found.
- Pages opened with curl:
  - https://www.usenix.org/conference/usenixsecurity26/presentation/nasr,
    which gives the title, authors and abstract.
  - https://www.usenix.org/system/files/usenixsecurity26-nasr.pdf, fetched
    with fetch_pdf.py; both quotes were found in it.
  - https://neurips.cc/virtual/2026/poster/152696, which redirects to
    /loc/paris/poster/152696 and lists FIDES as a poster on 10 Dec 2026.
- Semantic Scholar graph API, 8 arXiv ids: rate-limited (HTTP 429) for 7 of
  them. The eighth (Wu et al., 2409.19091) lists only arXiv as venue.
- OpenAlex works API (title search): HTTP 429 for every query, so it was not
  used.
- Crossref `works?query.bibliographic=<title>` for 32 titles: matches only
  for Rennervate (NDSS) and SecOPD (EMNLP).

Earlier look-ups:

- arXiv API: `https://export.arxiv.org/api/query?id_list=<41 ids>`, at
  13:25, for authors, titles and dates.
- Crossref: `https://api.crossref.org/works/<doi>` for 15 DOIs, at 13:07
  and 13:24, for venues, authors and pages.
- Full texts: arXiv PDFs, ACL Anthology PDFs, and two open copies found
  through DOI resolution, all fetched with `fetch_pdf.py` into scholar's
  cache.
- `10.1145/3830454.3846661`: no open copy found.

## Piles

**Supports.** Cited, full text verified:

- Attacks and their success: Greshake2023Signed, Liu2023HouYi,
  Zhan2024InjecAgent, Debenedetti2024AgentDojo, Dziemian2026Competition,
  Khodayari2026Wild, Fu2024Imprompter, Schulhoff2023HackAPrompt,
  Toyer2024TensorTrust, Perez2022Ignore, Zhang2025ASB.
- One channel for instructions and data: Zverev2025Separate,
  Chen2025StruQ (the mechanism, and its own limitation).
- Defences that fail under adaptive attack: Zhan2025Adaptive,
  Nasr2026AttackerSecond, Chen2025MetaSecAlign (its own limitation),
  Choudhary2025NotDetect, Chen2025DetectRemove, Liu2024Formalizing,
  Wu2024IFC (its critique of model-level defences).
- Prompt extraction: Zhang2024Extraction, Liang2024Leaked.

**Qualifies.** Cited, full text verified:

- Defences reporting robustness: Hines2024Spotlighting, Chen2025SecAlign,
  Wallace2024Hierarchy, Wu2025ISE, Liu2025DataSentinel,
  Hung2025AttentionTracker, Shi2025PromptArmor, Zhu2025MELON,
  Jia2025TaskShield, An2025IPIGuard. Nasr et al. later bypassed several of
  these defences with adaptive attacks (Spotlighting, StruQ, MetaSecAlign,
  DataSentinel, MELON).
- Defences claiming robustness against *adaptive* attacks, not yet tested
  by others in the sources read: Zhong2026Rennervate (NDSS 2026),
  Zhao2026LTBD (preprint), Shi2025PromptArmor (preprint).
  Peng2026SecOPD (EMNLP 2026) cuts the success of one adaptive attack to
  9.0 %, against 94.0 % for Meta-SecAlign. The same paper also supports (b):
  it says trained models "still suffer from near 100% attack success rates
  (ASRs) against adaptive prompt injections".
- Guarantees by design: Debenedetti2026CaMeL, Costa2026FIDES,
  BeurerKellner2025Patterns, Shi2025Progent, Kim2025PFI,
  Pandey2026Certified. Pandey2026Certified certifies structured actions; it
  "admits no unsafe action" under a bounded corruption budget.
- Weaker attack results:
  - a low per-attempt success rate for the most robust models
    (Dziemian2026Competition);
  - attacks that break only some security properties
    (Debenedetti2024AgentDojo);
  - about 40 % end-to-end success against RAG applications
    (DeStefano2026RagnRoll);
  - attacks overstated by earlier protocols in a realistic RAG pipeline
    (Yin2026Generator);
  - benchmark numbers inflated by harness defects (Shaw2026SilentFailures);
  - benchmarks saturated by simple firewalls (Bhagwatkar2025Firewalls).
- Adaptive test of a system-level defence: Progent held in one small
  independent reproduction (Narisetty2026OutOfBand). The same paper warns
  that all such defences have so far been validated only on static
  benchmarks.
- Protection against extraction: Wang2024Raccoon, Zhuang2026ProxyPrompt;
  in one CI/CD study the entry agent did not leak its system prompt
  (Sidot2026Verify, preprint).
- Enforcement in code can itself be flawed: a deterministic seccomp gate
  was raced in 18.9-23.1 % of attempts, while kernel-level confinement held
  (Erisen2026Seccomp, preprint).

**Refutes:** none found. No source read shows that prompt injection can be
reliably prevented for an unconstrained agent, or that the threat to
deployed systems is overstated. The counter-queries C1 and CR2 were written
to surface such work; what they returned is in the classified hit list (see
Screening).

## DROPPED and not cited

**Dropped (could not be verified):** *A Large-scale Measurement of In-Page
Prompt Injections Against LLM Web Agents* (doi:10.1145/3830454.3846661). No
open copy exists, and no institutional fetch was tried, so it is not cited.
It is listed under "to fetch".

**Read but not cited**, because they add nothing beyond the cited sources or
lie beside the question:

- MUZZLE (2602.09222): adaptive red-teaming of web agents.
- Overcoming the Retrieval Barrier (2601.07072).
- SoK: Systematizing LLM Prompt Security (2510.15476): mostly about
  jailbreaks, so adjacent.
- Prompt Stealing Attacks (2402.12959): reconstructs prompts from model
  outputs, a different threat.

## Papers to fetch by hand

- doi:10.1145/3830454.3846661, *A Large-scale Measurement of In-Page Prompt
  Injections Against LLM Web Agents* (ACM, 2026). Check how often in-page
  injections succeed against deployed web agents. This could strengthen
  statement 2.
- Published versions of sources that were read as preprints:
  - CaMeL (doi:10.1109/SaTML68715.2026.00040): the arXiv "updated version"
    was read; check that the published paper gives the same 77 % and 84 %.
  - StruQ (USENIX Security 2025) and MELON (ICML 2025): published PDFs not
    opened; the venues are taken from the arXiv records.

## Limitations

- **DBLP** could not be searched (anti-bot page).
- **IEEE Xplore** failed for R1-R3 and CR1-CR3 (daily quota) and has not
  been rerun. The quota resets at 01:00. To rerun:
  `PROVS='-p ieee' ./prompt-injection-queries.sh prompt-injection-runs R1 R2
  R3 CR1 CR2 CR3`.
- **The screening was done by machines.** An LLM classifier and an AI agent
  screened the session, and the author has not reviewed it. Seeded samples
  for that review have been drawn but not reviewed.
- **Not exhaustive.** 2,276 records were screened in full and 360 sampled;
  8,724 were only counted. The sample suggests that 1,600 to 2,300
  relevant records were never read.
- **Full texts** were read in their arXiv or other open versions, which may
  differ from the published versions.
- **Several load-bearing sources are preprints:** Chen2025MetaSecAlign,
  BeurerKellner2025Patterns, Dziemian2026Competition, Shi2025Progent,
  Liu2023HouYi. The conclusion on defences under adaptive attack does not
  rest on them, since Zhan2025Adaptive, Nasr2026AttackerSecond and
  Choudhary2025NotDetect are peer-reviewed.
- **Published versions.** These were checked on 27 Nov 2026 against the
  session's WoS, Scopus and OpenAlex records, against Crossref, and by
  recorded web searches; DBLP was down and S2 rate-limited, so a published
  version may have been missed. Found:
  - Nasr et al.: USENIX Security 2026. The open-access PDF was opened and
    both quotes were checked in it.
  - FIDES: NeurIPS 2026 poster. The neurips.cc page was opened; the
    proceedings are not yet out.
  - Tensor Trust: ICLR 2024.
  - Spotlighting: CAMLIS 2024 (CEUR).
  - StruQ: USENIX Security 2025. Formalizing: USENIX Security 2024. MELON:
    ICML 2025. These three come from WoS records.
  - Zverev, ASB, ISE: ICLR 2025.
  - No published version was found for Meta-SecAlign, the design patterns,
    Progent, HouYi, Wu et al. (IFC), PFI, Imprompter, the 2026 competition,
    PromptArmor or Liang et al.
- **Benchmarks measure fixed task suites.** No source measures prevention in
  a deployed business system over time.
- **The field moves fast.** This report covers the literature indexed by 27
  Nov 2026.
- **A reboot interrupted the search.** All of the earlier agent's searches
  were kept (the session records them with hit counts), and only its failed
  cells were redone.
