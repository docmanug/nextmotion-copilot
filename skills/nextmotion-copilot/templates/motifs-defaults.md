# Motifs de consultation — Modèles par défaut (médecine esthétique FR)

> **Base à AJUSTER — pas un pack à écrire tel quel.** Ce fichier liste des motifs
> types de médecine esthétique FR, utilisés **uniquement en fallback** de la Phase
> Découverte (`references/decouverte.md`) : quand le client ne sait pas quoi mettre
> ou veut aller vite. Le chemin normal, c'est de partir de **SES** motifs (recueillis
> en Découverte). Ici, on part de cette base et **on l'ajuste avec lui avant de
> créer** (retirer, ajouter, renommer, changer les durées).

---

## Rappel : hiérarchie des motifs dans Nextmotion

Nextmotion utilise une structure à 3 niveaux pour organiser les consultations :

| Niveau | Nom dans NM | Ce que c'est | Exemples | MCP |
|--------|-------------|--------------|----------|-----|
| **L1** | Catégorie | Grande **famille / zone** | Visage, Silhouette | ✅ `oapi_clinic_visit_type_category_create` |
| **L2** | Motif | **Technique / acte** | Injection, Peeling, Laser, Radiofréquence, HIFU | ✅ `oapi_clinic_visit_type_create` |
| **L3** | Sous-motif | Le **motif réservable précis** | Première consultation, Séance de traitement, Consultation de suivi, Consultation de contrôle | ✅ MCP direct (tableau `sub_visit_types`) |

**Règle pratique :** créer les catégories/zones (L1), puis les motifs/techniques (L2) dans chaque zone, avec leurs sous-motifs réservables (L3) passés dans le tableau `sub_visit_types` — **tout via MCP** (cf. `references/catalogue.md` § 5).

---

## Structure recommandée par zone (L1 → L2 → L3)

Le pack suit le modèle NM : **zone (L1) → technique (L2) → motif réservable (L3)**.
Chaque technique reçoit en général les mêmes **sous-motifs réservables** :
*Première consultation*, *Séance de traitement*, *Consultation de suivi*,
*Consultation de contrôle* (adapte le libellé à la technique). Durées indicatives, à ajuster.

### 🙂 L1 : Visage

| Motif (L2 — technique) | Durée | Sous-motifs réservables (L3) |
|------------------------|-------|------------------------------|
| **Injection** (acide hyaluronique, toxine…) | 30 min | Première consultation injection (45) · Séance d'injection (30) · Consultation de suivi (20) · Consultation de contrôle (15) |
| **Peeling** | 30 min | Consultation peeling (30) · Première séance peeling (30) · Consultation de suivi (20) |
| **Laser** (visage) | 30 min | Première consultation laser (30) · Séance de laser (30) · Consultation de contrôle (15) |
| **Radiofréquence / HIFU visage** | 60 min | Consultation (30) · Séance (60) · Consultation de suivi (20) |
| **Mésothérapie / PRP / microneedling** | 30 min | Consultation (30) · Séance (30) · Suivi (20) |

### 🧍 L1 : Silhouette

| Motif (L2 — technique) | Durée | Sous-motifs réservables (L3) |
|------------------------|-------|------------------------------|
| **HIFU / Radiofréquence corps** | 60 min | Consultation (30) · Séance (60) · Suivi (20) |
| **Cryolipolyse** | 45 min | Consultation (30) · Séance (45) · Suivi (20) |
| **Lipolyse injectable / mésothérapie corps** | 30 min | Consultation (30) · Séance (30) · Suivi (20) |

### 📋 L1 : Consultations générales *(optionnel — motifs non liés à une technique)*

| Motif (L2) | Durée | Sous-motifs (L3) |
|------------|-------|------------------|
| **Première consultation** (bilan global) | 45 min | — |
| **Téléconsultation** | 30 min | — (si feature téléconsult active) |
| **Consultation chirurgie esthétique** | 60 min | Préopératoire (30) · Postopératoire (20) — si le praticien est chirurgien |

---

## Durées recommandées (synthèse)

| Type de consultation | Durée recommandée |
|---------------------|-------------------|
| Première consultation | **45 min** |
| Injections (HA ou toxine, séance simple) | **30 min** |
| Injections combinées / complexes | **45 min** |
| Laser | **30 min** |
| Soins technologiques longs (HIFU, RF) | **60 min** |
| Suivi / contrôle | **15 min** |

---

## Notes de configuration

- **Durée tampon** : penser à activer un délai tampon entre séances (ex. 5–10 min) dans la configuration de l'agenda si le praticien a besoin de temps entre deux patients.
- **Consultation = base tarifaire** : chaque motif L2 peut être lié à un ou plusieurs types de traitements avec leur tarif. Créer d'abord les motifs, puis les traitements, puis les associer.
- **Ordre d'affichage** : les catégories et motifs peuvent être réordonnés dans Nextmotion après création.
