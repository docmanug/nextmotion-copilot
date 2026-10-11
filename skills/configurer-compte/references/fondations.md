# Fondations — identité, profil, équipe, mots-clés, fiches patient

> Étape 2. Rien ici ne se refait si l'assistant de démarrage l'a déjà posé : **lis d'abord** (`references/decouverte.md` § 1)
> et ne redemande que ce qui est vide. Chemins : `shared/chemins-doctor-portal.md` (tous sous **Paramètres**, en bas de la
> barre de gauche).

## 1. À quoi sert Nextmotion pour ce client ? (le « mode »)
Déduis-le des options lues (`shared/options-et-credits.md`), puis confirme en une question.
| Cas | Ce que tu configures |
|---|---|
| **Photos seules** (NM Capture, app iPhone/iPad de photos et vidéos standardisées, visibles sur le web) | L'essentiel : profil, clinique, mots-clés. Termine par « installer l'application et s'y connecter » puis « suivre les Tutos IA ». Dis : « Votre offre est centrée sur les photos ; je vous configure l'essentiel. » Ne dis pas « contactez Nextmotion ». |
| **Consult sans Capture** | Tout le parcours, sans parler de mots-clés photos ni d'application photo. |
| **Consult avec Capture** (cas courant) | Tout le parcours. |
Le plus simple : si le client ne sait pas, pars du parcours complet, il ignorera ce qui ne le concerne pas.

## 2. Identité de la clinique
Lecture : nom, adresse, téléphone, logo présent ou non, fuseau horaire (`oapi_clinic_list`). **Ne promets pas** de lire la TVA
ni le RPPS : demande-les ou guide.
Écran : **Paramètres › Mon compte › onglet Ma clinique** (pas d'outil d'écriture). Les champs s'enregistrent tout seuls.
Champs : nom de la société, téléphone, adresse, ville, code postal, pays, **devise**, **fuseau horaire** (le changer recharge
la page), numéro de TVA, site internet, « URL de demande d'avis positifs » (utile avec l'option Avis patients), langue.
- **Logo de la clinique** : bouton « Modifier ». S'il n'y a pas de section Logo, le compte n'est pas administrateur :
  « demandez au propriétaire ». Il apparaît ensuite sur les documents.
