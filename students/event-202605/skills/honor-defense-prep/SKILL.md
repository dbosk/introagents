---
name: honor-defense-prep
description: Prepare a student to orally present and defend every part of their own submission, satisfying Rule 3 (oral competency) of the KTH EECS Code of Honour.
---

# honor-defense-prep

Rule 3: *"Present and defend your entire solution."* If you cannot explain a part of your submission, you do not own that part — regardless of who or what produced it.

This skill is a rehearsal harness: it walks every section of a submission and tests whether the author can defend it cold.

## When to use

- Before an oral exam, project demo, code review with a TA, or thesis defense.
- As a self-check before submission: if defense prep reveals gaps, fix the *understanding*, not the wording.

## Process

### 1. Inventory the submission

Read or have the user paste the submission. Build a checklist of defendable units:

- For code: each function, each non-trivial block, each library choice, each non-default parameter.
- For prose: each claim, each citation, each figure, each equation.
- For experiments: each design choice, each metric, each reported number.

Mark anything the user flagged as AI-assisted or source-derived in [`honor-disclose`](../honor-disclose/SKILL.md) for **priority interrogation**.

### 2. Interrogate, one unit at a time

For each unit, ask the author at least one of:

- **What does this do / claim?** (paraphrase test)
- **Why this and not the obvious alternative?** (design-choice test)
- **What would break it?** (boundary test)
- **Walk me through it line by line / sentence by sentence.** (trace test)
- **Where does this number / claim come from, and how do you know it's right?** (provenance test)

The author answers *without looking at the submission*. Claude is the interrogator, not the helper — do not feed answers.

### 3. Score and triage

Tag each unit:

- **Owned** — clean answer, no hesitation.
- **Shaky** — answer broadly right but missing the *why*, or relied on jargon as a shield.
- **Borrowed** — author could not explain without re-reading the source/AI output.

### 4. Remediation

For each `shaky` or `borrowed` unit:

- **Borrowed** → the author must either (a) learn it well enough to move it to `owned`, or (b) remove it from the submission. Disclosing it is necessary but not sufficient — Rule 3 still requires defense.
- **Shaky** → drill the specific weak link. Usually one targeted question reveals which sub-concept is missing.

A submission is defense-ready when every unit is `owned`.

## Notes

- Be a tough but fair examiner: real examiners ask follow-ups. So should this skill.
- Don't accept "I used AI for this part" as a complete answer — that is disclosure, not defense.
- Do not write the answers for the student. The point is to surface gaps, not paper over them.
