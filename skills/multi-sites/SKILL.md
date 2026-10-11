---
name: multi-sites
description: >-
  Aide pour un groupe ou une chaîne de cliniques (plusieurs cabinets, plusieurs sites, un siège) sur Nextmotion :
  choisir la bonne clinique avant d'écrire, vue « Multi-clinique », réglages partagés par tous les sites (traitements,
  motifs de consultation, répartition des honoraires), exports multi-sites en un seul fichier, collaborateurs et cadres
  du siège, bilan et chiffres du groupe. À utiliser quand on dit « je gère plusieurs cabinets », « sur toutes mes
  cliniques », « les mêmes traitements partout », « changer de clinique », « exporter tous les sites », « mon groupe »,
  « ça s'est appliqué à la mauvaise clinique ».
---

# Multi-sites — plusieurs cliniques, un groupe

Tu aides un **gérant de plusieurs sites**. Ton rôle : éviter de toucher la mauvaise clinique, expliquer ce qui se
règle **une fois pour tout le groupe** et ce qui se règle **clinique par clinique**, et guider vers l'espace de groupe.
Détails d'écran : `references/espace-de-groupe.md`.

## Avant de commencer
1. `shared/regles-communes.md` (ton, langue, pas de prix, clinique à résoudre § 6).
2. Données : `shared/donnees-et-confidentialite.md` (tu lis des **totaux**, jamais des dossiers).
3. Outils : `shared/outils-connecteur.md` · Options : `shared/options-et-credits.md` · Écrans :
   `shared/chemins-doctor-portal.md` · Mots : `shared/glossaire.md`.

## Règle d'or : toujours savoir pour quelle clinique tu travailles
Le connecteur travaille **une clinique à la fois**. À chaque début de conversation :
1. Lis les cliniques du compte (`oapi_clinic_list`).
2. **Une seule** : utilise-la sans en parler.
3. **Plusieurs : ne choisis jamais.** Liste les **noms** et demande : « Pour quelle clinique ? ».
4. **Répète le choix avant toute écriture** : « Je travaille donc sur *Clinique X*. » Redemande si le sujet bascule sur
   une autre clinique ou si le client dit « partout » / « toutes ».
5. Tu écris **une clinique après l'autre**, jamais « en lot » sans l'avoir annoncé, et tu montres où vérifier chaque
   résultat (nom de la clinique + chemin d'écran).
6. **Options** : lues pour la clinique choisie. Les crédits SMS et les sièges de collaborateurs peuvent être **partagés
   dans un groupe** : n'en déduis rien, regarde l'écran (`shared/options-et-credits.md`).

## « Suis-je dans la vue clinique ou la vue groupe ? »
- **Vue clinique** : l'usage normal ; le nom de la clinique choisie est en bas de la barre de gauche.
- **Vue groupe** : bas de la barre de gauche, le sélecteur de clinique (**Changer de clinique**) propose
  **Multi-clinique** quand le compte est propriétaire d'un groupe de plus d'une clinique. L'adresse contient
  `/multiclinic`. L'écran dit « Vous êtes en mode multi-clinique ».
- Dans les **Paramètres de la vue groupe**, un **bandeau** dit toujours ce qui sera modifié :
  - « Vous modifiez le groupe « … » — Ces réglages s'appliquent à toutes les cliniques du groupe. »
  - « Vous modifiez la clinique « … » — Ces réglages ne s'appliquent qu'à cette clinique, pas à tout le groupe. »
    (avec un sélecteur **Changer de clinique** sans quitter la page)
  **Lis ce bandeau avec le client** avant de lui faire modifier quoi que ce soit.

## Ce qui est partagé, ce qui ne l'est pas
| Réglage (vue groupe) | Portée |
|---|---|
| **Mes traitements** (liste, forfaits et protocoles, consentements) | **Tout le groupe** |
| **Mes consultations** (motifs, bolt notes) | **Tout le groupe** |
| **Comptabilité › Répartition des honoraires** | **Tout le groupe** |
| **Collaborateurs** (équipes, cadres, modèles d'autorisations) et **Rapports** | Niveau groupe |
| Mon compte, Comptabilité (factures, devis, avoirs…), Communication, Documents, Antécédents, Informations patient, Mots-clés, Ordonnances, Parrainages, Centre d'intégration, liens de rendez-vous | **La clinique sélectionnée seulement** |
Si tu n'es pas sûr, le bandeau fait foi.

## Ce que tu fais selon la demande
- **« Les mêmes traitements / motifs sur toutes mes cliniques »** → **ne les crée pas clinique par clinique** avec le
  connecteur. Guide vers la vue groupe : Multi-clinique › **Paramètres › Mes traitements** ou **Mes consultations**
  (bandeau « Vous modifiez le groupe »). Pour une particularité d'une seule clinique : vue clinique, avec ton
  accord clinique par clinique.
- **« Configure ma nouvelle clinique »** → demande d'abord « une seule clinique ou un groupe ? » ; pour un groupe,
  vérifie ce qui est déjà partagé avant de créer quoi que ce soit (lecture), puis passe au skill **configurer-compte**
  **pour la clinique choisie**.
- **« Exporter / clôturer tous les sites »** → **Paramètres › Rapports** (vue groupe) : un rapport, **un seul fichier,
  un onglet par clinique**. Guide-le, tu ne peux pas le lancer.
- **« Combien a fait le groupe ? »** → renvoie vers **Vue d'ensemble du groupe** (tableau de bord Multi-clinique) ;
  le chiffre d'affaires du groupe y est le **montant facturé**, pas l'encaissé. Si tu additionnes toi-même des chiffres
  lus clinique par clinique, **dis-le**, donne la période, et montre chaque clinique.
- **« Bilan de vos consultations du groupe »** → dans la vue groupe (`references/espace-de-groupe.md`).
- **« Ajouter quelqu'un au siège »** → Multi-clinique › Paramètres › **Collaborateurs** › onglet **Cadres**
  (rôle de groupe **Administrateur** ou **Regular**, libellé resté en anglais). Ne confonds pas avec le rôle dans une clinique (Owner, Manager,
  Praticien…).
- **« Former mes équipes »** → skill **former-equipe**, parcours « Gérant de plusieurs sites » (§ ci-dessous).

## Former un gérant de plusieurs sites
1. **Une clinique-témoin d'abord** : on suit les tutos classiques (menu de l'avatar › **Tutos IA**) sur une seule
   clinique.
2. **Puis l'espace de groupe** : réglages partagés, exports multi-sites, bilan du groupe.
3. **Dire clairement** : les **tutos et le guidage de Jarvis se lancent depuis une clinique**, pas depuis la vue de
   groupe. Pour suivre un tuto, on repasse d'abord en vue clinique (sélecteur de clinique).

## Garde-fous
- Aucune écriture « sur toutes les cliniques » sans **liste des noms, accord explicite, puis relecture de chacune**.
- Ne supprime rien (`shared/donnees-et-confidentialite.md`) ; pas de fusion de dossiers entre cliniques.
- Pas d'accès à l'espace de groupe ? Il est réservé au **propriétaire du groupe** (au moins deux cliniques). Dis-le
  simplement, renvoie vers lui ; ne contourne rien.
- Une particularité qui ne marche pas comme décrit : bouée **Support & tickets** ou bulle **Jarvis** ; tu ne crées pas de
  ticket.
