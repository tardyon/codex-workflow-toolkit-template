#!/bin/sh
set -eu

codex_home=${CODEX_HOME:-"$HOME/.codex"}
state_file="$codex_home/toolkit-state.json"
context_state=${TOOLKIT_CONTEXT_STATE:-not-verified}

case "$context_state" in
  loaded|refreshed|started-before-update|not-verified) ;;
  *) echo "Invalid TOOLKIT_CONTEXT_STATE: $context_state" >&2; exit 2 ;;
esac

if [ ! -f "$state_file" ]; then
  echo "Toolkit context — installed state unavailable; policy match not verified; current task: $context_state"
  exit 1
fi

python3 - "$state_file" "$codex_home/AGENTS.md" "$context_state" <<'PY'
import hashlib
import json
import pathlib
import sys

state_path = pathlib.Path(sys.argv[1])
policy_path = pathlib.Path(sys.argv[2])
context_state = sys.argv[3].replace("-", " ")
state = json.loads(state_path.read_text())
version = state.get("toolkit_version", "unknown")
commit = state.get("source_commit", "unknown")
expected = state.get("policy_sha256", "")
if expected and policy_path.is_file():
    actual = hashlib.sha256(policy_path.read_bytes()).hexdigest()
    policy = "policy matches" if actual == expected else "POLICY DIFFERS"
else:
    policy = "policy match not verified"
print(f"Toolkit context — installed v{version} ({commit[:8]}); {policy}; current task: {context_state}")
PY
