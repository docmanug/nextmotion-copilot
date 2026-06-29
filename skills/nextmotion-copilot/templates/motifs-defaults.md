# Motifs de consultation — Modèles par défaut (médecine esthétique FR)

> Ce fichier liste les motifs de consultation types proposés par Claude lors de la configuration initiale d'un compte Nextmotion. Il couvre les actes courants en médecine esthétique française. Le praticien peut supprimer, modifier ou ajouter des motifs.

---

## Rappel : hiérarchie des motifs dans Nextmotion

Nextmotion utilise une structure à 3 niveaux pour organiser les consultations :

| Niveau | Nom dans NM | Description | MCP |
|--------|-------------|-------------|-----|
| **L1** | Catégorie de consultation | Regroupement par grande famille d'actes | ✅ `oapi_clinic_visit_type_category_create` |
| **L2** | Motif de consultation | L'acte ou la raison de venue du patient | ✅ `oapi_clinic_visit_type_create` |
| **L3** | Sous-motif | Précision du motif (ex. zone anatomique) | ✅ via `oapi_clinic_visit_type_create` (tableau `sub_visit_types`) |

**Règle pratique :** commencer par créer les catégories (L1), puis les motifs (L2), puis les sous-motifs (L3) — **les trois niveaux se créent via MCP** (les L3 en passant le tableau `sub_visit_types` à `oapi_clinic_visit_type_create`). L'UI reste un repli si l'API est indisponible.

---

## Catégories L1 et motifs L2 recommandés

### 🏥 Catégorie : Consultations générales

| Motif (L2) | Durée par défaut | Notes |
|------------|-----------------|-------|
| **Première consultation** | 45 min | Bilan global, photos, antécédents, projet thérapeutique |
| **Suivi / contrôle** | 15 min | Vérification résultat, retouche mineure, bilan |
| **Téléconsultation** | 30 min | À activer si feature téléconsult active |

---

### 💉 Catégorie : Injections

| Motif (L2) | Durée par défaut | Notes |
|------------|-----------------|-------|
| **Injections d'acide hyaluronique (HA)** | 30 min | Lèvres, pommettes, sillons, tempes, ovale |
| **Injections de toxine botulique** | 30 min | Front, glabelle, pattes d'oie, menton |
| **Injections combinées (HA + toxine)** | 45 min | Séance mixte — à proposer pour le visage complet |
| **Mésolift / mésothérapie** | 30 min | Micro-injections hydratation et éclat |
| **Biostimulateurs (Radiesse, Sculptra…)** | 45 min | Selon spécialités disponibles en cabinet |
| **PRP (plasma riche en plaquettes)** | 45 min | Préparation + injection |

---

### ✨ Catégorie : Soins & technologies

| Motif (L2) | Durée par défaut | Notes |
|------------|-----------------|-------|
| **Laser** | 30 min | Vasculaire, pigmentaire, épilation, remodelage |
| **Peeling chimique** | 30 min | Superficiel à moyen |
| **Radiofréquence** | 45 min | Raffermissement cutané |
| **HIFU (ultrasons focalisés)** | 60 min | Lifting non-chirurgical visage et corps |
| **Dermabrasion / microdermabrasion** | 30 min | Lissage mécanique |
| **Microneedling** | 45 min | Avec ou sans PRP |
| **Lipolyse par injection** | 30 min | Phosphatidylcholine ou équivalent |

---

### 📋 Catégorie : Actes spécifiques

| Motif (L2) | Durée par défaut | Notes |
|------------|-----------------|-------|
| **Consultation chirurgie esthétique** | 60 min | Si le praticien est chirurgien |
| **Consultation préopératoire** | 30 min | Bilan avant intervention |
| **Consultation postopératoire** | 20 min | Suivi après chirurgie |
| **Traitement de la transpiration excessive** | 30 min | Toxine botulique axillaire ou palmaire |
| **Retouche / complémentation** | 20 min | Ajustement de résultat entre 15 et 30 jours |

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
