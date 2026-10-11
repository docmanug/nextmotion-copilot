# Le dossier patient au quotidien

Tout se passe sur [ordinateur] sauf mention. Tu **guides** : tu ne lis pas le contenu d'un dossier existant et tu n'y
écris pas (`shared/donnees-et-confidentialite.md`).

## Comment la page est organisée
Barre de gauche → **Patients** → cliquez un patient.
- **En haut** : la carte patient (Devis, Réglé, Restant), la frise **« Historique des visites »**
  (« Ajouter une consultation ») et le panneau de notes (« Dernière visite », « Visite sélectionnée », « Note permanente » ;
  vous pouvez l'élargir).
- **Dessous**, deux sections que l'on peut permuter : **« Groupes de traitements »** et **« Journal »**.
- Un **groupe de traitements** regroupe des soins (onglets, « Nouveau groupe », « Ajouter un traitement »). Chaque soin est
  une **ligne**. Colonnes d'une ligne : Nom du traitement, Descriptif, Tarification, Quantité, Date de traitement, **Praticien**,
  Consultation, **Devis**, Consentement, Ordonnance, **Facture**, Avoir, RDV forfait, nb séances (forfait), Produits, pdf
  (info post-soin), Notes partagées, assistant, Secrétaire. « Modifier l'affichage » choisit et réordonne les colonnes ;
  « Filtrer » trie par état (devis provisoire / validé / accepté, facture provisoire / validée / d'acompte / réglée, consentement).
- **Consultation ou ligne ?** La **consultation** est l'échange médical : vous y écrivez la note (colonne « Consultation »
  ou frise). La **ligne de traitement** est l'acte : devis, consentement, produits, facture. Première consultation ou point
  médical à noter : les deux. Acte de routine : la ligne suffit. Pour compter les passages d'un patient, regardez la frise
  « Historique des visites ».
- Plusieurs médecins : une organisation commune (par exemple un groupe « Actes médicaux » et un groupe « Soins délégués »).
  Chiffre d'affaires par praticien : Paramètres → Comptabilité, filtre **Émetteur**.

## Que faire depuis le dossier ? (menu ⋮ « Plus d'actions »)
| Je veux… | Dans le menu ⋮ |
|---|---|
| noter une consultation | « Ajouter une visite » (ou « Ajouter une consultation » sur la frise) |
| faire une ordonnance libre | « Rédiger une ordonnance » |
| faire une visio | « Visioconsultation » |
| un papier administratif | « Documents administratifs » |
| envoyer plusieurs documents d'un coup | « Envoyer des documents groupés » (10 au plus) |
| regrouper deux dossiers en double | « Fusionner » |
| écrire au patient | « Envoyer un message » (ouvre Messages) |
| demander un avis | « Envoyer une demande d'avis positif » (`references/messages-sms-whatsapp.md`) |
| ajouter une photo ou comparer | « Créer une photo avant / après », « Créer une comparaison de photos » |
| faire un schéma | « Dessiner une note » |
| un nouveau soin | « Ajouter un nouveau groupe de traitements » |
| retrouver vite ce patient | « Ajouter aux favoris » / « Retirer des favoris » |
| corriger ses coordonnées | « Modifier les informations du patient » |
| lui rouvrir son portail | « Renvoyer le lien d'invitation » ou « Renvoyer le lien de connexion au portail patient » (`references/portail-patient.md`) |
Archiver ou supprimer un patient : dans la **liste** (menu de la ligne). Sur l'iPhone, le bouton éclair (`references/app-iphone-ipad.md`).

## Rédiger la consultation
1. Frise → **« Ajouter une consultation »** (ou ⋮ → « Ajouter une visite »). Fenêtre « Nouvelle visite » :
   « Sélectionnez un motif de consultation ».
2. Si le motif a une **BoltNote**, un petit questionnaire « Insérez vos réponses » s'ouvre : c'est la trame de compte
   rendu du motif (produit, zone, technique…), déjà prête, avec quelques champs à compléter par le praticien (ou par
   Consult IA). Ce n'est pas un raccourci à taper. Créer ou modifier une BoltNote : Paramètres → Mes consultations → onglet
   Bolt notes. Relisez-les après quelques semaines d'usage.
3. La note s'ouvre dans « Note de consultation » : écrivez ou **dictez** (bouton « Dicter »). Elle s'enregistre seule
   (« Enregistré »). 
4. **Note permanente** : pour ce qui doit rester visible (allergies, contre-indications). Elle se dicte aussi.
5. Écoute automatique : « Ouvrir Copilot IA » (`references/support-et-assistance.md`).

## Notes et alertes
- **Note permanente** (carte patient, panneau de notes) : allergies, contre-indications. Toute l'équipe la voit.
- **Notes partagées** : colonne de chaque ligne de traitement (« Ajouter des notes partagées… »).
- **VIP** : étiquette dans la liste. **Mots-clés** : Paramètres → Mots-clés, puis filtre « Mot-clé » de la liste.

## Ordonnances
- **Ordonnances types d'un soin** : liées au soin dans Paramètres → Mes traitements (colonne « Ordonnances »). Dans le dossier,
  colonne **Ordonnance** de la ligne → « + » → **« Générer les ordonnances »** → « Qui émet ces ordonnances ? ». La pastille
  indique « Générées », « Modifiées », « Signées, pas encore envoyées » ou « Envoyées le… ». Son menu : « Voir les ordonnances »,
  « Voir et modifier », « Renvoyer par mail », « Imprimer », « Supprimer les ordonnances ».
- **Ordonnance libre** : ⋮ → **« Rédiger une ordonnance »** : choisissez le modèle, « Texte libre », « Un document par ordonnance »
  ou « Tout fusionner sur une seule ordonnance », « Signer automatiquement ».
- **Corriger après coup** : depuis le Journal, « Modifier l'ordonnance » (l'enregistrement remplace le PDF). Une ordonnance
  **signée n'est plus modifiable**. On ne peut émettre qu'au nom d'un praticien qui en a le droit.
