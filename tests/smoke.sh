#!/bin/sh
set -eu

LEQUTIS_DIR="${LEQUTIS_DIR:-}"
if [ -z "$LEQUTIS_DIR" ]; then
    if [ -d "$HOME/LeQutisOS" ]; then
        LEQUTIS_DIR="$HOME/LeQutisOS"
    else
        LEQUTIS_DIR="$(cd "$(dirname "$0")/.." && pwd)"
    fi
fi
cd "$LEQUTIS_DIR"

PYTHON="${PYTHON:-$(command -v python3 || command -v python || echo python)}"

"$PYTHON" core/lequtis.py init >/dev/null

"$PYTHON" core/lequtis.py remember \
"Initial LeQutis memory: A71 is the current build and runtime host." >/dev/null

"$PYTHON" core/lequtis.py goal \
"Build the first autonomous notice-think-act-learn loop." >/dev/null

"$PYTHON" core/lequtis.py heartbeat

echo
echo "=== LEQUTIS SMOKE TEST: PASS ==="
