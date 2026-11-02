#!/bin/sh
set -eu

LEQUTIS_DIR="${LEQUTIS_DIR:-}"
if [ -z "$LEQUTIS_DIR" ]; then
    if [ -d "$HOME/LeQutisOS" ]; then
        LEQUTIS_DIR="$HOME/LeQutisOS"
    else
        LEQUTIS_DIR="$(cd "$(dirname "$0")" && pwd)"
    fi
fi
cd "$LEQUTIS_DIR"

PYTHON="${PYTHON:-$(command -v python3 || command -v python || echo python)}"

echo "=== LEQUTIS DOCTOR ==="

"$PYTHON" -m py_compile core/lequtis.py
"$PYTHON" core/lequtis.py init

echo
echo "Database:"
ls -lh state/lequtis.db

echo
echo "Integrity smoke test:"
"$PYTHON" core/lequtis.py heartbeat >/dev/null

echo "PASS: LeQutis kernel executable."
