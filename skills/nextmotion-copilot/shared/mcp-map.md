# Carte capacités MCP — Nextmotion Copilot

> **Note importante :** les outils sont référencés ci-dessous par leur **nom exact** (v2.14.7). Selon le client, ils peuvent devoir être **surfacés via la recherche d'outils** du connecteur : cherche **une seule fois** par nom exact, puis appelle. **Ne boucle jamais** sur la recherche ; si un outil ne ressort pas (surtout `oapi_clinic_list`), applique `shared/known-issues.md` § **tool-search burial** (demande le `clinic_id` au client, n'insiste pas). Certaines **lectures** renvoient parfois une erreur technique alors que la donnée existe (incident serveur) → replis + zéro jargon dans `known-issues.md`, ne bloque jamais.

**Niveaux MCP :**
- ✅ Écriture complète — Claude peut créer et modifier via MCP sans passer par l'UI
- 🟡 Partielle — certaines actions disponibles en MCP, d'autres nécessitent l'UI
- 👁 Lecture seule — MCP peut lire mais pas écrire
- ❌ Aucun — tout se fait dans l'UI

**Denylist :** les outils `*_destroy` sont **INTERDITS** sur des données réelles (config + dossiers patients). **Seule exception** : nettoyage d'une **donnée de test** créée par le copilote lui-même, après confirmation explicite (cf. SKILL.md §Données de test). Les outils de **données de test** (`oapi_clinic_patient_create`, `oapi_clinic_consultation_create`, `oapi_clinic_lead_create`, `oapi_lead_convert_to_patient`, `oapi_appointment_request_create`) sont **autorisés** pour valider la config — données étiquetées « TEST ».

---

## Table des 25 sections

