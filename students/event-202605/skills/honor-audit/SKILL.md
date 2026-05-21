---
name: honor-audit
description: Audit a draft KTH submission for honor-code risk — copied content, missing citations, undisclosed AI use, group-attribution gaps, attendance-record issues.
---

# honor-audit

A pre-submission read-through that flags concrete risks against Rules 1, 2, 4, and 5. Output is a punch list, not a verdict.

This skill **does not detect plagiarism algorithmically**. It surfaces patterns a careful human reader would notice and asks the author about them.

## When to use

- After the submission is drafted but before it is submitted.
- After [`honor-disclose`](../honor-disclose/SKILL.md) is filled in — the audit cross-checks the disclosure against the artefact.

## Checks

### Rule 4 — no copying

- Passages with a stylistic shift from the surrounding text (different vocabulary range, sentence rhythm, formality).
- Code blocks whose style differs from the rest of the file (naming, error handling, comment density).
- Suspiciously polished sections that contradict the author's stated skill level or earlier drafts.
- Verbatim or near-verbatim matches to sources cited *without quotation marks*.

For each hit: ask the author where it came from. If it is borrowed, require quotation/citation or a rewrite in the author's own words **plus understanding** ([`honor-defense-prep`](../honor-defense-prep/SKILL.md)).

### Rule 2 — disclosure completeness

Cross-check the disclosure block against the artefact:

- Any AI or source contribution visible in the artefact but absent from the disclosure → flag.
- Any disclosure entry with `Understood? = no` or `partial` → flag and route to defense prep.
- Conversation history that suggests help received but not disclosed → flag (with the specific evidence).

### Rule 1 — group accountability

For group submissions:

- Is every member named?
- Can every member defend every part? (Not "we divided the work" — Rule 1 makes accountability collective.)
- Are there sections only one member touched and the others have not read?

### Rule 5 — attendance integrity

If the submission interacts with attendance records (lab sign-offs, seminar tickets):

- Are all listed attendees actually attended?
- Are there signatures or sign-offs for people who were not present?

### Cross-cutting

- "AI-flavour" markers (em-dashes, hedging phrases, plausible-but-wrong citations) in submissions where AI use is undisclosed → flag.
- Citations that the author cannot locate or summarise → flag (likely hallucinated).
- Numbers in the text that disagree with numbers in tables/figures → flag (often a sign of partial rewrites by mixed authors/tools).

## Output

A bulleted list, ordered by severity:

```
## Audit findings — <submission>

### Must fix before submission
- <issue> — <location> — <recommended action>

### Should resolve
- ...

### Worth a second look
- ...

### Clean
- <areas checked and found in order>
```

Then: explicitly ask the author to address each `must fix` item. Do not produce a "cleaned" version of the submission — the author must do that themselves (Rule 3).
