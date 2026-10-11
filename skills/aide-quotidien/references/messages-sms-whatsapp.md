# Messages, SMS, WhatsApp, appels et leads

Tu **guides** : tu n'envoies jamais de message, SMS, WhatsApp ou e-mail à un patient (`shared/donnees-et-confidentialite.md`).
Tout se passe sur [ordinateur] sauf mention.

## Écrire à un patient
Deux chemins : barre de gauche → **Messages**, ou depuis le dossier du patient ⋮ → **« Envoyer un message »** (ouvre la bonne conversation).
- À gauche, la liste des contacts (recherche, messages non lus). Au centre, la conversation : texte, émojis, pièces jointes.
- En bas : **« Envoyer via : »** choisissez le canal : **message interne** (le patient le lit dans son portail), **SMS**, **WhatsApp**.
- Autres boutons : « Appel audio » / « Appel vidéo » / « Visioconsultation » (le patient reçoit un lien « Rejoindre la visioconsultation »,
  valable un temps limité), « Donner un rendez-vous », « Accéder au dossier patient ».
- Les réponses par SMS ou WhatsApp arrivent dans la bonne conversation.

### Un canal n'est pas proposé ? Les causes
| Canal absent ou grisé | Cause probable | Que faire |
|---|---|---|
| **WhatsApp** avec un cadenas | Votre offre n'inclut pas WhatsApp | Cliquer le cadenas ; le propriétaire peut le débloquer |
| **WhatsApp** sans cadenas, mais ne part pas | Aucun téléphone n'est connecté à WhatsApp | Paramètres → **Centre d'intégration** : connecter le téléphone (scanner le code QR avec WhatsApp). Paramètres → **Communication** → onglet WhatsApp : l'interrupteur « Envoi WhatsApp » doit être allumé |
| **SMS** absent | Interrupteur « Envoi de SMS » éteint, ou plus de crédits | Paramètres → Communication → SMS : « Envoi de SMS » (éteint par défaut) ; sous-onglet Crédits → « Recharger » |
| Aucun canal SMS/WhatsApp pour ce patient | Le patient n'a pas de numéro de téléphone | Ajouter son numéro dans « Modifier les informations du patient » |
| Message interne seul | Le patient n'a pas activé son portail | `references/portail-patient.md` |
Un patient « WhatsApp uniquement » n'a que ce canal. Les numéros doivent être au **format international** (+33…).

## Mes patients ne reçoivent pas les SMS
Dans cet ordre :
1. **L'interrupteur d'envoi** : Paramètres → Communication → onglet SMS → « Envoi de SMS ». Éteint par défaut : acheter un pack ne l'allume pas.
2. **Les crédits** : en haut de l'écran, la pastille « n crédits SMS restants ». À zéro, un bandeau dit « Plus de crédits SMS : les SMS de rendez-vous
   ne partent plus ». Un bandeau « Il vous reste n SMS… » avertit environ deux semaines avant la fin.
3. **Un achat en attente** : un paiement par prélèvement SEPA reste « En attente » puis passe à « Réglé » (Paramètres → Communication → SMS,
   sous-onglets Crédits et Consommation). Les SMS en attente partent dans la minute qui suit la confirmation.
4. **Le numéro du patient** : au format international, sans faute.
5. Toujours rien : l'historique est dans l'onglet **Messages** (SMS), puis le support (`references/support-et-assistance.md`).
**Recharger** : sur le bandeau ou la pastille, « Recharger ». « Me le rappeler plus tard » masque le bandeau jusqu'au
lendemain ; « Ne plus afficher » le retire. Toute question de prix : renvoyez au conseiller.
Le **nom de l'expéditeur** des e-mails se règle pour l'instant avec le support ; pour les SMS, c'est l'« Objet » de chaque modèle (11 caractères
maximum, Paramètres → Communication → SMS → Modèles).

## Savoir si un e-mail est bien arrivé
Dans le dossier du patient, section **Journal** : cliquez l'e-mail envoyé. Sa fiche (Titre, De, À, Type) se termine par **« Statut de livraison »** :
une ligne par étape, pastille verte = remis, rouge = erreur. Cela suffit pour répondre à « je n'ai rien reçu ». Pour un devis ou un consentement
envoyé en signature, la pastille propose « Demande de signature » (statut, « Renvoyer l'invitation »). Pour une ordonnance, la pastille indique
« Envoyées le… ». La fiche se met à jour en direct.

## Demande d'avis
⋮ → **« Envoyer une demande d'avis positif »** : un message avec le lien d'avis de la clinique part au patient. À faire après une
consultation qui s'est bien passée. Si l'écran répond « Votre clinique n'a aucune URL d'avis configurée », renseignez-la
dans Paramètres → Mon compte → Ma clinique (« URL de demande d'avis positifs »). Un cadenas = fonction hors offre.
Les e-mails automatiques partent au nom du cabinet ; pour changer le nom de l'expéditeur, passez par le support.

## Appels
Barre de gauche → **Appels** : l'historique des appels entrants, sortants et manqués (filtres par statut et période, recherche).
- Sur un appel : résumé et transcription, « Écouter l'enregistrement », **« Rappeler »**, **« Relance SMS »** / **« Relance WhatsApp »**
  (modèles rapides signés du nom de la clinique), « Planifier un rendez-vous », « Enregistrez cet appelant comme lead ».
- « Ajouter un appel » pour noter un appel à la main. **« Analyses »** : volume, durée moyenne, conversion en rendez-vous.
- **« Exporter »** : CSV, Excel ou PDF, à l'heure du cabinet. Un téléphone est intégré au navigateur (clavier, raccrocher, couper le son).
- Pour **retrouver et relancer un appelant** : filtre « Manqués » → ouvrez l'appel → Rappeler, ou Relance SMS / WhatsApp.
- Téléphonie avec assistant vocal : Paramètres → Téléphonie (mode configuration).

## Leads
Un **lead** est une personne qui vous a contactée sans être encore patiente. Barre de gauche → **Leads** : « Leads à traiter », recherche,
**« Créer un lead »** (Prénom, Nom, Email, Tél, Notes). Autres entrées : ⌘K → « Nouveau lead », ou depuis un appel.
Un lead se **convertit en patient** quand il prend rendez-vous. Sur l'iPhone/iPad [iPhone/iPad] : onglet Leads (menu « Autre »), liste ou pipeline,
« Nouveau lead », « Convertir en patient », notification sur le téléphone.

## Sur l'iPhone / l'iPad [iPhone/iPad]
Fiche patient → onglet **Chat** (ou bouton éclair → « Chat », si le patient a un contact) : conversations Interne / SMS / WhatsApp, pièces jointes
(Photothèque, Caméra, iCloud, « Scanner un document »), visio programmée. Il faut l'option Portail patient et l'option chat/visio.

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
Tutos IA : « Activer WhatsApp et paramétrer les messages automatiques » · « Consulter les appels et activer la téléphonie » · « La messagerie »
· (iPhone) « Écrire à vos patients par chat » · « Leads : traiter une demande en une minute ». Guides Jarvis : « Écrire à un patient depuis son dossier »
· « Recharger vos crédits SMS » · « Suivre la consommation et les envois de SMS » · « Suivre vos achats de crédits SMS en attente » · « Masquer l'alerte
« Aucun crédit SMS » » · « Exporter le journal d'appels ».
