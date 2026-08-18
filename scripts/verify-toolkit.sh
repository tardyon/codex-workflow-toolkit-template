#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
manifest="$repo_root/toolkit-manifest.json"
validator="${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py"

test -s "$manifest"
test -s "$repo_root/CODEX_TOOLKIT_CATALOG.md"
test -s "$repo_root/portable/AGENTS.template.md"
test -s "$repo_root/portable/CODEX_SETUP_CHECKLIST.md"

for script in "$repo_root"/scripts/*.sh; do
  sh -n "$script"
done

python3 - "$manifest" "$repo_root" <<'PY'
import json
import pathlib
import re
import sys

manifest_path = pathlib.Path(sys.argv[1])
root = pathlib.Path(sys.argv[2]).resolve()
data = json.loads(manifest_path.read_text())
assert data["schema_version"] == 1
assert re.fullmatch(r"\d+\.\d+\.\d+", data["toolkit_version"])
names = set()
for item in data["skills"]:
    name = item["name"]
    assert re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name), name
    assert name not in names, name
    names.add(name)
    path = (root / item["path"]).resolve()
    assert root in path.parents, path
    skill = path / "SKILL.md"
    assert skill.is_file(), skill
    text = skill.read_text()
    assert text.startswith("---\n"), skill
    match = re.search(r"^name:\s*(.+)$", text, re.MULTILINE)
    assert match and match.group(1).strip() == name, skill
policy = (root / data["policy"]["source"]).resolve()
assert root in policy.parents and policy.is_file(), policy
print(f"Manifest valid: {len(names)} skills")
PY

python3 - "$manifest" <<'PY' | while IFS= read -r path; do
import json, sys
print("\n".join(x["path"] for x in json.load(open(sys.argv[1]))["skills"]))
PY
  if [ -x "$validator" ] && python3 -c 'import yaml' >/dev/null 2>&1; then
    python3 "$validator" "$repo_root/$path"
  else
    python3 - "$repo_root/$path/SKILL.md" <<'PY'
import pathlib, re, sys
text = pathlib.Path(sys.argv[1]).read_text()
parts = text.split("---", 2)
assert len(parts) == 3 and not parts[0].strip()
front = parts[1]
name = re.search(r"^name:\s*(.+)$", front, re.M)
description = re.search(r"^description:\s*(.+)$", front, re.M)
assert name and description
assert re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", name.group(1).strip())
assert len(description.group(1).strip()) <= 1024
print("Skill is valid! (portable fallback)")
PY
  fi
done

if find "$repo_root" -type f \( -name '*.pyc' -o -name 'id_ed25519*' -o -name '*.key' -o -name '*.pem' -o -name '.env' \) -print -quit | grep -q .; then
  echo "Prohibited filename found in toolkit" >&2
  exit 1
fi

if find "$repo_root" -type d \( -name '__pycache__' -o -name '.venv' -o -name 'node_modules' \) -print -quit | grep -q .; then
  echo "Prohibited runtime directory found in toolkit" >&2
  exit 1
fi

if find "$repo_root" -type f -size +20M -print -quit | grep -q .; then
  echo "Unexpected file larger than 20 MB found in toolkit" >&2
  exit 1
fi

if grep -RIl --exclude-dir=.git -E -- '-----BEGIN (OPENSSH|RSA|EC|DSA) PRIVATE KEY-----|https?://[^/@[:space:]]+:[^/@[:space:]]+@' "$repo_root" | grep -q .; then
  echo "Credential-like content found in toolkit" >&2
  exit 1
fi

if grep -RIl --exclude-dir=.git --exclude='verify-toolkit.sh' -E -- '/Users/[^/<[:space:]]+|/Volumes/[^/<[:space:]]+|192\.168\.[0-9]{1,3}\.[0-9]{1,3}' "$repo_root" | grep -q .; then
  echo "Machine-specific absolute path or private IPv4 address found in toolkit" >&2
  exit 1
fi

python3 - "$repo_root" <<'PY'
import pathlib, sys
root = pathlib.Path(sys.argv[1]).resolve()
for path in root.rglob("*"):
    if path.is_symlink():
        target = path.resolve()
        if root != target and root not in target.parents:
            raise SystemExit(f"External symlink not allowed: {path} -> {target}")
print("Symlink containment passed")
PY

if [ -d "$repo_root/.git" ]; then
  git -C "$repo_root" fsck --no-dangling >/dev/null
  git -C "$repo_root" diff --check
fi

echo "Toolkit verification passed"
