#!/usr/bin/env bash
# sync-shared.sh — source unique, copies commitées.
#   shared/*.md  -> skills/<skill>/shared/   (pour chaque skill)
#   templates/   -> skills/configurer-compte/templates/
# Usage : scripts/sync-shared.sh          copie
#         scripts/sync-shared.sh --check  vérifie que les copies sont à jour (sortie 1 sinon)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHECK=0
[ "${1:-}" = "--check" ] && CHECK=1

[ -d "$ROOT/shared" ] || { echo "Dossier shared/ introuvable" >&2; exit 2; }
shopt -s nullglob
SKILLS=("$ROOT"/skills/*/)
[ ${#SKILLS[@]} -gt 0 ] || { echo "Aucun skill dans skills/" >&2; exit 2; }

STATUS=0
fail() { echo "Pas à jour : $1" >&2; STATUS=1; }

for skill in "${SKILLS[@]}"; do
  skill="${skill%/}"
  dest="$skill/shared"
  if [ "$CHECK" = 1 ]; then
    [ -d "$dest" ] || { fail "${dest#$ROOT/} (absent)"; continue; }
    for f in "$ROOT"/shared/*.md; do
      cmp -s "$f" "$dest/$(basename "$f")" || fail "${dest#$ROOT/}/$(basename "$f")"
    done
    for f in "$dest"/*.md; do
      [ -e "$ROOT/shared/$(basename "$f")" ] || fail "${f#$ROOT/} (n'existe plus dans shared/)"
    done
  else
    mkdir -p "$dest"
    rm -f "$dest"/*.md
    cp "$ROOT"/shared/*.md "$dest/"
  fi
done

if [ -d "$ROOT/templates" ]; then
  tdest="$ROOT/skills/configurer-compte/templates"
  if [ "$CHECK" = 1 ]; then
    if [ -d "$tdest" ]; then
      diff -r -q -x .DS_Store "$ROOT/templates" "$tdest" >/dev/null 2>&1 || fail "skills/configurer-compte/templates"
    else
      fail "skills/configurer-compte/templates (absent)"
    fi
  else
    mkdir -p "$tdest"
    rsync -a --delete --exclude .DS_Store "$ROOT/templates/" "$tdest/"
  fi
fi

if [ "$CHECK" = 1 ]; then
  [ "$STATUS" = 0 ] && echo "Copies de shared/ et templates/ à jour." || echo "Lancez scripts/sync-shared.sh puis commitez." >&2
else
  echo "Synchronisation terminée."
fi
exit $STATUS
