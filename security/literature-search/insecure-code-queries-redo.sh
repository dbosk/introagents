#!/bin/bash
# insecure-code: redo of failed cells (same query strings, only the failed
# providers) and the repair queries S9/C9 after the check by meaning.
# Run only when no other scholar command writes the session.
cd /home/dbosk/devel/edu/introllm/security
J=~/.local/share/scholar/review_sessions/insecure-code.json
q() { python3 -I -c "
import json,hashlib,sys
d=json.load(open('$J'))
for r in d['search_records']:
    if hashlib.sha1(r['query'].encode()).hexdigest()[:6]==sys.argv[1]: print(r['query']); break
" "$1"; }
run() { # $1 = hash, rest = providers
  local h=$1; shift; local P=""; for p in "$@"; do P="$P -p $p"; done
  local Q; Q="$(q $h)"; [ -z "$Q" ] && { echo "no query $h"; return; }
  echo "== redo $h on $*"; scholar search "$Q" -n insecure-code -l 0 $P --in title-abstract -f bibtex >/dev/null
}
# Semantic Scholar: S1 S2 S3 S6 S7 C4 C6
for h in 3a2892 57e95d 71d507 43b2ce 51c091 5037b2 ee8693; do run $h s2; done
# arXiv: S2 S3 S5 C1 C3 C4 C5 C6 C8
for h in 57e95d 71d507 803f23 797b31 167450 5037b2 12a34b ee8693 68f398; do run $h arxiv; done
# OpenAlex: C4
run 5037b2 openalex
