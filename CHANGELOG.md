# Journal des modifications

Toutes les évolutions notables de **Nextmotion Copilot** sont consignées ici.
Ce projet suit le [versionnage sémantique](https://semver.org).

## 2.0.0 — 2026-10-11

Réécriture complète : le copilote passe de un à cinq skills, sur la nouvelle interface de Nextmotion.

**Nouvelle interface**
- Tous les chemins, boutons et libellés décrivent la nouvelle interface (Doctor Portal). Les réglages se trouvent dans « Paramètres », en bas de la barre de gauche.
- L'ancienne interface n'est plus citée nulle part.

**Cinq skills au lieu d'un**
- `configurer-compte`, `aide-quotidien`, `former-equipe`, `consult-ia`, `multi-sites`. Chacun est appelable à la main (`/nextmotion-copilot:configurer-compte`, etc.).
- Fichiers communs (règles, glossaire, outils du connecteur, chemins dans l'app) en source unique, copiés dans chaque skill.
- Descriptions rédigées avec les phrases réelles des clients pour un déclenchement fiable, dont « configure mon compte Nextmotion ».

**IA**
- Consult IA, Nextmotion Local, dictée, Jarvis et « Bilan de vos consultations » ont leur propre skill.
- Le skill n'invente plus de réglage : il renvoie vers l'écran ou le guide de l'app quand il y en a un.

**Formation**
- Parcours d'accueil par rôle (propriétaire, médecin, secrétaire) ; Tutos IA et visites « Découvrir cette page » remplacent l'ancienne Academy.

**Usage**
- Aide au quotidien : agenda, dossier patient, devis, factures, encaissements, messages, tableaux de bord, application iPhone et iPad, portail patient.
- Envoi d'un devis en signature à distance et signature via le portail patient.
- Plusieurs cliniques : Claude demande laquelle avant d'agir.
- Claude répond dans la langue de l'utilisateur (français par défaut) ; modèles en français.

**Documents**
- Modèles de consentements, de motifs, de notes et de documents (8 types) mis à jour pour la nouvelle interface.

**Sécurité et confidentialité**
- Règles de données regroupées en un seul fichier : lecture d'un dossier patient seulement sur question à propos de ce patient ; écriture seulement sur demande explicite, après récapitulatif (fiche administrative, rendez-vous, appel, devis ou facture provisoire) ; jamais de suppression, de fusion ni de contenu médical écrit ; aucun message envoyé aux patients ; actes légaux laissés à l'utilisateur.
- Section « Données et confidentialité » dans le README, avec lien vers la politique de confidentialité.
- Plus aucune mention interne dans les fichiers publics.

**Installation et distribution**
- Une seule procédure d'installation, identique à celle de l'app (Personnaliser › Plugins › Parcourir › + › Ajouter une place de marché › Ajouter un dépôt), avec plan B (zip de la Release GitHub) et Claude Code.
- Connecteur fourni par le plugin ; connexion avec le compte Nextmotion habituel et « Toujours autoriser ». Ajout manuel en dernier recours. Plus de prérequis « option API » le premier mois.
- Sections « Mettre à jour » et « Pour toute l'équipe » ; guide `docs/INSTALL.md` avec dépannage.
- Version unique dans `plugin.json` ; zip versionné `nextmotion-copilot-<version>.zip` ; synchronisation et validation automatiques (`scripts/sync-shared.sh`, workflow de validation) ; cas d'évaluation dans `evals/`.
- La version du plugin s'annonce dans la première réponse de Claude.

## 1.3.3 — 2026-07-08

Regroupe les anciennes versions 1.2.16 à 1.2.19.

- **Découverte avant écriture** : sur un compte vierge, Claude s'informe d'abord de votre activité (questionnaire de
  santé, agenda, motifs, traitements et prix) avant de paramétrer quoi que ce soit.
- **Motifs à 3 niveaux** : catégorie, sous-catégorie, visite réservable.
- **TVA** : 20 % par défaut pour les actes esthétiques (France).
- **Consentements et mots-clés photos** : Claude vous demande d'abord si vous avez vos propres consentements à reprendre ;
  étape des mots-clés photos avant/après enrichie.

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
- Retrait de références non publiques.

## 1.2.15

- Première version publique : Nextmotion Copilot en 3 modes — configuration,
  aide à l'usage, onboarding/formation.
