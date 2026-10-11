# Nextmotion Copilot

Le copilote **Nextmotion** dans Claude. Vous parlez, Claude s'occupe de configurer votre compte, de vous aider au quotidien et de former votre équipe.

Pour les cliniques d'esthétique : médecin, secrétaire, gérant, nouveau collaborateur.

## Ce que fait le plugin

Cinq compétences, que Claude choisit tout seul selon votre demande. Vous pouvez aussi les appeler à la main en tapant leur nom dans la conversation.

| Compétence | Pour quoi faire | Appel à la main |
|---|---|---|
| **Configurer le compte** | Découvrir votre activité, puis régler le compte : motifs, traitements, tarifs, consentements, devis et factures, agenda, messages. | `/nextmotion-copilot:configurer-compte` |
| **Aide au quotidien** | Répondre à « comment je fais ? » : agenda, dossier patient, devis, factures, encaissements, messages, tableaux de bord, application iPhone et iPad, portail patient. | `/nextmotion-copilot:aide-quotidien` |
| **Former l'équipe** | Un parcours d'accueil adapté au rôle : propriétaire, médecin, secrétaire. | `/nextmotion-copilot:former-equipe` |
| **Consult IA** | Régler Consult IA, Nextmotion Local, la dictée, et retrouver le « Bilan de vos consultations ». | `/nextmotion-copilot:consult-ia` |
| **Plusieurs cliniques** | Gérer un groupe : Claude demande toujours quelle clinique avant d'agir. | `/nextmotion-copilot:multi-sites` |

Claude répond **dans votre langue** (français par défaut). Les modèles fournis (consentements, motifs, notes) sont en français.

Pour démarrer, tapez dans une nouvelle conversation : **« configure mon compte Nextmotion »**.

## Installation

Vous avez besoin d'un compte Claude payant (Pro, Max, Team ou Enterprise) et d'un compte Nextmotion.

Dans **Claude Desktop** (ou sur **claude.ai**) :

1. Ouvrez **Personnaliser**, puis **Plugins**.
2. Cliquez sur **Parcourir**, puis sur le **+**.
3. Choisissez **Ajouter une place de marché**, puis **Ajouter un dépôt**.
4. Collez `https://github.com/docmanug/nextmotion-copilot`.
5. Installez **Nextmotion Copilot**.
6. Ouvrez une **nouvelle conversation** et tapez : `configure mon compte Nextmotion`.
7. Claude vous demande de connecter Nextmotion : voir [`CONNECTORS.md`](CONNECTORS.md).

**Plan B, si vous ne voyez pas « Ajouter une place de marché »** : téléchargez le zip de la [dernière version](https://github.com/docmanug/nextmotion-copilot/releases/latest) (fichier `nextmotion-copilot-<version>.zip`), puis dans **Personnaliser › Plugins**, ajoutez-le en choisissant de téléverser un plugin.

**Claude Code** :

```text
/plugin marketplace add docmanug/nextmotion-copilot
/plugin install nextmotion-copilot@nextmotion-copilot
```

Pas à pas détaillé et dépannage : [`docs/INSTALL.md`](docs/INSTALL.md).

**Tutoriel vidéo** (connecter Claude à Nextmotion) : [français](https://www.tella.tv/video/vid_cmumg5o2r00hu0agm1zmn3ilk) · [English](https://www.tella.tv/video/vid_cmupa4sk7008b05mb4egbg4gc) · [español](https://www.tella.tv/video/vid_cmupbpbya001h06pfhikbh81x). Vous retrouvez aussi ces étapes dans Nextmotion : Paramètres › Centre d'intégration › Plugin Claude.

### Où ça marche

| Application | Compatible |
|---|---|
| Claude Desktop (Mac, Windows) | Oui |
| claude.ai (navigateur) | Oui |
| Claude Code | Oui |

### Pour toute l'équipe et plusieurs cliniques

- **Chaque collaborateur** installe le plugin lui-même, avec son compte Claude et son compte Nextmotion. Ses droits dans Claude sont ceux de son compte Nextmotion.
- **Avec un plan Team ou Enterprise**, l'administrateur Claude peut ajouter le plugin pour tout le monde (réglages de l'organisation, section des plugins : téléverser le zip de la Release, ou synchroniser depuis GitHub). Les libellés peuvent varier un peu selon votre version.
- **Pour plusieurs cliniques**, Claude demande toujours laquelle avant d'écrire quoi que ce soit.

## Mettre à jour

Une nouvelle version n'arrive pas toujours toute seule.

- **Claude Desktop / claude.ai** : Personnaliser › Plugins, ouvrez la place de marché Nextmotion, cliquez sur **Vérifier les mises à jour**. Activez **Synchroniser automatiquement** pour ne plus y penser.
- **Claude Code** : `/plugin marketplace update`.

Claude annonce la version du plugin dans sa première réponse, pour que vous puissiez vérifier que vous avez la dernière.

## Données et confidentialité

- Vos données sont hébergées par Nextmotion sur des serveurs certifiés HDS (hébergeur de données de santé).
- Claude règle le compte, vous forme et vous aide. Il ne modifie, ne fusionne ni ne supprime aucun dossier patient existant, et n'envoie aucun message à vos patients. Les actes légaux (valider une facture, encaisser, faire signer) restent à vous.
- Nextmotion enregistre quelles actions Claude effectue (par exemple « création d'un motif »), jamais le contenu de vos dossiers.
- Pour couper l'accès : Personnaliser › Connecteurs › Nextmotion › Déconnecter.

Règles complètes : [`shared/donnees-et-confidentialite.md`](shared/donnees-et-confidentialite.md). Politique de confidentialité : https://www.nextmotion.net/fr/politique-confidentialite

## Accès

Pendant votre premier mois, le connecteur est ouvert à toutes les cliniques : paramétrage, formation de l'équipe et aide au quotidien. Ensuite, Claude reste disponible pour vous aider et former votre équipe ; les automatisations par l'API demandent l'option API & automatisations.

## Aide

Écrivez-nous : support@nextmotion.net.

## Version et licence

Version actuelle : voir [`CHANGELOG.md`](CHANGELOG.md). Licence : voir [`LICENSE`](LICENSE).
