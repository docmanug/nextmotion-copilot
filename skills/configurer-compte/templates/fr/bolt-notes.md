# Bolt notes — format réel et deux modèles

> Une **bolt note** est un **modèle de compte rendu** : quand le praticien ouvre une consultation d'une visite donnée, la note est
> déjà pré-remplie avec la trame de la clinique (produit, zone, technique…) et quelques champs à compléter, par lui ou par Consult IA.
> Elle est **liée à une visite** (Paramètres › Mes consultations › Liste › ouvrir la visite › « Questionnaire bolt note »),
> **une visite = une bolt note**. Il n'existe **aucun raccourci tapé** du type « /toxine ». Elle se crée et se modifie dans
> Paramètres › Mes consultations › onglet **Bolt notes** (« Nouvelle bolt note ») ; droit « Peut accéder à l'éditeur des Bolt notes ».

## Les deux parties d'une bolt note
- **`fields_tmpl`** : l'introduction (`h.val`) et les **questions** (`q`) à remplir. Chaque question a un `id` unique (UUID, aussi pour chaque choix).
- **`note_tmpl`** : `{"template": {"html": "…"}}`, la **trame** du compte rendu, avec les champs automatiques. À chaque question
  correspond un champ `__survey_<libellé en minuscules, espaces remplacés par _>--autocomplete`.

## Type de champ choisi par le client → type à envoyer
| Le client veut… | `type` | En plus de `id` et `val` |
|---|---|---|
| Réponse libre (texte) | 1 | — |
| Oui / Non | 2 | `y` et `n` (libellés des boutons) |
| Choix unique | 3 | `boxes: [{id, text}]` |
| Choix multiple | 4 | `boxes: [{id, text}]` |
| Échelle (0 à 10) | 5 | `min`, `max` |
| Image | 6 | — |
| Date | 7 | — |

## Champs automatiques de la trame
Les dix variables standards d'une bolt note : `patient_id`, `patient_name`, `patient_number`, `patient_address`, `patient_birth_date`,
`patient_email`, `patient_phone_number`, `clinic_name`, `clinic_address`, `provider_sign` (signature du praticien). Vérifie avec
`oapi_survey_form_autocomplete_list` (type bolt note). Plus un champ automatique par question. Les « sections » n'existent pas :
utilise des intertitres en gras dans la trame. Même format de page que les documents (`div.page`).
Libellés de questions **sans apostrophe ni caractère spécial** (le code du champ en dépend).

## Procédure (cinq temps)
1. Propose les modèles (ou des idées, ci-dessous), adapte avec le client : 5 à 10 champs utiles, pas plus, pour que la note reste rapide.
2. Crée avec `oapi_clinic_survey_form_create` (`name`, type bolt note, `fields_tmpl`, `note_tmpl`).
3. Relis (`oapi_survey_form_retrieve`) : la liste des champs automatiques doit contenir le code de chaque question ; corrige la trame
   par `oapi_survey_form_update` si un code diffère, et vérifie que `note_tmpl.template.html` n'est pas vide.