- Par la voix : dans ⌘K, « rédige une ordonnance de paracétamol pour ce patient » ouvre l'ordonnance pré-remplie.

## Consentements : trois façons de les faire signer
Colonne **Consentement** → **« Créer un consentement »** (réponses éventuelles : « Insérez vos réponses »). Puis le menu :
1. **À l'écran, devant vous** : « Signer le consentement éclairé » (ordinateur, ou iPad : `references/app-iphone-ipad.md`).
2. **Par e-mail, à distance** : « Envoyer en signature » (lien par e-mail, 1 crédit de signature ; 500 inclus par mois),
   puis « Demande de signature » pour le suivi. Le patient peut aussi tout signer dans son portail (`references/portail-patient.md`).
3. **Signé sur papier** : « Importer consentement signé » (scan).
Le menu propose aussi Prévisualiser, Voir Pdf, Télécharger le Docx, Envoyer par mail, Envoyer à un correspondant.
Sans signature par défaut du médecin, un message demande de la définir (Paramètres → Mon compte → Mon profil).
Le consentement « droit à l'image » se signe sur l'iPhone/iPad (`references/app-iphone-ipad.md`).
Pas de durée de réflexion à annoncer : dites « pratique courante à valider avec votre assurance ou votre Ordre ».

## Documents administratifs et envois groupés
- **Créer** : ⋮ → « Documents administratifs » → « Nouveau document administratif » → choisissez le modèle, remplissez le
  formulaire, le PDF se génère, « Accepter » pour signer. Ces documents ajoutent des colonnes à la table des traitements.
- **Envoyer plusieurs documents** : ⋮ → « Envoyer des documents groupés » → cochez jusqu'à **10** documents, choisissez « Au patient »
  ou « À un correspondant », « Confirmer et envoyer ». Un seul e-mail avec des liens sécurisés.
- **Envoyer à un confrère** : « Envoyer à un correspondant » est dans les menus des pastilles Devis, Facture, Consentement, du Journal.
  Il faut qu'au moins un correspondant existe (Paramètres → Correspondants).
- **Informations administratives** : carte patient → « Voir les informations administratives » (questionnaire, documents associés, « Télécharger le dossier complet »).

## Fusionner deux dossiers en double
⋮ → **« Fusionner »** : 1) « Sélectionnez le patient en double » ; 2) « Choisir les antécédents médicaux » ; 3) « Réconcilier les
informations du patient », champ par champ ; puis « Fusionner ». **Irréversible** : fais confirmer le client et vérifier les deux dossiers avant.

