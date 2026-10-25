# mis-skills

Mis skills de Claude Code para videos, webs y sistemas, iguales en todos mis equipos.

## Instalar en un equipo nuevo

**macOS / Linux / WSL**

```bash
git clone https://github.com/lMrPonyl/mis-skills ~/mis-skills
cd ~/mis-skills && ./install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/lMrPonyl/mis-skills $HOME\mis-skills
cd $HOME\mis-skills; .\install.ps1 -Link
```

Reinicia Claude Code y las skills aparecen.

## Mantener los equipos sincronizados

| Quiero… | Comando |
|---|---|
| Recibir cambios en otro equipo | `git pull` (con enlaces no hace falta reinstalar; con `--copy` vuelve a correr el instalador) |
| Traer la última versión de los autores originales | `./update.sh` → `git commit -am "Actualizar skills"` → `git push` |
| Añadir una skill mía | crea `skills/<nombre>/SKILL.md`, commit y push |

## Sesiones en la nube (claude.ai/code)

Cuando este repo está en la sesión, Claude carga las skills solo, desde `.claude/skills` (es un enlace a `skills/`).
Para tenerlas en **cualquier** proyecto en la nube, añade al script de configuración del entorno:

```bash
git clone --depth 1 https://github.com/lMrPonyl/mis-skills ~/mis-skills && ~/mis-skills/install.sh
```

## Qué incluye

| Skill | Para qué | Origen |
|---|---|---|
| `impeccable` | Diseñar, criticar y pulir interfaces | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) · Apache-2.0 |
| `taste-skill` | Dirección de arte anti "hecho por IA" para webs | [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) · MIT |
| `hyperframes`, `hyperframes-cli`, `hyperframes-registry` | Videos con HTML: crear, renderizar, ~450 bloques | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) · Apache-2.0 |
| `remotion-to-hyperframes`, `slideshow`, `figma`, `media-use` | Migrar desde Remotion, presentaciones, Figma, música/voz/imágenes | ídem |
| `motion-doctrine`, `cut-the-curve`, `seam-craft`, `oversized-cursor`, `captions-overlay`, `changelog-video` | Lenguaje de movimiento y transiciones, subtítulos, video de changelog | ídem |

Las licencias originales están en [`licenses/`](licenses/).

**Vienen de mi cuenta de claude.ai (no hace falta copiarlas aquí):** Remotion, video-shotcraft, Superdesign,
Design Council, Codesign, Website Design, system-design-skills y las skills de Emil Kowalski (audit-suite).