| # | Section | Niveau MCP | Outils MCP — Écriture (create/update) | Outils MCP — Lecture (list/retrieve) | Comportement |
|---|---------|-----------|---------------------------------------|--------------------------------------|--------------|
| 1 | Mon Profil (PIN/MFA/signature) | ❌ Aucun | — | `Nextmotion:oapi_user_me_retrieve` | Guidage UI (`ui-paths.md` §1) |
| 2 | Ma Clinique (logo/TVA/RPPS/adresse) | 👁 Lecture seule | — | `Nextmotion:oapi_clinic_list` | Guidage UI (`ui-paths.md` §2) — pas de `clinic_update` disponible |
| 3 | Collaborateurs (praticiens/secrétaire) | ✅ Complète | `Nextmotion:oapi_clinic_doctor_create`, `Nextmotion:oapi_doctor_update` | `Nextmotion:oapi_clinic_doctor_list`, `Nextmotion:oapi_doctor_retrieve` | **MCP direct pour TOUS** (médecin ET secrétaire/assistante/manager) via `kind` (10/9/11/12). Params réels : `email`+`kind` requis, `color` RGBA 8 car., pas de `fr_rpps`. UI = simple alternative d'invitation |
| 4 | Traitements & Tarifs | ✅ Complète | `Nextmotion:oapi_clinic_treatment_type_create`, `Nextmotion:oapi_treatment_type_update` | `Nextmotion:oapi_clinic_treatment_type_list`, `Nextmotion:oapi_treatment_type_retrieve` | MCP direct. Prix = tableau **`pricings[]`** (décimal TTC `"350.00"`, PAS centimes ; `vat_rate` requis par pricing ; `details`=nom de variante ; `sessions`). **Plusieurs tarifs nommés/traitement = norme.** Liaison via `visit_type`+`sub_visit_type` (singuliers). ~~`oapi_treatment_type_destroy`~~ **INTERDIT** |
| 5 | Consultations 3 niveaux (L1/L2/L3) | ✅ Complète | `Nextmotion:oapi_clinic_visit_type_category_create`, `Nextmotion:oapi_visit_type_category_update`, `Nextmotion:oapi_clinic_visit_type_create`, `Nextmotion:oapi_visit_type_update`, `Nextmotion:oapi_clinic_visit_type_reorder` | `Nextmotion:oapi_clinic_visit_type_category_list`, `Nextmotion:oapi_visit_type_category_retrieve`, `Nextmotion:oapi_clinic_visit_type_list`, `Nextmotion:oapi_visit_type_retrieve`, `Nextmotion:oapi_clinic_sub_visit_type_list` | L1 + L2 + **L3 (sous-motifs) → MCP direct** (tableau `sub_visit_types` dans `visit_type_create`/`update` — vérifié prod 25/06, PAS UI-only). Motif L2 = champ `subject` (pas `name`), `category` (pas `visit_type_category_id`), `duration_minutes`, `color` requis. ~~`oapi_visit_type_destroy`~~ **INTERDIT** |
| 6 | BoltNotes (formulaires de consultation) | ✅ Complète | `Nextmotion:oapi_clinic_survey_form_create`, `Nextmotion:oapi_survey_form_update` | `Nextmotion:oapi_clinic_survey_form_list`, `Nextmotion:oapi_survey_form_retrieve` | MCP direct — ~~`oapi_survey_form_destroy`~~ **INTERDIT** |
| 7 | Consentements éclairés | ✅ Complète | `Nextmotion:oapi_clinic_survey_form_create`, `Nextmotion:oapi_treatment_consent_form_upload` | `Nextmotion:oapi_clinic_survey_form_list`, `Nextmotion:oapi_survey_form_retrieve` | MCP direct (texte + upload PDF signé) — ~~`oapi_survey_form_destroy`~~ **INTERDIT** |
| 8 | Documents admin (devis/factures/acomptes/avoirs) | ✅ Complète | `Nextmotion:oapi_clinic_document_template_create`, `Nextmotion:oapi_document_template_update`, `Nextmotion:oapi_document_template_duplicate` | `Nextmotion:oapi_clinic_document_template_list`, `Nextmotion:oapi_document_template_retrieve` | MCP direct — **TOUJOURS** appeler `retrieve` d'abord pour récupérer les variables `--autocomplete` — ~~`oapi_document_template_destroy`~~ **INTERDIT** |
| 9 | Ordonnancier | 👁 Lecture seule | — | `Nextmotion:oapi_patient_prescription_list`, `Nextmotion:oapi_prescription_retrieve` | Guidage UI (`ui-paths.md` §9) |
| 10 | Répartition honoraires (multi-praticien) | ✅ Complète | `Nextmotion:oapi_clinic_accounting_distribution_create`, `Nextmotion:oapi_accounting_distribution_update` | `Nextmotion:oapi_clinic_accounting_distribution_list`, `Nextmotion:oapi_accounting_distribution_retrieve` | MCP direct — requis : feature `consult_digital.accounting` + ≥2 praticiens — ~~`oapi_accounting_distribution_destroy`~~ **INTERDIT** |
| 11 | Moyens de paiement | ✅ Complète | `Nextmotion:oapi_clinic_payment_medium_create`, `Nextmotion:oapi_payment_medium_update` | `Nextmotion:oapi_clinic_payment_medium_list`, `Nextmotion:oapi_payment_medium_retrieve` | MCP direct — ~~`oapi_payment_medium_destroy`~~ **INTERDIT** |
| 12 | Codes promo | ❌ Aucun | — | — | Guidage UI (`ui-paths.md` §12) |
| 13 | Protocoles (packages traitement) | ✅ Complète | `Nextmotion:oapi_clinic_treatment_package_create`, `Nextmotion:oapi_treatment_package_update`, `Nextmotion:oapi_treatment_package_item_create`, `Nextmotion:oapi_treatment_package_item_update` | `Nextmotion:oapi_clinic_treatment_package_list`, `Nextmotion:oapi_treatment_package_retrieve`, `Nextmotion:oapi_treatment_package_item_list` | MCP direct — requis : feature `consult_digital.accounting` — ~~`oapi_treatment_package_destroy`~~ **INTERDIT** |
| 14 | Salles de consultation | ✅ Complète | `Nextmotion:oapi_clinic_appointment_room_create`, `Nextmotion:oapi_appointment_room_update` | `Nextmotion:oapi_clinic_appointment_room_list`, `Nextmotion:oapi_appointment_room_retrieve` | MCP direct — requis : feature `consult_digital.agenda` — ~~`oapi_appointment_room_destroy`~~ **INTERDIT** |
| 15 | Machines / équipements | ✅ Complète | `Nextmotion:oapi_clinic_appointment_device_create`, `Nextmotion:oapi_appointment_device_update` | `Nextmotion:oapi_clinic_appointment_device_list`, `Nextmotion:oapi_appointment_device_retrieve` | MCP direct — requis : feature `consult_digital.agenda` — ~~`oapi_appointment_device_destroy`~~ **INTERDIT** |
| 16 | Horaires d'ouverture | ✅ Complète | `Nextmotion:oapi_clinic_calendar_opening_hour_create`, `Nextmotion:oapi_calendar_opening_hour_update` | `Nextmotion:oapi_clinic_calendar_opening_hour_list`, `Nextmotion:oapi_calendar_opening_hour_retrieve` | MCP direct — ~~`oapi_calendar_opening_hour_destroy`~~ **INTERDIT** — heures = heure locale Paris + offset (jamais UTC brut) |
| 17 | Config agenda (délais, auto-accept, durée défaut) | ❌ Aucun | — | — | Guidage UI (`ui-paths.md` §17) — requis : feature `consult_digital.agenda` |
| 18 | Consignes pré/post traitement | 🟡 Partielle | `Nextmotion:oapi_post_treatment_config_update` | `Nextmotion:oapi_post_treatment_config_retrieve` | Post-traitement → MCP direct ; pré-traitement → Guidage UI |
| 19 | Prépaiement Stripe | ❌ Aucun | — | — | Guidage UI (`ui-paths.md` §19) — requis : feature `consult_digital.agenda` |
| 20 | Page RDV en ligne (publication) | ❌ Aucun | — | — | Guidage UI (`ui-paths.md` §20) — action publique : confirmer avant de publier |
| 21 | Antécédents médicaux | 🟡 Partielle | `Nextmotion:oapi_clinic_medical_history_update` | `Nextmotion:oapi_clinic_medical_history_retrieve` | Activation/config des champs → MCP direct (singleton) ; champs ultra-custom → UI |
| 22 | Champs custom patient | ❌ Aucun | — | — | Guidage UI (`ui-paths.md` §22) |
| 23 | Emails (templates) | 🟡 Partielle | `Nextmotion:oapi_communication_template_update` | `Nextmotion:oapi_clinic_communication_template_list`, `Nextmotion:oapi_communication_template_retrieve` | Modifier templates existants → MCP direct ; créer/identité d'envoi → Guidage UI |
| 24 | SMS (templates) | 🟡 Partielle | `Nextmotion:oapi_communication_template_update` | `Nextmotion:oapi_clinic_communication_template_list`, `Nextmotion:oapi_communication_template_retrieve` | idem emails — requis : feature `sms_communication` ; crédits SMS → Guidage UI |
| 25 | Inventaire (produits) | ✅ Complète | `Nextmotion:oapi_clinic_product_create`, `Nextmotion:oapi_clinic_product_update` | `Nextmotion:oapi_clinic_product_list`, `Nextmotion:oapi_clinic_product_retrieve` | MCP direct — ~~`oapi_clinic_product_destroy`~~ **INTERDIT** |

