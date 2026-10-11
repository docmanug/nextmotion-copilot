# Installer Nextmotion Copilot, pas à pas

Une seule procédure, la même que dans Nextmotion (Paramètres › Centre d'intégration › Plugin Claude).

## Avant de commencer

- Un compte Claude payant (Pro, Max, Team ou Enterprise).
- Un compte Nextmotion.
- Claude Desktop à jour (Mac ou Windows), ou claude.ai dans votre navigateur.

## Claude Desktop et claude.ai

1. Copiez le lien du plugin : `https://github.com/docmanug/nextmotion-copilot`
2. Ouvrez Claude.
3. Ouvrez **Personnaliser**, puis **Plugins**.
4. Cliquez sur **Parcourir**, puis sur le **+**.
5. Choisissez **Ajouter une place de marché**, puis **Ajouter un dépôt**. Collez le lien copié.
6. Installez **Nextmotion Copilot**.
7. Ouvrez une **nouvelle conversation** et tapez : `configure mon compte Nextmotion`.
8. Quand Claude vous le demande, connectez Nextmotion (voir [`../CONNECTORS.md`](../CONNECTORS.md)).

## Plan B : le zip

Si vous ne voyez ni « Ajouter une place de marché » ni « Ajouter un dépôt » :

1. Téléchargez `nextmotion-copilot-<version>.zip` sur la [dernière Release](https://github.com/docmanug/nextmotion-copilot/releases/latest).
2. Dans **Personnaliser › Plugins**, choisissez de téléverser un plugin et sélectionnez le zip.
3. Reprenez à l'étape 7 ci-dessus.

Ou passez par Claude Code (ci-dessous).

## Claude Code

```text
/plugin marketplace add docmanug/nextmotion-copilot
/plugin install nextmotion-copilot@nextmotion-copilot
```

Puis `/mcp` pour connecter Nextmotion, et tapez `configure mon compte Nextmotion`.

## Mettre à jour

- Claude Desktop / claude.ai : Personnaliser › Plugins, ouvrez la place de marché Nextmotion, **Vérifier les mises à jour**. Activez **Synchroniser automatiquement**.
- Claude Code : `/plugin marketplace update`.

## Pour toute l'équipe

Chaque collaborateur peut installer le plugin lui-même. Avec un plan Team ou Enterprise, l'administrateur peut l'ajouter pour tous depuis les réglages de l'organisation (section des plugins) : téléverser le zip de la Release, ou synchroniser depuis GitHub. Les libellés peuvent varier un peu selon votre version.

## Si ça ne marche pas

| Ce que vous voyez | Que faire |
|---|---|
| Le connecteur Nextmotion n'apparaît pas | Vérifiez que le plugin est bien installé et activé, ouvrez une nouvelle conversation. Sinon, ajout manuel : voir [`../CONNECTORS.md`](../CONNECTORS.md). |
| Claude ne réagit pas à « configure mon compte Nextmotion » | Ouvrez une nouvelle conversation après l'installation, ou appelez `/nextmotion-copilot:configurer-compte`. |
| La connexion Nextmotion échoue | Utilisez le même e-mail et mot de passe que sur le logiciel. Essayez de déconnecter puis reconnecter le connecteur. |
| Claude répond qu'il n'a pas accès à une fonction | Votre rôle Nextmotion ne le permet peut-être pas : demandez au propriétaire du compte. |
| Vous avez une ancienne version | Voir « Mettre à jour » ci-dessus. |

Toujours bloqué ? Écrivez à support@nextmotion.net en indiquant votre application (Desktop, claude.ai, Claude Code) et ce que vous voyez à l'écran.
