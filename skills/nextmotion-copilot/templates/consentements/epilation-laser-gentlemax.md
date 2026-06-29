# Consentement éclairé — Épilation laser (GentleMax Pro Plus)

> **Type NM : `survey_form` `treatment_consent`** (PAS un document). Le contenu visible/signé
> vit dans **`note_tmpl.template.html`** (éditeur « Consent forms », TipTap). **Validé live** en prod
> 2026-06-25 (compte Dr Monnier, survey_form `17834ece`) : titre, gras, déclarations, autofills en
> puces, footer — tout rend. Modèle de départ — à faire valider par un avocat santé / société savante.

## ⚠️ Règles de rendu (lues dans le code NM, validées live)

1. **Wrapper page obligatoire** : `<div class="page"><div class="page_background" …></div><div class="page_content"> … </div><div class="page_footer"></div></div>`. Sans `.page_content` → **affiche du vide**.
2. **Autofills = classe `embed-autocomplete`** : `<input class="embed-autocomplete CODE--autocomplete" type="button" value="<label>" data-variant="standard">` (PAS `autocomplete-field`). Toujours `signing_date` + `patient_sign` (requis).
3. **Titre** : `<h2>` est désactivé (rendu plat) → titre = `<p style="text-align:center;"><span style="font-size:26px;"><strong>…</strong></span></p>`.
4. **Pied de page** : zone footer native désactivée (`footerHeight:0`) → footer **en bas du `page_content`**, petit/centré.
5. **Champ custom** (zone de traitement…) → DEMANDER le type au client (texte/QCM/oui-non/date), créer dans `fields_tmpl.q`, lire le code `__survey_…--autocomplete` renvoyé, l'insérer. Cf. `documents.md §7` Étape 1bis pt 5.

## `note_tmpl.template.html` prêt à l'emploi (validé)

```html
<div class="page"><div class="page_background" style="position: absolute; width: 100%; height: 100%;"></div><div class="page_content"><p style="text-align: center;"><span style="font-size: 26px;"><strong>CONSENTEMENT ÉCLAIRÉ</strong></span></p><p style="text-align: center;"><strong>Traitement Épilation — Laser GentleMax Pro Plus (Candela)</strong></p><p></p><p><strong>Praticien :</strong> <input class="embed-autocomplete doctor_name--autocomplete" type="button" value="<Nom du praticien>" data-variant="standard"> — <input class="embed-autocomplete clinic_name--autocomplete" type="button" value="<Cabinet>" data-variant="standard"></p><p><strong>Patient :</strong> <input class="embed-autocomplete patient_name--autocomplete" type="button" value="<Nom du patient>" data-variant="standard"></p><p><strong>Zone(s) de traitement :</strong> ______________________________________</p><p></p><p>Le laser GentleMax Pro Plus est un appareil double longueur d'onde (755 nm et 1064 nm) utilisé notamment pour l'épilation. Le faisceau laser émis est absorbé par la mélanine de la tige pilaire et du bulbe, permettant de chauffer sélectivement et de détruire les structures primaires du poil.</p><p><strong>Résultats.</strong> Je suis conscient(e) que les résultats peuvent différer selon des facteurs individuels (antécédents médicaux, type de peau, respect des consignes pré/post-traitement). Aucune garantie ne peut être donnée quant au résultat final.</p><p><strong>Effets secondaires.</strong> Possibilité d'effets de courte durée (rougeurs, légères brûlures, hématomes, décolorations temporaires) et, plus rarement, d'effets tels qu'une hyperpilosité paradoxale, une stimulation pilaire, des cicatrices ou une décoloration permanente.</p><p><strong>Engagement.</strong> Je m'engage à suivre les instructions de soin pré et post-traitement et à respecter le délai de non-exposition au soleil avant et après le traitement.</p><p><strong>Séances &amp; tarifs.</strong> Le traitement comprend plusieurs séances, dont les tarifs m'ont été expliqués.</p><p><strong>Déclarations du patient :</strong></p><ul><li>Je déclare avoir été pleinement informé(e) des effets secondaires possibles.</li><li>Je reconnais que le traitement nécessite plusieurs séances et que les tarifs m'ont été expliqués.</li><li>Je certifie avoir été informé(e) de la nature et du but de la procédure et qu'aucune garantie de résultat ne peut m'être donnée.</li><li>Je consens à la prise de photographies et à leur utilisation anonyme (audit médical, formation, promotion).</li><li>Ma motivation est d'ordre esthétique et ma décision relève de ma seule volonté.</li></ul><p></p><p>Fait le <input class="embed-autocomplete signing_date--autocomplete" type="button" value="<Date de signature>" data-variant="standard">.</p><p><strong>Signature du patient</strong> (précédée de la mention manuscrite « Lu et approuvé ») :</p><p><input class="embed-autocomplete patient_sign--autocomplete" type="button" value="<Signature du patient>" data-variant="standard"></p><p></p><p style="text-align: center;"><span style="font-size: 10px; color: #888888;">——————————————————</span></p><p style="text-align: center;"><span style="font-size: 10px; color: #888888;"><input class="embed-autocomplete clinic_name--autocomplete" type="button" value="<Cabinet>" data-variant="standard"> — <input class="embed-autocomplete clinic_address--autocomplete" type="button" value="<Adresse>" data-variant="standard"></span></p></div><div class="page_footer"></div></div>
```

> La ligne « Zone(s) de traitement : ____ » est laissée en blanc **par défaut** — au moment de créer ce consentement, **demander au client** s'il veut en faire un autofill custom (liste à cocher des zones, texte libre, etc.) et le câbler. Cf. `documents.md §7` Étape 1bis pt 5.

## Création / mise à jour

- **Créer** : `oapi_clinic_survey_form_create` — `clinic_id`, `name`, `type = "treatment_consent"`, `note_tmpl = {"template": {"html": "<HTML ci-dessus>"}}`, `fields_tmpl = {"q": []}`.
- **Mettre à jour** : `oapi_survey_form_update` — `survey_form_id` + `note_tmpl` (préserve `fields_tmpl`). ✅ **L'update fonctionne** (débloqué par Marcin 25/06 ; si 403 réapparaît : utiliser les survey form tools avec `type=treatment_consent`).
- Puis **rattacher au type de traitement** (UI).

## Codes d'autofill standards

`patient_name` · `patient_birth_date` · `patient_address` · `clinic_name` · `clinic_address` · `doctor_name` · `doctor_speciality` · `create_date` · `signing_date` *(requis)* · `patient_sign` *(requis)* · `doctor_sign` · `treatment_planned_on_the` — chacun suffixé `--autocomplete`. Les autofills **custom** apparaissent en `__survey_<libellé>--autocomplete` dans la réponse après création.