---

## Bilan

| Niveau | Sections | Count |
|--------|---------|-------|
| ✅ Écriture complète | 3, 4, 5, 6, 7, 8, 10, 11, 13, 14, 15, 16, 25 | 13 |
| 🟡 Partielle | 18, 21, 23, 24 | 4 |
| 👁 Lecture seule | 2, 9 | 2 |
| ❌ Aucun (UI) | 1, 12, 17, 19, 20, 22 | 6 |
| **Total** | | **25** |

> **Corrections vérifiées en prod le 25/06** (compte test Dr Jean Dujardin) : §3 secrétaire créable via MCP (`kind`) · §5 sous-motifs L3 créables via MCP (`sub_visit_types`) · §4 prix = `pricings[]` décimal multi-variantes · `doctor_create` exige `email`+`kind` (pas `fr_rpps`) · motif L2 = `subject`/`category`/`duration_minutes` · gotcha agenda : plage doit lister ses `sub_visit_types`. §2 (identité clinique) confirmé **sans endpoint d'écriture** dans l'API ouverte (logo/TVA/adresse = UI ; sadmin ne modifie que `name`).

## Outils supplémentaires (audit silencieux au démarrage)

Ces outils sont utilisés pour l'audit silencieux du compte avant de proposer le parcours :

- `Nextmotion:oapi_clinic_list` — identifier la clinique courante
- `Nextmotion:oapi_clinic_feature_list` — lire les features actives (cf. `feature-gating.md`)
- `Nextmotion:oapi_clinic_visit_type_list` — vérifier si des motifs existent
- `Nextmotion:oapi_clinic_appointment_room_list` — vérifier si des salles existent
- `Nextmotion:oapi_clinic_calendar_opening_hour_list` — vérifier si des horaires existent
- `Nextmotion:oapi_clinic_document_template_list` — vérifier si des modèles existent
- `Nextmotion:oapi_clinic_doctor_list` — vérifier si des praticiens existent
- `Nextmotion:oapi_clinic_survey_form_list` — vérifier consentements/BoltNotes existants
- `Nextmotion:oapi_clinic_payment_medium_list` — vérifier moyens de paiement existants
- `Nextmotion:oapi_clinic_treatment_type_list` — vérifier traitements existants
- `Nextmotion:oapi_user_me_retrieve` — récupérer le profil de l'utilisateur courant

