#!/usr/bin/env bash
# package.sh — Zippe le PLUGIN nextmotion-copilot en dist/nextmotion-copilot.zip
# Le zip a .claude-plugin/plugin.json À LA RACINE (requis par l'uploader
# "Plugins personnels → Téléverser un plugin local" de Claude Desktop).
# Usage : ./package.sh

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST="$ROOT/dist"
OUT="$DIST/nextmotion-copilot.zip"

# Composants du plugin (docs/, .git, dist/, .superpowers exclus)
INCLUDE=(.claude-plugin skills README.md CONNECTORS.md LICENSE)

for p in "${INCLUDE[@]}"; do
  [ -e "$ROOT/$p" ] || { echo "❌ Manquant : $p" >&2; exit 1; }
done

mkdir -p "$DIST"
rm -f "$OUT"

echo "📦 Packaging plugin nextmotion-copilot..."
( cd "$ROOT" && zip -r "$OUT" "${INCLUDE[@]}" \
    -x "*.DS_Store" -x "*__MACOSX*" -x "*.git*" > /dev/null )

SIZE=$(du -sh "$OUT" | cut -f1)
echo "✅ Zip créé : $OUT  ($SIZE)"
echo "   Vérif racine du zip :"
unzip -l "$OUT" | awk '{print $4}' | grep -E '^(\.claude-plugin/plugin\.json|skills/nextmotion-copilot/SKILL\.md)$' || true
