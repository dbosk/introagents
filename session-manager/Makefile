# Everything in this directory tangles from sessionmgr.nw; this
# Makefile is committed only because it cannot tangle itself.

SCRIPTS=	entrypoint.sh group-session prepare.sh
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
	case "$@" in *.sh|group-session) chmod +x "$@";; *) :;; esac

# The two status-line seeds: distinct root-chunk names disambiguate the
# two settings.json outputs that the basename-keyed rule above cannot.
template/.claude/settings.json: sessionmgr.nw
	mkdir -p $(dir $@)
	notangle -R"[[.claude/settings.json]]" $< | cpif $@

template/.config/ccstatusline/settings.json: sessionmgr.nw
	mkdir -p $(dir $@)
	notangle -R"[[ccstatusline/settings.json]]" $< | cpif $@

sessionmgr.pdf: sessionmgr.nw preamble.tex

.PHONY: prepare build run hackspace
prepare: ${SEEDS} ${CFGSEEDS} prepare.sh
	./prepare.sh .data ${TEAMS}

build: ${SCRIPTS} ${CONFIGS}
	docker build -t introllm-session .

run:
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

hackspace: ${SEEDS} prepare.sh
	./prepare.sh .hackdata ${HACK_TEAMS}
	docker run --rm -d --name hackspace -p ${HACK_PORT}:22 \
	  -e CLAUDE_CODE_OAUTH_TOKEN -e ANTHROPIC_API_KEY \
	  -e ANTHROPIC_MODEL="${HACK_MODEL}" -e TEAMS="${HACK_TEAMS}" \
	  -v "${CURDIR}/.hackdata:/data" introllm-session

.PHONY: clean clean-tangled
clean: clean-tangled
clean-tangled:
	${RM} ${SCRIPTS} ${CONFIGS}
	${RM} -r template claude-defaults
	${RM} sessionmgr.tex sessionmgr.pdf
	${RM} sessionmgr.aux sessionmgr.log sessionmgr.out sessionmgr.toc
	${RM} sessionmgr.fls sessionmgr.fdb_latexmk

# The .nw is a self-contained document (its first chunk holds
# \documentclass and \input{preamble.tex}), so weave without
# noweave's own wrapper: -n emits no header, -delay defers the
# remaining markup past the first documentation chunk.  Our preamble
# sets \noweboptions, so no -option here.
NOWEAVEFLAGS.pdf=	-x -n -delay -t2

INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/noweb.mk