> **Lectures parfois instables** (incident serveur temporaire, juin 2026) :
> `oapi_clinic_feature_list`, `oapi_user_me_retrieve`, `oapi_clinic_doctor_list`,
> `oapi_clinic_visit_type_list` / `oapi_visit_type_retrieve`,
> `oapi_clinic_document_template_list`. Replis par lecture dans
> `shared/known-issues.md` — ne JAMAIS bloquer l'audit dessus, ni montrer l'erreur.

---

## Référence complète des outils par domaine

### Fondations (§2, §3)
- `Nextmotion:oapi_clinic_list` — lister les cliniques
- `Nextmotion:oapi_clinic_doctor_list` — lister les praticiens
- `Nextmotion:oapi_clinic_doctor_create` — créer un praticien ✅ ÉCRITURE
- `Nextmotion:oapi_doctor_retrieve` — détails praticien
- `Nextmotion:oapi_doctor_update` — modifier praticien ✅ ÉCRITURE
- `Nextmotion:oapi_user_me_retrieve` — profil utilisateur courant

### Catalogue — Motifs (§5)
- `Nextmotion:oapi_clinic_visit_type_category_list` — lister catégories L1
- `Nextmotion:oapi_clinic_visit_type_category_create` — créer catégorie L1 ✅ ÉCRITURE
- `Nextmotion:oapi_visit_type_category_retrieve` — détails catégorie
- `Nextmotion:oapi_visit_type_category_update` — modifier catégorie ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_visit_type_list` — lister motifs L2
- `Nextmotion:oapi_clinic_visit_type_create` — créer motif L2 ✅ ÉCRITURE
- `Nextmotion:oapi_visit_type_retrieve` — détails motif
- `Nextmotion:oapi_visit_type_update` — modifier motif ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_visit_type_reorder` — réordonner motifs ✅ ÉCRITURE

### Catalogue — Traitements (§4)
- `Nextmotion:oapi_clinic_treatment_type_list` — lister traitements
- `Nextmotion:oapi_clinic_treatment_type_create` — créer traitement ✅ ÉCRITURE
- `Nextmotion:oapi_treatment_type_retrieve` — détails traitement
- `Nextmotion:oapi_treatment_type_update` — modifier traitement ✅ ÉCRITURE

### Catalogue — BoltNotes & Consentements (§6, §7)
- `Nextmotion:oapi_clinic_survey_form_list` — lister formulaires
- `Nextmotion:oapi_clinic_survey_form_create` — créer formulaire/consentement ✅ ÉCRITURE
- `Nextmotion:oapi_survey_form_retrieve` — détails formulaire
- `Nextmotion:oapi_survey_form_update` — modifier formulaire ✅ ÉCRITURE
- `Nextmotion:oapi_treatment_consent_form_upload` — uploader PDF consentement ✅ ÉCRITURE

### Documents (§8, §9)
- `Nextmotion:oapi_clinic_document_template_list` — lister modèles documents
- `Nextmotion:oapi_clinic_document_template_create` — créer modèle ✅ ÉCRITURE
- `Nextmotion:oapi_document_template_retrieve` — récupérer modèle existant (TOUJOURS en premier)
- `Nextmotion:oapi_document_template_update` — modifier modèle ✅ ÉCRITURE
- `Nextmotion:oapi_document_template_duplicate` — dupliquer modèle ✅ ÉCRITURE
- `Nextmotion:oapi_patient_prescription_list` — lister ordonnances patient (lecture)
- `Nextmotion:oapi_prescription_retrieve` — détails ordonnance (lecture)

