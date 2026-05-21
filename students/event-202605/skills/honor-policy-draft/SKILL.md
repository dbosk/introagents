---
name: honor-policy-draft
description: (Teacher-side) Draft an unambiguous permitted-aids and collaboration policy for a KTH assignment, including explicit handling of generative AI.
---

# honor-policy-draft

The KTH honor code places a duty on teachers to *"provide clear instructions regarding which aids and forms of collaboration are permitted during examinations."* Ambiguity is where honor-code incidents are born. This skill produces a policy that leaves no room for "I didn't know."

## When to use

- Designing or updating an assignment, lab, project, or exam.
- After a previous round revealed disputes about what was allowed.

## Inputs to collect

1. **Assignment identity** — course code, name, weight, learning outcomes assessed.
2. **Assessment form** — individual / pair / group; written / oral / code / mixed.
3. **Intended difficulty signal** — what is the student supposed to demonstrate they can do *unaided*? (This is the load-bearing question; everything else falls out of it.)
4. **Pragmatic context** — typical class size, TA capacity, prior incidents.

## Output

Produce the policy in the grid form that [`honor-aid-check`](../honor-aid-check/SKILL.md) consumes, so students and tools agree on the same artefact.

```
# Permitted aids and collaboration — <course> <assignment>

## What you must demonstrate unaided
<one sentence — this is the test the policy below protects>

## Policy grid
| Aid type | Permitted? | Conditions |
|---|---|---|
| Discussing the problem with peers | yes/no/limited | |
| Sharing code with peers | yes/no/limited | |
| External sources (books, web, papers) | yes/no/limited | citation required? |
| Generative AI — ideation/brainstorming | yes/no/limited | |
| Generative AI — drafting prose | yes/no/limited | |
| Generative AI — code generation | yes/no/limited | |
| Generative AI — debugging code you wrote | yes/no/limited | |
| Reuse of your own prior work | yes/no/limited | |
| Reuse of starter/template code | yes/no/limited | |

## Disclosure requirement
<exactly what students must include in their submission to declare help received — point at the honor-disclose template if used>

## Oral defense
You may be asked to explain any part of your submission. Inability to explain a part is treated as not having authored it, regardless of whether help was disclosed.

## When in doubt
Ask <named examiner / TA channel> *before* using the aid. Asking after the fact does not retroactively make it permitted.
```

## Quality checks before publishing

- Read each "Permitted?" cell as if you were a student looking for a loophole. Can you find one?
- Does any "yes" cell undermine the "What you must demonstrate unaided" sentence? If so, narrow it.
- Is "Generative AI" addressed in *every* row it could plausibly apply to, not just one catch-all line? (The most common policy failure mode is a single "AI use is allowed/forbidden" line that doesn't survive contact with reality.)
- If a TA were asked "is X allowed?" by a student, can they answer from this document alone?

## Anti-patterns

- "Use AI responsibly" — undefined; means nothing.
- "No AI" without saying whether spellcheck, autocomplete, search-engine summaries, or IDE suggestions count.
- Policies that change between rounds of the same assignment without notice.
- Policies more restrictive than the course PM without explanation.
