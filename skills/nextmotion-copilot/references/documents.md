# Documents — Consentements & Documents administratifs (sections 7, 8, 9)

> **Module 3 du parcours — après le catalogue.**
> Prérequis : ≥1 motif L2 + ≥1 traitement créés (catalogue).
> Ce module consomme : `shared/mcp-map.md` · `templates/consentements/*` · `templates/documents/*`.

**Ordre :** consentements éclairés d'abord → documents administratifs (devis, factures) → ordonnancier (UI).

**Garde-fou légal important :** la numérotation de tes devis et factures est **séquentielle et jamais cassée**. Ne jamais forcer un numéro. Si tu fais une erreur sur une facture → créer un avoir + nouvelle facture. Les variables `--autocomplete` dans les templates gèrent ça automatiquement — ne jamais les supprimer.

> **Résilience lecture modèles :** `oapi_clinic_document_template_list` (et `retrieve`) peut être temporairement illisible (incident serveur — cf. `shared/known-issues.md`). Ne montre pas l'erreur, ne bloque pas : procède à la création/maj du modèle puis confirme avec le client, ou guide l'audit visuel dans l'UI (Documents). ⚠️ La règle « toujours `retrieve` d'abord pour récupérer les variables `--autocomplete` » reste l'idéal — si `retrieve` échoue, pars du modèle fourni dans `templates/documents/` (qui contient déjà les bonnes variables) et ne les invente jamais.

---

## Section 7 — Consentements éclairés

**Niveau MCP : ✅ Écriture complète.**

> ### 🚦 D'abord : est-ce vraiment un consentement de TRAITEMENT ?
>
> Un consentement **d'acte / de traitement** (épilation, laser, AH, toxine, peeling,
> chirurgie, PRP, fils tenseurs…) est **TOUJOURS** un `survey_form` `treatment_consent`
> (`oapi_clinic_survey_form_create`) — **jamais** un document. Il n'existe **aucun** type
> de document « consentement de traitement » dans NM.
>
> Ne confonds pas :
> - **Droit à l'image / photos** → document **type 6** (`oapi_clinic_document_template_create`).
> - **Devis / facture / acompte / avoir** → documents **types 1-4** (§8).
>
> ❌ **Bug réel** : créer un consentement de traitement comme un *document* le classe en
> « droit à l'image » (type 6), sans rattachement au traitement ni signature en consult.
> Un PDF de consentement d'acte fourni par le client → **Étape 1bis** (recette PDF),
> surtout pas le module documents.

### Ce que c'est (sans jargon)

> « Un consentement éclairé, c'est le document que votre patient signe avant un acte pour confirmer qu'il a bien été informé des bénéfices, des risques et des alternatives. C'est obligatoire en médecine esthétique. »

### Étape 1 — Proposer les consentements du pack modèles

Claude propose les 4 consentements types inclus dans le skill :

> « Je vous ai préparé 4 consentements éclairés prêts à l'emploi pour les actes les plus courants. Ils contiennent déjà les informations essentielles (bénéfices, risques, alternatives, signature). Vous pouvez les valider tels quels ou les adapter.
>
> ⚠️ **Important :** ces modèles sont des points de départ. Je vous recommande de les faire valider par un avocat en droit de la santé ou de vous baser sur les modèles de sociétés savantes (SOFCEP, SOFCPRE) avant de les utiliser avec vos patients. »

Consentements disponibles dans `templates/consentements/` :
- `ha.md` — Acide hyaluronique
- `toxine.md` — Toxine botulique
- `laser.md` — Laser
- `peeling.md` — Peeling chimique

> « Voulez-vous qu'on crée les 4, ou seulement ceux qui correspondent à votre pratique ? »

### Étape 1bis — Le client fournit un consentement (PDF / photo-image / texte collé / Word)

