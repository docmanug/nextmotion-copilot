# Nextmotion Copilot

Plugin **Claude** (Code & Desktop) qui accompagne toute l'équipe d'une clinique esthétique sur Nextmotion — en **3 modes** :

- **🔧 Configurer** : paramétrer le compte en langage naturel (motifs, traitements, consentements, devis, horaires…) directement via le MCP Nextmotion.
- **💡 Aide à l'usage** : répondre aux questions d'usage quotidien (« comment j'envoie un devis ? », « où je trouve mes factures ? ») avec une réponse courte et ciblée, sans audit complet.
- **🎓 Onboarder / Former** : accompagner un nouveau membre (médecin, secrétaire, associé) avec un parcours pédagogique role-aware en 5 phases.

Le client parle à Claude, Claude **classe l'intention** et **agit** : il configure, guide ou forme — avec des défauts sûrs, sans jargon, en français.

> Objectif à terme : remplacer le wizard d'onboarding `setup.nextmotion.net` et le support usage de premier niveau.

## Pour qui

Médecin / secrétaire / clinique esthétique : que ce soit pour ouvrir un compte Nextmotion, se débloquer sur une tâche quotidienne, ou former un nouveau collaborateur.

## Installation (client)

**Claude Code** — install depuis ce repo, en deux commandes :

```text
/plugin marketplace add docmanug/nextmotion-copilot
/plugin install nextmotion-copilot@nextmotion-copilot
```

Le serveur MCP **nextmotion** est fourni par le plugin (`.mcp.json`) : ouvre `/mcp`, **approuve-le** et **authentifie-toi** (voir [`CONNECTORS.md`](CONNECTORS.md)), puis dis « configure mon compte Nextmotion ».

**Claude Desktop** — l'install par URL n'existe pas sur Desktop : on téléverse un zip. Construis-le avec `./package.sh`, puis Réglages → **Plugins personnels** → `+` → « Téléverser un plugin local » → `dist/nextmotion-copilot.zip`. Connecteur MCP idem.

Prérequis : Claude Code ou Claude Desktop à jour, exécution de code activée, abonnement Nextmotion compatible connecteurs. Détail : [`CONNECTORS.md`](CONNECTORS.md) + [`skills/nextmotion-copilot/INSTALL.md`](skills/nextmotion-copilot/INSTALL.md).

## Packaging

```bash
./package.sh          # → dist/nextmotion-copilot.zip (à envoyer au client)
```

## Architecture

Un seul composant : **le skill** `nextmotion-copilot` (pas de `commands/` — format unique recommandé par Claude Desktop), modulaire en interne (progressive disclosure) :

```
nextmotion-copilot/                  # racine du plugin (= le repo)
├── .mcp.json                        # serveur MCP nextmotion (fourni par le plugin)
├── .claude-plugin/
│   ├── plugin.json                  # manifeste plugin (requis par l'uploader Desktop)
│   └── marketplace.json             # pour /plugin marketplace add (Claude Code)
├── CONNECTORS.md · README.md · LICENSE
└── skills/
    └── nextmotion-copilot/          # LE skill (routeur + modules)
        ├── SKILL.md                 # routeur 3 modes : classification d'intention → module
        ├── references/              # modules à la demande
        │   ├── aide-usage.md        #  mode 💡 aide ponctuelle (search_knowledge_base + playbook)
        │   ├── formation.md         #  mode 🎓 onboarding role-aware (5 phases)
        │   └── fondations / catalogue / documents / agenda / finance-comm  # mode 🔧 config
        ├── shared/                  # intent-routing, playbooks, mcp-map, glossary, ui-paths, feature-gating
        └── templates/               # pack FR (consentements, devis/facture, motifs, BoltNotes)
```

## Principes de conception

- **Routeur 3 modes** : classification d'intention en tête (config / aide-usage / onboarding) — chaque mode charge le bon module sans sur-charger l'autre.
- **MCP-first** : 17 des 25 domaines de config sont écrits par Claude ; seuls 8 passent par l'UI.
- **Feature-gating** : ne propose que ce que l'abonnement du client active (`GET /clinics/{id}/features`).
- **« Fais et montre »** : défauts sûrs → écriture par lot → récap → test de bouclage.
- **Traduire, pas interroger** : zéro jargon, défaut sûr quand le client ne sait pas.
- **Jamais destructif sur du réel** : `*_destroy` interdit (sauf nettoyage confirmé d'une donnée de **test** auto-créée) ; jamais d'écriture sur de vrais dossiers patients. Données de test étiquetées « TEST » autorisées pour valider la config.
- **Résilient** : une lecture MCP qui échoue ne bloque jamais et n'affiche jamais d'erreur technique au client (`shared/known-issues.md`).
- **Filtre client-safe** : aucun contenu CSM interne (argumentaires, pricing interne, codes patients non cliniques).

Validé par 3 personas non-techniques (test RED→GREEN), où le skill d'onboarding précédent échouait.

## MCP requis

Serveur Nextmotion clinique : `https://mcp.nextmotion.net/mcp` (auth par clé API clinique / OAuth), **fourni par le plugin** via `.mcp.json` — il suffit de l'approuver et de s'authentifier. Distinct du Superadmin (`/sadmin/mcp`).

## Licence

Voir [`LICENSE`](LICENSE).
