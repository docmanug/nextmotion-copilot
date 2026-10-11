# Finance et communication — réglages à la demande

> Étape 6. Réglages optionnels, proposés après le cœur du compte ou quand le client les demande. Lis l'option concernée avant de
> proposer (`shared/options-et-credits.md`) ; si tu ne peux pas la lire, demande au client ce qu'il voit à l'écran.
> Ce qui envoie de vrais messages à de vrais patients ne s'active jamais sans accord explicite.

## 1. Moyens de paiement
Paramètres › Comptabilité › **Moyens de paiement**. Carte bancaire, espèces, chèque, virement et « Autre » existent **déjà
d'office** (ainsi que Stripe et le bon cadeau automatiquement). Lis d'abord `oapi_clinic_payment_medium_list`. Demande : « Avez-vous
un moyen de paiement particulier (paiement en plusieurs fois, chèque cadeau) ? » Ne crée que ceux-là, avec
`oapi_clinic_payment_medium_create` (un nom réservé est refusé). Récapitulatif : « Les moyens usuels sont déjà là ; j'ai ajouté … ».

## 2. Répartition des honoraires (cabinets à plusieurs praticiens)
Paramètres › Comptabilité › **Répartition des honoraires**. Condition ferme : **plusieurs praticiens** (sinon : « C'est une fonction
pour plusieurs praticiens ; on passe, elle ne vous est pas utile »). L'option Comptabilité est **recommandée** (les honoraires
servent surtout aux factures) mais ne masque pas la section. Deux étapes :
1. **Créer le modèle** : `oapi_clinic_accounting_distribution_create`, `name` et exactement deux lignes (clinique, praticien) avec
   `price_percent` (total 100 %), `vat_rate` et `details`. Demande : « Quelle part pour la clinique, quelle part pour le praticien,
   avec quel taux de TVA ? »
2. **Le rattacher** aux lignes de tarif (`accounting_distribution` dans `pricings`, ou colonne « Répart. honoraires »), et si besoin
   **par praticien** (`oapi_treatment_pricing_user_accounting_distribution_replace`, un modèle par praticien). Incompatible avec les
   « sous-prix » d'une même ligne (`references/catalogue.md` § 2). Pour un protocole : les outils de répartition du protocole.
Vérifie avec `oapi_clinic_accounting_distribution_list`.

## 3. Codes promo et bons cadeaux (écran seulement)
- **Codes promo** : Paramètres › Comptabilité › **Codes promo**. Champs : Code ; « Début de la validité du code » et « Fin de la
  validité du code » (obligatoires) ; montant **en euros ou en pourcentage** (l'un ou l'autre) ; « Appliquer à » (global,
  clinique seulement, médecin seulement). Un code est unique par clinique. Il s'utilise avec le bouton « Utiliser un bon
  d'achat » sur un devis ou une facture. Il n'y a ni type de remise, ni nombre d'utilisations maximum. Pas d'outil : guide.
- **Bons cadeaux** : créés depuis le dossier du patient (« Nouveau bon cadeau »), comptés comme moyen de paiement. Personnalise
  l'e-mail « Bons cadeaux » (§ 7). Non pilotable par Claude.

## 4. Partage des documents comptables avec les patients
En haut de Paramètres › Comptabilité, l'interrupteur « Partagez automatiquement les documents comptables avec vos patients »
publie leurs factures dans leur portail. Pose la question quand le client active le portail patient ; ne l'active pas à sa
place. Mentions légales et certification des factures : `references/documents.md`.

