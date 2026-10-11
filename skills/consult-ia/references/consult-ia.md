# Consult IA — les fonctions IA, l'enregistrement d'une consultation, le paramétrage

> Règles de ton, de données et d'options : `shared/regles-communes.md`, `shared/donnees-et-confidentialite.md`,
> `shared/options-et-credits.md`. Chemins d'écran : `shared/chemins-doctor-portal.md`.
> Ici : tu **expliques et tu guides**. Tu ne lances pas d'enregistrement et tu ne lis pas le contenu des consultations
> (règle des données).

## 1. Les fonctions IA en une page

« Consult IA » et « Copilot IA » sont **la même fonction** : sur le web le bouton s'appelle **Copilot IA**, sur iPhone/iPad
et dans les tutos **Consult IA**. Elle ne se confond pas avec toi (le plugin « Nextmotion Copilot »).

| Fonction | Ce que ça fait | Où | Inclus dans |
|---|---|---|---|
| **Consult IA** | Écoute la consultation, la transcrit, remplit le dossier | Web : dossier patient › **Ouvrir Copilot IA** ; iPhone/iPad : bouton ⚡ › **Consultation IA** | l'option **Copilot IA** (minutes selon l'offre) |
| **Dictée** | Vous dictez, l'IA met en forme | Note de consultation, barre ⌘K | l'option **Copilot IA** (minutes) |
| **Barre ⌘K « Demander à l'IA »** | Lance des actions à partir d'une phrase | Toutes les pages | toutes les cliniques |
| **Jarvis** | Assistant en bulle : répond, montre le chemin | Bas droite de l'écran | toutes les cliniques |
| **Nextmotion Local** | Fait tourner l'IA sur un Mac du cabinet | Paramètres › IA | disponible, sans minutes décomptées |
| **Téléphonie IA** | Un agent répond au téléphone du cabinet | Paramètres › Téléphonie | l'option **Téléphonie IA** |
| **Analyse de peau** | Analyse IA d'une photo de peau | App iPhone | l'option **Analyse de peau** |
| **Bilan de vos consultations** | Rapport mensuel sur ce qui s'est dit | Tableau de bord | clients **Consult IA** |

Pour savoir ce qu'une clinique a : `oapi_clinic_feature_list` (voir `shared/options-et-credits.md`). Si la lecture échoue,
**n'affirme rien** et demande au client ce qu'il voit (un cadenas = fonction non incluse). Aucun prix, jamais.
Pas d'achat d'option à proposer avant la fin du parcours d'installation du client.

Détail : dictée, ⌘K, Jarvis → `references/dictee-cmdk-jarvis.md` · IA sur Mac → `references/nextmotion-local.md` ·
bilan, tableau de bord, téléphonie, peau → `references/rapports-et-bilan.md` · pannes → `references/depannage-ia.md`.

## 2. Enregistrer une consultation sur le web

**À dire d'abord : testez sur un patient d'essai.** « Terminer » écrit pour de vrai dans le dossier.

1. Ouvrez le **dossier du patient**.
2. Dans la barre du haut, cliquez sur l'étoile **Ouvrir Copilot IA**. La fenêtre « Enregistrement Copilot IA » a trois
   onglets : **Transcription**, **Zones**, **Instructions**.
3. Onglet **Zones** : cochez ce que l'IA doit remplir (voir § 3).
4. Onglet **Transcription** : choisissez le **Micro** (par défaut « Micro par défaut du système »), puis
   **Démarrer l'écoute**. L'écran affiche « En cours d'écoute » et la « Transcription en direct ».
5. **Pause** / **Reprendre** autant que nécessaire (« Écoute en pause »).
6. **Terminer**. L'écran dit « Synchronisation en cours… » puis « Votre transcription a été synchronisée avec succès ».
   Le résultat arrive dans le dossier sans recharger la page. **Il n'y a pas de relecture avant l'envoi.**

Navigateur : Chrome, Edge ou Safari à jour, sur app.nextmotion.net. Le micro est rarement la cause d'un souci : voir
`references/depannage-ia.md`.

