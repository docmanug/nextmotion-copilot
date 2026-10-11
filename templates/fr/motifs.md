# Motifs de consultation — base à ajuster (médecine esthétique)

> **Point de départ, jamais un pack à écrire tel quel.** À utiliser seulement si le client ne sait pas quoi mettre ou veut aller vite
> (`references/decouverte.md`) : on ajuste avec lui (retirer, ajouter, renommer, changer une durée), il valide, puis tu crées
> (`references/catalogue.md` § 1). La base reprend le vocabulaire de l'assistant de démarrage, pour que le client reconnaisse ses mots.

## Structure
Catégorie › sous-catégorie (la technique) › visite (le motif que le patient réserve). Dans l'assistant de démarrage : catégories ›
motifs › sous-motifs. Couleur : une par catégorie (6 caractères, sans #), utilisée pour les sous-catégories.

## Règle des noms de visites (importante pour Consult IA)
**Chaque nom de visite est unique dans toute la clinique** et contient la technique. Quatre visites par technique, avec ces modèles
de noms (remplace `<technique>` par le nom court de la colonne « Nom court ») :
| Visite | Durée | Nom |
|---|---|---|
| Première consultation | 45 min | Première consultation `<technique>` |
| Séance | selon la technique (colonne Séance) | Séance `<technique>` |
| Suivi | 20 min | Suivi `<technique>` |
| Contrôle | 15 min | Contrôle `<technique>` |
Exemples : « Première consultation toxine », « Séance cryolipolyse », « Suivi peeling », « Contrôle skinbooster ». N'écris jamais deux
visites nommées « Consultation de suivi ». Garde un total raisonnable (une centaine de visites au plus) : ne crée que les techniques
que le client pratique. La durée d'une sous-catégorie par défaut est 30 minutes ; la marge entre deux patients se met **dans la durée
de la visite** (il n'y a pas de réglage de marge dans l'agenda).

## Catégories et techniques proposées par l'assistant de démarrage

### Visage (couleur `0071CE`)
| Sous-catégorie (technique) | Nom court | Séance |
|---|---|---|
| Injections acide hyaluronique | acide hyaluronique | 30 min |
| Toxine botulique | toxine | 20 min |
| Mésothérapie | mésothérapie visage | 30 min |
| Peelings | peeling | 30 min |
| Fils tenseurs | fils tenseurs | 60 min |
| PRP visage | PRP visage | 45 min |
| Skinbooster | skinbooster | 30 min |

### Silhouette / Corps (couleur `E67E22`)
| Sous-catégorie (technique) | Nom court | Séance |
|---|---|---|
| Cryolipolyse | cryolipolyse | 45 min |
| Radiofréquence | radiofréquence corps | 60 min |
| EMSculpt | EMSculpt | 30 min |
| Liposuccion douce | liposuccion douce | 90 min |

### Cheveux (couleur `9B59B6`)
| Sous-catégorie (technique) | Nom court | Séance |
|---|---|---|
| PRP capillaire | PRP capillaire | 45 min |
| Mésothérapie capillaire | mésothérapie capillaire | 30 min |
| Greffe FUE | greffe FUE | 240 min |
| Greffe FUT | greffe FUT | 240 min |

### Peau / Laser (couleur `E74C3C`)
| Sous-catégorie (technique) | Nom court | Séance |
|---|---|---|
| Laser CO2 | laser CO2 | 45 min |
| IPL | IPL | 30 min |
| Laser vasculaire | laser vasculaire | 30 min |
| Épilation laser | épilation laser | 30 min |

### Médecine Régénérative (couleur `27AE60`)
| Sous-catégorie (technique) | Nom court | Séance |
|---|---|---|
| PRP articulaire | PRP articulaire | 45 min |
| Cellules souches | cellules souches | 60 min |
| Exosomes | exosomes | 45 min |

### Consultations générales (facultatif, motifs sans technique)
| Sous-catégorie | Durée | Visites |
|---|---|---|
| Première consultation (bilan global) | 45 min | — |
| Téléconsultation | 30 min | seulement si le client a la visio intégrée (chat et visio) |
| Consultation chirurgie esthétique | 60 min | Consultation préopératoire (30) · Consultation postopératoire (20), si le praticien est chirurgien |

## Réglages à la création
- `display_in_appointment_form` (« RDV @ », visible sur la page de réservation en ligne) : **faux par défaut**. Passe à vrai seulement pour les
  visites que le client veut ouvrir au public, avec son accord (`references/agenda.md`).
- `display_in_agenda` vrai si l'Agenda est dans l'offre ; les autres canaux gardent leur valeur par défaut.
- Pas de prix sur les visites : les tarifs vivent sur les traitements (`references/catalogue.md` § 2).
- Doctolib : renseigne la spécialité de chaque catégorie (`references/catalogue.md` § 10).
