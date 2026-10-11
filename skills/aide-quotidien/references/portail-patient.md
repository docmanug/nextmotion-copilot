# Le portail patient

Le **portail patient** est l'espace en ligne du patient (adresse patient.nextmotion.net). Il demande l'option **Portail patient** dans l'offre (sans elle, un cadenas apparaît
côté clinique). Il n'y a pas d'application patient dans l'App Store : le patient l'utilise dans son navigateur. Langue : celle du navigateur.
Tu **guides** : tu n'envoies pas d'e-mail au patient (`shared/donnees-et-confidentialite.md`).

## À quoi sert le portail (à dire simplement)
Le patient y **signe ses devis et ses consentements**, remplit son questionnaire de santé, voit ses rendez-vous et ses photos (celles que vous partagez), son plan de traitement,
ses ordonnances et ses factures, et vous écrit par chat (avec l'option chat/visio). Il peut prendre, modifier ou annuler un rendez-vous.

## Ouvrir le portail à un patient [ordinateur]
1. À la création du patient (Patients → « Ajouter un patient »), laissez la case **« Créer l'espace patient »** cochée : « Le patient recevra un e-mail pour activer son espace personnel ».
   Il faut l'**adresse e-mail** du patient et l'option Portail patient.
2. La case est cochée par défaut selon la préférence **« Créer le portail patient par défaut »** (Paramètres → Mon compte → Mon profil). Si la clinique **ne veut pas** d'envoi automatique,
   décochez-la **avant** d'ajouter ou d'importer des patients.
3. Le patient reçoit l'e-mail « Activation du portail patient » : le lien n'est valable qu'un temps, et **seul le dernier e-mail fonctionne**.

## « Mon patient n'arrive pas à entrer dans son portail »
1. Vérifiez l'adresse e-mail du patient (⋮ → « Modifier les informations du patient »).
2. Dossier du patient → menu ⋮ « Plus d'actions » :
   - compte **pas encore activé** → **« Renvoyer le lien d'invitation »** ;
   - compte **déjà activé** → **« Renvoyer le lien de connexion au portail patient »** (e-mail « Rappel du portail patient »).
3. Dites au patient d'ouvrir le **dernier** e-mail reçu (les liens plus anciens ne marchent plus) et de regarder ses courriers indésirables.
4. Sinon, sur la page de connexion, il choisit **« Recevoir un lien de connexion par e-mail »** (lien à usage unique) ou « Mot de passe oublié ? ».
Si le patient ne reçoit rien : `references/messages-sms-whatsapp.md` (statut de livraison de l'e-mail), puis le support.
Plusieurs patients peuvent partager un compte (proches) : le patient choisit « Qui utilise le portail ? ».

## Ce que voit le patient (libellés tels qu'à son écran)
- **Accueil** « Bonjour, <prénom> » : **« À faire pour votre clinique »** (questionnaire « Quelques questions sur votre santé », « Devis à signer », « Consentement à signer »,
  « Document à compléter », « Document à lire »), **« Prochain rendez-vous »** (Modifier / Annuler, consignes avant et après, « Prendre un rendez-vous »), « Rejoindre la visioconsultation »
  (cinq minutes avant), « Une question ? Écrire à votre clinique », « Votre dossier ». À la première connexion, un écran « Bienvenue, <prénom> » liste ce qu'il reste à compléter (« Plus tard »).
- **Votre dossier** : « Devis et consentements », « Questionnaires », « Ordonnances », « Factures », « Photos et produits » (Photos, Produits utilisés), « Plan de traitement » (traitements, documents,
  notes du praticien), « Tous les documents ». Statuts : À signer, À compléter, En attente, Signé, Complété, Refusé. Il peut télécharger un PDF.
- **Chat** avec la clinique (texte et pièces jointes), notifications, **Mon profil** (lecture seule : « Pour modifier vos informations personnelles, contactez votre clinique »),
  guide d'utilisation et « Me déconnecter » dans le menu.
- **Ce qu'il ne fait pas** : modifier ses coordonnées (la clinique le fait), payer une facture en ligne (seul l'**acompte de réservation** se règle en ligne), recevoir des notifications sur son téléphone,
  passer une commande de produits.

## Faire signer un devis ou un consentement à distance
Deux chemins, au choix [ordinateur] :
1. **Le patient signe dans son portail** : il se connecte (lien d'invitation ou de connexion), ouvre « Devis à signer » puis ses consentements, qui s'enchaînent. Il faut l'option Portail patient et
   qu'il ait activé son espace.
2. **Vous l'envoyez en signature** : pastille Devis (ou Consentement) → **« Envoyer en signature »**. Le patient reçoit un lien par e-mail. Chaque envoi utilise 1 crédit de signature (500 inclus chaque mois) ;
   suivi et relance via « Demande de signature » (`references/devis-factures-encaissements.md`).
En présentiel, la signature se fait à l'écran (ordinateur ou iPad : `references/app-iphone-ipad.md`).

## Les photos : le patient ne voit que ce que vous partagez
« Mon patient ne voit pas ses photos » → **les avez-vous partagées ?** Dossier du patient → section **Journal** → ligne de la photo ou du montage → **« Partagez »**. Sans partage, il ne voit rien.
Le lien « Avant / Après » envoyé par e-mail est une page à part, protégée par un lien personnel.

## Le questionnaire d'antécédents dans le portail
Le patient le remplit lui-même si la clinique l'ouvre : Paramètres → **Antécédents**.
- Cochez, sous **chaque question**, la case qui l'ouvre au patient.
- Bouton « Paramètres » de la page : activez « Afficher automatiquement ce questionnaire après la première ouverture du portail patient » et « Rendre accessible ce questionnaire depuis le portail patient ».
  « Utiliser le modèle par défaut » repart d'un questionnaire standard.
- À la fin, la signature est demandée. Le patient voit « Commencer » puis « Envoyer mes réponses ».
Ces cases se cochent à l'écran.

## Réservation en ligne
La page où vos patients réservent (adresse du type patient.nextmotion.net/book/…) est hébergée par le portail. Le patient reçoit un e-mail de vérification, puis des e-mails pour modifier,
annuler ou confirmer (« Je confirme »). Un acompte peut être demandé (« Régler l'acompte »). Réglage des motifs réservables : mode configuration ; gestes d'agenda : `references/agenda.md`.

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
Guides Jarvis : « Renvoyer le lien de connexion au portail patient ». Pour montrer le geste « Inviter un patient dans son espace patient » ou « Faire signer un consentement à distance », demande à
Jarvis (« montre-moi comment inviter un patient dans son espace »).
