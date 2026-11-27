#!/bin/bash
# insecure-code: package-hallucination strand (Q14-Q16), added 2026-11-27 after restart.
# Same providers as Q1-Q13; run without the KTH tunnel if port 1081 is closed.
P="-p dblp -p wos -p ieee -p openalex -p scopus -p s2 -p arxiv"
PH='("package hallucination" OR "package hallucinations" OR "hallucinated package" OR "hallucinated packages" OR "hallucinated dependency" OR "hallucinated dependencies" OR "hallucinated library" OR "hallucinated libraries" OR "non-existent package" OR "non-existent packages" OR "nonexistent package" OR "nonexistent packages" OR "fictitious package" OR "fictitious packages" OR "phantom package" OR "phantom packages" OR "phantom dependencies" OR slopsquatting)'
LLM='("large language model" OR "large language models" OR LLM OR LLMs OR "language model" OR "language models" OR "code assistant" OR "coding assistant" OR "coding assistants" OR Copilot OR ChatGPT OR "generative AI" OR "AI-generated" OR "coding agent" OR "coding agents")'
HAL='(hallucination OR hallucinations OR hallucinated OR hallucinate OR hallucinates)'
PKG='(package OR packages OR dependency OR dependencies OR library OR libraries)'
ECO='(npm OR PyPI OR "supply chain" OR "supply-chain" OR squatting OR typosquatting OR registry OR registries)'
CTR='(rare OR rarely OR "low rate" OR decline OR declined OR decreasing OR decreased OR mitigate OR mitigation OR mitigating OR "no evidence" OR newer OR improved OR reduce OR reduced OR reduces OR exploited OR exploitation OR "in the wild" OR registered OR registration)'
# Q14 (S): package hallucination, named concept
scholar search "$PH" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
# Q15 (S): described concept
scholar search "$LLM AND $HAL AND $PKG AND $ECO" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
# Q16 (C): rates low / falling / mitigated / (not) exploited
scholar search "$LLM AND ($HAL OR $PH) AND $PKG AND $CTR" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
