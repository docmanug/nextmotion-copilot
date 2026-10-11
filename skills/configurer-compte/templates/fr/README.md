# Modèles en français — mode d'emploi

Modèles que Claude propose à une clinique qui démarre. Ce sont des **points de départ à ajuster avec le client**, jamais écrits tels
quels sans son accord. Ils sont utilisés par le skill configurer-compte (`references/documents.md`, `references/catalogue.md`).

```
templates/fr/
├── consentements/   5 consentements d'acte (fichiers .md : mode d'emploi + HTML du corps)
│   ├── ha.md · toxine.md · laser.md · peeling.md · epilation-laser-gentlemax.md
├── documents/       8 modèles de documents (fichiers .html, prêts à envoyer)
│   ├── ordonnance.html (0) · devis.html (1) · facture.html (2) · facture-acompte.html (3) · avoir.html (4)
│   └── droit-image.html (6) · document-administratif.html (7) · compte-rendu.html (8)
├── motifs.md        catégories, techniques et noms de visites (vocabulaire de l'assistant de démarrage)
├── bolt-notes.md    format réel d'une bolt note, deux modèles et des idées
└── README.md
```

## Avertissement juridique (consentements et droit à l'image)
Ces textes sont des **modèles de base non validés juridiquement**. Le praticien doit les faire valider par un avocat en droit de la
santé, ou reprendre les modèles de sa société savante, avant de s'en servir. Sa responsabilité est engagée. Dis-le au client à chaque
création, avec tes mots.

## Principes de construction
- **Forme des champs automatiques** : `<input class="embed-autocomplete CODE--autocomplete" type="button" value="&lt;Libellé&gt;">`.
  La classe est `embed-autocomplete` (pas `autocomplete-field`). Le libellé est libre ; **seul le code compte**. Une autre forme n'est
  pas remplacée à l'impression.
- **Structure d'une page** : `div.page` contenant `div.page_background`, `div.page_content` et `div.page_footer` (une `div.page` par page
  A4). Titres en `<p>` gras centré, jamais `<h1>`/`<h2>`.
- **Codes lus dans Nextmotion** : tous les codes de `documents/` et de `consentements/` sont ceux de l'outil de variables de leur type
  (`oapi_document_template_autocomplete_list`, `oapi_survey_form_autocomplete_list`). Relis la liste avant d'écrire et ne rajoute jamais
  un code qui n'y figure pas. Les champs personnalisés d'un consentement ou d'une bolt note ont un code `__survey_<libellé en minuscules,
  espaces remplacés par _>--autocomplete` : relis-le après création.
- **Langue** : français. Le contenu s'adapte au client ; les modèles anglais et espagnols viendront dans une version suivante.

## Les huit documents
| Fichier | Type | Champs obligatoires | À savoir |
|---|---|---|---|
| `ordonnance.html` | 0 | `content` | Mise en page (en-tête, contenu, signature) ; les textes d'ordonnance types se saisissent à l'écran. Pied de page « En cas d'urgence… 15 (Samu) ». |
| `devis.html` | 1 | `quote_number` **et** `patient_accepted_sign` | **Signature du patient obligatoire.** Mentions légales par `company_*` (Entité de facturation). Un bloc de texte prédéfini accueille validité et conditions. |
| `facture.html` | 2 | `invoice_number` | Dernière ligne = signature facultative du patient : retire-la si le client n'en veut pas. Option Facturation. |
| `facture-acompte.html` | 3 | `deposit_invoice_number` | Se rattache à une facture (`master`). Option Facturation. |
| `avoir.html` | 4 | `credit_note_number` | Se rattache à une facture (`master`). Option Facturation. |
| `droit-image.html` | 6 | `signing_date`, `patient_sign` | **Document**, pas un consentement d'acte. Texte à faire valider. |
| `document-administratif.html` | 7 | — | Fiche d'accueil à adapter. `autoshow` envoie à chaque nouveau patient : jamais sans accord. |
| `compte-rendu.html` | 8 | `content` | HTML minimal : un seul par clinique ; sans lui, chaque note s'imprime vierge. |

Pour les mentions légales, le client remplit d'abord **Paramètres › Comptabilité › Entité de facturation** ; sinon les lignes société restent
vides. Envoie le contenu du fichier à partir de `<div class="page">` dans `template` : `{"html": "…"}`.

## Rappels
- Numérotation : ne jamais retirer le champ de numéro d'un devis, d'une facture, d'un acompte ou d'un avoir.
- Aucun prix, aucun nom de client dans ces modèles ; les exemples de zones et de produits restent génériques.
- Texte de consentement : jamais de numéro d'identification du praticien à remplir automatiquement ; la signature du praticien
  (`doctor_sign`) n'est ajoutée que s'il l'a enregistrée.
