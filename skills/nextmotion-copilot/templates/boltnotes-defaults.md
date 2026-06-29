# BoltNotes — Modèles de bilans de consultation par défaut

> Ce fichier contient 2 modèles de BoltNote (formulaire de bilan de consultation structuré dans Nextmotion). Claude les propose lors de la configuration initiale. Le praticien peut les modifier librement dans l'interface Nextmotion après création.
>
> **BoltNote = un formulaire structuré** attaché à un type de traitement ou de motif. Il recueille des informations cliniques standardisées lors de la consultation. Dans Nextmotion, il est créé via `oapi_clinic_survey_form_create`.

---

## Modèle 1 : Bilan injection visage

**Nom suggéré dans Nextmotion :** `Bilan injection visage`

**Description :** Formulaire de recueil clinique pré-injection (HA et/ou toxine botulique). À remplir lors de la consultation d'évaluation ou en début de séance.

---

### Section 1 — Motif et objectifs

| Champ | Type de réponse |
|-------|----------------|
| Motif principal de consultation | Texte libre |
| Zone(s) souhaitée(s) par le patient | Cases à cocher : ☐ Front ☐ Glabelle ☐ Tempes ☐ Pattes d'oie ☐ Cernes ☐ Pommettes ☐ Sillon naso-labial ☐ Rides marionnettes ☐ Lèvres ☐ Menton ☐ Ovale du visage ☐ Autre |
| Résultat attendu (en mots du patient) | Texte libre |

---

### Section 2 — Antécédents et contre-indications

| Champ | Type de réponse |
|-------|----------------|
| Antécédents d'injection HA | Oui / Non |
| Si oui : date de la dernière injection | Date |
| Antécédents de toxine botulique | Oui / Non |
| Si oui : date de la dernière injection | Date |
| Antécédents de chirurgie esthétique du visage | Oui / Non |
| Si oui : préciser | Texte libre |
| Traitement anticoagulant ou antiagrégant en cours | Oui / Non |
| AINS ou aspirine dans les 7 derniers jours | Oui / Non |
| Allergie(s) connue(s) | Oui / Non |
| Si oui : préciser | Texte libre |
| Grossesse ou allaitement en cours | Oui / Non |
| Pathologie auto-immune évolutive connue | Oui / Non |
| Antécédents d'herpès labial ou facial | Oui / Non |

---

### Section 3 — Examen clinique pré-acte

| Champ | Type de réponse |
|-------|----------------|
| Phototype (Fitzpatrick) | Choix : I / II / III / IV / V / VI |
| Peau de la zone à traiter | Choix : Normale / Sèche / Mixte / Grasse / Sensibilisée |
| Tonus musculaire (zones toxine) | Choix : Faible / Moyen / Fort |
| Asymétrie préexistante notée | Oui / Non |
| Résultat de l'examen photographique pré-acte | Oui / Non / Non réalisé |
| Remarques cliniques spécifiques | Texte libre |

---

### Section 4 — Plan de traitement proposé

| Champ | Type de réponse |
|-------|----------------|
| Produit(s) retenu(s) | Texte libre (ex. HA réticulé marque X / Toxine Y) |
| Zone(s) retenues et volumes/doses prévus | Texte libre |
| Nombre de séances prévu(es) | Nombre entier |
| Consentement éclairé remis et signé | Oui / Non |
| Devis remis | Oui / Non |

---

### Section 5 — Résultat et suivi

| Champ | Type de réponse |
|-------|----------------|
| Résultat immédiat (coté par le praticien) | Choix : Excellent / Bon / Satisfaisant / À retoucher |
| Œdème post-injection | Choix : Aucun / Léger / Modéré |
| Hématome | Oui / Non |
| Rendez-vous de contrôle à J15 prévu | Oui / Non |
| Observations post-acte | Texte libre |

---

## Modèle 2 : Suivi post-acte

**Nom suggéré dans Nextmotion :** `Suivi post-acte`

**Description :** Formulaire de bilan de suivi après tout acte esthétique (injection, laser, peeling, soin). À remplir lors de la consultation de contrôle.

---

### Section 1 — Acte de référence

| Champ | Type de réponse |
|-------|----------------|
| Date de l'acte initial | Date |
| Type d'acte réalisé | Texte libre (ou liste : Injection HA / Toxine / Laser / Peeling / Autre) |
| Zone(s) traitée(s) | Texte libre |
| Délai depuis l'acte | Choix : J7 / J14 / J30 / J60 / J90 / Autre |

---

### Section 2 — Tolérance immédiate rapportée par le patient

| Champ | Type de réponse |
|-------|----------------|
| Douleur post-acte | Choix : Aucune / Légère / Modérée / Forte |
| Durée des douleurs | Texte libre |
| Œdème ou gonflement post-acte | Choix : Aucun / Léger (< 48h) / Prolongé (> 48h) |
| Hématomes | Oui / Non |
| Durée des hématomes (si oui) | Texte libre |
| Effets indésirables signalés par le patient | Texte libre |

---

### Section 3 — Résultat clinique au contrôle

| Champ | Type de réponse |
|-------|----------------|
| Satisfaction globale du patient | Choix : Très satisfait / Satisfait / Neutre / Insatisfait / Très insatisfait |
| Résultat estimé par le praticien | Choix : Excellent / Bon / Satisfaisant / Insuffisant / À retravailler |
| Symétrie du résultat | Choix : Symétrique / Légère asymétrie / Asymétrie à corriger |
| Persistance du résultat (pour les injections) | Choix : Bonne / Partielle / Dégradée |
| Anomalies constatées à l'examen | Oui / Non |
| Si oui : préciser | Texte libre |
| Photographies de contrôle réalisées | Oui / Non |

---

### Section 4 — Plan de suivi

| Champ | Type de réponse |
|-------|----------------|
| Retouche nécessaire | Oui / Non |
| Si oui : date prévue de la retouche | Date |
| Prochaine séance de traitement | Oui / Non |
| Si oui : délai recommandé | Texte libre (ex. « dans 4 mois ») |
| Observations et recommandations | Texte libre |
| Consentement mis à jour si retouche | Oui / Non / Non applicable |

---

## Comment utiliser ces modèles

1. **Claude crée ces BoltNotes** via `Nextmotion:oapi_clinic_survey_form_create` avec le contenu de ce fichier comme base.
2. **Le praticien les retrouve** dans Nextmotion : ⚙️ → BoltNotes → liste des formulaires.
3. **Modification** : les champs peuvent être ajoutés, supprimés ou réordonnés directement dans l'interface Nextmotion.
4. **Association** : chaque BoltNote peut être associé à un ou plusieurs types de traitements (via ⚙️ → Traitements → modifier → BoltNote associé).
