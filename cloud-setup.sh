#!/usr/bin/env bash
# Script de configuración para entornos en la nube de Claude Code (claude.ai/code).
# Copia su contenido en: menú del entorno → Edit → Setup script.
# Instala mis skills en ~/.claude/skills en cada sesión nueva, sin importar el proyecto.

# 1) Si el repo ya viene adjunto a la sesión, úsalo.
for d in /home/user/mis-skills "$HOME/mis-skills"; do
  if [ -x "$d/install.sh" ]; then "$d/install.sh" --copy; exit 0; fi
done

# 2) Si no, clónalo (solo funciona si el repo es público).
if git clone -q --depth 1 https://github.com/lMrPonyl/mis-skills /tmp/mis-skills 2>/dev/null; then
  /tmp/mis-skills/install.sh --copy
else
  echo "mis-skills: no se pudo clonar (¿repo privado?). Se continúa sin las skills."
fi
exit 0
