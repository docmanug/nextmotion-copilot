# Dépannage de l'IA — symptôme → cause → action

> Parle comme l'écran : reprends les phrases ci-dessous. Ne montre jamais d'erreur technique (`shared/regles-communes.md`
> § 10). Pannes générales du connecteur : `shared/problemes-connus.md`. Si rien ne marche : bulle **Jarvis** (en bas à
> droite) ou **Support & tickets** ; tu ne crées pas de ticket toi-même.

## 1. Consult IA sur le web : l'ordre des vérifications
**Le micro est rarement la cause.** Dans l'ordre :
1. **Lire le message** affiché sous la transcription (tableau 2).
2. **Compteur de minutes** (au survol : « N minutes Copilot IA restantes »).
3. **Recharger la page**, puis relancer.
4. **Bon micro** dans le menu « Micro » de la fenêtre (pas celui d'un iPhone, d'AirPods, d'un dictaphone).
5. **Cadenas** du navigateur (tableau 3).
6. **Autre application** qui occupe le micro (visioconférence, dictaphone).
7. **Réseau** (Wi-Fi, VPN, pare-feu du cabinet).
8. Sinon : Jarvis ou Support & tickets.
Navigateur pris en charge : **Chrome, Edge ou Safari à jour**, sur app.nextmotion.net.

## 2. Messages de Copilot IA (web)
| Message à l'écran | Cause | Action |
|---|---|---|
| « Votre clinique n'a plus de minutes Copilot IA… » | Plus de minutes | Voir le compteur et la date de recharge ; le propriétaire ajoute des minutes ou le conseiller Nextmotion ; ou passer sur Nextmotion Local |
| « Vos minutes Copilot IA se sont épuisées pendant cette consultation… » | Épuisées en cours de route | Appuyer sur **Terminer** pour garder le texte déjà transcrit, puis recharger des minutes |
| « La connexion au service de transcription a été coupée… » | Réseau | **Terminer**, vérifier le réseau, relancer |
| « Le service de transcription a refusé la connexion : votre session a expiré » | Session expirée | **Recharger la page** et se reconnecter si besoin |
| « Le service de transcription n'a pas démarré » | Démarrage lent | Attendre quelques secondes, relancer |
| « La transcription n'est pas disponible dans cette session » | Session | Recharger la page ; si ça persiste, Jarvis |
| « Cette page n'est plus à jour… » | Page ancienne | Recharger la page, puis réessayer |
| « Aucun son n'arrive au micro. Vérifiez quel micro est sélectionné (un iPhone, des AirPods, un Plaud…) » | Mauvais micro | Choisir le bon dans le menu **Micro** ; parler plus près |
| « Aucune parole n'a été captée. Veuillez réessayer. » | Transcription vide à l'arrêt | Relancer, parler plus près, vérifier le micro |
| Chrono qui tourne mais **transcription vide** | Micro muet ou erreur non lue | Lire le message ; sinon changer de micro, recharger |
| « L'ordinateur du cabinet qui transcrit les consultations est injoignable » | Mac hors ligne (Nextmotion Local) | Tableau 6 ; en urgence repasser sur **Dans le cloud** |
| « …transcrit déjà autant de consultations qu'il le peut » | Mac occupé | Attendre un instant, réessayer |
| « La connexion avec l'ordinateur du cabinet a été coupée… » | Connexion au Mac coupée | **Terminer**, vérifier le Mac (tableau 6) |

## 3. Le micro (web)
« Copilot n'a pas pu accéder à votre micro » + une des quatre causes :
| Cause affichée | Action |
|---|---|
| « L'accès au micro est bloqué pour ce site » | Cadenas à côté de l'adresse › Microphone › **Autoriser**, recharger. Sur Mac : aussi Réglages Système › Confidentialité et sécurité › Microphone (cocher le navigateur) ; sur Windows : Paramètres › Confidentialité › Microphone |
| « Aucun micro n'a été détecté… » | Brancher ou allumer un micro, choisir le bon dans le menu **Micro** |
| « Le micro est déjà utilisé par une autre application » | Fermer la visio ou le dictaphone, relancer |
| « Ce navigateur ne peut pas enregistrer l'audio ici » | Chrome, Edge ou Safari à jour, sur app.nextmotion.net |
Si le bouton micro n'apparaît pas du tout : navigateur incompatible.

## 4. La dictée (web)
| Message | Action |
|---|---|
| « La dictée n'a pas pu accéder à votre micro. » | Tableau 3 |
| « Plus de minutes Copilot IA. Contactez Nextmotion pour recharger. » | Comme les minutes (tableau 2) |
| « La connexion a été perdue pendant la dictée. Votre texte est conservé — réessayez. » | Relancer la dictée |
| « La dictée n'est pas encore prête — patientez un instant et réessayez. » | Attendre quelques secondes |
| « Le résumé IA a échoué — votre dictée est conservée telle quelle. » | Garder le texte, corriger à la main ou refaire « Structurer avec l'IA » |
| « Cette page n'est plus à jour… » | Recharger |
| (Nextmotion Local) « L'ordinateur du cabinet qui transcrit la dictée est injoignable… » | Vérifier qu'il est allumé (tableau 6) |
**En attendant**, le client peut écrire la note **au clavier** (la bolt note du motif la pré-remplit), puis relancer
Consult IA ou la dictée quand c'est réglé.

## 5. iPhone et iPad
| Symptôme | Cause | Action |
|---|---|---|
| Consult IA tourne (chrono, jauge du micro) mais **rien n'est enregistré à l'arrêt**, « Terminer » reste grisé | Application trop ancienne | **Mettre à jour l'application** : version 6.9.13 ou plus (idéalement la dernière), qui demande iOS/iPadOS 26. Version : Réglages › Général › Stockage de l'iPhone › Nextmotion, ou App Store. Si l'appareil ne peut pas passer à iOS/iPadOS 26 : utiliser Copilot IA sur ordinateur. **Ne donne pas d'autre explication.** |
| « Terminer » grisé, application à jour | Pas encore de texte (normal) | Parler, attendre l'apparition du texte |
| « Plus de minutes Consult IA » | Plus de minutes | Bouton « Ajouter des minutes » (propriétaire) ou conseiller |
| « Consult IA n'est pas activé pour vous » | Interrupteur du collaborateur | Sur le web : **Paramètres › Collaborateurs ›** fiche › **Consult AI** |
| « Consult IA est désactivé pour la clinique » | Réglage de la clinique | Un administrateur le réactive sur le web : **Paramètres › IA › Copilot** (au moins une case cochée) |
| « Le micro est désactivé pour Nextmotion » | Autorisation iPhone | **Réglages › Nextmotion › Micro** |
| Dictée de note sans effet | App < 6.9.17 ou micro refusé | Mettre à jour l'app ; autoriser le micro |
Le « désactivé pour la clinique » correspond probablement aux quatre cases décochées : **vérifie à l'écran** avant d'affirmer.

## 6. Nextmotion Local : « Hors ligne », « En attente de la première connexion »
Pastille dans **Paramètres › IA**. Tant que le Mac est hors ligne, **l'IA est arrêtée** (pas de repli automatique).
1. Lire la pastille : *Connecté* · *En attente de la première connexion* (« se connecte généralement dans les deux
   minutes ») · *Hors ligne* (« Vu pour la dernière fois le … »).
2. Le Mac est-il **allumé, branché, sorti de veille, connecté à Internet** (pas d'extinction programmée) ?
3. Dans la barre de menus du Mac, l'application **Nextmotion Local** indique-t-elle « Prêt » ?
4. **Pare-feu / réseau** : demander à la personne qui gère le réseau d'autoriser le trafic **UDP sortant sur le port 51820**.
5. Premier démarrage : le **modèle d'IA** télécharge encore (« Téléchargement du modèle d'IA : N % ») — patienter.
6. Attendre deux minutes, actualiser Paramètres › IA.
7. Dernier recours : **Retirer l'ordinateur** (Paramètres › IA), puis relancer l'installateur
   (`references/nextmotion-local.md`).
**En attendant :** proposer de repasser provisoirement sur **Dans le cloud** (sans perte). Si le moteur ou la dictée
« est arrêté » alors que le Mac est « Connecté » : support (Jarvis ou Support & tickets).
« Ce lien est invalide ou a déjà été utilisé » / « Ce lien a expiré » / « Ce code ne correspond pas… » : relancer
l'installateur (voir le fichier Nextmotion Local).

## 7. Autres cas fréquents
| Symptôme | Cause probable | Action |
|---|---|---|
| Je ne vois pas le bouton Copilot IA | Option non incluse (cadenas), interrupteur « Consult AI » du collaborateur éteint, ou ancienne interface | Vérifier l'option, l'interrupteur, puis la nouvelle version de l'application |
| La consultation s'appelle « Copilot AI » | Aucun sous-motif ne correspondait | Donner des noms distincts et parlants aux sous-motifs (`references/consult-ia.md` § 6) |
| Le compte rendu est un résumé, pas la bolt note | Le sous-motif choisi n'a pas de bolt note avec champs | Rattacher une bolt note au motif |
| Un rendez-vous a été créé | Zone « Rendez-vous » cochée | Décocher la zone ; supprimer le rendez-vous dans l'agenda |
| Rien dans « Plan de traitement » | Traitements mal nommés, zone décochée | Nommer le catalogue comme les praticiens le disent |
| Le bilan n'apparaît pas | Moins de 10 consultations analysées, pas encore le 1er du mois, pas de droit, pas de Consult IA | `references/rapports-et-bilan.md` § 3 ; sinon « pas encore ouverte sur votre compte » |
| Jarvis ne répond pas | Mac hors ligne (si IA locale) | Tableau 6 |
| Un webhook ne reçoit rien depuis Nextmotion Local | URL « test » n8n, ou workflow inactif | Utiliser l'URL de **production**, activer le workflow, localhost seulement |
