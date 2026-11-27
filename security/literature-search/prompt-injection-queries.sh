#!/bin/bash
# Queries of the literature search for the claim "Can prompt injection
# against LLM-integrated applications and agents be reliably prevented?"
# Session: prompt-injection.  Run through the KTH tunnel.
# Every query goes to the same six providers, unlimited (-l 0), years
# 2022-2026, title and abstract (--in title-abstract: OpenAlex and Scopus;
# WoS TS= already; s2, ieee, dblp ignore it).
# Usage: prompt-injection-queries.sh OUTDIR [LABEL ...]
# PROVS='-p s2' reruns failed cells on one provider (same query, same session).

# Concept blocks (each concept in several wordings)
PI='("prompt injection" OR "prompt injections" OR "indirect injection" OR "injected instruction" OR "injected instructions" OR "injected prompt" OR "injected prompts" OR "instruction injection" OR "goal hijacking" OR "prompt hijacking" OR "task hijacking")'
LLM='(LLM OR LLMs OR "language model" OR "language models" OR agent OR agents OR agentic OR chatbot OR chatbots OR "retrieval-augmented" OR RAG)'
AGENT='(agent OR agents OR agentic)'
APP='(indirect OR "LLM-integrated" OR integrated OR application OR applications OR "real-world" OR deployed OR deployment OR plugin OR plugins OR web OR email OR retrieval OR "third-party" OR tool OR tools)'
DEF='(defense OR defenses OR defence OR defences OR defend OR defending OR mitigation OR mitigate OR mitigating OR detection OR detect OR detector OR detectors OR filter OR filtering OR guardrail OR guardrails OR delimiter OR delimiters OR spotlighting OR "instruction hierarchy" OR "fine-tuning" OR "fine-tuned" OR prevent OR prevention OR protect OR protection)'
ADA='(adaptive OR bypass OR bypassing OR bypassed OR evade OR evading OR evasion OR evasive OR circumvent OR circumventing OR break OR breaking OR breaks OR optimization OR optimisation OR optimized OR "red teaming" OR "red-teaming")'
GUA='(provable OR provably OR guarantee OR guarantees OR guaranteed OR "by design" OR certified OR formal OR "information flow" OR "control flow" OR "data flow" OR isolation OR isolate OR "privilege separation" OR "least privilege" OR capability OR "policy enforcement" OR sandbox OR sandboxing OR "design pattern" OR "design patterns" OR "dual LLM" OR deterministic OR architecture OR architectural)'
UTIL='(utility OR "task performance" OR overhead OR cost OR "trade-off" OR tradeoff OR usability OR benign)'
BENCH='(benchmark OR benchmarks OR benchmarking OR evaluation OR evaluate OR evaluating OR measure OR measuring OR "attack success" OR "success rate")'
EXT='("system prompt" OR "system prompts" OR "prompt extraction" OR "prompt leaking" OR "prompt leakage" OR "prompt leak" OR "prompt stealing" OR "prompt theft" OR "hidden prompt" OR "hidden prompts")'
EXTV='(extract OR extracting OR extraction OR leak OR leaking OR leakage OR leaked OR steal OR stealing OR theft OR reveal OR revealing OR recover OR recovering OR exfiltrate OR exfiltration)'
SEP='("instructions and data" OR "instruction and data" OR "data and instructions" OR "instruction-data" OR "separate instructions" OR "separating instructions" OR "separation of instructions" OR "structured queries" OR "structured query" OR "single channel" OR "same channel")'
# Counter-term blocks
CTRA='(overstated OR overestimated OR exaggerated OR ineffective OR unrealistic OR "limited impact" OR "low success" OR "not effective" OR "not vulnerable" OR rarely OR "no evidence" OR "in the wild" OR hype)'
ROB='(robust OR robustness OR resilient OR resilience OR resistant OR resistance OR immune OR immunity OR "near-zero" OR "near zero" OR effective OR effectively OR secure OR "state-of-the-art")'
SOLVED='(solve OR solved OR solves OR solving OR eliminate OR eliminates OR eliminating OR prevents OR completely OR complete OR fully OR provable OR provably OR guarantee OR guarantees OR "by design")'
NOCOST='("no loss" OR "without loss" OR "minimal loss" OR negligible OR little OR preserve OR preserves OR preserving OR "utility-preserving" OR maintain OR maintains OR "without sacrificing" OR "without compromising")'
PROT='(defense OR defence OR defend OR protect OR protection OR safeguard OR safeguarding OR prevent OR prevention OR mitigate OR mitigation OR obfuscation OR obfuscate OR secure OR securing OR robust)'
# Repair blocks (added after the check by meaning, 2026-11-27): the claim's
# own wording "untrusted data" and the attack named without "injection".
UNTR='("untrusted data" OR "untrusted input" OR "untrusted inputs" OR "untrusted content" OR "untrusted sources" OR "untrusted tool")'
DESN='(isolation OR isolate OR "least privilege" OR "privilege separation" OR "information flow" OR "control flow" OR integrity OR guardrail OR guardrails OR defense OR defence OR mitigation OR mitigate OR prevent OR prevention)'
TOOLAG='(agent OR agents OR agentic OR "LLM-integrated" OR "tool use" OR "tool-using" OR "tool-integrated")'
ADVP='("adversarial prompt" OR "adversarial prompts" OR "malicious instruction" OR "malicious instructions" OR "malicious prompt" OR "malicious prompts" OR "hidden instruction" OR "hidden instructions")'
MISUSE='(exfiltration OR exfiltrate OR "tool misuse" OR "improper tool use" OR hijack OR hijacking OR manipulate OR manipulation)'
# Repair block R3 (added 2026-11-27 13:55 by the restarted agent): the check by
# meaning returned an SoK on "prompt security" (2510.15476) that no query held;
# the attack class named as "prompt attacks"/"prompt security".
PSEC='("prompt attack" OR "prompt attacks" OR "prompt security" OR "prompt-based attack" OR "prompt-based attacks" OR "adversarial prompting")'
SEPC='(separate OR separates OR separation OR distinguish OR distinguishes OR distinguishing OR robust OR "by design" OR enforce OR enforces OR enforcing)'

