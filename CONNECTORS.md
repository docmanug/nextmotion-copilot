# Connecteur requis

Le plugin **Nextmotion Copilot** a besoin d'**un seul connecteur** pour fonctionner : le MCP **Nextmotion** (accès au compte de la clinique).

## Activer le connecteur Nextmotion (Claude Desktop)

1. Ouvre **Claude Desktop** → **Réglages** (⚙️) → **Connecteurs**.
2. Ajoute le connecteur **Nextmotion** (`https://mcp.nextmotion.net/mcp`).
3. **Authentifie-toi** : connecte-toi au compte Nextmotion de ta clinique (OAuth). Rien à copier-coller.
4. Vérifie que le connecteur apparaît comme **connecté** (actif).

> Sans ce connecteur, Claude ne peut ni lire ni configurer le compte : le copilote ne fonctionnera pas.

## Activer le connecteur Nextmotion (Claude Code)

```bash
claude mcp add --transport http nextmotion https://mcp.nextmotion.net/mcp
```

Puis `/mcp` → **nextmotion** → authentifie-toi au compte Nextmotion de ta clinique (OAuth).

## Prérequis

- **Claude Desktop** à jour (Mac ou Windows).
- **Exécution de code** activée : Réglages → **Capacités** → activer *code execution* (requis pour les compétences).
- Un **compte Nextmotion** (la clinique) avec l'option *API & automatisations* active sur l'abonnement.

## Ce que le plugin ne contient pas

Aucun secret, aucune clé API n'est stocké dans le plugin. L'authentification vit uniquement dans le connecteur Nextmotion (OAuth), côté Claude Desktop.
