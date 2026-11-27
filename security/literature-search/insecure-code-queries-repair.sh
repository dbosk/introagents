#!/bin/bash
# insecure-code: repair after the check by meaning (2026-11-27). Works that
# bear on sub-question (b) but were in no session (a secure-coding benchmark,
# web applications generated from prompts, repository-context studies) say
# "generate(s)", "generating ... applications" or "benchmark" rather than the
# phrases "generated code"/"code generation" of S3. The generated-code concept
# is therefore searched again in its verb and noun forms with the objects
# code, applications, programs and benchmarks (concept repair, not fitted to
# one study). Same providers as every other query.
cd /home/dbosk/devel/edu/introllm/security
P="-p dblp -p wos -p ieee -p openalex -p scopus -p s2 -p arxiv"
A='("large language model" OR "large language models" OR LLM OR LLMs OR "language model" OR "language models" OR "AI assistant" OR "AI assistants" OR "code assistant" OR "code assistants" OR "coding assistant" OR "coding assistants" OR "programming assistant" OR "programming assistants" OR "AI pair programmer" OR Copilot OR ChatGPT OR Codex OR "generative AI" OR "AI-generated" OR "AI-assisted" OR "coding agent" OR "coding agents" OR "vibe coding")'
V='(insecure OR vulnerability OR vulnerabilities OR vulnerable OR CWE OR "security weakness" OR "security weaknesses" OR "security flaws" OR "security issues" OR "code security" OR "secure code")'
G='(generate OR generates OR generated OR generating OR generation OR write OR writes OR writing OR written)'
O='(code OR application OR applications OR program OR programs OR benchmark OR benchmarks)'
CTR='("no difference" OR "no significant" OR "not significantly" OR "no evidence" OR "more secure" OR "as secure" OR "fewer vulnerabilities" OR safer OR improve OR improved OR improves OR improvement OR replication OR replicate OR replicated OR comparable OR "human-written" OR "human developers" OR newer OR longitudinal)'
# S9 (S): repaired generated-code concept
scholar search "$A AND $V AND $G AND $O" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
# C9 (C): S9 with the counter terms
scholar search "$A AND $V AND $G AND $O AND $CTR" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
