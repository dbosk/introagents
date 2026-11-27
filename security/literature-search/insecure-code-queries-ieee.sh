#!/bin/bash
# insecure-code: IEEE Xplore cells that failed on the daily quota on
# 2026-11-27 (S7 S8 S9 C4 C5 C6 C7 C8 C9). Run after 01:00 CET, when the
# quota resets, through the KTH tunnel, with no other scholar command
# writing the session. Afterwards: scholar sessions export insecure-code
# -f screen-sheet --pending --top 100 ... to see whether tier 1 grew, and
# classify only those new tier-1 records.
cd /home/dbosk/devel/edu/introllm/security
export SCHOLAR_PROXY=${SCHOLAR_PROXY:-socks5h://127.0.0.1:1081}
J=~/.local/share/scholar/review_sessions/insecure-code.json
for h in 51c091 be773d 0b2064 5037b2 12a34b ee8693 9f48fe 68f398 54ce9a; do
  Q="$(python3 -I -c "
import json,hashlib,sys
d=json.load(open('$J'))
for r in d['search_records']:
    if hashlib.sha1(r['query'].encode()).hexdigest()[:6]==sys.argv[1]: print(r['query']); break
" $h)"
  echo "== ieee $h"; scholar search "$Q" -n insecure-code -l 0 -p ieee --in title-abstract -f bibtex >/dev/null
done