### Finance (§10, §11, §13)
- `Nextmotion:oapi_clinic_accounting_distribution_list` — lister répartitions honoraires
- `Nextmotion:oapi_clinic_accounting_distribution_create` — créer répartition ✅ ÉCRITURE
- `Nextmotion:oapi_accounting_distribution_retrieve` — détails répartition
- `Nextmotion:oapi_accounting_distribution_update` — modifier répartition ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_payment_medium_list` — lister moyens de paiement
- `Nextmotion:oapi_clinic_payment_medium_create` — créer moyen de paiement ✅ ÉCRITURE
- `Nextmotion:oapi_payment_medium_retrieve` — détails moyen de paiement
- `Nextmotion:oapi_payment_medium_update` — modifier moyen de paiement ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_treatment_package_list` — lister protocoles
- `Nextmotion:oapi_clinic_treatment_package_create` — créer protocole ✅ ÉCRITURE
- `Nextmotion:oapi_treatment_package_retrieve` — détails protocole
- `Nextmotion:oapi_treatment_package_update` — modifier protocole ✅ ÉCRITURE
- `Nextmotion:oapi_treatment_package_item_list` — lister items protocole
- `Nextmotion:oapi_treatment_package_item_create` — créer item protocole ✅ ÉCRITURE
- `Nextmotion:oapi_treatment_package_item_update` — modifier item protocole ✅ ÉCRITURE

### Agenda (§14, §15, §16, §18)
- `Nextmotion:oapi_clinic_appointment_room_list` — lister salles
- `Nextmotion:oapi_clinic_appointment_room_create` — créer salle ✅ ÉCRITURE
- `Nextmotion:oapi_appointment_room_retrieve` — détails salle
- `Nextmotion:oapi_appointment_room_update` — modifier salle ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_appointment_device_list` — lister machines
- `Nextmotion:oapi_clinic_appointment_device_create` — créer machine ✅ ÉCRITURE
- `Nextmotion:oapi_appointment_device_retrieve` — détails machine
- `Nextmotion:oapi_appointment_device_update` — modifier machine ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_calendar_opening_hour_list` — lister horaires
- `Nextmotion:oapi_clinic_calendar_opening_hour_create` — créer horaire ✅ ÉCRITURE
- `Nextmotion:oapi_calendar_opening_hour_retrieve` — détails horaire
- `Nextmotion:oapi_calendar_opening_hour_update` — modifier horaire ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_visit_type_opening_hour_list` — horaires par type de visite
- `Nextmotion:oapi_post_treatment_config_retrieve` — détails consignes post-traitement
- `Nextmotion:oapi_post_treatment_config_update` — modifier consignes post-traitement ✅ ÉCRITURE

### Catalogue — Inventaire (§25)
- `Nextmotion:oapi_clinic_product_list` — lister produits inventaire
- `Nextmotion:oapi_clinic_product_create` — créer produit ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_product_retrieve` — détails produit
- `Nextmotion:oapi_clinic_product_update` — modifier produit ✅ ÉCRITURE

### Extras (§21, §23, §24)
- `Nextmotion:oapi_clinic_medical_history_retrieve` — lire config champs antécédents (singleton)
- `Nextmotion:oapi_clinic_medical_history_update` — modifier config antécédents ✅ ÉCRITURE
- `Nextmotion:oapi_clinic_communication_template_list` — lister templates email/SMS
- `Nextmotion:oapi_communication_template_retrieve` — détails template
- `Nextmotion:oapi_communication_template_update` — modifier template email/SMS ✅ ÉCRITURE

### Outils INTERDITS (denylist — ne jamais appeler sur des données réelles)
> Exception test : `oapi_patient_destroy`, `oapi_consultation_destroy` et `oapi_lead_destroy` sont autorisés **uniquement** pour supprimer une donnée de **test** créée par le copilote lui-même, après confirmation (cf. SKILL.md §Données de test). **Tous les autres `*_destroy` restent interdits**, sans exception.
- ~~`Nextmotion:oapi_treatment_type_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_visit_type_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_visit_type_category_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_survey_form_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_document_template_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_appointment_room_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_appointment_device_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_calendar_opening_hour_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_payment_medium_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_accounting_distribution_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_treatment_package_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_treatment_package_item_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_clinic_product_destroy`~~ **INTERDIT**
- ~~`Nextmotion:oapi_doctor_destroy`~~ **INTERDIT**