- **Pas de champ RPPS pour la clinique** : le numéro d'identification se met sur la fiche de chaque praticien
  (Paramètres › Collaborateurs › Modifier › champ « Numéro d'identification 1 »).
- TVA : « nécessaire dès que vous facturez la TVA ». Pour le taux d'un acte, renvoie au comptable ; n'affirme pas de règle fiscale.
- Mentions légales des factures : elles viennent de l'**Entité de facturation** (`references/documents.md`), pas de cet écran.

## 3. Profil du praticien (écran, aucun outil)
**Paramètres › Mon compte › onglet Mon profil** : photo (« Changer de photo », JPG, GIF ou PNG, 2 Mo maximum), cases
« Je suis médecin » et « Créer le portail patient par défaut » (voir § 7), informations personnelles.
- **Signature** : deux façons, au choix, quelle que soit l'offre. Sur l'iPhone ou l'iPad : Paramètres › Compte › Ma signature ›
  Ajouter une signature. Sur le web : Paramètres › Mon compte › Mon profil › Informations personnelles › « Ajouter une
  signature » (importer une image ou dessiner ; plusieurs signatures possibles, une « Par défaut »). Elle sert aux devis,
  ordonnances et consentements.
- **Code à 4 chiffres** (« Activer le code PIN », « Modifier le code PIN ») et **Authentification multi-facteurs**
  (choix « Email » ou « Application d'authentification »). Recommandé, jamais bloquant.

## 4. Collaborateurs
Écran : **Paramètres › Collaborateurs** (onglet « Actifs et en attente », bouton « Ajouter un collaborateur », actions
« Modifier », « Renvoyer l'invitation »). Outils : `oapi_clinic_doctor_list`, `oapi_clinic_doctor_create`, `oapi_doctor_update`.

### Les rôles (à l'écran → code)
Praticien (10) · Secrétaire (9) · Assistant (11) · Manager (12) · Propriétaire (13) · Diététicien (8). Seul le propriétaire
est unique. Un **Manager a des droits d'administration** : réserve ce rôle à une personne de confiance (il voit et modifie
les réglages sensibles). Secrétaire et assistant ne sont pas administrateurs ; leurs droits se règlent section par section
(Paramètres › Collaborateurs › Modifier › **Autorisations**). Le rôle choisi applique déjà le jeu de droits prévu ;
seuls les ajustements fins se font dans les autorisations.
**Garde-fous** : tu **ne crées jamais** un propriétaire (13) et tu **ne promeus jamais** quelqu'un en propriétaire (cela
retire le statut au titulaire actuel). Pour un **Manager**, demande la confirmation du titulaire avant l'appel.

### Créer un collaborateur : annonce, accord, siège
1. Demande : prénom, nom, **e-mail** (il sert d'identifiant), rôle, couleur dans l'agenda (facultative), numéro
   d'identification (facultatif ; il va dans le champ « Numéro d'identification 1 »).
2. **Annonce** : « Cette personne va recevoir un e-mail d'invitation de Nextmotion tout de suite. » Demande un OK
   explicite avec prénom, nom, e-mail et rôle.
3. Vérifie qu'il reste un **siège** libre (`oapi_clinic_feature_list`, ligne collaborateurs : les sièges sont **en plus** du
   titulaire ; ne te fie pas au compteur d'utilisation). Sinon : « Votre offre n'a plus de siège libre : vous pouvez en
   ajouter un ou passer à l'offre supérieure (bouton « Ajouter un collaborateur »). »
4. `oapi_clinic_doctor_create` : `email` et `kind` obligatoires ; `first_name` et `last_name` si l'e-mail est nouveau ;
   `color` en **8 caractères** (ex. `3498dbff`) ; `id_no_1` pour le RPPS. Pour une **secrétaire, un assistant ou un
   manager**, mets `display_in_calendar_provider_view` à **faux**, sinon la personne apparaît comme praticien dans
   l'agenda.
5. Pour qu'un praticien soit **réservable en ligne** : `visit_types` (ses motifs), `activate_online_booking` à vrai et
   `display_in_appointment_page` (visible sur la page de rendez-vous) ; à l'écran : « Visible pour la prise de rendez-vous
   en ligne », « Visible dans le calendrier », « Visible sur le tableau de bord », « Autoriser l'attribution de patients ».
   Ne les ouvre qu'avec l'accord du client et après avoir créé les motifs (`references/agenda.md`).
6. **Consult IA** : activé par défaut pour chaque nouveau collaborateur (`has_copilot_ai_access`). Pour le retirer ou le
   remettre : Paramètres › Collaborateurs › ouvrir la fiche › « Consult AI » (le libellé est resté en anglais à l'écran).
7. Vérifie avec `oapi_clinic_doctor_list`.
Modifier : `oapi_doctor_update` exige la **spécialité** : relis le collaborateur et renvoie l'objet complet.
Une secrétaire ou un assistant se crée avec le même outil et la même annonce qu'un praticien.

## 5. Mots-clés des photos
**Paramètres › Mots-clés** (bouton « Ajouter un mot-clé »). Pas d'outil de création : guide le client, après avoir regardé
avec lui ce que l'assistant a déjà créé. Si le client dit « tag » ou « photothèque », suis son vocabulaire ; l'écran
affiche « Mots-clés » et « Portfolio ». Utile surtout si l'app photo (NM Capture) est utilisée : mots-clés par zone
(Front, Pommettes, Lèvres…) ou par acte, qui se croisent avec le type de traitement dans le Portfolio. À proposer selon
sa pratique, pas en liste générique.

## 6. Dossier patient : champs
- **Champs obligatoires** : Paramètres › Informations patient › « Champs invariables ». On coche les champs (Email, Prénom,
  Nom, Sexe, Date de naissance, Tél, Adresse, Code postal, Ville, Pays, N° d'identifiant unique, Praticien ; « Tout rendre
  obligatoire », « Tout effacer »), sans bouton Enregistrer. Recommandation : Prénom, Nom, Date de naissance, Email ou Tél.
- **Champs additionnels** : Paramètres › Informations patient › « Champs additionnels » › « Ajouter un champ ». Six types
  au choix à l'écran, avec les options « Afficher dans le tableau de bord » et « Accessible sur le portail patient » ; ces
  champs peuvent aussi être insérés dans les documents. Pas d'outil : guide, et demande au client le libellé et le type.
- Antécédents (questionnaire médical) : `references/finance-communication.md`.

## 7. Créer des fiches patient
Règles et garde-fous : `shared/donnees-et-confidentialite.md` (récapitulatif et accord, doublons ; un dossier existant ne se
modifie que sur demande explicite, jamais fusionné ni supprimé). Pratique :
- `oapi_clinic_patient_create` exige **e-mail, prénom, nom et sexe** ; le reste est facultatif (date de naissance,
  téléphone, adresse, consentements aux contacts). Vérifie d'abord avec `oapi_clinic_patient_list` que le patient n'existe pas.
- **Espace patient** : à la création, la case « Créer l'espace patient » (cochée d'office) envoie au patient un e-mail
  d'activation. Elle suit la préférence **« Créer le portail patient par défaut »** (Paramètres › Mon compte › Mon profil).
  Demande au client ce qu'il veut. S'il ne veut aucun envoi automatique, ou avant un import de plusieurs patients, fais-lui
  **décocher cette préférence avant**. Prérequis du portail : l'option Portail patient et un e-mail du patient.
- Import depuis une liste (Excel, tableau collé) : une fiche après l'autre, récapitulatif d'abord. Prévenir que les
  intégrations actives (Doctolib, par exemple) reçoivent aussi la fiche. Un fichier venant d'un autre logiciel n'est pas
  importé automatiquement : ne le promets pas.
- Un patient dit que son lien d'activation ne marche pas : seul le **dernier** e-mail fonctionne, il expire ; renvoie le lien.
  L'export des patients existe aussi à l'écran (Paramètres › Mon compte › Ma clinique, « Export de mes patients »).

## 8. Plusieurs cliniques
Demande « une ou plusieurs cliniques ? » avant de créer le catalogue. Sur un compte de groupe, un bandeau indique si l'on
modifie le **groupe** ou **une clinique** : lis-le avant d'écrire, et ne crée pas motifs et traitements clinique par clinique
si le client veut les partager (skill multi-sites).

## 9. Webhooks (hors configuration de base)
Paramètres › Centre d'intégration › Webhooks. Tu les **lis** par défaut (`oapi_clinic_webhook_list`). Tu n'en crées un que sur
demande explicite du client (« envoyer mes nouveaux patients vers mon outil »), après récapitulatif : événement, adresse de
destination. Huit événements existent à l'écran (patient créé ou supprimé, devis accepté, facture validée, rendez-vous modifié
ou supprimé, demande d'avis envoyée, visite créée) ; **par outil, seuls les événements patient, devis, facture et paiement** :
pour les autres, guide le client à l'écran. La destination est une adresse Internet ou l'ordinateur Nextmotion Local.

## 10. Récapitulatif et suite
Liste : identité (présente ou à compléter), logo, signature, équipe créée, mots-clés, champs patient. Ce que le client
fait à l'écran : logo, signature, mots-clés, champs. Puis : « On construit maintenant votre catalogue »
(`references/catalogue.md`).
