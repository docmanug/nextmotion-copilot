# Découverte — Phase d'enquête AVANT toute écriture de catalogue

> **Chargé en TÊTE du mode 🔧 Config**, en priorité sur un **compte vierge**.
>
> **Règle d'or.** Sur le **catalogue métier** (activité, motifs de consultation,
> traitements, prix), tu **enquêtes d'abord → tu proposes → tu écris seulement
> après validation**. Tu n'écris **JAMAIS** un pack générique par lot sans avoir
> mené cette découverte.
>
> Les défauts sûrs « fais et montre » restent valables pour la **plomberie
> technique** (formats, couleurs, TVA exonérée, structure HTML) — **pas** pour le
> contenu métier, qui est propre à chaque cabinet.

## Pourquoi cette phase existe

Un motif ou un tarif **générique** est du déchet : chaque cabinet a sa spécialité,
ses actes, ses prix. Créer un pack standard sans demander force le client à faire
le ménage derrière. Trois questions courtes suffisent à tout personnaliser — et
c'est exactement ce qu'un client attend d'un assistant de paramétrage.

## L'enquête — 3 volets, questions courtes, une idée à la fois

Ne pose pas les 3 blocs d'un coup : enchaîne naturellement, en rebondissant sur
les réponses. Zéro jargon (`shared/glossary.md`).

### 1. Activité

> « Avant de configurer, deux-trois questions pour coller à votre pratique.
> **Vous faites quoi principalement ?** Injectables (acide hyaluronique, toxine),
> laser, peeling, HydraFacial, HIFU, fils, chirurgie… ? Plusieurs, c'est normal. »

Retiens la/les spécialité(s) → elles orientent **à la fois** les motifs et les
traitements que tu proposeras.

### 2. Agenda + motifs de consultation

**Détecte d'abord si l'Agenda est actif** (feature `consult_digital.agenda`,
cf. `shared/feature-gating.md`). Adapte le discours :

- **Agenda actif** → « Vous avez l'agenda en ligne : vos **motifs de consultation**
  serviront **à la fois** à vos comptes-rendus **et** à la prise de rendez-vous en
  ligne. »
- **Agenda inactif / illisible** → « Vos **motifs de consultation** servent à
  structurer vos comptes-rendus de consultation. » *(ne parle pas de RDV en ligne
  si l'agenda n'est pas là)*

**Amorce n°1 — pars de ses motifs réservables en ligne (la source la plus fiable) :**

> « Le plus simple : **listez-moi les motifs de consultation que vos patients peuvent
> déjà réserver en ligne.** Si vous êtes sur **Doctolib**, reprenez vos motifs
> Doctolib ; sinon, ceux de votre page de prise de rendez-vous actuelle. Ça me donne
> exactement ce dont vous avez besoin. »

Ces motifs reflètent sa vraie activité et sa façon de faire réserver → c'est le
meilleur point de départ. Récupère la liste brute, tu la rangeras juste après dans
la hiérarchie NM à 3 niveaux.

**Explique la hiérarchie à 3 niveaux, avec un exemple concret** (c'est ainsi que NM
organise les motifs de consultation) :

| Niveau | Ce que c'est | Exemples |
|---|---|---|
| **Catégorie 1 (L1)** | grande zone / famille | **Visage**, **Silhouette** |
| **Catégorie 2 (L2)** | technique / acte | **Injection**, **Peeling**, **Radiofréquence**, Laser, HIFU |
| **Catégorie 3 (L3)** | le motif **réservable** précis | Injection → *Première consultation injection*, *Séance d'injection*, *Consultation de suivi*, *Consultation de contrôle* · Peeling → *Consultation peeling*, *Première séance peeling*, *Consultation de suivi peeling* |

> « Dans Nextmotion, vos motifs se rangent sur 3 niveaux : une **grande famille**
> (Visage, Silhouette), une **technique** (Injection, Peeling, Radiofréquence…), et
> le **motif précis que le patient réserve** (Première consultation, Séance de
> traitement, Consultation de suivi, Consultation de contrôle…). Je reprends votre
> liste et je vous la range comme ça — vous validez ou vous ajustez. »

Reformule SA liste dans cette structure, fais **valider**, **puis** crée
(cf. `references/catalogue.md` § 5 : L1 = catégorie, L2 = motif, L3 = sous-motif, tout
via MCP).

### 3. Traitements + tarifs (+ import Excel) + hiérarchie

Commence par proposer l'import, c'est le chemin le plus rapide :

> « Pour la facturation : vous avez une **liste de vos traitements avec les prix**
> — un fichier **Excel**, un doc, une capture d'écran ? Collez-la ici, je m'en occupe. »

**S'il n'a pas de liste**, explique la hiérarchie **avec un exemple concret** et
laisse-le remplir :

> « Dans Nextmotion, un traitement se décline en **sous-traitements**, et **c'est le
> sous-traitement qui porte le prix** (et le consentement). Par exemple, si vous
> faites des injectables :
> - **Traitement : Injection d'acide hyaluronique**
>   - sous-traitement : *Lèvres — 350 €*
>   - sous-traitement : *Pommettes — 350 €*
>   - sous-traitement : *2 seringues (volumateur) — 650 €*
>
> Vous préférez organiser autrement (par zone, par produit, par forfait de
> séances) ? Dites-le-moi, on fait du sur-mesure. »

Collecte, pour chaque traitement : ses **sous-traitements = { libellé, prix }**.
Prix manquant → `0,00 €` à compléter plus tard (jamais un prix inventé).

## Ce que tu fais des réponses

1. **Proposition ciblée** — reformule ce que tu vas créer, **à partir de SES
   réponses** (pas d'un pack standard) :
   > « Voici ce que je propose de créer pour votre cabinet : [ses motifs] +
   > [ses traitements avec sous-traitements et prix]. On valide, ou vous ajustez ? »
2. **Écris seulement après validation** → puis suis `references/catalogue.md`
   (motifs d'abord, traitements ensuite). Le **prix vit sur le sous-traitement**
   (= la ligne `pricings[]`).
3. **Fallback générique — uniquement si le client ne sait pas / veut aller vite :**
   > « Je peux partir d'une base type médecine esthétique et on l'ajuste ensemble ? »
   → alors seulement, propose `templates/motifs-defaults.md` comme **point de départ
   à ajuster** — jamais écrit tel quel sans un OK explicite.

## Mapping vers l'API (rappel technique — ne pas exposer au client)

| Concept métier (ce que dit le client) | Objet NM (API) | Où vit le prix |
|---|---|---|
| Grande famille / zone (Visage, Silhouette) | `visit_type_category` (L1) | — |
| Technique / acte (Injection, Peeling, RF…) | `visit_type` (L2) | — |
| Motif réservable précis (première conso, séance, suivi, contrôle) | `sub_visit_type` (L3) | — |
| Traitement | `treatment_type` | — |
| **Sous-traitement / ligne de tarif** (zone, volume, forfait…) | **`pricings[]`** d'un `treatment_type` | **ici** (`price` + `vat_rate` + consentement `survey_form`) |

Détail de création : `references/catalogue.md` (§ 5 motifs, § 4 traitements) ;
rattachement du consentement au sous-traitement : `references/documents.md` § Étape 4.
