# Journal des modifications

Toutes les évolutions notables de **Nextmotion Copilot** sont consignées ici.
Ce projet suit le [versionnage sémantique](https://semver.org).

## 1.3.3 — 2026-07-08

Intègre les corrections issues du test client réel (branche `fix/copilot-live-test`) :

- **Phase Découverte** : sur un compte vierge, enquête métier (activité, questionnaire
  de pré-consultation, Agenda, motifs, traitements + prix, import Excel) **avant** toute
  écriture — fini le paramétrage générique par lot. Nouveau module `references/decouverte.md`.
- **Motifs** : hiérarchie NM à 3 niveaux enseignée (L1 zone Visage/Silhouette → L2
  technique → L3 motif réservable) ; amorce « listez vos motifs Doctolib / réservables en ligne ».
- **TVA** : défaut corrigé à **20 %** pour les actes esthétiques (France) — n'était pas exonéré.
- **Questionnaire de pré-consultation (antécédents)** : proposé tôt et configurable via MCP
  (message de bienvenue + questions typées, remplissage iPad/ordinateur).
- **Consentements** : demande d'abord au client s'il a les siens (PDF/photo/texte) à importer
  ; URL directe de visualisation fournie après création.
- **Mots-clés photos avant/après** : étape enrichie (recherche portfolio par traitement ET
  mots-clés, exemples FUE/rhinoplastie/zones) — guidage UI.
- Corrections API vérifiées live : rattachement consentement→tarif via `pricings[].survey_form`,
  sous-motifs L3 en MCP, bugs serveur (serialization, 500 survey_form) corrigés.

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
