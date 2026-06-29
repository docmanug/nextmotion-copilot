# Catalogue — Motifs, Traitements & Tarifs (sections 5, 4, 6, 13, 25)

> **Module 2 du parcours — après les fondations.**
> Prérequis : ≥1 praticien créé (fondations § 3).
> Ce module consomme : `shared/mcp-map.md` · `templates/motifs-defaults.md` · `templates/boltnotes-defaults.md`.

**Ordre impératif :** motifs de consultation d'abord, traitements et tarifs ensuite. C'est l'ordre du vrai wizard Nextmotion — les motifs structurent l'agenda ; les traitements et tarifs y sont liés ensuite.

**Réglages avancés (à la demande, hors onboarding standard) :** BoltNotes (§ 6), protocoles (§ 13), inventaire (§ 25). Claude les propose après avoir fini les motifs et traitements si le client le souhaite.

> **Résilience lecture motifs :** `oapi_clinic_visit_type_list` peut être temporairement illisible (incident serveur — cf. `shared/known-issues.md`). Ne montre pas l'erreur et ne bloque pas.
> **À savoir : « activer un motif à l'agenda » = le champ `display_in_agenda` via `oapi_visit_type_update` (une écriture, qui FONCTIONNE).** Le seul obstacle quand la liste est illisible, c'est d'**obtenir les IDs** des motifs déjà existants (ce que `visit_type_list` fournirait) — pas l'activation elle-même.
> Replis : les **catégories** (`oapi_clinic_visit_type_category_list`) et **sous-motifs** (`oapi_clinic_sub_visit_type_list`) restent lisibles ; et tu connais les IDs des motifs que **tu crées** (ils sont renvoyés à la création) → tu peux les activer directement. Pour **activer en masse des motifs préexistants** que tu ne peux pas énumérer : propose au client de cocher l'affichage agenda depuis l'écran **Catalogue → Motifs de consultation** de Nextmotion, ou fais-le dès que la lecture remarche. Ne prétends jamais l'avoir fait si tu n'as pas pu.

---

## Section 5 — Motifs de consultation (L1 / L2 / L3)

**Niveau MCP : 🟡 Partielle.**
- L1 (catégories) et L2 (motifs) → MCP complet ✅
- **L3 (sous-motifs) → guidage UI uniquement** (MCP lecture seule pour les lire, pas les créer)

### Étape 1 — Proposer les défauts

Claude propose les motifs types du pack modèles :

> « Je vous ai préparé les motifs de consultation les plus courants en médecine esthétique. On va les créer en une fois. Vous pouvez en retirer, en ajouter, ou modifier les durées. »

Référence : `templates/motifs-defaults.md` — catégories et motifs recommandés :

| Catégorie (L1) | Motifs inclus (L2) |
|----------------|-------------------|
| Consultations générales | Première consultation (45 min), Suivi/contrôle (15 min) |
| Injections | HA (30 min), Toxine botulique (30 min), Injections combinées (45 min) |
| Soins & technologies | Laser (30 min), Peeling chimique (30 min), HIFU (60 min) |
| Actes spécifiques | Retouche/complémentation (20 min) |

> « On crée tout ça maintenant ? Vous pouvez me dire ce que vous voulez retirer ou modifier. »

### Étape 2 — Créer les catégories L1 via MCP

Pour chaque catégorie validée :

```
Nextmotion:oapi_clinic_visit_type_category_create
→ Paramètres réels (vérifiés en prod 25/06) :
  - clinic_id (requis)
  - name (requis, ex. "Injections")
  - speciality (optionnel, ENUM) : ex. `aesthetic_doctor`, `plastic_surgeon`, `dermatologist`, `injecting_nurse`…
```

