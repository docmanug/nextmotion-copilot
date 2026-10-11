# Connecter Nextmotion

Le connecteur **Nextmotion** est fourni par le plugin : vous n'avez rien à ajouter à la main.

## Après l'installation

1. Ouvrez le plugin **Nextmotion Copilot**, onglet **Connecteurs**.
2. Cliquez sur **Nextmotion**, puis sur **Connecter**.
3. Connectez-vous avec votre compte Nextmotion habituel (le même que sur le logiciel).
4. Choisissez **Toujours autoriser**.

Claude agit avec vos droits : ce que votre rôle Nextmotion ne permet pas, Claude ne le fait pas non plus.

## Accès

Pendant votre premier mois, le connecteur est ouvert à toutes les cliniques. Ensuite, Claude reste disponible pour vous aider et former votre équipe ; les automatisations par l'API demandent l'option API & automatisations.

## Dernier recours : ajout manuel

Si le connecteur n'apparaît pas, ajoutez-le vous-même avec cette adresse : `https://mcp.nextmotion.net/mcp`.

- Claude Desktop / claude.ai : Personnaliser › Connecteurs › ajouter un connecteur personnalisé.
- Claude Code : `claude mcp add --transport http nextmotion https://mcp.nextmotion.net/mcp`, puis `/mcp` pour vous connecter.

## Déconnecter

Personnaliser › Connecteurs › Nextmotion › Déconnecter.

Le plugin ne contient aucune clé ni aucun mot de passe.
