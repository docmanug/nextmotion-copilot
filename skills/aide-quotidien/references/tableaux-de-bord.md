# Chiffres, tableaux de bord et bilans

## Donner un chiffre d'activité (lecture seule)
Des **totaux par défaut** (règles : `shared/donnees-et-confidentialite.md`). Une liste nominative (par exemple les devis en
attente) seulement si le client la demande ; pour un patient précis, réponds sur ce patient. Montre aussi où le trouver à l'écran.

| Question du client | Comment lire | Où il le voit lui-même |
|---|---|---|
| « Combien de rendez-vous aujourd'hui ? » | `oapi_clinic_calendar_appointment_list` avec la date du jour : donne le nombre (`count`) | Calendrier, « Vue jour » ; tableau de bord Assistant : « RDV du jour » |
| « Mon chiffre d'affaires du mois ? » | `oapi_clinic_statistics_appointment_income` avec `period_type` = mois et les dates de début et de fin du mois | Tableau de bord, vue Manager : « CA encaissé », période 30 j |
| « Combien de devis en attente ? » | `oapi_clinic_quote_list` : compter les devis dont le statut est « validé, en attente de réponse » | ⌘K → « Devis en attente » ; page « Conversion des devis » |
| « Combien de factures impayées ? » | `oapi_clinic_invoice_list` : compter les factures validées non réglées | ⌘K → « Factures impayées » ; carte patient → « Impayés » |

