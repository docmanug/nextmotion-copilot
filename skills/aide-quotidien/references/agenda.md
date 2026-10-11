# L'agenda au quotidien

Tout se passe sur [ordinateur] sauf mention. Menu : barre de gauche → **Calendrier** (la page s'appelle « Agenda »).
Si l'icône porte un cadenas, l'agenda n'est pas dans l'offre (voir `SKILL.md`). Pour **régler** l'agenda
(horaires, salles, motifs en ligne), c'est le mode configuration ; ici on s'en sert.

## Lire sa journée
- En haut : « Aujourd'hui », flèches Précédente / Suivant, **Vue jour**, **Vue semaine**, **Vue mois**.
- Interrupteur **Praticiens | Salles** (jour et semaine) : une colonne par praticien ou par salle. Votre choix est mémorisé.
- Panneau de gauche : « Praticiens et salles » (quelles colonnes afficher), filtres « Statut » et « Statuts patient »,
  « Exporter le PDF ».
- Le mini-calendrier reste sur le mois que vous avez choisi.
- L'agenda s'ouvre sur vos horaires d'ouverture (une heure avant et après). Pour tout voir sans faire défiler :
  « Plus d'options » → « Configurer le calendrier » → « Configuration de l'agenda » (durée du créneau, début, fin,
  jours affichés) ; l'option « Afficher toute la journée à l'écran » ajuste l'agenda à la hauteur de l'écran.
- Les rendez-vous en même temps s'affichent côte à côte. **Survolez** un rendez-vous : une carte montre praticien,
  salle et statut. **Cliquez** : il s'ouvre.
- « Plus d'options » : **Vues personnalisées** (« Créer une vue personnalisée » : un nom + les praticiens ou salles à voir),
  Apparence, « Modifier les horaires d'ouvertures », « Configurer le calendrier », « Exporter en PDF », Notifications
  (par exemple « Vous avez annulé un rendez-vous », avec « Déplacer le RDV », « Message », « Supprimer »).
- La page se met à jour toute seule : inutile de la recharger.

## Gérer un rendez-vous
**Prendre un rendez-vous** : bouton « Prendre un rendez-vous », trois onglets.
1. **RDV** : choisissez le patient (ou « Ajouter un nouveau patient »), la date, l'horaire, la durée, le praticien,
   le motif de consultation, la pièce, la machine, une note. Un créneau « Déjà réservé » est refusé.
2. **Absence** : praticiens, plage ou « Toute la journée », objet, « Répéter » si elle revient, « Notifier l'absence »
   pour prévenir les patients concernés.
3. **Horaire d'ouverture** : pour ajouter une plage d'ouverture.

**Menu d'un rendez-vous** (clic sur le rendez-vous) : « Détails de la consultation », « Déplacer le RDV », « Copier le rendez-vous »,
« Absence justifiée », « Supprimer ».
- **Déplacer** : deux méthodes. (1) « Déplacer le RDV », puis cliquez le nouveau créneau (Échap pour annuler).
  (2) Glissez-déposez le rendez-vous : l'heure et la durée sont conservées.
- **Copier** : « Copier le rendez-vous », puis cliquez le créneau où poser la copie.
- **Supprimer** : confirmez ; l'agenda reste sur le jour où vous travailliez.

**La page du rendez-vous** (en cliquant dessus) : « Ouvrir le dossier patient », « Ouvrir dans iOS », « Déplacer le rendez-vous »,
« Copier le rendez-vous », « Bloquer la prise de RDV » (ce patient ne pourra plus réserver en ligne ; « Débloquer »
pour annuler), « Ajouter un parcours patient », « Supprimer le RDV ».

**Poser le rendez-vous depuis un soin** : dans le dossier du patient, sous la date d'une ligne de traitement, cliquez
**« Poser le rendez-vous »**. L'agenda s'ouvre avec le patient, le motif et le praticien déjà remplis, et le rendez-vous
reste relié à la ligne. Pour un forfait, la colonne « RDV forfait » propose « Prendre un rendez-vous » (il faut que le
traitement soit payé).

## Suivre l'état d'un rendez-vous
Sur la page du rendez-vous, colonne de droite, il y a **quatre familles** :
1. **Statut du patient** : En salle d'attente, Absence injustifiée, Absence justifiée, En consultation, Vu par le praticien.
2. **Mots-clés** : En retard, Paiement reçu, Confirmé par téléphone, En attente de confirmation téléphonique, nb séances
   (forfait), Nouveau patient, RDV @ (pris en ligne).
3. **Statut rendez-vous** : des statuts que **vous** nommez et colorez. « Gérer les statuts » ouvre « Statuts de
   rendez-vous » → « Ajouter un statut ». Un statut supprimé reste sur les anciens rendez-vous. « Confirmé » est un
   statut système (le patient a confirmé).
4. **Statut des forfaits** : Nouveau, Planifié, Réglé, Forfait, Contrôle, Aucun. Il ne sert que si le rendez-vous
   est lié à un forfait (les séances d'un forfait). Ne le confondez pas avec « Statut rendez-vous », qui est libre.

## Demandes de rendez-vous en ligne et confirmation par e-mail
- Bouton **« Demandes de rendez-vous »** dans l'agenda : les réservations en ligne en attente. **Accepter** ou **Refuser**
  (le patient est prévenu du refus). Si votre clinique accepte automatiquement les demandes, vous n'avez rien à faire.
- **Confirmation par le patient** : elle est **désactivée par défaut**. Pour l'activer : Paramètres → Agenda → bouton
  « Paramètres » → « Demander aux patients de confirmer leur rendez-vous » (24 h avant par défaut, ou 2 jours, ou un
  nombre d'heures). Le patient confirme d'un clic et le rendez-vous passe en « Confirmé ». Pour suivre : le statut du
  rendez-vous, et sur le tableau de bord « Assistant », le bloc « Confirmations de RDV pour demain ».
- La page de réservation en ligne de la clinique est hébergée dans le portail patient : les e-mails de rendez-vous
  (confirmation, annulation, « Je confirme ») mènent au même endroit.

## Doctolib
- **La passerelle Doctolib** est proposée à toutes les cliniques : c'est Nextmotion qui l'active de son côté. Demandez
  au support de l'activer (`references/support-et-assistance.md`). En attendant, créer un patient à la main prend une
  trentaine de secondes.
- **L'extension Doctolib** (extension du navigateur) apporte la synchronisation instantanée des contacts et la
  descente automatique des rendez-vous de Doctolib vers Nextmotion. Elle dépend de votre offre : votre conseiller
  Nextmotion vous dit si elle est incluse. Une fois installée, des boutons apparaissent dans la barre du haut pour
  ouvrir le calendrier ou la liste de Doctolib. L'extension **propose** de créer le dossier : rien n'est créé sans votre clic.
- Ne dites pas au client de « dire à Doctolib de se brancher » : ce n'est plus la procédure.

## Sur l'iPhone / l'iPad [iPhone/iPad]
Onglet **Agenda** : vues **Jour, Semaine, Liste, Mois**. Touchez un créneau : choisissez **Rendez-vous**
(« Nouveau rendez-vous ») ou **Absence** (« Nouvelle absence » : ressources concernées, toute la journée, répétition).
Filtres en haut ; « Ouvrir la fiche patient » depuis un rendez-vous. Les rendez-vous annulés sont barrés ; l'heure affichée
est celle du cabinet. Pas de cadenas d'offre dans l'app pour l'agenda : les droits sont vérifiés par le serveur.

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
- Tutos IA, ordinateur : « Découvrir et configurer le nouvel agenda ».
- Tutos IA, iPhone : « L'Agenda : lire sa journée, bloquer un jour, prendre un rendez-vous ».
- Guides Jarvis : « Afficher l'agenda par salle » · « Afficher toute la journée à l'écran » · « Voir l'essentiel d'un rendez-vous
  au survol » · « Gérer les statuts de vos rendez-vous » · « Demander aux patients de confirmer leur rendez-vous » ·
  « Poser un rendez-vous depuis la date d'un traitement ».

## Si ça ne marche pas
- **L'agenda a un cadenas** : fonction hors offre ; le propriétaire peut la débloquer en cliquant dessus.
- **Un médecin n'apparaît pas dans les colonnes** : « Praticiens et salles » (panneau de gauche) ; sinon Paramètres →
  Collaborateurs → sa fiche → « Visible dans le calendrier ».
- **Un patient ne peut pas réserver en ligne** : voir si vous avez cliqué « Bloquer la prise de RDV » sur sa fiche de rendez-vous,
  et si le praticien est « Visible pour la prise de rendez-vous en ligne » (Paramètres → Collaborateurs).
- **Les patients ne reçoivent pas de rappel par SMS** : `references/messages-sms-whatsapp.md`.
