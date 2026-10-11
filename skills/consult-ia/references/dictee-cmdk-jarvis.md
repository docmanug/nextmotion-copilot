# Dictée, barre ⌘K, Jarvis, Tutos IA

> Données : `shared/donnees-et-confidentialite.md`. Pannes de dictée : `references/depannage-ia.md`.
> Tu **guides** : tu ne dictes pas à la place du client, tu ne lis pas ses notes et tu ne lances pas de guide à l'écran.

## 1. Dicter une note

### Sur ordinateur (web)
Le micro se trouve à deux endroits :
- dans l'éditeur de la **note de consultation** ou de la **note permanente** du dossier patient : bouton **Dicter**,
  l'écran dit « Écoute… », puis **Arrêter la dictée** ;
- dans la barre de recherche **⌘K** (Ctrl+K sous Windows) : **Dicter une commande**.

Pendant la dictée, deux commandes vocales : **« nouveau paragraphe »** et **« retour à la ligne »** (« à la ligne » en
fin de phrase).
À l'arrêt, **Structurer avec l'IA** réécrit le passage dicté avec l'instruction de consultation de la clinique
(Paramètres › IA, roue dentée de la zone Consultations). **Relisez toujours le texte structuré par l'IA** avant de
continuer. Si l'IA échoue, l'écran dit « Le résumé IA a échoué — votre dictée est conservée telle quelle » : le texte
dicté est gardé, rien n'est perdu.

Minutes : la dictée consomme des minutes Copilot IA (IA dans le cloud) ; aucune avec Nextmotion Local.

### Sur iPhone / iPad (application 6.9.17 ou plus, iOS/iPadOS 26)
1. Fiche patient › **Ajouter une consultation** (visite), choisir le motif.
2. Dans la zone **Observation**, touchez le micro **Dicter**, parlez, puis **Arrêter**.
3. L'application transcrit, puis met en forme avec le modèle de la clinique (« Structuration par l'IA… »).
4. **Relisez**, corrigez, enregistrez.
Ce n'est **pas automatique** : on relit et on enregistre. Pour enregistrer **toute la consultation**, utiliser Consult IA
(⚡ › **Consultation IA**, voir `references/consult-ia.md`).
Si le micro ne répond pas ou si un message apparaît : `references/depannage-ia.md`.

## 2. La barre ⌘K et son « Assistant IA »
- Ouvrir : **⌘K** (Ctrl+K), champ « Rechercher des informations ou lancer une action ». On peut aussi **dicter**.
- Pour toute phrase d'**au moins 3 mots**, une ligne **Demander à l'IA** (groupe « Assistant IA ») apparaît : l'IA
  comprend la demande et l'exécute parmi une centaine d'actions (ouvrir un dossier, prendre un rendez-vous, rédiger une
  ordonnance, créer un patient, un devis, un traitement, un modèle de document, une bolt note, naviguer, trouver un
  créneau, déplacer ou annuler un rendez-vous…).
- Exemples à proposer :
  1. « Rédige une ordonnance de paracétamol pour ce patient » (ouvre l'ordonnance pré-remplie avec l'ordonnance type
     dont le titre correspond) ;
  2. « Crée le patient Camille Durand né le 12 mars 1985 » (remplit aussi sexe et adresse si donnés) ;
  3. « Trouve un créneau de 30 minutes jeudi » ;
  4. « Quel est mon chiffre d'affaires du mois ? » (aussi rendez-vous du jour, stock bas, devis en attente) ;
  5. « Montre les factures impayées » ;
  6. « Ouvre les appels manqués ».
- L'IA suit le réglage **Où s'exécute l'IA** (cloud ou ordinateur du cabinet) et **peut se tromper** : **vérifier avant
  de valider**.
- Quand tu expliques une action rapide à faire dans l'application : « Rappelez ⌘K : tapez ou dictez votre demande en une
  phrase. »

## 3. Jarvis, l'assistant en bulle
- **Ouvrir Jarvis** : la bulle en bas à droite de toutes les pages. Champ « Demandez-moi quelque chose… ».
- Il peut : **retrouver un dossier par le nom**, **réserver un rendez-vous** pour « ce patient » depuis la fiche
  ouverte, **répondre** à une question d'usage, et surtout **montrer le chemin pas à pas** (surbrillance à l'écran ;
  il propose « Je vous montre ? »). Conseil : « demandez-lui *montre-moi comment…* **avant** d'ouvrir un ticket ».
- Il **ne remplace pas le support** : pour un souci qu'il ne règle pas, il aide à **ouvrir un ticket** (suivi dans la
  section Support). Le bouton **Support & tickets** (en haut de l'écran) fait la même chose et permet aussi de
  **réserver un appel** avec le support. **Tu ne crées pas de ticket toi-même.**
- Avec Nextmotion Local, Jarvis (texte) répond depuis l'ordinateur du cabinet : s'il est hors ligne, il ne répond pas.
- **Visites « Découvrir cette page »** : sur les pages où elles sont proposées, le bouton lance une visite guidée.
  Si le client ne le voit pas, il demande à Jarvis.
- N'annonce pas de commande **vocale** de Jarvis (micro de la bulle) : ce n'est pas ouvert aux clients.

## 4. Tutos IA et Nouveautés
- **Tutos IA** : menu de votre avatar › **Tutos IA**. Parcours guidés en cliquant, par exemple « Consult IA : transcrire
  une consultation et remplir le dossier », les réglages de l'IA, les rapports. Il y a des parcours pour iPhone
  et des parcours **ordinateur + iPhone**. Tu **nommes** le bon parcours et tu dis où le lancer ; tu ne le lances pas.
  Pour une équipe : voir le skill **former-equipe**.
- **Nouveautés** : menu de votre avatar › **Nouveautés** (notes de version, IA comprise).
- L'Academy n'existe plus : renvoyer vers Tutos IA.

## 5. Pour qui, quoi montrer (formation express)
| Personne | À montrer en 10 minutes |
|---|---|
| Praticien | Consult IA sur un patient d'essai, puis la dictée |
| Assistante | ⌘K, puis Jarvis (« montre-moi comment… ») |
| Associé qui arrive | Consult IA + dictée, et son interrupteur « Consult AI » (Paramètres › Collaborateurs) |
| Administrateur | Paramètres › IA, minutes, interrupteur par collaborateur |
