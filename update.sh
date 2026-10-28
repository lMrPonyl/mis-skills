#!/usr/bin/env bash
# Trae la última versión de las skills desde sus repos originales y las copia a skills/.
# Después revisa con `git diff`, haz commit y push.
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

fetch() { GIT_LFS_SKIP_SMUDGE=1 git clone -q --depth 1 "https://github.com/$1" "$TMP/$2"; }
sync() { rm -rf "$REPO/skills/$2"; cp -R "$1" "$REPO/skills/$2"; echo "✓ $2"; }

fetch pbakaus/impeccable impeccable
sync "$TMP/impeccable/.claude/skills/impeccable" impeccable

fetch Leonxlnx/taste-skill taste
sync "$TMP/taste/skills/taste-skill" taste-skill

fetch heygen-com/hyperframes hyperframes
for d in "$TMP"/hyperframes/skills/*/; do sync "${d%/}" "$(basename "$d")"; done
for d in motion-doctrine seam-craft cut-the-curve captions-overlay changelog-video oversized-cursor; do
  sync "$TMP/hyperframes/.claude/skills/$d" "$d"
done

fetch latent-spaces/brag brag
sync "$TMP/brag/skills/brag-slim" brag-slim

fetch JuliusBrussee/caveman caveman
for d in caveman ultracave megacave; do sync "$TMP/caveman/skills/$d" "$d"; done

echo "Actualizado. Revisa con: git -C \"$REPO\" status"
