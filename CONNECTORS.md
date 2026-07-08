# Connecteur requis

Le plugin **Nextmotion Copilot** a besoin d'**un seul connecteur** pour fonctionner : le MCP **Nextmotion** (accès au compte de la clinique).

## Activer le connecteur Nextmotion (Claude Desktop)

1. Ouvre **Claude Desktop** → **Réglages** (⚙️) → **Connecteurs**.
2. Ajoute le connecteur **Nextmotion** (`https://mcp.nextmotion.net/mcp`).
3. **Authentifie-toi** : connecte-toi au compte Nextmotion de ta clinique (OAuth). Rien à copier-coller.
4. Vérifie que le connecteur apparaît comme **connecté** (actif).

> Sans ce connecteur, Claude ne peut ni lire ni configurer le compte : le copilote ne fonctionnera pas.

## Activer le connecteur Nextmotion (Claude Code)

Le serveur MCP **nextmotion** est **fourni par le plugin** (`.mcp.json`) : rien à ajouter à la main. Après l'install du plugin :

1. Ouvre `/mcp` → **approuve** le serveur **nextmotion** (`https://mcp.nextmotion.net/mcp`).
2. **Authentifie-toi** au compte Nextmotion de ta clinique (OAuth). Rien à copier-coller.

> Install manuelle (hors plugin), si jamais nécessaire :
> ```bash
> claude mcp add --transport http nextmotion https://mcp.nextmotion.net/mcp
> ```

## Prérequis

- **Claude Desktop** à jour (Mac ou Windows).
- **Exécution de code** activée : Réglages → **Capacités** → activer *code execution* (requis pour les compétences).
- Un **compte Nextmotion** (la clinique) avec l'option *API & automatisations* active sur l'abonnement.

## Ce que le plugin ne contient pas

Aucun secret, aucune clé API n'est stocké dans le plugin. L'authentification vit uniquement dans le connecteur Nextmotion (OAuth), côté Claude Desktop.
