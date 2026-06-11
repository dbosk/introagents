# Session manager

An SSH-into-Claude host for the TCS Summer Event: participants SSH
into a Docker container on the facilitator's laptop and land directly
in a fresh `claude` session in their team's shared directory.

Everything here is a literate program: all scripts, the Dockerfile,
the SSH configuration and the seed files tangle from `sessionmgr.nw`,
and the woven `sessionmgr.pdf` is the full documentation. Build it
with `make` (requires the `makefiles/` submodule:
`git submodule update --init` at the repository root).

Quick start for facilitators:

```sh
make                # tangle everything, weave sessionmgr.pdf
make prepare        # seed .data/ with the team workspaces
make build          # build the Docker image
claude setup-token  # once, on your own machine
CLAUDE_CODE_OAUTH_TOKEN=sk-ant-oat01-... make run
```

Participants connect with `ssh -p 2222 groupa@<ip-address>` (or
`groupb`, `groupc`). See `sessionmgr.pdf` for the design and all the
details.
