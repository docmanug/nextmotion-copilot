# Documents — consentements, devis, factures, ordonnance, compte rendu

> Étape 4. Modèles prêts à ajuster : `templates/fr/` (consentements en `.md`, documents en `.html`). Écrans : Paramètres ›
> Mes traitements › onglet **Consentement(s) éclairé(s)**, et Paramètres › **Documents** (« Mes modèles »).
> **Devis et modèle de devis** : socle de Consult Digital, toujours proposés. **Factures, acomptes, avoirs, paiements** : option
> Facturation (menu Comptabilité) ; propose-les seulement si elle est dans l'offre (`shared/options-et-credits.md`) ; si tu ne
> peux pas la lire, demande « Vous voyez Factures dans Comptabilité ? ».

## 1. Trois objets à ne jamais confondre
| Le client veut… | Objet | Outil |
|---|---|---|
| Consentement **d'un acte** (épilation, laser, HA, toxine, peeling, PRP, fils…) | **Formulaire de consentement** (type consentement de traitement) | `oapi_clinic_survey_form_create` |
| **Droit à l'image** (photos) | Document **type 6** | `oapi_clinic_document_template_create` |
| Devis, facture, acompte, avoir, ordonnance, document administratif, compte rendu | Document types 1, 2, 3, 4, 0, 7, 8 | `oapi_clinic_document_template_create` |
Un consentement d'acte créé comme document se classe en « droit à l'image », sans rattachement au traitement.

