#!/usr/bin/env bash
# Instala las skills de este repo en ~/.claude/skills (macOS / Linux / WSL / Git Bash).
#   ./install.sh          enlaza (symlink): un `git pull` actualiza todo
#   ./install.sh --copy   copia los archivos (si no puedes usar symlinks)
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
MODE="link"
[ "${1:-}" = "--copy" ] && MODE="copy"

mkdir -p "$DEST"
for src in "$REPO"/skills/*/; do
  name="$(basename "$src")"
  target="$DEST/$name"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "· $name ya existe como carpeta normal, lo respaldo en $target.bak"
    rm -rf "$target.bak" && mv "$target" "$target.bak"
  fi
  rm -f "$target"
  if [ "$MODE" = "link" ]; then
    ln -s "${src%/}" "$target"
  else
    cp -R "${src%/}" "$target"
  fi
  echo "✓ $name"
done
echo "Listo: $(ls -1 "$REPO/skills" | wc -l | tr -d ' ') skills en $DEST ($MODE). Reinicia Claude Code."
