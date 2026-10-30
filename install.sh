#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "$0")" && pwd)"
target="$HOME/.claude"
mkdir -p "$target/skills"

link() {
  local src="$1" dest="$2"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mv "$dest" "$dest.bak.$(date +%Y%m%d%H%M%S)"
    echo "backed up existing $dest"
  fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

link "$repo/CLAUDE.md" "$target/CLAUDE.md"
for skill in "$repo"/skills/*/; do
  name="$(basename "$skill")"
  link "${skill%/}" "$target/skills/$name"
done
