# KTH EECS Honor-Code Skills

A suite of Claude Code skills supporting the [KTH EECS Code of Honour](https://www.kth.se/en/eecs/utbildning/hederskodex/inledning-1.17237).

The honor code rests on **mutual trust** and a working definition of **professional integrity**:

> Work is completed in your own name; contributions from others are acknowledged; you understand your own solution; you accept responsibility for its quality.

It is operationalised by seven rules:

1. **Group responsibility** — all members are accountable for the collective work
2. **Disclosure** — honestly report help received and sources used
3. **Oral competency** — be able to present and defend your *entire* solution
4. **No copying** — do not duplicate others' solutions
5. **Attendance integrity** — manage attendance records correctly
6. **Proper assistance** — provide help appropriately
7. **Generative AI** — handle AI tools correctly (disclose, understand, take responsibility)

## Skills

| Skill | Purpose | Primary rule(s) |
|---|---|---|
| [honor-disclose](honor-disclose/SKILL.md) | Generate an honest disclosure block for a submission | 2, 7 |
| [honor-aid-check](honor-aid-check/SKILL.md) | Check requested help against an assignment's permitted-aids policy *before* giving it | 4, 6, 7 |
| [honor-defense-prep](honor-defense-prep/SKILL.md) | Prepare to orally defend every part of a solution | 3 |
| [honor-audit](honor-audit/SKILL.md) | Audit a draft submission for honor-code risk | 1, 2, 4, 5 |
| [honor-policy-draft](honor-policy-draft/SKILL.md) | (Teacher) draft an unambiguous permitted-aids policy for an assignment | (teacher) |
| [canvas](canvas/SKILL.md) | Query KTH Canvas via the `canvaslms` CLI (courses, assignments, deadlines, modules, syllabus) | — |

## Design principles

- **Disclose by default.** When in doubt, surface it. The code calls openness about help "the central principle."
- **Understanding gate.** Any output must be one the user can explain back. The defense-prep skill enforces this directly; other skills nudge toward it.
- **Policy first.** What is permitted varies per assignment. Skills consume an explicit policy (or ask for one) — they do not assume.
- **No detection theater.** These skills do not try to "catch" anyone. They help the honest person stay honest.
