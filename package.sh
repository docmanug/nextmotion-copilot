#!/usr/bin/env bash
# package.sh — zippe le plugin en dist/nextmotion-copilot-<version>.zip
# (plugin.json à la racine du zip : .claude-plugin/plugin.json).
# Le zip est joint à la Release GitHub (plan B d'installation).
# Usage : ./package.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

"$ROOT/scripts/sync-shared.sh"

VERSION="$(python3 -c 'import json;print(json.load(open(".claude-plugin/plugin.json"))["version"])')"
[ -n "$VERSION" ] || { echo "Version introuvable dans plugin.json" >&2; exit 1; }
OUT="$ROOT/dist/nextmotion-copilot-$VERSION.zip"

# Composants du plugin (docs/, evals/, scripts/, .github/ restent dans le dépôt)
INCLUDE=(.claude-plugin .mcp.json skills README.md CONNECTORS.md CHANGELOG.md LICENSE)
for p in "${INCLUDE[@]}"; do
  [ -e "$p" ] || { echo "Manquant : $p" >&2; exit 1; }
done

mkdir -p dist
rm -f "$OUT"
zip -r "$OUT" "${INCLUDE[@]}" -x "*.DS_Store" -x "*__MACOSX*" -x "*.git*" > /dev/null

# Vérifications : plugin.json à la racine, au moins un SKILL.md
LIST="$(unzip -Z1 "$OUT")"
echo "$LIST" | grep -qx '.claude-plugin/plugin.json' || { echo "plugin.json absent de la racine du zip" >&2; exit 1; }
echo "$LIST" | grep -q '^skills/[^/]*/SKILL\.md$' || { echo "Aucun SKILL.md dans le zip" >&2; exit 1; }

echo "Zip créé : $OUT ($(du -h "$OUT" | cut -f1)), version $VERSION"