## 2. Consentements éclairés
**D'abord, demande s'il a les siens** (validés par son avocat ou sa société savante) : PDF, photo ou capture d'écran, ou texte collé
(un fichier Word n'est pas lisible : demande de coller le texte ou un PDF). C'est le chemin à privilégier. **Transcris, ne
photocopie pas**, et fais valider le texte lu (« Voici ce que j'ai lu, c'est fidèle ? ») avant de créer.
Sinon, propose les bases de `templates/fr/consentements/` : acide hyaluronique, toxine, laser, peeling, épilation laser. Dis-le
ainsi : « Ce sont des bases à adapter, que je mets en forme pour vous. Faites-les valider par un avocat en droit de la santé ou
reprenez les modèles de votre société savante avant de les utiliser : votre responsabilité est engagée. »

### Format du corps (sinon le document s'affiche vide)
- **Le texte que le patient voit et signe vit dans `note_tmpl`** : `{"template": {"html": "…"}}`. Jamais dans l'introduction
  (`fields_tmpl.h`) : elle n'est pas lue par l'éditeur de consentement. `fields_tmpl` est obligatoire mais peut être `{"q": []}`.
- **Structure d'une page** (une `div.page` par page A4) :
  `<div class="page"><div class="page_background" style="position: absolute; width: 100%; height: 100%;"></div><div class="page_content">…</div><div class="page_footer"></div></div>`
- **Titre** : `<p style="text-align: center;"><span style="font-size: 26px;"><strong>TITRE</strong></span></p>` (pas de `<h1>`/`<h2>`,
  ni de `<hr>`). Corps en `<p>`, `<strong>`, `<ul><li>`. Le pied de page peut aller dans `page_footer` ou en bas de `page_content`.
- **Champs automatiques** : `<input class="embed-autocomplete CODE--autocomplete" type="button" value="&lt;Libellé&gt;" data-variant="standard">`.
  La classe est **`embed-autocomplete`** (pas `autocomplete-field`). Le libellé est libre et traduit à l'ouverture ; **seul le code
  compte**. Toute autre forme n'est pas remplacée à l'impression.
- **Codes autorisés** : appelle `oapi_survey_form_autocomplete_list` (type consentement de traitement) et n'en invente aucun.
  Obligatoires : `signing_date` et `patient_sign`. Courants : `patient_name`, `patient_birth_date`, `patient_address`,
  `clinic_name`, `clinic_address`, `doctor_name`, `doctor_speciality`, `create_date`, `doctor_sign`, et les nouveaux
  `treatment_name` (Intervention), `treatment_details` (Détail de l'intervention), `quote_number` (Devis n°),
  `quote_issue_date` (Date du devis), `quote_accepted_date` (Date de signature du devis). Ces cinq sont **vides tant que le devis
  n'est pas émis ou signé**. Pas de numéro RPPS à remplir automatiquement dans un consentement.
- **Un blanc à remplir sans équivalent standard** (type de laser, phototype, profondeur du peeling…) devient un **champ
  personnalisé** : ne mets jamais une ligne `____`. Demande le type au client (texte libre, liste à cocher, oui/non, échelle,
  date), ajoute-le dans `fields_tmpl.q` (types : 1 texte, 2 oui/non avec `y`/`n`, 3 choix unique et 4 choix multiple avec
  `boxes:[{id,text}]`, 5 échelle avec `min`/`max`, 7 date). Libellé **sans apostrophe ni caractère spécial**. Le code est
  `__survey_<libellé en minuscules, espaces remplacés par _>--autocomplete` ; après création **relis-le** dans
  `note_tmpl.autocomplete_list` et corrige la trame si besoin, ne le devine pas.
- **Logo ou image** : tu ne peux pas la poser. Le client l'ajoute dans l'éditeur avec le bouton Image (JPEG ou PNG), la glisse à
  sa place, l'agrandit avec les poignées, la retire avec la corbeille.
- Créer : `oapi_clinic_survey_form_create` (`clinic_id`, `name`, type consentement de traitement, `fields_tmpl`, `note_tmpl`).
  Modifier le texte : `oapi_survey_form_update` avec `note_tmpl` seul (le `fields_tmpl` est conservé).

### Rattacher et vérifier (obligatoire)
1. Relis avec `oapi_survey_form_retrieve` : `note_tmpl.template.html` doit être **non vide** et contenir `class="page_content"`.
   Sinon corrige tout de suite par une mise à jour, relis, et n'annonce « créé » qu'après.
2. Rattache à la ligne de tarif : champ `survey_form` de `pricings[]` (`references/catalogue.md` § 4). À l'écran : Mes
   traitements › Liste › traitement › colonne « Consentement ». **Fin de section : liste les tarifs sans consentement.**
3. Dis où le voir : Paramètres › Mes traitements › Consentement(s) éclairé(s) (menu « Personnaliser » et « Éditeur de champs
   de remplissage automatique » dans l'éditeur).
Déposer un PDF déjà signé sur un traitement patient n'est pas fiable depuis Claude : guide le client dans le dossier du patient.

## 3. Les huit types de documents
| Type | Nom à l'écran | Champ obligatoire | Option |
|---|---|---|---|
| 0 | Ordonnance (mise en page) | `content` | — |
| 1 | Devis | `quote_number` **et** `patient_accepted_sign` | — |
| 2 | Facture | `invoice_number` | Facturation |
| 3 | Facture d'acompte | `deposit_invoice_number` | Facturation |
| 4 | Avoir | `credit_note_number` | Facturation |
| 6 | Consentement de droit à l'image | `signing_date`, `patient_sign` | — |
| 7 | Document administratif | — | — |
| 8 | Compte rendu de visite (un seul par clinique) | `content` | — |
Ne les nomme « documents administratifs » que pour le type 7 (fiche d'accueil, règlement intérieur, consignes…).

### Lire d'abord, puis créer
`oapi_clinic_document_template_list`. Un **compte neuf n'a aucun modèle** : sans eux, créer un devis, une facture ou une
ordonnance échoue (« aucun modèle de document n'est en place »). Si l'écran Documents est vide, l'assistant de démarrage n'a pas
été terminé : crée d'abord devis (et facture si Facturation). Sur compte neuf, pose ensuite les autres types (ordonnance,
droit à l'image, compte rendu ; acompte et avoir rattachés à la facture ; administratif **sur demande**), sans doublon.
1. **Variables** : appelle `oapi_document_template_autocomplete_list` avec le type ; garde **toutes** les variables « required »
   et n'invente aucun code. Les fichiers de `templates/fr/documents/` sont déjà construits ainsi (repli si l'outil échoue).
2. `oapi_clinic_document_template_create` : `name`, `type` (entier), `template` = `{"html": "<div class=\"page\">…"}`.
   Envoie le contenu du fichier à partir de `<div class="page">`. **Acompte et avoir** : `master` = identifiant du modèle de
   facture auquel ils se rattachent (cherche-le avec la liste, type 2).
3. Modifier : `oapi_document_template_retrieve`, puis `oapi_document_template_update` avec `name` et `template` **complets**.
   Dupliquer : `oapi_document_template_duplicate`.
4. Vérifie avec la liste ; montre-la : Paramètres › Documents (huit familles).

### Particularités
- **Devis** : doit contenir la **signature du patient** (`patient_accepted_sign`) : sans elle, Nextmotion refuse le modèle. Le patient signe
  son devis à l'iPad, dans son portail, ou à distance par « Envoyer en signature » (lien par e-mail ; des crédits de signature
  sont inclus chaque mois ; un rappel consomme un crédit). **Blocs de texte prédéfinis** : `template_texts` (`name` + `content`)
  et le champ `template_text` dans le modèle ; propose 2 ou 3 blocs (conditions de règlement, annulation) sans valeur
  juridique affirmée. **Délai de réflexion et validité** : ne les écris pas en dur ; mets-les dans un bloc prédéfini « à valider
  avec votre assurance ou votre Ordre ».
- **Facture** : zone de signature du patient facultative (`patient_sign`, `patient_sign_date`).
- **Plusieurs praticiens** : demande si chacun a son en-tête. `doctor` = identifiant du praticien (le modèle est choisi pour lui
  et la facture sort sous sa société : à valider avec le comptable). Nommage possible
  « Devis – Dr Nom », sur demande seulement.
- **Mentions légales (SIREN, RCS, capital, TVA)** : elles viennent de l'**Entité de facturation** (Paramètres › Comptabilité ›
  onglet Entité de facturation) via les variables `company_*`. Invite le client à la remplir **avant** de créer les modèles de
  facture ; ne réécris pas ces mentions en dur. **Certification NF525 (scellement)** : explique-la, **ne l'active jamais à sa place
  ni ne la conseille sans accord explicite** : elle est irréversible (identité légale verrouillée, documents scellés non
  modifiables, corrections par avoir).
- **Numérotation** : ne supprime jamais le champ de numéro, ne force jamais un numéro ; erreur = avoir + nouvelle facture.
- **Ordonnance** : deux écrans distincts. La **mise en page** (en-tête, `content`, signature) est le document type 0 :
  Paramètres › Documents › Ordonnances (tu la crées ; l'option « Filtrer les modèles par praticien » existe). Les **textes
  d'ordonnance prêts à l'emploi** se saisissent à l'écran : Paramètres › Mes prescriptions (pas d'outil), puis se lient aux
  tarifs. Ne dis pas « ordonnancier ».
- **Droit à l'image** : modèle `templates/fr/documents/droit-image.html`. Le patient le signe depuis le bouton éclair de l'app ;
  le Portfolio sait filtrer les patients qui ont accepté (« Droits d'image acceptés »).
- **Document administratif** : questions Oui/Non = type 2 (`y`/`n`) avec zone de précision libre ; variable `treatment_date`.
  `autoshow` crée et envoie le document **à chaque nouveau patient**, à remplir à sa première connexion au portail ; l'interrupteur
  « Création auto » le fait aussi : ne l'active jamais sans prévenir et sans accord. `display_in_consultations` l'ajoute au
  tableau des soins.
- **Compte rendu (type 8)** : sans le champ `content`, chaque note s'imprime vierge. S'il n'existe pas, crée le modèle
  minimal (`templates/fr/documents/compte-rendu.html`) ; n'en crée jamais un second.
- **Partage automatique avec les patients** : interrupteur de Paramètres › Comptabilité (`references/finance-communication.md`).

## 4. Récapitulatif
« Consentements : N créés, rattachés à N tarifs, N tarifs sans consentement. Documents : devis, facture… en place. À faire à
l'écran : logo, Entité de facturation, ordonnances types. » Suite : `references/agenda.md` si l'Agenda est dans l'offre,
sinon `references/finance-communication.md`.
