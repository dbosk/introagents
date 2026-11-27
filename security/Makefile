PDFS=		notes.pdf slides.pdf

.PHONY: all
all: ${PDFS}

LATEXFLAGS+=	-shell-escape
# The example program's terminal session is run and embedded with
# PythonTeX (didactic's \runpython), and the Mentipy polls are registered
# by PythonTeX too, so code and output cannot drift apart.
TEX_PYTHONTEX=	yes

# PythonTeX's python3 cannot import the mentipy tool, so the deck has its
# own venv, which this Makefile makes.  The two jobs share an output
# directory, hence --rerun=always.
MENTIPY_VENV=	$(CURDIR)/.venv
PYTHONTEXFLAGS=	--interpreter python:${MENTIPY_VENV}/bin/python3 --rerun=always

${MENTIPY_VENV}/bin/python3:
	mentipy init --venv ${MENTIPY_VENV}

MENTIPY_VERSION=	1.0
MENTIPY_STAMP=	${MENTIPY_VENV}/mentipy-${MENTIPY_VERSION}

# Order-only: the venv must exist, but its timestamp must not trigger an
# upgrade.  The PythonTeX output goes with the upgrade, since latexmk
# reruns PythonTeX only when the code changed.
${MENTIPY_STAMP}: | ${MENTIPY_VENV}/bin/python3
	${MENTIPY_VENV}/bin/python3 -m pip install 'mentipy>=${MENTIPY_VERSION}'
	${RM} ${TEX_OUTDIR}/*.pytxmcr
	touch $@

${PDFS}: ${MENTIPY_STAMP}
# mentipy serve rewrites the QR sidecars; the PDFs must follow them.
${PDFS}: $(wildcard mentipy-obj/Q-*.pdf_tex)
# The support bot's launcher writes its address here when it starts.
${PDFS}: $(wildcard bot-url.tex)

# The deck is a literate program: contents.nw is the single source.
# contents.tex is woven from it and the example program is tangled from
# it (the examples/ directory is all generated files).
SRC+=		preamble.tex
SRC+=		abstract.tex contents.tex
SRC+=		design.tex
SRC+=		search-appendices.tex
# The appendices \input the search reports' chapters and their generated
# hit-list tables; a regenerated file must trigger a rebuild.
SRC+=		$(wildcard literature-search/*-chapter.tex)
SRC+=		$(wildcard literature-search/*-full.tex)
SRC+=		ltnotes.bib
SRC+=		$(wildcard literature-search/*.bib)
# Recorded sessions with the support bot, shown on the slides.  They are
# data: the build never calls a language model.
SRC+=		$(wildcard transcripts/*.txt)

# The four small files of the support bot that the slides show.  They
# are tangled from the bot's own literate source.
TEACHING=	chatbot/prompt_vulnerable.py chatbot/prompt_hardened.py
TEACHING+=	chatbot/refund_before.py chatbot/refund_after.py

${TEACHING}: chatbot/chatbot.nw
	${MAKE} -C chatbot venv teaching

${PDFS}: ${TEACHING}

# The bot's woven source is an appendix of the notes.
chatbot/chatbot.tex: chatbot/chatbot.nw
	${MAKE} -C chatbot chatbot.tex

notes.pdf: chatbot/chatbot.tex

# One line per tangled example program.
EXAMPLES+=	examples/primes.py

contents.tex: contents.nw

# The generic %.py: %.nw pattern does not match across the examples/
# directory boundary, so spell out one rule per suffix.
examples/%.py: contents.nw
	@mkdir -p ${@D}
	${NOTANGLE.py}

.PHONY: examples
examples: ${EXAMPLES}

notes.pdf: notes-body.tex
slides.pdf: slides-body.tex

${PDFS}: ${SRC} ${EXAMPLES}


.PHONY: clean
clean:
	${RM} notes.pdf slides.pdf
	${RM} contents.tex
	${RM} ${EXAMPLES}


INCLUDE_MAKEFILES=../makefiles
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/noweb.mk