> ⚠️ **Formats d'entrée :**
> - **Photo / image / capture d'écran** (JPEG/PNG) : ✅ **Claude Desktop la lit nativement** (vision) — c'est
>   le format le plus simple, même un consentement papier photographié marche. Extrais le texte et reconstruis-le
>   en HTML. ⚠️ **Document légal = tu retranscris, tu ne photocopies pas** : une photo floue/manuscrite peut être
>   mal lue → **fais valider le texte transcrit au client** avant de finaliser (« Voici ce que j'ai lu, vous confirmez
>   que c'est fidèle avant que je le crée ? »). Le logo éventuel n'est pas reproduit → guidage UI (point 6).
> - **PDF / texte collé** : ✅ même chemin.
> - **Word/.docx** : ❌ Claude Desktop **ne lit pas nativement un .docx** → demande de **coller le texte** ou un **PDF**.
>
> **Quel que soit le format, la suite est identique** : le corps devient le HTML page-wrappé de
> `note_tmpl.template.html` (points 1-4 ci-dessous). **Ne dépose jamais le texte brut tel quel dans un champ** —
> surtout pas `fields_tmpl.h.val` (invisible → document blanc) — re-balise-le toujours en HTML.

Un consentement de traitement = `survey_form` `treatment_consent`, **mais ce que le
patient voit et signe vit dans `note_tmpl.template.html`** (un document HTML, édité dans
NM via « Consent forms » → éditeur TipTap avec « Autofills editor »). ⚠️ Le `fields_tmpl`
(questions) **ne s'affiche PAS** dans cet éditeur (il ne sert qu'à définir des autofills
custom). **Le contenu va donc dans `note_tmpl.template.html`, jamais dans `fields_tmpl.h.val`.**

