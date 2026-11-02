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
mkdir -p logs
exec "$PYTHON" core/lequtis.py daemon 900 >> logs/daemon.log 2>&1