4. Rattache à la visite : champ `bolt_note` (identifiant de la bolt note) à la création ou à la mise à jour de la visite (relis la visite
   et renvoie l'objet complet, `references/catalogue.md` § 9).
5. Montre où la voir (onglet Bolt notes) et comment l'ajuster.

## Modèle 1 — Bilan injection visage
`fields_tmpl` :
```json
{"h": {"val": "Bilan injection visage : à compléter pendant la séance."},
 "q": [
  {"id": "<UUID>", "type": 4, "val": "Zones traitées", "boxes": [{"id": "<UUID>", "text": "Front"}, {"id": "<UUID>", "text": "Glabelle"}, {"id": "<UUID>", "text": "Pattes d'oie"}, {"id": "<UUID>", "text": "Pommettes"}, {"id": "<UUID>", "text": "Sillons nasogéniens"}, {"id": "<UUID>", "text": "Lèvres"}, {"id": "<UUID>", "text": "Menton"}, {"id": "<UUID>", "text": "Ovale du visage"}, {"id": "<UUID>", "text": "Cernes"}, {"id": "<UUID>", "text": "Autre"}]},
  {"id": "<UUID>", "type": 1, "val": "Produit utilisé"},
  {"id": "<UUID>", "type": 3, "val": "Technique", "boxes": [{"id": "<UUID>", "text": "Aiguille"}, {"id": "<UUID>", "text": "Canule"}, {"id": "<UUID>", "text": "Les deux"}]},
  {"id": "<UUID>", "type": 1, "val": "Quantité injectée"},
  {"id": "<UUID>", "type": 1, "val": "Numéro de lot"},
  {"id": "<UUID>", "type": 2, "val": "Anticoagulants ou anti-inflammatoires récents", "y": "Oui", "n": "Non"},
  {"id": "<UUID>", "type": 2, "val": "Contrôle prévu à 15 jours", "y": "Oui", "n": "Non"},
  {"id": "<UUID>", "type": 1, "val": "Observations"}
]}
```
`note_tmpl.template.html` :
```html
<div class="page"><div class="page_background" style="position: absolute; width: 100%; height: 100%;"></div><div class="page_content"><p style="text-align: center;"><strong>BILAN INJECTION VISAGE</strong></p><p><strong>Patient : </strong><input class="embed-autocomplete patient_name--autocomplete" type="button" value="&lt;Nom du patient&gt;" data-variant="standard"> — <input class="embed-autocomplete patient_birth_date--autocomplete" type="button" value="&lt;Date de naissance du patient&gt;" data-variant="standard"></p><p></p><p><strong>Zones traitées : </strong><input class="embed-autocomplete __survey_zones_traitées--autocomplete" type="button" value="&lt;Zones traitées&gt;" data-variant="custom"></p><p><strong>Produit utilisé : </strong><input class="embed-autocomplete __survey_produit_utilisé--autocomplete" type="button" value="&lt;Produit utilisé&gt;" data-variant="custom"></p><p><strong>Technique : </strong><input class="embed-autocomplete __survey_technique--autocomplete" type="button" value="&lt;Technique&gt;" data-variant="custom"></p><p><strong>Quantité injectée : </strong><input class="embed-autocomplete __survey_quantité_injectée--autocomplete" type="button" value="&lt;Quantité injectée&gt;" data-variant="custom"></p><p><strong>Numéro de lot : </strong><input class="embed-autocomplete __survey_numéro_de_lot--autocomplete" type="button" value="&lt;Numéro de lot&gt;" data-variant="custom"></p><p><strong>Anticoagulants ou anti-inflammatoires récents : </strong><input class="embed-autocomplete __survey_anticoagulants_ou_anti-inflammatoires_récents--autocomplete" type="button" value="&lt;Anticoagulants ou anti-inflammatoires récents&gt;" data-variant="custom"></p><p><strong>Contrôle prévu à 15 jours : </strong><input class="embed-autocomplete __survey_contrôle_prévu_à_15_jours--autocomplete" type="button" value="&lt;Contrôle prévu à 15 jours&gt;" data-variant="custom"></p><p><strong>Observations : </strong><input class="embed-autocomplete __survey_observations--autocomplete" type="button" value="&lt;Observations&gt;" data-variant="custom"></p><p></p><p><strong>Signature du praticien : </strong><input class="embed-autocomplete provider_sign--autocomplete" type="button" value="&lt;Signature du praticien&gt;" data-variant="standard"></p></div><div class="page_footer"></div></div>
```

## Modèle 2 — Suivi post-acte
`fields_tmpl` :
```json
{"h": {"val": "Suivi après un acte esthétique : à compléter lors de la consultation de contrôle."},
 "q": [
  {"id": "<UUID>", "type": 1, "val": "Acte de référence"},
  {"id": "<UUID>", "type": 3, "val": "Délai depuis la séance", "boxes": [{"id": "<UUID>", "text": "7 jours"}, {"id": "<UUID>", "text": "14 jours"}, {"id": "<UUID>", "text": "30 jours"}, {"id": "<UUID>", "text": "3 mois"}, {"id": "<UUID>", "text": "Autre"}]},
  {"id": "<UUID>", "type": 3, "val": "Tolérance rapportée par le patient", "boxes": [{"id": "<UUID>", "text": "Très bonne"}, {"id": "<UUID>", "text": "Bonne"}, {"id": "<UUID>", "text": "Gênante"}]},
  {"id": "<UUID>", "type": 3, "val": "Gonflement", "boxes": [{"id": "<UUID>", "text": "Aucun"}, {"id": "<UUID>", "text": "Léger"}, {"id": "<UUID>", "text": "Prolongé"}]},
  {"id": "<UUID>", "type": 2, "val": "Hématomes", "y": "Oui", "n": "Non"},
  {"id": "<UUID>", "type": 3, "val": "Résultat estimé par le praticien", "boxes": [{"id": "<UUID>", "text": "Excellent"}, {"id": "<UUID>", "text": "Bon"}, {"id": "<UUID>", "text": "Satisfaisant"}, {"id": "<UUID>", "text": "À retoucher"}]},
  {"id": "<UUID>", "type": 5, "val": "Satisfaction du patient", "min": 0, "max": 10},
  {"id": "<UUID>", "type": 2, "val": "Retouche ou nouvelle séance prévue", "y": "Oui", "n": "Non"},
  {"id": "<UUID>", "type": 1, "val": "Observations"}
]}
```
`note_tmpl.template.html` :
```html
<div class="page"><div class="page_background" style="position: absolute; width: 100%; height: 100%;"></div><div class="page_content"><p style="text-align: center;"><strong>SUIVI POST-ACTE</strong></p><p><strong>Patient : </strong><input class="embed-autocomplete patient_name--autocomplete" type="button" value="&lt;Nom du patient&gt;" data-variant="standard"> — <input class="embed-autocomplete patient_birth_date--autocomplete" type="button" value="&lt;Date de naissance du patient&gt;" data-variant="standard"></p><p></p><p><strong>Acte de référence : </strong><input class="embed-autocomplete __survey_acte_de_référence--autocomplete" type="button" value="&lt;Acte de référence&gt;" data-variant="custom"></p><p><strong>Délai depuis la séance : </strong><input class="embed-autocomplete __survey_délai_depuis_la_séance--autocomplete" type="button" value="&lt;Délai depuis la séance&gt;" data-variant="custom"></p><p><strong>Tolérance rapportée par le patient : </strong><input class="embed-autocomplete __survey_tolérance_rapportée_par_le_patient--autocomplete" type="button" value="&lt;Tolérance rapportée par le patient&gt;" data-variant="custom"></p><p><strong>Gonflement : </strong><input class="embed-autocomplete __survey_gonflement--autocomplete" type="button" value="&lt;Gonflement&gt;" data-variant="custom"></p><p><strong>Hématomes : </strong><input class="embed-autocomplete __survey_hématomes--autocomplete" type="button" value="&lt;Hématomes&gt;" data-variant="custom"></p><p><strong>Résultat estimé par le praticien : </strong><input class="embed-autocomplete __survey_résultat_estimé_par_le_praticien--autocomplete" type="button" value="&lt;Résultat estimé par le praticien&gt;" data-variant="custom"></p><p><strong>Satisfaction du patient : </strong><input class="embed-autocomplete __survey_satisfaction_du_patient--autocomplete" type="button" value="&lt;Satisfaction du patient&gt;" data-variant="custom"></p><p><strong>Retouche ou nouvelle séance prévue : </strong><input class="embed-autocomplete __survey_retouche_ou_nouvelle_séance_prévue--autocomplete" type="button" value="&lt;Retouche ou nouvelle séance prévue&gt;" data-variant="custom"></p><p><strong>Observations : </strong><input class="embed-autocomplete __survey_observations--autocomplete" type="button" value="&lt;Observations&gt;" data-variant="custom"></p><p></p><p><strong>Signature du praticien : </strong><input class="embed-autocomplete provider_sign--autocomplete" type="button" value="&lt;Signature du praticien&gt;" data-variant="standard"></p></div><div class="page_footer"></div></div>
```

## Autres idées de modèles (noms de bolt notes)
« Injection toxine », « Acide hyaluronique lèvres », « Skinbooster », « Première consultation », « Consultation de contrôle »,
« Consignes post-injection ». Champs utiles types : produit, zone, technique, quantité, numéro de lot, observations.
Choisis les champs avec le praticien ; ne remplis jamais une note à sa place.
