---
name: honor-aid-check
description: Before giving or accepting help on a KTH assignment, check whether the help is within the assignment's permitted-aids and collaboration policy.
---

# honor-aid-check

Implements the front-half of Rules 4, 6, and 7: don't copy, give help appropriately, use AI correctly. The check happens **before** help is given, not after.

## When to use

- A student asks for help on an assignment and you (or Claude) are about to provide it.
- A peer is about to share code, notes, or a draft.
- The student is about to paste an assignment problem into a generative-AI tool.

## Process

### 1. Establish the policy

Ask for, in order of preference:
- The assignment's explicit "permitted aids / collaboration / AI use" statement, verbatim.
- The course's general policy (syllabus / course PM).
- If neither is available: **stop and recommend the user obtain it from the examiner**. Do not infer.

Normalise the policy into a small grid:

| Aid type | Permitted? | Conditions |
|---|---|---|
| Discussing problem with peers | yes / no / limited | e.g. "ideas only, no shared code" |
| Sharing code with peers | yes / no / limited | |
| External sources (books, web) | yes / no / limited | e.g. "with citation" |
| Generative AI — ideation | yes / no / limited | |
| Generative AI — drafting prose | yes / no / limited | |
| Generative AI — code generation | yes / no / limited | |
| Generative AI — debugging existing code | yes / no / limited | |
| Reuse of own prior work | yes / no / limited | |
| Reuse of starter / template code | yes / no / limited | |

### 2. Classify the requested help

State plainly which row(s) of the grid the request maps to. If a request spans multiple rows (e.g. "explain this paper and rewrite my paragraph"), split it.

### 3. Decide

For each row:

- **Permitted, no conditions** → proceed.
- **Permitted with conditions** → proceed, and note which conditions must be met (citation, disclosure, "ideas only," etc.). Add a reminder to log it for [`honor-disclose`](../honor-disclose/SKILL.md).
- **Not permitted** → refuse the specific sub-request. Offer the closest permitted alternative (e.g. "I can't write this paragraph for you, but I can point to two papers that argue both sides").
- **Unclear in policy** → treat as not-permitted-by-default and recommend asking the examiner. The honor code's burden is on the student to know the rules ("students must discover the rules for each course component").

### 4. Record

Append a one-line entry the user can paste into a running help log:

```
<date> · <assignment> · <aid type> · <permitted? + condition> · <what was provided>
```

This log feeds [`honor-disclose`](../honor-disclose/SKILL.md) at submission time.

## Anti-patterns to refuse

- "Just this once" — the rule applies independently of frequency.
- "My friend already submitted, can you adapt theirs" — Rule 4 (no copying), regardless of permission.
- Requests to remove AI fingerprints or "make it not sound like AI" — this is *concealment*, which violates Rule 2 even if the AI use itself was permitted.
- Helping with one part of a group submission while bypassing other members (Rule 1 — group responsibility is collective).
