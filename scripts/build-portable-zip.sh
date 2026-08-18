#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
version=$(sed -n '1p' "$repo_root/VERSION")
output_dir="$repo_root/dist"
stage_dir=$(mktemp -d)
trap 'rm -rf "$stage_dir"' EXIT HUP INT TERM

package_dir="$stage_dir/codex-portable-starter-$version"
mkdir -p "$package_dir/skills/suggest-project-versioning"

cp "$repo_root/portable/README.md" "$package_dir/README.md"
cp "$repo_root/portable/AGENTS.template.md" "$package_dir/AGENTS.template.md"
cp "$repo_root/portable/CODEX_SETUP_CHECKLIST.md" "$package_dir/CODEX_SETUP_CHECKLIST.md"
cp "$repo_root/portable/CODEX_TOOLKIT_BEST_PRACTICES.md" "$package_dir/CODEX_TOOLKIT_BEST_PRACTICES.md"
cp -R "$repo_root/skills/suggest-project-versioning/." "$package_dir/skills/suggest-project-versioning/"

commit=$(git -C "$repo_root" rev-parse --verify HEAD 2>/dev/null || printf '%s' 'uncommitted')
{
  printf 'toolkit_version=%s\n' "$version"
  printf 'source_commit=%s\n' "$commit"
  printf 'built_utc=%s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  printf 'contains_private_state=no\n'
} > "$package_dir/MANIFEST.txt"

mkdir -p "$output_dir"
archive="$output_dir/codex-portable-starter-$version.zip"
rm -f "$archive"
(cd "$stage_dir" && /usr/bin/zip -qr "$archive" "codex-portable-starter-$version")
printf '%s\n' "$archive"