Règles pratiques :
- Annonce un total en une phrase (« Vous avez 14 rendez-vous aujourd'hui »), puis dis où le retrouver.
- Les listes sont paginées (`limit`, `offset`) et renvoient un `count`. Si le compte est grand ou si tu hésites sur un statut, **ne devine pas** :
  oriente vers ⌘K « Requêtes intelligentes » ou la page concernée.
- Ce chiffre est calculé à partir des rendez-vous : c'est un ordre de grandeur. Pour un montant officiel (comptable), renvoie à Paramètres → Comptabilité. Précise-le si
  le client compare avec son tableau de bord.
- Si une lecture échoue, ne montre pas l'erreur : donne le chemin à l'écran.
- Jamais de prix d'offre dans un récapitulatif.

## Lire son tableau de bord
Barre de gauche → **Tableau de bord** (visible seulement si le droit est accordé). Il s'ouvre sur votre vue habituelle.
- **Trois vues** via « Changer de rôle » (votre choix est mémorisé). Ce sont des **vues**, pas des rôles ni des droits : à ne pas confondre avec
  Owner / Manager / Praticien.
  - **Manager** : CA encaissé, nouveaux patients, taux de conversion des devis, activité des praticiens, meilleurs traitements, remboursements et avoirs, « À traiter ».
  - **Docteur** : « Mes consultations », « Mes procédures réalisées », « Mes patients fidèles », « Mes patients à rappeler », « Suivi de la qualité des dossiers »,
    BoltNotes en retard, consentements manquants, « Photos après à prendre ».
  - **Assistant** : « Planning du jour », « RDV du jour », « Patients à préparer », « Relances de devis », « Suivis post-procédure », stock critique,
    « Confirmations de RDV pour demain ».
- **Période** : Aujourd'hui, 7 j, 30 j, 90 j, Année. **« Comparer à »** la période précédente ou à la même période l'an dernier (courbes superposées).
  Les graphes de la semaine et du mois incluent la période en cours.
- **Un chiffre manque ?** C'est un droit : Paramètres → Collaborateurs → fiche du collègue → « Visible sur le tableau de bord ». Sans le droit, le CA encaissé
  n'apparaît pas. Sur l'iPhone, l'onglet Rapports reste accessible pour l'instant : ne dis pas que décocher le droit masque aussi ces chiffres sur le téléphone.
- Autres chiffres : « Conversion des devis », « Stock », « Leads », « Appels » (barre de gauche).

## Retrouver ses chiffres : Comptabilité
Roue **Paramètres → Comptabilité** (module facturation requis pour Factures, Règlements, Avoirs ; cadenas sinon) :
| Onglet | Pour… |
|---|---|
| Factures | retrouver, valider, encaisser, exporter les factures (filtre Émetteur pour un praticien) |
| Règlements | voir les paiements reçus, par moyen de paiement |
| Devis | suivre les devis émis |
| Avoirs | avoirs et remboursements |
| Répartition des honoraires | la part clinique / praticien |
| Moyens de paiement, Codes promo | réglages du quotidien |
| Entité de facturation | l'entité qui émet vos factures |
Exports et formats : `references/devis-factures-encaissements.md`.

## Bilan de vos consultations
Un rapport mensuel construit à partir des consultations enregistrées avec Consult IA. Où : **Tableau de bord** (carte « Bilan de vos consultations », en
bas de la vue Manager ; sous les chiffres de la vue Docteur ; « À faire après les consultations » en vue Assistant), puis la page dédiée.
- Rubriques : **À faire** (actions à marquer « Fait » ou « Pas pertinent »), **Opportunités** (devis ouverts, soins demandés jamais chiffrés,
  patients sans prochaine étape, « Récupérables (estimation) »), **Conseils** (le conseil du mois), **Vos règles** (les bonnes pratiques
  de consultation suivies ou non), **Vos patients**.
- Il arrive chaque début de mois ; il faut au moins dix consultations analysées (sinon le bilan couvre les trois derniers mois, puis une jauge indique
  « Encore N consultations »). Il est réservé aux cliniques qui utilisent Consult IA.
- Rappelle toujours : « **Il peut se tromper : vérifiez avant d'agir.** » Les montants « récupérables » sont des estimations.
- Si le client ne le voit pas : « cette fonction n'est pas encore ouverte sur votre compte ». Le détail de la fonction : mode Consult IA.

## Stock (« Mes consommables »)
Barre de gauche → **Stock**. « Ajouter un produit » (nom, marque, conditionnement, prix d'achat), puis **« Gérer le stock »** :
Quantité, Seuil critique, **Date d'expiration**, **Numéro de lot**, Prix de revient. Sans lot ni péremption, pas d'alertes
(onglets Tous / Alertes critiques / Expire bientôt ; « Alertes de stock », « Historique d'activité », « Exporter le stock »).
Vérifiez qu'un produit n'existe pas déjà avant de le créer.

## Mon usage
Pas de contenu à toi. Si le client mentionne « Mon usage » ou « Votre bilan du trimestre » (menu de la photo) : ne l'explique pas, ne cite aucun chiffre
ni prix de cet écran, et renvoie vers son conseiller Nextmotion.

## Je gère plusieurs cabinets
- **Changer de clinique** : sélecteur en bas de la barre de gauche (« Changer de clinique »). La page de choix de clinique permet la recherche et
  les « Récemment consultées ». Ouvrir un dossier peut aussi montrer « Tous les sites ».
- **Vue clinique ou vue groupe ?** Dans la vue de groupe, l'adresse contient `/multiclinic` et le bandeau dit « Vous modifiez le groupe ». Seul le
  propriétaire d'une chaîne (au moins deux cliniques) y accède : « Multi-clinique », tableau de bord multiclinique (évolution, comparaison des cliniques,
  bilan des consultations du groupe).
- **Paramètres communs** à tous les sites (traitements, consultations, comptabilité, documents) : dans la vue groupe.
- **Rapports** : Paramètres → **Rapports** (vue groupe) → « Lancer » : un seul fichier Excel pour tous les sites, un onglet par clinique ; l'historique est
  sous « Exports ».
Pour aller plus loin, passe au mode multi-sites.

## Sur l'iPhone / l'iPad [iPhone/iPad]
Onglet **Rapports** : un tableau de bord que vous composez (« Ajouter un rapport », « Modifier », « Terminé »), périodes 7 j / 30 j / Mois / 90 j / Année.
Cartes disponibles : Planning du jour, RDV du jour, Remplissage du planning, Nouveaux patients, Top traitements, Répartition des actes, Évolution de la
pratique, Stocks critiques, CA encaissé, Taux de conversion, Activité par praticien, Évolution du CA, Devis en attente, Patients fidèles, Consultations,
Appels à passer, Suivis post-acte (J+7 / J+15 / J+30). La carte « Renouvellements » est marquée « Bientôt » dans l'app : ne promets ni contenu ni date.

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
Tutos IA : « Explorer les statistiques et leurs trois points de vue » (ordinateur) · « Rapports : composer et lire votre tableau de bord » (iPhone).
Guide Jarvis : « Comparer le tableau de bord à une autre période ».
