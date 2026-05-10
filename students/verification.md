---
title: Verification
---

# Verifying agent output

Good agent workflows do not stop at fluent output. They end when you have
checked the relevant evidence.

That matters because a model can sound confident while still being wrong about
files, code, commands, tests, or the state of a repository. In this course, a
useful default is: treat the model's answer as a draft until the files, tools,
or test results support it.

## Intended learning outcomes covered on this page

After working through this page, students should be better able to:

- explain why repository-grounded terminal agents support different kinds of
  work than ordinary browser chat
- critically verify model output against files, tools, and project context
  before relying on it

## Example repository

To keep the examples comparable, imagine the same small repository in every
case:

- `README.md`
- `src/demo_app/cli.py`
- `src/demo_app/utils.py`
- `tests/test_cli.py`

The point is not this exact project. The point is to keep the repository fixed
while the kind of claim changes.

## Example 1: a repository claim

Suppose an agent says:

> The program starts in `src/demo_app/cli.py`.

That might be right, but the claim is not trustworthy just because it sounds
plausible. Ask for the evidence path.

A better interaction is:

> Show your work. Which file and command support that answer?

Now the verification can be grounded in the repository itself:

```sh
rg "__main__|main\(" -n src tests
sed -n '1,120p' src/demo_app/cli.py
```

If the search result and file contents really show `main()` being called from
`src/demo_app/cli.py`, then the claim is supported. If not, the answer needs to
be revised.

## Example 2: a code-change claim

Suppose an agent says:

> I renamed `format_name` to `render_name` everywhere.

This is a code-change claim, so the first check is not prose. The first check
is the diff.

```sh
git diff
rg "format_name|render_name" -n src tests
pytest tests/test_cli.py -q
```

Here the evidence should show three things:

1. the diff really made the intended edit
2. old references are gone or intentionally retained
3. the relevant tests still pass

If the agent changed the wrong file, missed one reference, or broke a test, the
claim is not yet verified.

## Example 3: a behavior claim

Suppose an agent says:

> I fixed the CLI so it prints the greeting correctly.

That is a behavioral claim. The best evidence is to run the behavior or a test
that checks it.

```sh
python -m demo_app --name "Ada"
pytest tests/test_cli.py -q
```

If the program output or test result matches the claim, good. If not, then the
model has described a fix that is not actually present.

Testing is often the first support here. If a behavior can be tested, start
there before trusting the explanation around it.

## Example 4: an explanation or synthesis claim

Suppose an agent says:

> The program reads configuration from the `DEMO_APP_MODE` environment
> variable.

This is not mainly a code-edit claim. It is an explanation claim. You still
verify it against the repository:

```sh
rg "DEMO_APP_MODE" -n src tests README.md
sed -n '1,120p' src/demo_app/utils.py
```

The explanation is only as good as the evidence path. A helpful answer should
point you to the relevant file and ideally cite the line or command that
supports the explanation.

## A reusable verification loop

After the examples, the general pattern becomes easier to see:

1. Identify what kind of claim the model is making.
2. Choose the matching check.
3. Run the check against reality.
4. Inspect the result before trusting the answer.

## Match the claim to the check

| If the model claims... | First check | Good evidence looks like |
| --- | --- | --- |
| something about repository structure | search plus file inspection | matching files, paths, and contents in the repo |
| it changed code correctly | `git diff` plus targeted search | the intended edit is present and unintended edits are absent |
| it fixed behavior | run the command or test | observed output or test results match the claim |
| its explanation is accurate | ask for file-backed evidence | cited files, commands, and outputs support the explanation |

## Show your work

When possible, ask the agent to show its evidence path rather than only its
conclusion.

Weak:

> The entry point is `src/demo_app/cli.py`.

Stronger:

> The entry point appears to be `src/demo_app/cli.py`; I found `main()` there
> with `rg "__main__|main\(" -n src tests`, and the file shows it being called
> under `if __name__ == "__main__":`.

The stronger version is better because it gives you something to inspect. This
resembles good literate-programming habits too: not just stating the conclusion,
but showing the path from evidence to conclusion.

## What not to trust by itself

On their own, these are not enough:

- the model sounding confident
- the model giving a long explanation
- the model saying it ran a command without showing what the command showed
- the model saying it changed files without you checking the diff

In short: `the model said it` is weaker than `the tool showed evidence`, which
is weaker than `the files, commands, and tests confirmed it`.

## Short checklist

Before you rely on an agent answer, ask:

1. What kind of claim is this?
2. Which file, command, diff, or test would check it fastest?
3. Did I actually inspect that evidence?
4. Am I trusting the model's wording, or the verified result?

## Next step

- [Understand the shared agentic concepts](agentic-concepts.html)
- [Get started with Claude Code](claude-code.html)
- [Get started with OpenCode](opencode.html)
- [Get started with the Python package `llm`](llm.html)
- [Which tool should I use?](which-tool.html)

## Further reading

- [Simon Willison: Agentic engineering patterns](https://simonwillison.net/guides/agentic-engineering-patterns/)