## 5. Questionnaire d'antécédents
Paramètres › **Antécédents** (à ne pas confondre avec « Consignes pré-consultation » de l'Agenda). C'est la première brique utile :
propose-le tôt (`references/decouverte.md`). Il est rempli par le patient dans son portail (si l'option Portail patient est dans l'offre)
ou saisi par le praticien dans le dossier ; ne promets pas qu'il se remplit sur l'iPad à l'accueil. Ce que le patient voit dans son
portail : skill aide-quotidien (fiche Portail patient).
Outils : `oapi_clinic_medical_history_retrieve` puis `oapi_clinic_medical_history_update`, avec `medical_history_tmpl` =
`{"h": {"val": "<message de bienvenue>"}, "q": [ … ]}`. Écrire le questionnaire de la clinique demande un **administrateur** (`scope`
clinique, par défaut ; le questionnaire personnel est `scope` praticien). Relis puis renvoie tout.
| `type` | Réponse | Champs en plus de `id`, `val` |
|---|---|---|
| 1 | Réponse ouverte | — |
| 2 | Oui / Non | `y`, `n` (libellés des boutons) |
| 3 / 4 | Choix simple / choix multiples | `boxes: [{id, text}]` |
| 5 | Échelle | `min`, `max` |
| 7 | Date | — |
Chaque question et chaque choix a un `id` unique (UUID). `patient_can_answer` à **vrai** pour ce que le patient doit remplir seul
(faux par défaut) ; `short_name` et `display_in_dashboard` facultatifs. L'assistant de démarrage propose un modèle de 8 questions.
Défaut sûr : allergies (oui/non), traitements en cours (libre), grossesse ou allaitement (oui/non), antécédents chirurgicaux
(libre), contre-indications (choix multiples). **À l'écran, le client règle** (roue « Paramètres » du questionnaire) :
« Afficher automatiquement ce questionnaire après la première ouverture du portail patient », « Utiliser le modèle par défaut »,
« Rendre accessible ce questionnaire depuis le portail patient » ; l'outil ne règle pas ces trois interrupteurs.

## 6. Avis patients
Option « Avis patients » : verrou dans le menu du patient ; le propriétaire peut la débloquer en ligne. L'adresse de la page d'avis
se met dans Paramètres › Mon compte › Ma clinique (« URL de demande d'avis positifs »).

## 7. Messages automatiques (e-mail, SMS, WhatsApp)
Paramètres › **Communication**, trois onglets : **Emails**, **SMS**, **WhatsApp**. Tu **modifies les modèles existants**, tu n'en crées
pas de nouveaux.
- Lecture : `oapi_clinic_communication_template_list` (filtre `kind` : e-mail, SMS, WhatsApp), `oapi_communication_template_retrieve`.
  Mise à jour : `oapi_communication_template_update` avec `template` (`html`, `subject`) et `is_enabled`. Ne montre jamais les identifiants
  de modèles externes.
- **Variables** : n'invente rien ; appelle `oapi_communication_template_autocomplete_list` avec le `type` du modèle. Les variables
  courantes sont celles du patient, de la clinique et du praticien (nom, adresse, téléphone) ; les rendez-vous ont les leurs
  (date, heure, motif, lien).
- **Nomme les modèles comme à l'écran** : « Confirmation de RDV », « Rappel du RDV », « Rendez-vous annulé », « Demande de
  confirmation de rendez-vous », « Devis », « Envoi des factures définitives », « Envoi des consentements éclairés », « Envoi
  d'ordonnances », « Envoi des documents administratifs », « Rappel du portail patient », « Lien de connection rapide », « Rappel
  (nouveau RDV) », « Bons cadeaux », « Consultation », « Evaluation ». Quelques-uns sont encore en anglais à l'écran : décris-les.
- Chaque modèle s'**active ou se désactive** (« activer/désactiver ce message ») : demande lesquels le client veut.
- **Nom de l'expéditeur** des e-mails : il est posé à l'inscription ; pour le changer, **passer par le support** pour l'instant
  (pas de réglage à l'écran). Pour les SMS et WhatsApp, c'est l'objet de chaque modèle (voir plus bas). Ne présente ni adresse
  de réponse ni réglage technique d'envoi comme modifiables.
- Le client peut tester un e-mail avec « Envoyer un e-mail de test ».

### SMS
Un SMS part si **trois conditions** sont réunies, à vérifier **dans cet ordre** avant de dire que « les SMS fonctionnent » :
1. l'interrupteur **« Envoi de SMS »** est allumé (éteint par défaut, il envoie de vrais SMS à de vrais patients : **le client
   l'allume lui-même**, tu le guides) ; 2. le **modèle** est activé ; 3. il reste des **crédits** (`oapi_clinic_feature_list`, ligne
   des crédits SMS : `remaining_count` supérieur à zéro).
Écran : Paramètres › Communication › SMS, sous-onglets **Modèles**, **Crédits**, **Consommation**, **Messages**. Sans crédits : « Il ne
vous reste plus de crédits SMS : Paramètres › Communication › SMS › Crédits › Recharger » (achat en ligne). Ne dis pas « option non
activée » ni « contactez le support », et ne donne aucun prix.
Rédaction : **objet de 11 caractères maximum** (c'est le nom de l'expéditeur) ; viser **160 caractères au plus après insertion des
valeurs** (un message plus long consomme plusieurs crédits).

### WhatsApp
Quatre prérequis : l'option **WhatsApp** dans l'offre ; un **téléphone connecté** (Paramètres › Centre d'intégration › Intégration
native › WhatsApp) ; l'interrupteur **« Envoi WhatsApp »** (Paramètres › Communication › WhatsApp) ; des modèles activés.
Tu peux rédiger les textes des modèles WhatsApp ; tu ne connectes pas le téléphone et tu n'allumes pas l'interrupteur (le client le
fait, tu le guides). Objet de 11 caractères au plus, comme les SMS.

## 8. Ailleurs
Champs additionnels du dossier patient et webhooks : `references/fondations.md`. Entité de facturation et NF525 :
`references/documents.md`.

## 9. Récapitulatif de clôture
« Moyens de paiement : … Honoraires : configurés / sans objet. Antécédents : en place. Messages : N modèles mis à jour, N activés.
SMS : interrupteur [allumé/éteint], crédits [oui/non]. À faire à l'écran : codes promo, interrupteurs d'envoi, connexion du
téléphone WhatsApp. » Puis propose le skill former-equipe pour prendre en main ce qui vient d'être configuré.
