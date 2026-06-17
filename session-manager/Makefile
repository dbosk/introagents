# Everything in this directory tangles from sessionmgr.nw; this
# Makefile is committed only because it cannot tangle itself.

SCRIPTS=	entrypoint.sh group-session prepare.sh team-report
CONFIGS=	Dockerfile sshd_config
SEEDS=		template/CLAUDE.md template/RULES.md \
		claude-defaults/.claude.json

# Status-line seeds.  Kept out of SEEDS because the generic rule below
# keys the notangle root chunk on the basename ($(notdir $@)), and both
# of these tangle to a file named settings.json -- so they need their
# own rules with distinct, path-qualified root-chunk names.
CFGSEEDS=	template/.claude/settings.json \
		template/.config/ccstatusline/settings.json

# The team accounts to create: number and names.  ?= so that an
# exported TEAMS in the environment wins, letting "export TEAMS=..."
# once feed both `make prepare` and `make run`.  Must match the
# Dockerfile's ENV TEAMS default (see sessionmgr.nw, sec:dockerfile).
TEAMS ?=	groupa groupb groupc

.PHONY: all
all: ${SCRIPTS} ${CONFIGS} ${SEEDS} ${CFGSEEDS} sessionmgr.pdf

# One explicit rule for all tangle targets: noweb.mk's suffix rules
# assume one .nw per output and don't cover extensionless or
# .md/.json targets.  -R picks the right root chunk out of the
# single .nw; cpif only touches the file when the content changed.
${SCRIPTS} ${CONFIGS} ${SEEDS}: sessionmgr.nw
	mkdir -p $(dir $@)
	notangle -R"[[$(notdir $@)]]" $< | cpif $@
	case "$@" in *.sh|group-session|team-report) chmod +x "$@";; *) :;; esac

# The two status-line seeds: distinct root-chunk names disambiguate the
# two settings.json outputs that the basename-keyed rule above cannot.
template/.claude/settings.json: sessionmgr.nw
	mkdir -p $(dir $@)
	notangle -R"[[.claude/settings.json]]" $< | cpif $@

template/.config/ccstatusline/settings.json: sessionmgr.nw
	mkdir -p $(dir $@)
	notangle -R"[[ccstatusline/settings.json]]" $< | cpif $@

sessionmgr.pdf: sessionmgr.nw preamble.tex noweb_lexer.py

.PHONY: prepare build run hackspace require-credential
prepare: ${SEEDS} ${CFGSEEDS} prepare.sh
	./prepare.sh .data ${TEAMS}

build: ${SCRIPTS} ${CONFIGS}
	docker build -t introllm-session .

# Fail fast, on the terminal, if no credential is in the environment.
# `run`/`hackspace` detach with -d, so the entry point's own check would
# otherwise surface only in `docker logs`, leaving `make run` looking like
# it succeeded while the container exits.  We read the same variables docker
# passes through, so this predicts exactly what reaches the container --
# and spells out that a subscription token is not auto-detected from
# ~/.claude but must be passed explicitly.
require-credential:
	@if [ -z "$$CLAUDE_CODE_OAUTH_TOKEN" ] && [ -z "$$ANTHROPIC_API_KEY" ]; then \
	  echo "error: no credential in the environment.  Pass one of:" >&2; \
	  echo "  CLAUDE_CODE_OAUTH_TOKEN=sk-ant-oat01-... make run   (claude setup-token)" >&2; \
	  echo "  ANTHROPIC_API_KEY=sk-ant-...           make run   (API credits)" >&2; \
	  echo "note: a subscription token is NOT read from ~/.claude; pass it explicitly." >&2; \
	  exit 1; \
	fi

run: require-credential
	docker run --rm -d --name introllm-session -p 2222:22 \
	  -e CLAUDE_CODE_OAUTH_TOKEN -e ANTHROPIC_API_KEY \
	  -e ANTHROPIC_MODEL -e TEAMS="${TEAMS}" \
	  -v "${CURDIR}/.data:/data" introllm-session