### Après « Terminer » : où regarder
- Carte **Dernière visite** : le compte rendu. Le **Journal** : la consultation créée (à l'heure réelle).
- **Plan de traitement**, **Antécédents**, **Agenda** : selon les zones cochées. Les zones modifiées s'illuminent quelques
  secondes ; les lignes ajoutées par l'IA portent un contour arc-en-ciel (« créée par Copilot IA »).
- **Relisez et corrigez.** Un rendez-vous créé par erreur se supprime dans l'agenda (ses rappels automatiques partent
  sinon : décochez « Rendez-vous » si ce n'est pas voulu).
- La consultation porte le **nom du sous-motif** que l'IA a choisi (« Copilot AI » si aucun ne convient).

### Chaque reprise compte au moins une minute
Chaque segment d'écoute (entre deux pauses) est compté **au moins 60 secondes**. Évitez les pauses très courtes en série.

## 3. Les quatre zones

| Zone (onglet Zones) | Ce que l'IA remplit |
|---|---|
| **Consultations** | Le compte rendu, rangé sous un motif de consultation (carte « Dernière visite », journal) |
| **Rendez-vous** | Un rendez-vous dans l'agenda (avec ses rappels automatiques) |
| **Évaluation médicale** | Les réponses au questionnaire d'antécédents |
| **Plan de traitement** | Des traitements du catalogue, avec leur tarif |

Chaque zone a une **roue dentée** : « Modifier l'instruction pour … » › **Invite utilisateur** › **Valider**. C'est la
consigne donnée à l'IA (ex. le style du compte rendu). **Un changement vaut pour toute la clinique.**
Quand décocher « Rendez-vous » : si le patient a déjà son rendez-vous, ou si la clinique ne veut pas de rendez-vous créés
par l'IA.

## 4. iPhone et iPad
1. Fiche patient › bouton éclair **⚡** › **Consultation IA** (en dernier dans le menu).
2. Fenêtre « Consult IA », mêmes onglets (Activations, Instructions, Transcription). Cases : Consultation, Agenda,
   Évaluation médicale, Traitements.
3. **Mettre en pause** / **Reprendre** / **Terminer**. La fenêtre peut se réduire en pastille « Consult IA en écoute ».
4. Prérequis : application **à jour (6.9.13 ou plus)** et **iOS/iPadOS 26**. Si le client ne peut pas mettre à jour,
   il utilise Copilot IA sur ordinateur (web).
Les écrans de blocage et leurs solutions : `references/depannage-ia.md`.

## 5. Mes minutes
- Compteur **« N min »** à droite du bouton Copilot IA ; au survol : « N minutes Copilot IA restantes » et
  « Recharge prévue le … ».
- À zéro : « Plus de minutes Copilot IA… » ou « Contactez Nextmotion pour recharger ». Pour en ajouter : le propriétaire
  du compte (achat en ligne depuis l'application) ou le conseiller Nextmotion. **Aucun prix ni volume** de ta part.
- La **dictée** consomme aussi des minutes (en IA dans le cloud). Avec **Nextmotion Local**, aucune minute n'est
  décomptée : le compteur est remplacé par « Sur l'ordinateur du cabinet ».

## 6. Paramétrer Consult IA

### Réglages de la clinique — Paramètres › IA
Section **Copilot** (« Ce que le Copilot remplit à partir d'un enregistrement ») : **Consultations, Agenda, Antécédents
médicaux, Traitements**. Message de confirmation : « Réglage du Copilot enregistré ».
Conseil : **laissez tout coché au début**, puis ajustez après quelques essais. Les mêmes interrupteurs existent dans
l'onglet **Zones** : ne les présente pas comme deux réglages indépendants ; après un changement, **vérifie** à l'écran
que l'autre endroit montre la même chose. Section **Où s'exécute l'IA** : voir `references/nextmotion-local.md`.

### Un interrupteur par collaborateur — Paramètres › Collaborateurs › fiche › « Consult AI »
Libellé resté en anglais dans l'interface (« Accès aux fonctionnalités d'IA »). **Activé par défaut** pour chaque nouveau
collaborateur. C'est lui qui autorise Consult IA sur iPhone/iPad. Grisé si l'option n'est pas incluse ou s'il n'y a plus
de minutes (« Aucun crédit Consult AI restant disponible »).

### Préparer le compte pour que Consult IA soit bon
À la fin de l'enregistrement, l'IA choisit **un sous-motif** parmi ceux de la clinique, **d'après leur nom** (les ~100
premiers sont pris en compte). Donc :
1. **Sous-motifs à noms distincts et parlants**, uniques dans toute la clinique (« Suivi injection toxine », « Contrôle
   peeling », « Séance cryolipolyse »). Deux sous-motifs « Suivi » : l'IA ne sait pas les distinguer. Ne dépasse pas
   ~100 sous-motifs.
2. **Une bolt note par sous-motif fréquent.** Une bolt note est un **modèle de compte rendu** : quand on ouvre une
   consultation de ce type, la note est pré-remplie avec votre trame (produit, zone, technique…) et quelques champs à
   compléter, **par le praticien ou par Consult IA**. Si le sous-motif choisi a une bolt note avec des champs, l'IA les
   remplit depuis la transcription ; sinon elle écrit un résumé avec l'instruction « Consultations ». Visez 5 à 10 champs
   utiles.
3. **Traitements et tarifs nommés comme les praticiens les disent**, pour que « Plan de traitement » trouve les bons.
4. **Questionnaire d'antécédents rempli** (zone « Évaluation médicale »).

**Où :** la bolt note se crée dans **Paramètres › Mes consultations › onglet Bolt notes › Nouvelle bolt note**
(si l'onglet manque, c'est un droit à accorder dans Paramètres › Collaborateurs). Elle se rattache à un motif :
**Paramètres › Mes consultations ›** ouvrir le motif › bloc **Questionnaire bolt note** › **Sélectionner une bolt note**.
**Un motif = une bolt note.**
**Tu peux faire** (avec accord) : lire les sous-motifs et signaler les noms en double
(`oapi_clinic_sub_visit_type_list`) ; créer des bolt notes et les rattacher (voir le skill **configurer-compte**, qui
détient les modèles, et le champ de bolt note à la création ou à la mise à jour d'un motif). Annonce le résultat attendu :
« La consultation créée portera le nom du sous-motif choisi. »

### Mise en garde webhooks
Chaque consultation enregistrée par l'IA déclenche l'événement **« Visite créée »** des webhooks de la clinique : un
webhook reçoit donc le texte des consultations (donnée de santé). Pour ces automatisations, recommande **Nextmotion
Local** (`references/nextmotion-local.md`) ; pour toute question de conformité, renvoie vers le DPO de la clinique ou le support.

## 7. Droits et nouveautés
- L'IA locale se gère depuis un **compte administrateur** (droit « machines »).
- Pour les dernières nouveautés IA : menu de l'avatar › **Nouveautés**. N'annonce pas une fonction qui n'y figure pas.
- Pour apprendre en cliquant : menu de l'avatar › **Tutos IA**, parcours « Consult IA : transcrire une consultation et
  remplir le dossier » (praticiens).