**Format HTML EXACT** (lu dans le code NM `tiptap-document-editor` — sinon l'éditeur affiche du **VIDE**) :

1. **Wrapper page OBLIGATOIRE** :
   ```html
   <div class="page"><div class="page_background" style="position: absolute; width: 100%; height: 100%;"></div><div class="page_content"> …CONTENU… </div><div class="page_footer"></div></div>
   ```
   Sans `.page_content`, l'extension de pagination perd tout le contenu.
2. **Mise en forme** (c'est de l'HTML — gras/tailles OK) — ⚠️ **`<h1>/<h2>` et `<hr>` sont DÉSACTIVÉS** dans cet éditeur (`StarterKit heading:false, horizontalRule:false`) :
   - **Titre** : pas de `<h2>` (sinon rendu en texte plat) → `<p style="text-align: center;"><span style="font-size: 26px;"><strong>TITRE</strong></span></p>` (la taille de police est gérée).
   - Corps : `<p>` paragraphes, `<strong>` labels, `<ul><li>` déclarations. Pas de `<hr>` (ligne de `—` si besoin d'un séparateur).
   - **Pied de page** : la zone footer native est désactivée (`footerHeight: 0`) → mets le footer **en bas du `page_content`**, petit/centré (ex. `<p style="text-align: center;"><span style="font-size: 10px; color: #888;">{{Cabinet}} — {{Adresse}}</span></p>`). Laisse `<div class="page_footer">` vide.
3. **Autofills = `<input class="embed-autocomplete CODE--autocomplete" type="button" value="<label>" data-variant="standard">`.**
   La classe **`embed-autocomplete`** est ce que le parseur TipTap reconnaît (**PAS** `autocomplete-field`).
   Codes standards : `patient_name`, `clinic_name`, `clinic_address`, `doctor_name`,
   **`signing_date`** (requis), **`patient_sign`** (requis), `create_date`, `patient_birth_date`…
   → **Toujours inclure `signing_date--autocomplete` ET `patient_sign--autocomplete`** (requis pour signer).
4. **Mappe les blancs aux autofills STANDARD** : « Nom du patient » → `patient_name` ; « Date » →
   « Fait le <signing_date> » ; « Signature » → `patient_sign` ; cabinet → `clinic_name`/`clinic_address`.

5. **🗣️ Champ SANS autofill standard → autofill CUSTOM, et DEMANDE le type au client (comportement OBLIGATOIRE).**
   Dès que le document a un champ à remplir spécifique à l'acte (« Zone(s) de traitement », « Produit /
   dosage », « Nombre de séances », « Type de peau »…) sans équivalent standard, **ne mets jamais une simple
   ligne `____`** : signale-le et **pose la question au client** —
   > « J'ai repéré un champ à remplir : **"Zone(s) de traitement"**. Pour ce document, vous le voulez comment :
   > une **liste à cocher** (aisselles · maillot · jambes · visage…), du **texte libre**, un **oui/non**,
   > une **échelle** ou une **date** ? »
   Selon la réponse, ajoute le champ dans **`fields_tmpl.q`** :
   - texte → `{"id":"<uuid>","type":1,"val":"Zone(s) de traitement"}`
   - oui/non → `type:2` + `"y":"Oui","n":"Non"` · date → `type:7` · échelle → `type:5` + `"min":1,"max":10`
   - liste QCM → `type:3` (choix unique) / `type:4` (multi) + `"boxes":[{"id":"<uuid>","text":"Aisselles","val":"Aisselles"}, …]`
     ⚠️ **`text` ET `val` dans chaque box** (workaround bug serveur 500) ; `id` = **UUID**.
   Puis **récupère le code généré** : après create/update, NM renvoie le champ dans
   `note_tmpl.autocomplete_list` (format `__survey_<libellé slugifié>--autocomplete`). **Lis ce code exact dans
   la réponse — ne le devine pas** — et insère-le dans le HTML :
   `<input class="embed-autocomplete <code-exact>" type="button" value="<Zone(s) de traitement>" data-variant="custom">`.

6. **Logo / image de marque sur le document** — **NE l'extrais PAS toi-même.** Extraire une image d'un PDF
   exige du code (Python/`fitz`), **indisponible dans Claude Desktop nu** où tourne le copilote. À la place,
   **guide le client** vers le flux natif NM (vérifié doc + prod) :
   - Dans l'éditeur (consentement OU modèle de document, même éditeur) : **bouton `+` en haut à droite** →
     choisir le **logo de la clinique** → **ascenseur** pour régler la taille → il se place **en fond, derrière
     le texte** (aucune incidence sur la mise en page). Pour l'enlever : **poubelle en haut à droite**.
   - ⚠️ **Logo en JPEG, < 100 ko** (évite les gros PNG) — au-delà, la génération PDF peut **planter** (mémoire).
   - **Repli si le client n'a pas de fichier logo** : lui faire **capturer** le logo à l'écran (macOS `⌘⇧4`,
     Windows Outil Capture) depuis son PDF/site, le sauver en **JPEG < 100 ko**, puis le **charger comme logo
     de la clinique** (réglages, UI) → ensuite il ressort via le `+` dans tous les documents.
   - Rappel : le **logo clinique n'est PAS settable par API** (UI only, confirmé 25/06) → le copilote **guide**,
     il ne pousse jamais l'image lui-même.

7. **Nomme** d'après l'acte, `type: "treatment_consent"`, crée via `oapi_clinic_survey_form_create`
   (avec `note_tmpl` — Étape 2), puis **rattache au type de traitement** (Étape 4, UI).

> Au client : « Je l'ai créé comme **consentement de traitement** (pas en document droit-à-l'image),
> mis en page, avec les champs auto — nom du patient, date, signature — et rattaché à votre acte. »

**Modèle prêt, validé en prod (épilation laser GentleMax) :**
`templates/consentements/epilation-laser-gentlemax.md` — contient le `note_tmpl.template.html`
complet (page-wrappé + autofills `embed-autocomplete`). C'est le rendu exact à viser.

### Étape 2 — Créer / mettre à jour via MCP

**Création** : `oapi_clinic_survey_form_create` avec :
- `clinic_id`, `name`, `type: "treatment_consent"`
- **`note_tmpl`** : `{"template": {"html": "<le HTML page-wrappé de l'Étape 1bis>"}}` ← **le contenu visible et signé**
- **`fields_tmpl`** : **requis par l'API** mais peut être **minimal** (`{}` ou `{"q": []}`). N'y mets des
  questions QUE pour créer des autofills custom (elles n'apparaissent pas dans l'éditeur, seulement
  comme variables insérables). ⚠️ **`fields_tmpl.h` n'accueille JAMAIS le corps** : tout texte mis dans
  `fields_tmpl.h.val` est **invisible** dans l'éditeur de consentement (NM ne lit que `note_tmpl.template.html`
  + `fields_tmpl.q`) → document blanc. Le corps vit **uniquement** dans `note_tmpl.template.html`.

**Mise à jour du HTML** : `oapi_survey_form_update` avec `survey_form_id` + `note_tmpl`.
Envoyer `note_tmpl` seul **préserve** le `fields_tmpl` existant.

**🚫 Si (et seulement si) tu remplis `fields_tmpl.q`** (autofills custom) — règles anti-500 (bugs
serveur connus, cf. `shared/known-issues.md` § survey_form CREATE) :
1. **Chaque question DOIT avoir un `id` = UUID valide** (le serveur ne les génère pas à la création → sinon **500**).
2. **Types 1/2/7 uniquement** — évite 3/4 : le serveur lit `boxes[].text` alors que le schéma documente `boxes[].val` → **500**.

**Défaut sûr :** créer avec le texte du pack modèles. Le client peut modifier le texte dans l'interface à tout moment (⚙️ → Consentements → éditer). **Même structure `fields_tmpl` pour les BoltNotes** (catalogue § 6).

Modifier un consentement existant :
```
Nextmotion:oapi_survey_form_update
→ Paramètres : id du consentement + champs à modifier
```

Lire les consentements existants :
```
Nextmotion:oapi_clinic_survey_form_list    → lister tous les formulaires
Nextmotion:oapi_survey_form_retrieve       → détails d'un consentement
```

### Étape 3 — Uploader un PDF signé sur un traitement patient (usage hors config)

> ℹ️ **Note :** cet outil sert à déposer un **PDF de consentement déjà signé** sur un traitement patient existant (hors parcours de configuration). Il ne rattache PAS un modèle de consentement à un type de traitement ou à une ligne de tarif.

```
Nextmotion:oapi_treatment_consent_form_upload
→ Paramètres : treatment_id (ID du traitement patient), document (PDF signé)
```

### Étape 4 — Rattacher les consentements aux types de traitement / lignes de tarif

> **Point clé :** dans Nextmotion, un modèle de consentement doit être associé aux types de traitements pour qu'il se charge automatiquement lors d'une consultation.

> ⚠️ **Limite MCP :** le MCP n'expose pas d'outil d'écriture sur le pricing ni de paramètre de rattachement attesté entre un modèle de consentement et une ligne de tarif. Cette association se fait dans l'interface Nextmotion.

**→ Guide UI :** `shared/ui-paths.md` § 7 — Rattacher un consentement à un type de traitement

Chemin interface : ⚙️ → **Catalogue** → **Types de traitements** → sélectionner le traitement → champ **Consentement éclairé** → choisir le modèle créé.

> « Je vous ai créé les consentements dans Nextmotion. Pour les rattacher à vos traitements, voici comment faire dans l'interface : ⚙️ → Catalogue → Types de traitements → vous sélectionnez chaque traitement et vous choisissez le consentement correspondant. »

### Vérification consentements (self-check OBLIGATOIRE — ne jamais l'omettre)

Après **chaque** `oapi_clinic_survey_form_create` / `oapi_survey_form_update`, un simple
`survey_form_list` (qui ne confirme que le nom + le type) **ne suffit pas** : un consentement au
corps mal placé (`note_tmpl.template` vide) y passe pour un succès alors qu'il s'affiche **BLANC**.

**Self-check, sur l'`id` retourné par la création :**
```
Nextmotion:oapi_survey_form_retrieve  → id du consentement créé
```
1. Vérifier que **`note_tmpl.template.html` est une chaîne non-vide** ET contient `class="page_content"`.
2. Si vide / absent → le corps a été mal placé (probablement dans `fields_tmpl`). **Corrige immédiatement**
   via `oapi_survey_form_update` (HTML page-wrappé dans `note_tmpl.template`), puis re-vérifie.
3. **N'annonce « consentement créé » au client qu'une fois ce contrôle passé.**

Puis confirmer le total : `oapi_clinic_survey_form_list` → [N] consentements, type "treatment_consent".

---

## Section 8 — Documents administratifs (devis, factures)

**Gated : `consult_digital.accounting` requis.** Si cette feature est inactive, masquer toute cette section (devis, factures, acomptes, avoirs) et proposer un upsell doux en fin de parcours.

**Niveau MCP : ✅ Écriture complète (si accounting actif).**

### Ce que c'est (sans jargon)

> « Les modèles de documents, c'est le gabarit de vos devis et factures — avec votre logo, vos informations, les mentions légales, et les zones qui se remplissent automatiquement (numéro de devis, nom du patient, montant…). »

### Règle absolue — TOUJOURS récupérer d'abord

**Avant de créer ou modifier un template, toujours récupérer un template existant** pour ne pas perdre les variables obligatoires.

```
Nextmotion:oapi_document_template_retrieve
→ Paramètre : id du template existant
→ Récupère : structure HTML + variables --autocomplete

Nextmotion:oapi_clinic_document_template_list
→ Lister les templates existants
```

Ces variables sont critiques pour la numérotation légale :
- `quote_number--autocomplete` → numéro de devis auto-incrémenté
- `quote_date--autocomplete` → date du devis
- `patient_name--autocomplete` → nom du patient
- `total_amount--autocomplete` → montant total
- `invoice_number--autocomplete` → numéro de facture (séquentiel, jamais cassé)

> « ⚠️ La numérotation de vos devis et factures est **automatique et légale** — je ne touche jamais aux champs qui la gèrent. Si vous devez corriger une facture, on fait un **avoir + une nouvelle facture**, jamais une modification du numéro existant. »

*(Note interne, jamais montrée au client : ne supprime jamais les variables `--autocomplete` des modèles — `quote_number--autocomplete`, `invoice_number--autocomplete`, etc. — elles portent la numérotation séquentielle.)*

### Étape 1 — Proposer les modèles du pack

Claude propose les templates du skill :

> « Je vous ai préparé un modèle de devis et un modèle de facture aux couleurs neutres, avec toutes les variables obligatoires. Vous voulez les utiliser comme base ? »

Templates disponibles dans `templates/documents/` :
- `devis.html` — devis avec variables --autocomplete
- `facture.html` — facture avec variables --autocomplete

> « Je peux aussi dupliquer un modèle existant dans votre compte si vous préférez repartir de celui de Nextmotion. »

### Étape 2 — Workflow : retrieve → adapter → créer

**Si le client a des templates existants** :

```
1. Nextmotion:oapi_clinic_document_template_list  → identifier les templates existants
2. Nextmotion:oapi_document_template_retrieve → récupérer le HTML complet avec variables
3. (adapter le contenu en gardant toutes les variables --autocomplete)
4. Nextmotion:oapi_document_template_update   → mettre à jour
```

**Si le compte est vierge** (aucun template) :

```
1. Nextmotion:oapi_clinic_document_template_create
   → Paramètres :
     - name (ex. "Devis standard")
     - type : "quote" (devis) ou "invoice" (facture) ou "deposit_invoice" (acompte) etc.
     - content : HTML depuis templates/documents/devis.html ou facture.html
```

**Dupliquer un template existant** (utile pour créer une variante) :