# The post-game hacker space: a second, independent container so the
# game's .data/ stays pristine for evaluation.  Its own name, port,
# volume, account list and (larger) model, each overridable like TEAMS.
# Reuses the game's image, so `make build` must have run first; reads
# the credential from the environment exactly as `run` does.
HACK_TEAMS ?=	hack1 hack2 hack3 hack4
HACK_PORT ?=	2223
HACK_MODEL ?=	claude-opus-4-8

hackspace: require-credential ${SEEDS} prepare.sh
	./prepare.sh .hackdata ${HACK_TEAMS}
	docker run --rm -d --name hackspace -p ${HACK_PORT}:22 \
	  -e CLAUDE_CODE_OAUTH_TOKEN -e ANTHROPIC_API_KEY \
	  -e ANTHROPIC_MODEL="${HACK_MODEL}" -e TEAMS="${HACK_TEAMS}" \
	  -v "${CURDIR}/.hackdata:/data" introllm-session

# Post-event harvest (see sessionmgr.nw, sec:harvest).

.PHONY: ccusage archive
# Per-team token usage and cost.  Reads only the persisted transcripts,
# so it needs no credential and never calls Claude; the image is reused
# as root purely because that is the one way to read the teams' mode-600
# transcripts.
ccusage: build
	docker run --rm -v "${CURDIR}/.data:/data:ro" -e TEAMS="${TEAMS}" \
	  --entrypoint /usr/local/bin/team-report introllm-session ccusage

# Pack the teams' work into data.tar.gz and data.zip, each carrying a
# generated README, in two phases.  Phase one stages a host-owned,
# pruned copy as root in the container (the only step that can read the
# mode-600 transcripts); HOST_UID/HOST_GID let it chown the staging tree
# back to whoever ran make.  Phase two runs the SAME tangled script on
# the host, where the facilitator's own logged-in claude writes the
# READMEs and tar/zip pack the archives -- so no credential is plumbed
# into the container and .data ownership is left untouched.
HARVEST ?=	.harvest
archive: build team-report
	${RM} -r "${HARVEST}"
	docker run --rm -v "${CURDIR}/.data:/data:ro" -v "${CURDIR}:/out" \
	  -e TEAMS="${TEAMS}" -e HOST_UID="$$(id -u)" -e HOST_GID="$$(id -g)" \
	  --entrypoint /usr/local/bin/team-report introllm-session \
	  stage "/out/${HARVEST}"
	TEAMS="${TEAMS}" ./team-report pack "${HARVEST}"
	${RM} -r "${HARVEST}"

# Convenience names: one `archive` run produces both, so depending on it
# (rather than carrying a recipe each) keeps `make data.tar.gz data.zip`
# to a single archive run.
data.tar.gz data.zip: archive

.PHONY: clean clean-tangled
clean: clean-tangled
	${RM} data.tar.gz data.zip
clean-tangled:
	${RM} ${SCRIPTS} ${CONFIGS}
	${RM} -r template claude-defaults
	${RM} sessionmgr.tex sessionmgr.pdf noweb_lexer.py
	${RM} sessionmgr.aux sessionmgr.log sessionmgr.out sessionmgr.toc
	${RM} sessionmgr.fls sessionmgr.fdb_latexmk

# The .nw is a self-contained document (its first chunk holds
# \documentclass and \input{preamble.tex}), so weave without
# noweave's own wrapper: -n emits no header, -delay defers the
# remaining markup past the first documentation chunk.  Our preamble
# sets \noweboptions, so no -option here.  The remaining flags mirror
# noweb.mk's NOWEAVEFLAGS.tex (the rich path the makefiles' own docs
# use, which NOWEAVE.pdf otherwise omits): -autolang/-autodefs index
# the shell definitions, and the tominted filter pipes code chunks
# through minted via noweb_lexer.py for syntax highlighting.  Note
# -index supersedes -x (noweave rejects the two together), so unlike
# the bare .pdf path we drop -x.
NOWEAVEFLAGS.pdf=	-n -delay -t2 -autolang -autodefs sh \
			-index -filter 'tominted -lexer ${NOWEB_LEXER}'

INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk
