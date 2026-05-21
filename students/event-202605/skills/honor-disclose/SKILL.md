---
name: honor-disclose
description: Generate an honest, structured disclosure block for a KTH submission — what was the student's own work, what help was used (people, sources, AI), and where each contribution appears.
---

# honor-disclose

Produce a disclosure statement that satisfies Rule 2 (disclosure of help and sources) and Rule 7 (generative AI) of the KTH EECS Code of Honour.

The principle: *it is not the receipt of help that violates the code — it is the failure to disclose it.* This skill makes disclosure routine.

## When to use

- Before submitting an assignment, lab report, project, or thesis chapter.
- Whenever a session has involved AI assistance, peer discussion, or use of external code/text/figures.

## Inputs to collect

Ask the user (in one consolidated turn — don't drip-feed questions):

1. **Submission identity** — course code, assignment name, author(s).
2. **Permitted-aids policy** — what the assignment explicitly allows (paste it, or point to it). If unknown, say so; the disclosure will note this.
3. **Help received**, broken down:
   - **People** — who, in what role (peer discussion, TA hint, supervisor feedback, proofreader). Names if applicable.
   - **Sources** — papers, textbooks, Stack Overflow answers, blog posts, repositories. URL or full citation.
   - **AI tools** — which tool/model, what it was used for (brainstorming, code completion, drafting, rewriting, debugging), and which sections it touched.
   - **Pre-existing material** — own prior work, templates, starter code.
4. **Where each contribution appears** — section, file, line range, figure number.
5. **Verification** — for each AI- or source-derived contribution, can the author explain it without the source? (Rule 3 hook.) Mark `understood` / `partial` / `not yet`.

## Output format

```
## Honesty Declaration

Course: <code> — <assignment>
Author(s): <name(s)>
Permitted-aids policy: <one-line summary OR "not stated — see note">

### Own work
- <high-level statement of what the author did independently>

### Help received
| Source | Type | Used for | Location | Understood? |
|---|---|---|---|---|
| <name / citation / tool> | person / source / AI / prior work | <purpose> | <where> | yes / partial / no |

### Notes
- <any caveats, e.g. "policy did not address AI use; I treated it as permitted-with-disclosure">
- <anything the author is unsure whether to disclose — flag it rather than hide it>

Signed: <name>, <date>
```

## Rules for the assistant

- **Never invent** entries the user did not report. If you (Claude) helped with this submission earlier in the conversation, include yourself explicitly — model name, what you did, where it appears.
- If the user under-reports help that is visible in the conversation, point it out before producing the block.
- If `Understood?` is `no` for any row, recommend running [`honor-defense-prep`](../honor-defense-prep/SKILL.md) before submitting.
- If the permitted-aids policy is unknown, recommend [`honor-aid-check`](../honor-aid-check/SKILL.md) and produce the block with a note rather than guessing.
