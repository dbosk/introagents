# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project at a glance

This repo is the source for "The life agentic" — a GitHub Pages site
(<https://github.com/dbosk/introagents>) introducing students and TCS staff
to agentic LLM tool use. It has **two audiences and two build pipelines**:

- **`students/`** — Jekyll markdown pages (the main content area, ~16 pages).
  Rendered to HTML by GitHub Pages on push; nothing is built locally.
- **`tcs/`** — a LaTeX/Beamer slide deck (`slides.tex` → `slides.pdf`) plus a
  small Jekyll landing page at `tcs/index.md`. The slide deck is built
  locally with `make`.

Other top-level pieces worth knowing about:

- `_config.yml` — Jekyll config (`jekyll-theme-primer`).
- `README.md` — landing copy mirrored to the Pages site.
- `makefiles/` and `didactic/` — **git submodules**, load-bearing for the
  slide build (see below).

## Build & preview commands

**First-time setup is mandatory before the slide build will work:**

```bash
git submodule update --init
```

The `tcs/` Makefile `include`s `../makefiles/tex.mk`, `../makefiles/noweb.mk`,
and `../didactic/didactic.mk`; and `tcs/didactic.sty` is a symlink into the
`didactic/` submodule. Without the submodules initialised, the build fails
immediately.

**Build the slides:**

```bash
cd tcs && make            # produces tcs/ltxobj/slides.pdf
                          # (tcs/slides.pdf is a symlink to it)
cd tcs && make clean      # removes built PDFs
```

The build uses `latexmk` under the hood and requires `-shell-escape` (already
set in `tcs/Makefile`) because of `minted` and `pythontex`.

**Site preview:** there is **no local Jekyll workflow wired up** in this
repo. The Pages site is rendered on push. If you genuinely need a local
preview, `bundle exec jekyll serve` will work but is not part of the
project's standard workflow.

**No test suite, no linter, no CI** lives in this repo. (The
`makefiles/.circleci/` config belongs to the `makefiles` submodule, not to
introllm.)

## Prose conventions (must be respected)

**British English is a project rule, not a preference.** PR #11 (commit
`a66a542`, "Proofreads student pages and switches to British English")
deliberately swept the student pages over to British spelling. New and
edited prose must follow suit.

- Use: *recognise*, *behaviour*, *centre*, *organise*, *generalisation*,
  *colour*, *whilst*, *learnt*.
- Do **not** use: *recognize*, *behavior*, *center*, *organize*, *color*.

This applies to both `.md` student pages and LaTeX prose in `tcs/`
(`preamble.tex` already sets `babel` to `british`).

**Jekyll front matter** on every published markdown page:

```
---
title: <Page Title>
---
```

**Cross-page links use `.html`, not `.md`** (matches Jekyll's output paths):
`[Model access](model-access.html)`, never `[Model access](model-access.md)`.

**Learning-outcomes scaffolding.** The master list lives in
`students/index.md` under "Intended learning outcomes". Most student pages
carry their own "Intended learning outcomes covered on this page" section
that quotes a subset, lightly rephrased. Keep this pattern when adding new
pages or revising existing ones — do not invent new outcomes that
contradict the master list.

## LaTeX / Beamer conventions in `tcs/`

- The `didactic` package (`didactic.sty`, loaded via the submodule symlink)
  supplies **semantic environments** — `question`, `exercise`, `activity`,
  `remark` — on top of standard `block`, `definition`, `theorem`. Prefer
  these over a generic `block` when the semantic intent matches; they are
  colour-coded in Beamer and degrade gracefully in handouts.
- Preamble uses `babel` with `swedish,british` (British primary),
  `biblatex` (alphabetic), `minted`, `pythontex`, `csquotes`, `cleveref`.
  Use `\cref{}` rather than `\S\ref{}`, and `\enquote{}` rather than raw
  `` ``...'' ``.
- `pythontex` working dir is `..` (one level up from `tcs/`).

## Private / local files

- `tcs/elena.email` — mode `600`, contains a private email used as raw
  material for one slide demo. Off-limits: do not read it, do not commit
  it. It currently shows as untracked in `git status`; that is intentional.

## Relevant skills installed

Let these auto-trigger rather than re-deriving their conventions:

- `latex-writing` — when editing `tcs/*.tex`.
- `didactic-notes` — when adding pedagogical reasoning; keep those in
  `\ltnote{}`, out of student-facing prose.
- `variation-theory` and `try-first-tell-later` — when adding examples or
  exercises to student pages.
- `commit` — for atomic commits.

## AGENTS.md

`AGENTS.md` at the repo root is a symlink to this file, so non-Claude
agents (Copilot CLI, OpenCode, etc.) read the same conventions. Edit
`CLAUDE.md`; the symlink propagates the change.
