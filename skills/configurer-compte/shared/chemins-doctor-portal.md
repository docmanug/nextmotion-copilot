# Chemins d'écran — la nouvelle interface de Nextmotion (Doctor Portal)

> Remplace l'ancien fichier de chemins. Adresse : https://app.nextmotion.net. Tous les libellés ci-dessous sont ceux de
> l'écran en français. **N'en invente jamais un autre.** Convention d'écriture : **Paramètres › Rubrique › Onglet**.
> Ce que Claude peut faire par outil : `shared/outils-connecteur.md` § 6. Règles générales : `shared/regles-communes.md`.

**À savoir partout**
- Presque tous les réglages **se sauvegardent tout seuls** (au bout d'une demi-seconde environ) : pas de bouton « Enregistrer »,
  sauf mention contraire. Le dire au client évite qu'il cherche un bouton.
- Si le client ne voit pas une rubrique de Paramètres : un droit manque. Vérifier **Paramètres › Collaborateurs › Modifier ›
  Autorisations** (le propriétaire peut l'accorder).
- Une fonction grisée avec un cadenas n'est pas dans l'offre (voir `shared/regles-communes.md` § 9).
- Si le client décrit un écran absent de ce fichier, il est probablement sur l'ancienne interface : voir
  `shared/regles-communes.md` § 4.

## 1. Où est quoi dans l'application

### Barre de gauche (de haut en bas, le libellé s'affiche au survol)
| Entrée | À quoi ça sert | Remarque |
|---|---|---|
| **Tableau de bord** | Chiffres de l'activité, vues Manager / Docteur / Assistant, « Bilan de vos consultations » | Visible seulement avec l'autorisation « tableau de bord » |
| **Patients** | Liste des patients, dossier de chaque patient | |
| **Calendrier** (page « Agenda ») | Rendez-vous, absences, demandes de rendez-vous en ligne | Cadenas si l'option Agenda manque |
| **Stock** (page « Mes consommables ») | Produits, lots, dates d'expiration, alertes | |
| **Messages** | Conversations avec les patients (message interne, SMS, WhatsApp) | WhatsApp selon l'option |
| **Appels** | Journal des appels, relances par SMS ou WhatsApp, exports | |
| **Leads** | Personnes qui vous ont contacté sans être encore patientes | |
| **Conversion des devis** | Suivi et relance des devis en cours | Autorisation « devis » requise |
| En bas : **sélecteur de clinique** | « Changer de clinique » ; « Multi-clinique » pour un propriétaire de plusieurs cliniques | Visible à partir de deux cliniques |
| En bas : roue dentée **Paramètres** | Menu de toutes les rubriques de réglages (§ 3) | S'ouvre au survol ou au clic, en bas de la barre de gauche (et **non** en haut à droite) |

### Barre du haut
- Champ **« Rechercher des informations ou lancer une action »** (⌘K, ou Ctrl+K sous Windows) avec un micro « Dicter une commande ».
- Dans un dossier patient : bouton **« Ouvrir Copilot IA »** et, à côté, le compteur de minutes.
- Une pastille de **crédits SMS** (« n crédits SMS restants »).
- La bouée **« Support & tickets »** : « Nouveau ticket », « En cours », « Résolus », « Réserver un appel support »,
  « Mon problème est réglé », « Rouvrir le ticket ». C'est ici que le client contacte le support. Claude ne crée pas de ticket.
- L'**avatar** (en haut à droite) : voir ci-dessous.
- Un lien « Ancienne version » existe aussi dans la barre du haut : ne le propose jamais.

### Menu de l'avatar (en haut à droite)
**Profil et préférences** (ouvre Paramètres › Mon compte) · le **nom de la clinique** et son **ID** avec un bouton pour le
copier · **Donner mon avis** · **Mon usage** (si activé ; n'en dis rien de plus, voir `shared/regles-communes.md` § 5) ·
**Nouveautés** (notes de version, pastille des non-lus) · **Tutos IA** (tutoriels guidés par Jarvis, ordinateur et iPhone) ·
**Documentation API** · **Factures d'abonnement** (« Factures et facturation », portail de l'abonnement) · **Me déconnecter**.
Le sélecteur de clinique n'est **pas** dans ce menu : il est en bas de la barre de gauche.

### Bulle Jarvis (en bas à droite de toutes les pages)
Bouton **« Ouvrir Jarvis »** : poser une question, demander « montre-moi comment… » (un guide pas à pas s'affiche à l'écran,
« Je vous montre ? »), chercher un dossier par son nom. Un parcours de formation personnalisé y est aussi proposé. Les
**visites « Découvrir cette page »** se lancent depuis Jarvis. Les **Tutos IA** se trouvent dans le menu de l'avatar.

## 2. Dossier patient et agenda : les points d'entrée
- **Dossier patient** : menu ⋮ **« Plus d'actions »** (Ajouter une visite, Rédiger une ordonnance, Visioconsultation, Documents
  administratifs, Envoyer des documents groupés, Fusionner, Envoyer un message, Envoyer une demande d'avis positif, Créer une
  photo avant / après, Créer une comparaison de photos, Dessiner une note, Ajouter un nouveau groupe de traitements, Ajouter
  aux favoris, Copier l'ID du patient, Modifier les informations du patient, Renvoyer le lien d'invitation, Renvoyer le lien
  de connexion au portail patient). Chaque ligne de traitement a des colonnes (Devis, Consentement, Ordonnance, Facture,
  Avoir…) : un « + » ou une pastille de couleur ouvre le menu de l'action. Détail : skill d'aide au quotidien.
- **Agenda** : « Aujourd'hui », « Vue jour / semaine / mois », interrupteur « Praticiens | Salles », « Prendre un rendez-vous »
  (onglets RDV, Absence, Horaire d'ouverture), « Plus d'options ».
- **Comptabilité au quotidien** : Paramètres › Comptabilité (§ 3.8).

## 3. Paramètres : toutes les rubriques (menu de la roue dentée, dans l'ordre)
| # | Rubrique | Onglets / contenu | Condition |
|---|---|---|---|
| 1 | **Mon compte** | Mon profil · Ma clinique · Programme de parrainage · Sessions de connexion · Clés API | Tous ; « Clés API » : option API et automatisations |
| 2 | **Antécédents** | Questionnaire médical de la clinique | Tous |
| 3 | **Informations patient** | Champs invariables · Champs additionnels | Tous |
| 4 | **Mots-clés** | Étiquettes pour les photos et vidéos | Tous |
| 5 | **Mes consultations** | Liste (motifs) · Bolt notes | Tous |
| 6 | **Mes traitements** | Liste · Consentement(s) éclairé(s) · Protocoles | Tous |
| 7 | **Documents** | Modèles : ordonnances, devis, factures, acomptes, avoirs, droit à l'image, administratifs… | Tous (familles masquées selon les options) |
| 8 | **Comptabilité** | Factures · Règlements · Devis · Avoirs · Répartition des honoraires · Moyens de paiement · Codes promo · Entité de facturation | Factures, Règlements, Avoirs : option Facturation |
| 9 | **Rapports** | Export des données de toutes les cliniques d'un groupe | Mode multi-clinique, propriétaire de la chaîne |
| 10 | **Parrainages** | Parrainage de patients | Tous |
| 11 | **Correspondants** | Confrères avec qui partager devis, factures, consentements | Tous, par clinique |
| 12 | **Communication** | Emails · SMS · WhatsApp | SMS : crédits + interrupteur ; WhatsApp : option |
| 13 | **Collaborateurs** | Équipe : actifs et en attente, archivés | Sièges selon l'offre |
| 14 | **Agenda** | Horaires d'ouverture · Réservation en ligne · Salles · Praticiens · Appareils · Consignes pré-consultation · Confirmation par prépaiement · Flux ICS + bouton « Paramètres » | Option Agenda |
| 15 | **Mes prescriptions** | Ordonnances types | Tous |
| 16 | **Historique** | Historique des activités (qui a fait quoi) | Tous |
| 17 | **Centre d'intégration** | Intégration native · Plugin Claude · CLI · Webhooks · Clés API | Tous ; Clés API et Make/Zapier : option API et automatisations |
| 18 | **IA** | Copilot (ce qu'il remplit) · Où s'exécute l'IA | Tous ; l'ordinateur local demande l'autorisation de gérer les machines |
| 19 | **Serveur privé** | Serveur dédié géré, n8n | Par clinique |
| 20 | **Téléphonie** | Agent · Qualification · Transferts · Forfait | Option agent vocal |

Il y a donc **19 rubriques** pour une clinique seule ; « Rapports » s'ajoute en mode multi-clinique. L'onglet « CLI » du
Centre d'intégration : n'en parle pas.

## 4. Détail des rubriques

### 4.1 Mon compte (5 onglets)
- **Mon profil** : photo (« Changer de photo », image de 2 Mo maximum, cases « Je suis médecin » et **« Créer le portail patient
  par défaut »**), « Informations personnelles » (prénom, nom, signatures), **« Code à 4 chiffres »**, « Modifier mon mot de
  passe », **« Authentification multi-facteurs »**, « Gestion du mot de passe » (propriétaire : forcer la réinitialisation pour
  toute l'équipe). Pas-à-pas : § 5.1.
- **Ma clinique** (titre « Paramètres de l'entreprise ») : Logo de la clinique, Nom de la société, Téléphone, Adresse, Ville,
  Code postal, Pays, Devise, **Fuseau horaire** (le changer recharge la page), numéro de TVA, URL, **URL de demande d'avis
  positifs**, Site internet, Langue ; **Utilisation du stockage** et « Télécharger les médias » ; **Export de mes patients**,
  « Exporter les visites », « Exporter la facturation ». Il n'y a **pas de champ « numéro RPPS de la clinique »** : le numéro
  d'identification du praticien se met sur sa fiche (Paramètres › Collaborateurs › Modifier › Identification › « Numéro
  d'identification 1 »).
- **Programme de parrainage** : liens et codes de parrainage de la clinique, paliers, « Mes parrainages » (à ne pas confondre
  avec la rubrique « Parrainages » des patients).
- **Sessions de connexion** : « Vos appareils », « Autres appareils », « Déconnecter les autres appareils » (utile en cas
  d'appareil perdu ou volé).
- **Clés API** : « Créer une nouvelle clé », copier, supprimer. Cadenas sans l'option API et automatisations.

### 4.2 Antécédents
Texte d'introduction, « Ajouter une question » (Réponse ouverte, Oui/Non, Choix simple, Choix multiples, Echelle, Date, plus un
en-tête). Bouton **« Paramètres »** : « Afficher automatiquement ce questionnaire après la première ouverture du portail
patient », « Utiliser le modèle par défaut », « Rendre accessible ce questionnaire depuis le portail patient ». Utile quand le
client veut que ses patients remplissent le questionnaire avant le rendez-vous.

### 4.3 Informations patient
- **Champs invariables** (obligatoires) : Email, Prénom, Nom, Sexe, Date de naissance, Tél, Adresse, Code postal, Ville, Pays,
  N° d'identifiant unique, Praticien ; boutons « Tout rendre obligatoire » et « Tout effacer ». On coche les champs ; pas de bouton
  Enregistrer.
- **Champs additionnels** : « Ajouter un champ » (6 types), options « Afficher dans le tableau de bord », « Accessible sur le
  portail patient », « Raccourci ». Ces champs peuvent aussi être insérés dans les documents.

### 4.4 Mots-clés
« Ajouter un mot-clé » (nom de l'étiquette), modifier, supprimer. Les mots-clés **classent les photos et vidéos avant/après**
(pas les patients) et servent à les retrouver dans le Portfolio de l'app iPhone/iPad. Sur iPhone : Paramètres › Compte › Mots-clés.

### 4.5 Mes consultations
- **Liste** (titre « Mes motifs de consultation ») : catégorie › sous-catégorie › visite (la visite est le motif réservable).
  Vues « Tableau » et « Tableau de bord ». Champs d'une visite : Nom, Durée, Tarif, Canaux (RDV en ligne, Calendrier, Fichier),
  **Bolt note**, Traitements liés (préréglages), Prépaiement, couleur. Import et export Excel (.xlsx) possibles.
- **Bolt notes** : « Nouvelle bolt note », Dupliquer, Supprimer (la dissocie des visites). Pour **rattacher** une bolt note : ouvrir
  la visite › bloc « Questionnaire bolt note » › « Sélectionner une bolt note » (une visite = une bolt note).

### 4.6 Mes traitements
- **Liste** : « Ajouter un traitement ». Lignes de tarifs : Sous-traitements, Prix (€), TVA (%), Produits obligatoires, Pack.
  (nombre de séances), Répart. honoraires, Rappel / Jours, Motif de consultation, **Consentement**, **Ordonnances**. « Document
  d'information » (PDF). Import et export Excel.
- **Consentement(s) éclairé(s)** : création, modification, duplication. Pour lier un consentement à un tarif : ouvrir le traitement ›
  la ligne de tarif › colonne « Consentement ».
- **Protocoles** (paquets) : « Nouveau pack » (nom, TVA, répartition, lignes traitement › tarif › séances ; 25 traitements au maximum).

### 4.7 Documents
Titre « Mes modèles ». Familles : Ordonnances (filtre par praticien), Devis (blocs de texte prédéfinis), Factures, Factures
d'acompte, Avoirs, Paiement refusé, Consentements de droit à l'image, Documents administratifs (interrupteur **« Création auto »** :
le document est alors créé pour chaque nouveau patient, à n'activer qu'avec l'accord du client), Consultations. Actions :
Modifier, Dupliquer, Supprimer, glisser pour réordonner, **« Créer un modèle »**. Le menu « Personnaliser » de l'éditeur insère les
champs automatiques. Si la liste est vide, l'assistant de démarrage n'a pas été terminé : crée d'abord le devis et la facture.

### 4.8 Comptabilité
Interrupteur « Partagez automatiquement les documents comptables avec vos patients » (n'active pas sans accord). Onglets :
**Factures · Règlements · Devis · Avoirs** (les trois premiers sous cadenas sans l'option Facturation ; Devis reste ouvert) ·
**Répartition des honoraires** (« Ajouter un nouveau modèle » ; les lignes d'un modèle font 100 %) · **Moyens de paiement**
(« Ajouter un moyen de paiement ») · **Codes promo** (« Ajouter un code promo » : Code, Début et Fin de validité, Montant,
« Appliquer à » : Global, Clinique uniquement, Médecin uniquement) · **Entité de facturation** (visible des administrateurs :
raison sociale, forme juridique, adresse, TVA, SIREN, RCS, capital ; « Activer le scellement NF525 »). **Le scellement NF525 est
irréversible : explique-le, ne l'active jamais à la place du client.** Les exports (« Exporter » : PDF en lot, récapitulatif,
Excel) se trouvent dans chaque liste. Le menu d'une pastille de facture (valider, encaisser, avoir) est décrit dans le skill
d'aide au quotidien.

### 4.9 Communication
Trois onglets : **Emails · SMS · WhatsApp**. Chaque modèle est une carte avec un interrupteur d'activation et « Modifier le
modèle » (Titre de l'email / Objet, Message, « Insérer le raccourci », « Envoyer un e-mail de test »). Modèles : Rappel du
portail patient, Traitement partagé, Evaluation, Envoi d'ordonnances, Devis, Envoi des factures définitives, Envoi des
consentements éclairés, Demande de signature, Confirmation de RDV, Rappel du RDV, Rendez-vous annulé, Demande de confirmation de
rendez-vous, Envoi des documents administratifs, Lien de connection rapide, Rappel (nouveau RDV), Bons cadeaux, Consultation,
Envoyer à un correspondant, SMS libre.
- **SMS** : interrupteur **« Envoi de SMS »** (éteint par défaut) puis sous-onglets Modèles · Crédits · Consommation · Messages.
- **WhatsApp** : interrupteur **« Envoi WhatsApp »** + modèles ; le téléphone se connecte dans le Centre d'intégration.
- Il n'y a **aucun champ « nom d'expéditeur » ni « adresse de réponse »** pour les e-mails : le nom d'expéditeur des e-mails
  se change pour l'instant via le support. Pour les SMS et WhatsApp, le nom affiché est l'« Objet » de chaque modèle
  (11 caractères maximum), modifiable dans le modèle.
- Conditions et crédits : `shared/options-et-credits.md`.

### 4.10 Collaborateurs
Onglet « Actifs et en attente » (et liste des archivés avec « Désarchiver »). Bouton **« Ajouter un collaborateur »** (grisé si plus
de siège). Fiche : Prénom, Nom, Email, **Rôle**, Spécialité, Numéro d'identification 1 et 2, couleur, et les interrupteurs
« Visible sur le tableau de bord », « Visible dans le calendrier », « Autoriser l'attribution de patients », **« Visible pour la
prise de rendez-vous en ligne »**, **« Accès aux fonctionnalités d'IA »** (Consult AI). Actions : Modifier, **Renvoyer
l'invitation**, Supprimer. Clic sur le nom du rôle : tiroir d'autorisations par module (droits fins). Noms de rôles à l'écran :
Praticien, Secrétaire, Assistant, Manager, Owner, Diététicien (et « Regular Executive » pour un cadre du siège).

### 4.11 Agenda (option Agenda)
Huit onglets : **Horaires d'ouverture · Réservation en ligne · Salles · Praticiens · Appareils** (le mot « machine » apparaît dans la
fenêtre) **· Consignes pré-consultation · Confirmation par prépaiement · Flux ICS**. Le bouton **« Paramètres »** (en haut à droite)
ouvre « Paramètres de l'agenda » (§ 5.5). La durée d'un créneau est la durée de la visite (Mes consultations).

### 4.12 Mes prescriptions
« +Ajouter une nouvelle ordonnance » : Nom, Praticien (ou « Modèle partagé (tous les praticiens) »), Contenu. Ce sont les
**ordonnances types**. La **mise en page** de l'ordonnance, elle, est un modèle de la rubrique Documents (famille Ordonnances).
Il n'existe pas de rubrique « Ordonnancier ».

### 4.13 Historique
« Historique des activités » avec recherche et filtres par type d'action. Utile pour répondre à « qui a supprimé ce devis ? ».

### 4.14 Centre d'intégration
Onglets : **Intégration native** (cartes : Stripe, WhatsApp, Zapier, Make.com, Twilio, Brevo, Mailchimp, HubSpot, SendGrid et d'autres) · **Plugin Claude** (installation de ce plugin) · CLI (ne pas en parler) ·
**Webhooks** (envoi d'événements : Patient créé / supprimé, Devis accepté, Facture validée, Rendez-vous mis à jour / supprimé,
Demande d'avis envoyée, Visite créée ; destination « URL Internet » ou « Nextmotion Local ») · **Clés API**. Il n'y a pas de carte
Doctolib (voir `shared/options-et-credits.md`).

### 4.15 IA, Serveur privé, Téléphonie
- **IA** : bloc « Copilot » (cases Consultations, Agenda, Antécédents médicaux, Traitements : ce que Consult IA remplit) et bloc
  **« Où s'exécute l'IA »** (« Dans le cloud » ou « Sur un ordinateur de la clinique » = Nextmotion Local). Réglage optionnel :
  laisse tout coché au début. Si l'IA est réglée en local et que l'ordinateur est éteint, l'IA s'arrête.
- **Serveur privé** : serveur dédié géré et n8n pour les automatisations. Pour un client qui veut « automatiser avec n8n ».
- **Téléphonie** : assistant de mise en service puis onglets Agent · Qualification · Transferts · Forfait.

## 5. Écrans sans outil : le pas-à-pas
Pour chacun : annonce le chemin, demande ce que le client voit, avance étape par étape.

### 5.1 Profil, code à 4 chiffres, double authentification, signature
Paramètres › **Mon compte** › onglet **Mon profil**.
1. **Signature** : « Informations personnelles » › **« Ajouter une signature »** › **« Importer une signature »** (ou la dessiner) ;
   plusieurs signatures possibles, l'une est « Par défaut » (liste « Signatures enregistrées »). Le plus simple : la dessiner à
   l'écran ; sur iPhone : Paramètres › Compte › Ma signature. Ne conseille aucun outil externe.
2. **Code à 4 chiffres** (exactement 4) : « Activer le code PIN », puis « Modifier le code PIN » ou « Désactiver ».
3. **Authentification multi-facteurs** : choisir **« Email »** ou **« Application d'authentification »** ; conserver les
   « Codes de récupération ».
4. **Mot de passe** : « Modifier mon mot de passe ».
5. **« Créer le portail patient par défaut »** : à décocher **avant** d'importer ou de créer plusieurs patients si la clinique ne
   veut pas qu'ils reçoivent tous un e-mail d'activation.

### 5.2 Logo et identité de la clinique
Paramètres › Mon compte › onglet **Ma clinique** › « Logo de la clinique » › **« Modifier »**. Si le client ne voit pas la section
Logo, son compte n'est pas administrateur : il demande au titulaire. Le reste (nom, adresse, fuseau…) se remplit sur le même
écran, sans bouton Enregistrer. TVA, SIREN, RCS : onglet Comptabilité › Entité de facturation.

### 5.3 Codes promo et bons cadeaux
- **Codes promo** : Paramètres › Comptabilité › **Codes promo** › « Ajouter un code promo » (code, début et fin de validité, montant,
  « Appliquer à »). Il n'y a ni « nombre d'utilisations maximum » ni type de remise.
- **Bons cadeaux** : se créent depuis le dossier du patient (carte patient › informations administratives › « Bons cadeaux »).
  Le modèle d'e-mail « Bons cadeaux » se personnalise dans Paramètres › Communication › Emails.

### 5.4 Champs additionnels du dossier patient
Paramètres › **Informations patient** › « Champs additionnels » › « Ajouter un champ » ; choisir le type, nommer, cocher si le champ
s'affiche sur le tableau de bord et/ou sur le portail patient.

### 5.5 Réglages d'agenda
Paramètres › **Agenda** › bouton **« Paramètres »** › « Paramètres de l'agenda » : accepter automatiquement les demandes de rendez-vous ;
ajouter au parcours patient en « salle d'attente » ; synchroniser le parcours patient et l'agenda ; délai minimum avant
réservation (interrupteur) ; **« Demander aux patients de confirmer leur rendez-vous »** (« Envoyer la demande » : 2 jours avant,
24 heures avant, ou Personnalisé de 1 à 168 heures ; **éteint par défaut**, ne l'active qu'avec l'accord du client ; le message
se modifie dans Communication › Emails › « Demande de confirmation de rendez-vous »). Il n'y a pas de « délai maximum de
réservation » ni de « durée de créneau par défaut » (la « Durée du créneau » de « Plus d'options › Configurer le calendrier »
ne règle que l'affichage de l'agenda, pas la durée des rendez-vous, qui est celle de la visite).

### 5.6 Consignes avant et après le rendez-vous
Paramètres › Agenda › **Consignes pré-consultation** : consignes avant, et aussi les consignes après la consultation, par visite.
(Les consignes après soin envoyées par e-mail par traitement se règlent avec les outils, voir `shared/outils-connecteur.md` § 6.)

### 5.7 Prépaiement par Stripe (2 étapes)
1. Paramètres › **Centre d'intégration** › **Intégration native** › carte **Stripe** › Connecter.
2. Paramètres › **Agenda** › **Confirmation par prépaiement** : « Activer le prépaiement pour les réservations » (grisé tant que
   Stripe n'est pas connecté ; l'alerte propose « Ouvrir le Centre d'intégration »), « Montant », messages avant le paiement
   (partiel ou intégral), « Encaisser le montant si » : « Absent non excusé » / « Absent excusé ». Pour un paiement intégral, le prix
   de la visite doit être saisi (Mes consultations). Le prépaiement se règle aussi visite par visite.

### 5.8 Réservation en ligne
Paramètres › Agenda › **Réservation en ligne** : pas de bouton « Publier » ni « Aperçu ». La page existe dès que l'option Agenda est
active et que des visites et des horaires sont proposés en ligne (visite : canal « RDV en ligne » dans Mes consultations, plus
horaires d'ouverture). Réglages : « Lien de réservation principal de la clinique » (modifiable), « Afficher la bannière haut de
page », « Code d'intégration » (copier le code « embed » pour le site web), « Google Tag Manager », « Couleur de la page »,
« Liens de réservation personnalisés ». La page publique est hébergée par le portail patient ; le lien exact s'affiche dans « Lien de réservation principal de la clinique ». **Demande l'accord du client avant d'afficher des visites en ligne ou de diffuser le lien.**

### 5.9 Mots-clés, antécédents, ordonnances types, correspondants
Chacun a sa rubrique propre (§ 4). Pour un « questionnaire » : antécédents = Paramètres › Antécédents ; compte rendu de visite =
Paramètres › Mes consultations › Bolt notes ; consentement = Paramètres › Mes traitements › Consentement(s) éclairé(s). Il n'y a
pas de rubrique « Questionnaires ».

### 5.10 Exporter ses données, stockage
Paramètres › Mon compte › Ma clinique : « Export de mes patients », « Exporter les visites », « Exporter la facturation »,
« Télécharger les médias », **« Utilisation du stockage »** (« Augmenter mon espace » pour le propriétaire).

### 5.11 Clé API, appareils connectés
Paramètres › Mon compte › **Clés API** (« Créer une nouvelle clé ») ; **Sessions de connexion** (« Déconnecter les autres appareils »).

### 5.12 Ouvrir le portail à un patient
Claude **ne peut pas** activer le portail à la place du client : il guide. À la création d'un patient (bouton « Ajouter un patient »
de la liste), l'interrupteur **« Créer l'espace patient »** envoie au patient un e-mail pour activer son espace (activé par défaut
selon la préférence « Créer le portail patient par défaut » de Paramètres › Mon compte › Mon profil ; l'option Portail patient est
nécessaire et le patient doit avoir une adresse e-mail). Pour un patient existant : dossier › menu ⋮ « Plus d'actions » ›
**« Renvoyer le lien d'invitation »** (compte non activé) ou **« Renvoyer le lien de connexion au portail patient »** (compte
déjà activé). Le patient doit utiliser le **dernier** e-mail reçu.

## 6. Plusieurs cliniques
Pour un propriétaire de plusieurs cliniques : « Changer de clinique » ou **« Multi-clinique »** en bas de la barre de gauche. En mode
groupe, la roue dentée ouvre les mêmes rubriques avec un bandeau :
- « Vous modifiez le groupe « X » — Ces réglages s'appliquent à toutes les cliniques du groupe » (traitements, consultations,
  répartition des honoraires, comptabilité) ;
- « Vous modifiez la clinique « X » — Ces réglages ne s'appliquent qu'à cette clinique ».
Collaborateurs et Agenda ont une page de groupe ; **Rapports** exporte les données de tous les sites dans un seul Excel (un onglet par
clinique). Correspondants, IA, Serveur privé et Téléphonie restent **par clinique**. Fais lire le bandeau au client avant d'écrire, et
demande « une ou plusieurs cliniques ? » avant de créer le catalogue.

## 7. Assistant de démarrage
Adresse : https://app.nextmotion.net/onboarding. Il fait presque toujours déjà l'essentiel : vous, votre clinique (nom, adresse, logo,
TVA), la signature, la certification NF525 (France), l'équipe, l'application iPhone, et pour finir l'installation de ce plugin.
**Lis le compte avant de poser une question d'identité** et ne redemande que ce qui est vide. Le plugin se trouve aussi dans
Paramètres › Centre d'intégration › Plugin Claude.

## 8. L'application iPhone / iPad (repères)
Onglets : **Patients · Agenda · Rapports · Tutos IA**, puis le menu « Autre » : **Leads · Portfolio · Chat · Paramètres**. Fiche patient :
**Médias · Traitements · Timeline · Dossier · Chat**, avec le bouton éclair (actions rapides). Pour les réglages de l'app :
Paramètres › Compte (Ma signature, Mots-clés, Parrainage), Paramètres › Stockage. Détail : skill d'aide au quotidien.