## Retrouver, exporter, archiver des patients
Barre de gauche → **Patients**. Puces : Récents, Inactifs, À relancer, Anniversaires ce mois-ci, VIP, Archivés, Consentement
signé. Filtres : Statut, **Praticien**, Mot-clé, Tranche d'âge, Total facturé. « Colonnes » (mémorisées) et « Affichage » (Compact /
Confortable / Spacieux). **« Exporter »** demande le mot de passe du compte. **« Ajouter un patient »** : la case
« Créer l'espace patient » envoie un e-mail d'activation du portail. Menu de la ligne : Ouvrir le profil, Planifier un rendez-vous,
Appeler, Archiver / Désarchiver, Supprimer (irréversible). La recherche marche avec ou sans le 0 initial du téléphone.
**Praticien** : renseignez la colonne « Praticien » de chaque ligne de traitement. Un médecin absent des choix :
Paramètres → Collaborateurs → sa fiche → « Attribution des patients ». Pour retrouver les dossiers sans médecin : filtre Praticien.

## Journal : retrouver un document ou une visite
Section **« Journal »** : tout est classé par date (visites, e-mails, SMS, documents, devis, factures, photos, comparaisons). Outils :
« Rechercher », « Date de consultation », « Filtrer par type », « Tout effacer ». Cliquez une ligne : aperçu avec « Agrandir »,
« Télécharger », « Imprimer », « Envoyer par mail ». **Preuve d'envoi d'un e-mail** : cliquez l'e-mail envoyé → bloc **« Statut de
livraison »** (pastille verte = remis, rouge = erreur). « Supprimer la visite » l'efface vraiment (confirmation demandée).

## Photos, mots-clés et Portfolio
- **Sur ordinateur** : ⋮ → « Créer une photo avant » / « Créer une photo après » (déposez un fichier JPEG ou PNG) ou
  « Créer une comparaison de photos ». Les photos prises avec l'iPhone/iPad arrivent seules dans le Journal.
  La **prise de vue structurée** (cadrage identique, photo « après » calée) se fait sur l'iPhone/iPad (`references/app-iphone-ipad.md`).
- **Mots-clés (« tags ») de photos** : ils classent vos photos et vidéos, pas vos patients. Créer : Paramètres → Mots-clés →
  « Ajouter un mot-clé » (sur l'iPhone : Paramètres → Compte → Mots-clés). Idée simple : par zone (lèvres…), par acte (toxine, AH…), par moment (avant, après, J+15…), « Publication OK » si le patient a donné son accord pour l'image.
  Les attribuer et les retrouver dans le **Portfolio**, la photothèque de vos avant/après : `references/app-iphone-ipad.md`.
- **Fiche d'information post-soin** : réglée sur le traitement (Paramètres → Mes traitements → « Importer le document d'information »).
  Envoi **manuel** : colonne **pdf** de la ligne → « Envoyer par mail ». Envoi **automatique** : un modèle de communication à part.
- **Produits utilisés et traçabilité** : colonne « Produits » de la ligne → « Ajouter des produits » (le lot et la date de péremption
  sont reliés au dossier). Sur l'iPhone : ligne → icône appareil photo pour photographier l'étiquette.

## Questionnaire d'antécédents
Paramètres → **Antécédents** : « Ajouter une question » (réponse ouverte, Oui/Non, choix simple, choix multiples, échelle, date).
Quinze à vingt questions, surtout des Oui/Non. Pour que les patients le remplissent eux-mêmes,
voir `references/portail-patient.md`.

## Bon à savoir (« pourquoi ça a changé ? »)
Dates en jj/mm/aaaa. Téléphone pré-rempli avec l'indicatif du pays. Un nouveau groupe de traitements est sélectionné dès sa création.
Du devis accepté à la facture, remises, extras et quantités sont repris. La date d'une ligne reste modifiable après validation.
Dossiers et agenda se mettent à jour en direct. Jarvis retrouve un dossier avec le seul nom.

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
Tutos IA : « Créez votre premier patient » · « Découvrir le nouveau dossier patient ». Guides Jarvis : « Ajouter un patient et le
rattacher à un praticien » · « Rechercher un patient depuis la liste des patients » · « Exporter la liste de vos patients » ·
« Modifier les informations et les documents administratifs d'un patient » · « Dicter au lieu de taper » · « Rédiger une ordonnance avec ⌘K ».