```
Nextmotion:oapi_document_template_duplicate
→ Paramètre : id du template source
→ Crée une copie qu'on peut ensuite modifier
```

Modifier un template :

```
Nextmotion:oapi_document_template_update
→ Paramètres : id + contenu HTML modifié (en conservant toutes les variables --autocomplete)
```

### Étape 3 — Types de documents à créer

Pour un cabinet complet, créer au minimum :

| Type | Description | Quand l'utiliser |
|------|-------------|-----------------|
| `quote` — Devis | Proposition tarifaire avant l'acte | Avant chaque consultation payante |
| `invoice` — Facture | Document de paiement | Après chaque acte facturé |
| `deposit_invoice` — Acompte | Acompte à la réservation (si prépaiement actif) | Si Stripe configuré |
| `credit_note` — Avoir | Correction d'une facture erronée | En cas d'erreur, jamais modifier la facture directement |

> « Pour commencer, on crée le devis et la facture. L'acompte et l'avoir peuvent être ajoutés plus tard. »

### Vérification documents

```
Nextmotion:oapi_clinic_document_template_list
→ Confirmer : [N] templates créés, types présents
```

> « Voici vos modèles de documents créés : [liste]. La numérotation est automatique — vous n'avez rien à configurer manuellement. »

---

## Section 9 — Ordonnancier

**Niveau MCP : 👁 Lecture seule.** Entièrement géré dans l'interface.

> « La configuration de vos modèles d'ordonnances (en-tête, signature, mentions légales) se fait manuellement. Je vous guide. »

Référence complète : `shared/ui-paths.md` § 9

📍 ⚙️ → **Documents** → **Ordonnancier**

- Créer un modèle type « Ordonnance standard » avec votre nom, adresse, RPPS, numéro d'Ordre
- L'éditeur visuel (WYSIWYG) vous permet de formater comme dans Word
- Vous pouvez créer plusieurs modèles (médicale, cosmétique, etc.)

> « Votre numéro RPPS et votre numéro d'Ordre doivent figurer sur les ordonnances médicales. Voir le glossaire (§ RPPS, § Numéro d'Ordre). »

MCP disponible pour lire les ordonnances existantes :
```
Nextmotion:oapi_patient_prescription_list  → lister les ordonnances (lecture)
Nextmotion:oapi_prescription_retrieve      → détails d'une ordonnance (lecture)
```

---

## Récapitulatif — Ce qui a été créé

À la fin du module documents, Claude liste :

```
✅ Consentements éclairés :
   - [N] consentements créés (type treatment_consent)
   - Liens consentements ↔ tarifs : [OK / à compléter]
   - PDFs uploadés : [N / aucun pour l'instant]
   ⚠️ Rappel : faire valider les textes par un avocat santé ou société savante (SOFCEP, SOFCPRE)

✅ Documents administratifs (si `consult_digital.accounting` actif) :
   - Devis : [créé / mise à jour]
   - Facture : [créée / mise à jour]
   - Acompte : [créé / à faire plus tard]
   - Avoir : [créé / à faire plus tard]
   ⚠️ Numérotation séquentielle active — ne jamais modifier un numéro existant

⚠️ À faire dans l'interface (si pas encore fait) :
   - Ordonnancier → ⚙️ Documents → Ordonnancier
```

---

## Prochaine étape

Si la feature `consult_digital.agenda` est active : **→ `references/agenda.md`** (salles, machines, horaires, page de réservation).

Sinon : **→ `references/finance-comm.md`** pour les extras à la demande.

> « Vos documents sont configurés. »
> [Si agenda actif :] « Maintenant on s'attaque à la dernière grande étape : votre agenda en ligne. À la fin, on pourra tester qu'un patient peut vraiment réserver un créneau. »
> [Si agenda inactif :] « L'option agenda en ligne n'est pas active sur votre compte. Si vous voulez l'activer un jour, contactez Nextmotion. On peut maintenant configurer d'autres options (paiements, emails…) si vous le souhaitez. »
