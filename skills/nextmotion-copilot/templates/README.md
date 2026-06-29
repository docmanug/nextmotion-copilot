# Templates — Pack de démarrage médecine esthétique FR

Ce dossier contient les **modèles de contenu par défaut** que Claude propose aux clients Nextmotion qui commencent de zéro.

## Contenu

```
templates/
├── consentements/
│   ├── ha.md          — Consentement éclairé : acide hyaluronique
│   ├── toxine.md      — Consentement éclairé : toxine botulique
│   ├── laser.md       — Consentement éclairé : laser (modèle générique)
│   └── peeling.md     — Consentement éclairé : peeling chimique
├── documents/
│   ├── devis.html     — Template devis (variables --autocomplete Nextmotion)
│   └── facture.html   — Template facture (variables --autocomplete Nextmotion)
├── motifs-defaults.md  — Motifs de consultation types + durées
├── boltnotes-defaults.md — 2 modèles de BoltNote (bilan injection + suivi)
└── README.md          — Ce fichier
```

## Principe d'utilisation

Claude propose ces modèles comme **point de départ**, pas comme contenu définitif. Le client peut :
- **Accepter tel quel** : Claude charge directement le contenu via MCP Nextmotion.
- **Modifier avant chargement** : le client précise ses changements en langage naturel, Claude adapte et charge.
- **Ignorer** : le client fournit ses propres documents, Claude les utilise à la place.

## Avertissement légal — Consentements éclairés

> ⚠️ **Les consentements éclairés inclus dans `consentements/` sont des MODÈLES DE BASE.**
>
> Ils ne constituent PAS des documents juridiquement validés et NE DOIVENT PAS être utilisés tels quels en pratique clinique sans avoir été :
>
> 1. **Validés par un avocat spécialisé en droit de la santé**, ou
> 2. **Récupérés auprès d'une société savante compétente** : SOFCEP (Société Française des Chirurgiens Esthétiques Plasticiens), SOFCPRE (Société Française et Francophone de Chirurgie Plastique Reconstructrice et Esthétique), SNCDE (Syndicat National des Chirurgiens Dermatologues Esthétiques), ou toute autre société savante reconnue dans la spécialité.
>
> **La responsabilité du praticien est engagée.** Ces modèles servent uniquement à illustrer la structure d'un consentement et à fournir une base de travail.

## Templates documents (devis, facture)

Les fichiers HTML utilisent des balises `<input type="button" class="<variable>--autocomplete autocomplete-field">` pour identifier les zones variables que Nextmotion remplit automatiquement (nom patient, numéro de devis, montants…). Par exemple : `class="patient_name--autocomplete autocomplete-field"`. La structure `<div class="page">…<div class="page_footer">…</div></div>` est requise par le moteur de rendu Nextmotion.

**Ne pas modifier la classe CSS `--autocomplete`** des balises `<input>` — elles sont lues par Nextmotion pour injecter les données du dossier patient et du document.
