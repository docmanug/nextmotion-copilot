# Journal des modifications

Toutes les évolutions notables de **Nextmotion Copilot** sont consignées ici.
Ce projet suit le [versionnage sémantique](https://semver.org).

## 1.3.2 — 2026-06-29

- Métadonnées de publication ajoutées au manifeste `.claude-plugin/plugin.json` :
  `repository`, `license`, `author` enrichi (email + url) et `$schema`.
- Entrée marketplace enrichie dans `.claude-plugin/marketplace.json` : `keywords`,
  `category`, `author`, `homepage`, `repository`, `license`.
- Ajout de ce `CHANGELOG.md`.
- Validé avec `claude plugin validate`.

## 1.3.1

- Serveur MCP Nextmotion fourni par le plugin via `.mcp.json` : côté Claude Code,
  il suffit d'approuver le connecteur et de s'authentifier (plus d'ajout manuel).
- Retrait des références superadmin non publiques.

## 1.2.15

- Première version publique : Nextmotion Copilot en 3 modes — configuration,
  aide à l'usage, onboarding/formation.