> ⚠️ **Pas de `color` sur la catégorie** (le skill l'indiquait à tort). La couleur se met sur le **motif L2** (`visit_type`), pas sur la catégorie L1.

### Étape 3 — Créer les motifs L2 via MCP

Pour chaque motif dans sa catégorie :

```
Nextmotion:oapi_clinic_visit_type_create
→ Paramètres réels (vérifiés en prod 25/06) :
  - clinic_id (requis)
  - subject (REQUIS — c'est le NOM du motif, PAS `name`)
  - color (REQUIS — HEX 6 car. SANS `#`, ex. `3498db`)
  - category (ID catégorie L1 — PAS `visit_type_category_id`)
  - duration_minutes (entier — PAS `duration`)
  - display_in_agenda (true si agenda actif)
  - sub_visit_types : [ {subject, duration_minutes, color?…}, … ]  ← crée les L3 EN MÊME TEMPS (voir ci-dessous)
```

> ⚠️ **Le skill disait à tort** `name/visit_type_category_id/duration`. Les vrais noms sont **`subject` / `category` / `duration_minutes`**, et **`color` est REQUIS** (hex 6 car. sans `#`).

**Défaut sûr :** `display_in_agenda: true` si la feature agenda est active, `false` sinon.

### Étape 4 — Réordonner si besoin

Pour mettre les motifs dans l'ordre d'affichage souhaité :

```
Nextmotion:oapi_clinic_visit_type_reorder
→ Paramètres : ordered list d'IDs de motifs
```

Défaut : laisser dans l'ordre de création.

### Étape 5 — Modifier une catégorie ou un motif si besoin

```
Nextmotion:oapi_visit_type_category_update  → modifier une catégorie L1
Nextmotion:oapi_visit_type_update           → modifier un motif L2
```

### ✅ L3 Sous-motifs — CRÉABLES via MCP (correction 25/06)

> ⚠️ **Le skill disait à tort que les L3 étaient « UI uniquement ».** **FAUX, vérifié en prod le 25/06** : les sous-motifs se créent **directement via l'API**, de deux façons :

**(a) En même temps que le motif L2** — passe le tableau `sub_visit_types` dans `oapi_clinic_visit_type_create` :
```
oapi_clinic_visit_type_create(
  clinic_id, subject="Injection acide hyaluronique", color="3498db", category=<L1>, duration_minutes=30,
  sub_visit_types=[
    {subject:"Lèvres", duration_minutes:30},
    {subject:"Pommettes", duration_minutes:30},
    {subject:"Sillons nasogéniens", duration_minutes:30},
    {subject:"Cernes", duration_minutes:30}
  ])
```
Chaque sous-motif (item) exige au minimum **`subject` + `duration_minutes`** ; `color`/`display_in_agenda`/`price` optionnels. Les IDs L3 sont renvoyés à la création.

**(b) Sur un motif existant** — `oapi_visit_type_update` avec la liste complète `sub_visit_types` (item avec `id` = mis à jour, sans `id` = créé, omis = supprimé).

Lecture : `oapi_clinic_sub_visit_type_list` / `oapi_visit_type_retrieve`.

> Conséquence : ne renvoie plus le client en UI pour les sous-motifs — propose-les et crée-les toi-même (liste à cocher des zones, puis création par lot). L'UI reste un repli si l'API est indisponible.

### Vérification motifs

```
Nextmotion:oapi_clinic_visit_type_category_list  → confirmer les catégories L1
Nextmotion:oapi_clinic_visit_type_list           → confirmer les motifs L2
```

> « Voici les motifs créés : [liste]. On passe maintenant aux traitements et tarifs. »


---

## Section 4 — Traitements & Tarifs

**Niveau MCP : ✅ Écriture complète.**

### Ce que c'est (sans jargon)

> « Un "type de traitement" dans Nextmotion, c'est un soin ou un acte avec son prix. Par exemple : "Injection lèvres HA — 350 €". C'est ce qui apparaît sur vos devis et factures. »

**Différence motif vs traitement :**
- Motif = pourquoi le patient vient (pour l'agenda)
- Traitement = ce que vous faites et ce que vous facturez (pour la compta)
- À la fin de ce module, on les lie ensemble.

### Étape 1 — Proposer les défauts

Claude propose une liste de traitements types basée sur les motifs créés :

> « Je vous propose des types de traitements qui correspondent à vos motifs. Vous me donnez les prix et je crée tout. »

Exemple pour un cabinet injections :

| Traitement | Prix TTC suggéré | Zone |
|------------|-----------------|------|
| Injection HA lèvres | à renseigner | Lèvres |
| Injection HA pommettes | à renseigner | Pommettes |
| Injection toxine front | à renseigner | Front |
| Injection toxine glabelle | à renseigner | Glabelle |

> « Vous me donnez vos tarifs ? Pour chaque traitement, je crée la fiche. »

### Étape 2 — Créer les traitements via MCP

```
Nextmotion:oapi_clinic_treatment_type_create
→ Paramètres réels (vérifiés en prod 25/06) :
  - clinic_id (requis)
  - name (requis, ex. "Injection HA — Lèvres")
  - pricings : [ … ]  ← le PRIX vit ICI, dans un tableau (voir ci-dessous). PAS de `price` à plat, PAS de `vat_rate` à plat.
  - visit_type (ID du motif L2 lié — SINGULIER, PAS `visit_type_ids`)
  - sub_visit_type (ID du sous-motif lié, optionnel — doit appartenir au visit_type)
```

**⚠️ Le prix = un tableau `pricings`, en décimal (PAS en centimes), TVA INCLUSE dans `price` :**
```
pricings: [
  { details: "1 seringue (1 ml)", price: "350.00", vat_rate: "0", sessions: 1 },
  { details: "2 seringues",       price: "650.00", vat_rate: "0", sessions: 1 }
]
```
- **`price`** = décimal string TTC (`"350.00"`), **JAMAIS** des centimes (`35000` est faux).
- **`vat_rate`** = pourcentage (`"0"` pour la médecine esthétique exonérée), **requis dans chaque pricing**.
- **`details`** = **le NOM de la variante de tarif** (« 1 seringue », « Forfait 3 séances »…). C'est ce qui s'affiche.
- **`sessions`** = nb de séances incluses (forfaits/cures, ex. `3`).
- **Plusieurs tarifs nommés par traitement = la norme.** Un traitement peut (doit souvent) avoir 2-3 `pricings`.

> ⚠️ **Le skill disait à tort** `price` en centimes + `vat_rate` à plat + `visit_type_ids[]`. **FAUX** : prix décimal dans `pricings[]`, liaison via **`visit_type`** (singulier) + `sub_visit_type`.

**Défaut sûr TVA :** médecine esthétique = exonérée → `vat_rate: "0"`. À vérifier avec le comptable.

**Défaut prix :** prix inconnu → `price: "0.00"` (à compléter plus tard). Propose toujours **plusieurs variantes nommées** au client (par volume, par zone, par forfait de séances).

### Étape 3 — Mettre à jour un traitement

```
Nextmotion:oapi_treatment_type_update
→ Paramètres : id du traitement + champs à modifier
```

### Étape 4 — Lier traitements ↔ motifs

La liaison se fait **dès la création** (`visit_type` + `sub_visit_type` dans `treatment_type_create`). Pour la modifier après coup :

```
Nextmotion:oapi_treatment_type_update
→ Paramètres : treatment_type_id + name + visit_type (singulier) + sub_visit_type (optionnel)
→ Pour les tarifs : renvoyer la liste COMPLÈTE `pricings` (item avec `id` = modifié, sans `id` = créé, omis = supprimé)
```

> ⚠️ Pas de `visit_type_ids[]` (pluriel) — c'est **`visit_type`** (un seul motif par traitement) + `sub_visit_type` optionnel.

> « J'ai lié vos traitements à vos motifs de consultation. Maintenant quand un patient vient pour "Injections HA", vous voyez directement les traitements et tarifs associés. »

### Rattachement consentements et fiches info aux tarifs

> **Important :** dans Nextmotion, les consentements éclairés et les fiches d'information patient se rattachent **à la ligne de tarif** (le pricing), pas seulement au type de traitement. Ce rattachement se fait dans le module Documents (après avoir créé tes consentements).

On y reviendra dans `references/documents.md` — garde ça en tête.

### Vérification traitements

```
Nextmotion:oapi_clinic_treatment_type_list  → confirmer les traitements
Nextmotion:oapi_treatment_type_retrieve     → détails d'un traitement (inclut les liens motifs)
```

---

## Section 6 — BoltNotes *(réglage avancé, à la demande)*

**Niveau MCP : ✅ Écriture complète.** Proposé seulement si le client le demande ou après le cœur.

> « Les BoltNotes, c'est des formulaires de consultation structurés — comme un questionnaire médical que vous remplissez à chaque RDV pour suivre l'évolution du patient. Ce n'est pas obligatoire pour commencer, mais ça peut vous aider. Voulez-vous qu'on les configure maintenant ? »

Si oui, Claude propose les 2 modèles du pack : `templates/boltnotes-defaults.md`
- Modèle 1 : Bilan injection visage
- Modèle 2 : Suivi post-acte

```
Nextmotion:oapi_clinic_survey_form_create
→ Paramètres : name, type ("bolt_note"), questions (structure du formulaire)

Nextmotion:oapi_survey_form_update     → modifier un formulaire existant
Nextmotion:oapi_clinic_survey_form_list → lister les formulaires
Nextmotion:oapi_survey_form_retrieve   → détails d'un formulaire
```

Vérification : après création, lister les BoltNotes créés et confirmer.

---

## Section 13 — Protocoles *(réglage avancé, à la demande)*

**Niveau MCP : ✅ Écriture complète.** Requis : feature `consult_digital.accounting` active.

> « Un protocole (ou "forfait"), c'est un ensemble de traitements avec un tarif global — par exemple "Pack rajeunissement 3 séances" à 900 €. C'est optionnel. Voulez-vous en créer ? »

Si oui, et si `consult_digital.accounting` est active :

```
Nextmotion:oapi_clinic_treatment_package_create
→ Paramètres : name, description, price, treatment_type_ids

Nextmotion:oapi_treatment_package_item_create  → ajouter un item au protocole
Nextmotion:oapi_treatment_package_item_update  → modifier un item
Nextmotion:oapi_treatment_package_update       → modifier le protocole
Nextmotion:oapi_clinic_treatment_package_list  → lister les protocoles
Nextmotion:oapi_treatment_package_retrieve     → détails d'un protocole
Nextmotion:oapi_treatment_package_item_list    → lister les items d'un protocole
```

Vérification : lister les protocoles créés et confirmer le contenu de chacun.

---

## Section 25 — Inventaire *(réglage avancé, à la demande)*

**Niveau MCP : ✅ Écriture complète.** Proposé seulement si le client gère un stock de produits.

> « L'inventaire vous permet de gérer le stock de produits que vous utilisez (seringues, produits, consommables). Ce n'est pas obligatoire pour commencer. Voulez-vous qu'on le configure ? »

Si oui :

```
Nextmotion:oapi_clinic_product_create
→ Paramètres : name, reference, quantity, unit_price

Nextmotion:oapi_clinic_product_update   → modifier un produit
Nextmotion:oapi_clinic_product_list     → lister les produits
Nextmotion:oapi_clinic_product_retrieve → détails d'un produit
```

Vérification : lister les produits créés.

---

## Récapitulatif — Ce qui a été créé

À la fin du catalogue, Claude liste :

```
✅ Motifs de consultation (L1/L2) :
   - [N] catégories créées
   - [N] motifs créés
   ⚠️ Sous-motifs L3 : à créer dans l'interface si souhaité
      → ⚙️ Consultations → motif L2 → Sous-motifs

✅ Traitements et tarifs :
   - [N] traitements créés
   - Liaisons motifs ↔ traitements : [OK / à compléter]

[Si créés à la demande :]
✅ BoltNotes : [N] créés
✅ Protocoles : [N] créés
✅ Inventaire : [N] produits créés
```

---

## Prochaine étape

Une fois le catalogue validé : **→ `references/documents.md`** (consentements éclairés, puis documents administratifs).

> « Super, votre catalogue est en place. On passe maintenant aux consentements et aux documents — devis, factures. »