declare -A Q
Q[S1]="$PI AND $LLM"
Q[S2]="$PI AND $APP"
Q[S3]="$PI AND $DEF"
Q[S4]="$PI AND $DEF AND $ADA"
Q[S5]="$PI AND $GUA"
Q[S6]="$PI AND $GUA AND $UTIL"
Q[S7]="$PI AND $BENCH AND $AGENT"
Q[S8]="$EXT AND $EXTV AND $LLM"
Q[S9]="$LLM AND $SEP"
Q[C1]="$PI AND $APP AND $CTRA"
Q[C2]="$PI AND $DEF AND $ADA AND $ROB"
Q[C3]="$PI AND $GUA AND $SOLVED"
Q[C4]="$PI AND $GUA AND $UTIL AND $NOCOST"
Q[C5]="$EXT AND $EXTV AND $LLM AND $PROT"
Q[C6]="$LLM AND $SEP AND $SEPC"
Q[C7]="$PI AND $BENCH AND $AGENT AND $ROB"
Q[R1]="$LLM AND $UNTR AND $DESN"
Q[R2]="$TOOLAG AND $ADVP AND $MISUSE"
Q[CR1]="$LLM AND $UNTR AND $DESN AND $SOLVED"
Q[CR2]="$TOOLAG AND $ADVP AND $MISUSE AND $ROB"
Q[R3]="$PSEC AND $LLM AND $DEF"
Q[CR3]="$PSEC AND $LLM AND $DEF AND $ROB"

out=$1; shift
labels=("$@")
[ ${#labels[@]} -eq 0 ] && labels=(S1 S2 S3 S4 S5 S6 S7 S8 S9 C1 C2 C3 C4 C5 C6 C7 R1 R2 CR1 CR2 R3 CR3)
if [ "$out" = "--print" ]; then
  for l in "${labels[@]}"; do printf '%s\t%s\n' "$l" "${Q[$l]}"; done
  exit 0
fi
mkdir -p "$out"
for l in "${labels[@]}"; do
  echo "=== $l $(date -Is)"
  scholar search "${Q[$l]}" -n prompt-injection -l 0 -y 2022-2026 \
    --in title-abstract \
    ${PROVS:--p dblp -p wos -p ieee -p openalex -p scopus -p s2} \
    -f bibtex+prov > "$out/$l${PROVS:+-rerun}.bib" 2> "$out/$l${PROVS:+-rerun}.err"
  echo "exit $? $(date -Is)"
  tail -3 "$out/$l.err"
done
