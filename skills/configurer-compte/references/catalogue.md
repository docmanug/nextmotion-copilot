# Catalogue — motifs, traitements, tarifs, bolt notes, protocoles, stock

> Étape 3. **Prérequis : la Découverte a eu lieu** (`references/decouverte.md`). Tu crées à partir de ce que le client a dit,
> pas d'un pack. Ordre : **motifs d'abord, traitements et tarifs ensuite**. Avant toute modification, lis l'existant
> (`oapi_clinic_visit_type_list`, `oapi_clinic_treatment_type_list`) et applique la règle « relire puis renvoyer l'objet
> complet » (§ 9). Écrans : Paramètres › Mes consultations › Liste, et Paramètres › Mes traitements › Liste.

## 1. Motifs de consultation
À l'écran, trois niveaux : **catégorie › sous-catégorie › visite** (la visite est le motif réservable). Dans l'assistant de
démarrage : « catégories », « motifs », « sous-motifs ». Modèle de départ à ajuster : `templates/fr/motifs.md`.

| Niveau à l'écran | Outil de création | Champs utiles |
|---|---|---|
| Catégorie (ex. Visage) | `oapi_clinic_visit_type_category_create` | `name`, `speciality` (liste de spécialités ; **sert à Doctolib**) |
| Sous-catégorie (ex. Injection) | `oapi_clinic_visit_type_create` | `subject` (nom), `color` (6 caractères, sans #), `category`, `duration_minutes`, `price` |
| Visite (ex. Séance d'injection) | `sub_visit_types` dans le même appel, ou `oapi_visit_type_update` | `subject` et `duration_minutes` obligatoires, `color`, `price` |

Crée les catégories, puis chaque sous-catégorie **avec ses visites en même temps**. Les durées sont celles de la visite : il
n'y a pas de réglage de durée par défaut dans l'agenda, et pas de marge automatique entre deux patients (« ajoutez la marge
dans la durée du motif »).

### Les « canaux » d'une visite (champs `display_in_*`)
| À l'écran | Champ | Effet |
|---|---|---|
| RDV @ | `display_in_appointment_form` | **Visible sur la page de réservation en ligne** |
| Calendrier | `display_in_agenda` | Proposée dans l'agenda |
| Tableau de bord | `display_in_dashboard` | Comptée dans le tableau de bord |
| Fichier | `display_in_patient_file` | Proposée à la création d'une visite dans le dossier |
| Prépaiement | `enable_treatment_pre_payments` | Prépaiement à la réservation (éteint par défaut) |
**Défaut prudent** : crée avec `display_in_appointment_form` à **faux** ; ne passe à vrai que pour les visites que le client
veut réellement ouvrir au public, avec son accord (`references/agenda.md`). `display_in_agenda` à vrai si l'Agenda est dans
l'offre. Pour activer un motif existant : lis d'abord `oapi_clinic_visit_type_list`, puis `oapi_visit_type_update`.

### Options à connaître (laisse vide par défaut)
`bolt_note` (rattacher une bolt note à la visite, § 6), `next_visit_reminder_days` (rappel de prochaine visite, 0 = aucun),
`enable_treatment_pre_payments`, `appointment_treatment_presets` (traitements créés quand le patient réserve : § 3).
Ordre d'affichage : `oapi_clinic_visit_type_reorder` et `oapi_clinic_visit_type_category_reorder`, avec une liste
d'objets `[{"id": "A"}, {"id": "B"}]` (le premier = position 1).

### Pour que Consult IA fonctionne bien
Noms de visites **uniques dans toute la clinique** et parlants, avec la technique (« Suivi injection », « Contrôle peeling »,
« Séance cryolipolyse »), jamais deux « Consultation de suivi ». Refuse un nom déjà pris. Une bolt note de 5 à 10 champs sur les
visites fréquentes, des traitements nommés comme les praticiens les disent, antécédents complétés, une centaine de visites
au plus. Annonce le résultat : la consultation créée porte le nom de la visite choisie.

## 2. Traitements et tarifs
Un **traitement** (`oapi_clinic_treatment_type_create`) porte des **sous-traitements = lignes de tarif** (`pricings`), et
c'est la ligne qui porte le prix, le consentement et les ordonnances. Écran : Mes traitements › Liste (« Ajouter un
traitement », « Ajouter un nouveau sous-traitement »).
- Traitement : `name`, `pricings`, `visit_type` et `sub_visit_type` (la visite par défaut, au singulier ; la visite doit
  appartenir au motif), `display_in_dashboard` (« Afficher dans le dashboard » : vrai pour les actes principaux),
  `create_visit` (réserver ce traitement crée une visite).
- Ligne de tarif : `details` (« Descriptif » : Lèvres, Pack 4 séances), `price` (**TTC**, décimal « 350.00 », jamais en
  centimes), `vat_rate` (**obligatoire**, en pourcentage : demande-le ou renvoie au comptable ; n'affirme pas de taux),
  `sessions` (colonne « Pack. », nombre de séances, 1 par défaut), `rebate` (remise absolue TTC), `accounting_code`.
- **Prix inconnu** : ne crée pas la ligne, ou crée-la et liste-la dans « prix à compléter ». Pas de 0,00 par défaut.
- **Produits injectés** : si le client suit ses produits, cherche-les (`oapi_clinic_global_product_list`, recherche par nom ou
  marque), lie-les au tarif (`products`: produit et quantité) et propose `require_products_before_invoice_create`
  (« Produits obligatoires ») pour les actes à traçabilité (toxine, acide hyaluronique).
- **Rappel du prochain soin** (actes récurrents, ex. toxine tous les 4 à 6 mois) : demande « Voulez-vous un rappel
  automatique, dans combien de jours ? » → `send_reminder_on_invoice_paid` (« Rappel »), `next_treatment_reminder_days`
  (« Jours »), `duplicate_on_invoice_paid` (« Prévision » : recrée le traitement à prévoir quand la facture est payée).
- **Motif réservable depuis le portail** une fois le soin payé : `appointment_visit_type`, `appointment_sub_visit_type`.
- **Actes détaillés** (chirurgie, honoraires) : `subpricing` (« Sous-prix » : la somme égale le prix total) **ou**
  répartition d'honoraires (`accounting_distribution`, voir `references/finance-communication.md`), jamais les deux.
Récapitule avant de créer : « Voici les traitements que je crée, avec vos tarifs : … ».
Vérification : `oapi_clinic_treatment_type_list`, puis `oapi_treatment_type_retrieve`.

## 3. Relier traitements et motifs (trois liens distincts)
Demande lequel le client veut ; n'annonce pas d'affichage automatique.
1. **Visite par défaut du traitement** (`visit_type`, `sub_visit_type`) : celle qu'on crée depuis ce traitement.
2. **Préréglage de réservation** (`appointment_treatment_presets` sur la visite : tarif et quantité) : ce que le patient
   « réserve » quand il prend ce rendez-vous.
3. **Rendez-vous de suite payant** (`appointment_visit_type` sur la ligne de tarif) : motif réservable depuis le portail.

## 4. Consentements et ordonnances rattachés aux tarifs
- **Consentement** : colonne « Consentement » de la ligne (« Associer un formulaire de consentement ») ou champ `survey_form`
  de la ligne. Crée d'abord le consentement (`references/documents.md`). Une ligne qui demande un consentement doit avoir le sien,
  sinon il ne pourra pas être généré : à la fin, **liste les tarifs sans consentement**.
- **Ordonnances types** : colonne « Ordonnances » (« Associer des ordonnances »), champ `prescription_types` (liste d'identifiants,
  25 au plus). Tu ne peux pas créer le **texte** d'une ordonnance type (Paramètres › Mes prescriptions, à l'écran). Pour les
  attacher, lis les ordonnances déjà liées à un traitement ; sinon renvoie le client à l'écran.
- **Fiche d'information** (PDF, 10 Mo au plus) : écran seulement, sur la ligne de tarif.

## 5. Consignes après soin (par traitement)
Outil par type de traitement : `oapi_post_treatment_config_retrieve` / `oapi_post_treatment_config_update` (e-mail de suivi
et e-mail de rappel programmés après le soin). Ce n'est **pas** un texte global de clinique. Demande : quel traitement, quel
délai, quel texte ; active-le explicitement. Les consignes **avant** le rendez-vous sont un autre écran (Paramètres › Agenda ›
Consignes pré-consultation : `references/agenda.md`).

## 6. Bolt notes
Une **bolt note** est un modèle de compte rendu : quand le praticien ouvre une consultation d'une certaine visite, la note
est déjà pré-remplie avec la trame de la clinique (produit, zone, technique…) et quelques champs à compléter par le
praticien ou par Consult IA. Il n'y a **aucun raccourci tapé** du type « /toxine ».
- Création : `oapi_clinic_survey_form_create` avec `type` « bolt_note », `fields_tmpl` (introduction + questions) et
  `note_tmpl` (la trame). Format exact, types de champs, deux modèles et idées : `templates/fr/bolt-notes.md`.
- Écran : Paramètres › Mes consultations › onglet **Bolt notes** (« Nouvelle bolt note »). Droit « Peut accéder à
  l'éditeur des Bolt notes » requis.
- **Rattachement** : à une visite (Paramètres › Mes consultations › Liste › ouvrir la visite › « Questionnaire bolt note »)
  ou par le champ `bolt_note` à la création ou mise à jour de la visite. **Une visite = une bolt note.**
- Supprimer une bolt note la dissocie de ses visites : ne le fais pas (interdit sur du réel).

## 7. Protocoles (packs)
Un **protocole** est un lot de lignes de tarif vendu à un prix global (ex. « Pack rajeunissement 3 séances »). Il se compose de
**lignes de tarif, pas de traitements**. Écran : Mes traitements › onglet Protocoles (« Nouveau pack », 25 traitements au plus).
1. Crée d'abord les traitements, relève les identifiants de leurs lignes (`oapi_clinic_treatment_pricing_list`).
2. `oapi_clinic_treatment_package_create` : `name`, `price` (TTC, « 900.00 »), `vat_rate`.
3. `oapi_treatment_package_items_replace` : liste `[{pricing: <id de la ligne>, sessions: 3}, …]`.
4. Vérifie avec `oapi_treatment_package_retrieve` et `oapi_treatment_package_item_list`.
Le nombre de séances d'un tarif simple est la colonne « Pack. » ; le protocole est un lot multi-tarifs.
N'appelle pas l'outil qui verse un protocole dans une consultation (usage patient). Ne pose aucune condition d'option.

## 8. Stock (consommables)
Barre de gauche **Stock** (« Mes consommables »). On ne crée pas de produit libre : on choisit dans le **catalogue Nextmotion**.
1. Cherche : `oapi_clinic_global_product_list` (recherche par nom ou marque).
2. Ajoute au stock : `oapi_clinic_product_create` avec `global_product`, `lot_number`, `expiration_date`, `stock_level`,
   `warning_level` (seuil critique), `unit_price`. Sans lot ni péremption, pas d'alertes.
3. **Produit absent du catalogue** : ne le crée pas et ne promets rien. Dis : « Ce produit n'est pas dans le catalogue ;
   je ne peux pas l'ajouter à votre place. Parlez-en à votre conseiller Nextmotion (bouton Support & tickets). »
Pour vérifier : Stock › Gérer le stock, Alertes de stock.

## 9. Modifier sans rien casser
Relis (`oapi_treatment_type_retrieve`, `oapi_visit_type_retrieve`), modifie, renvoie **tout**. Dans une liste imbriquée
(`pricings`, `sub_visit_types`, lignes de protocole), un élément **avec** `id` est mis à jour, **sans** `id` est créé et
**absent est supprimé**. Les champs obligatoires de chaque mise à jour sont dans `shared/outils-connecteur.md`.

## 10. Si le client utilise Doctolib
La **passerelle** Doctolib est proposée à tous les clients ; elle est activée par Nextmotion (pas d'écran d'activation : le
client la demande à son conseiller). L'**extension** Doctolib (synchronisation instantanée des contacts et descente automatique
des rendez-vous de Doctolib vers Nextmotion) est réservée à l'offre Scale. L'accès aux outils Doctolib se donne par collaborateur
(Paramètres › Collaborateurs › Modifier › Autorisations). Pour que les agendas ne soient pas vides :
1. renseigne la **spécialité** de chaque catégorie ; 2. crée des **visites** pour chaque sous-catégorie à exposer (Doctolib ne
voit que les visites) ; 3. fais **attribuer les visites à chaque praticien** (Paramètres › Agenda › Praticiens › « Attribuer des
types de visite », à l'écran). Prévenir : toute modification part tout de suite vers Doctolib quand la passerelle est active.

## 11. Récapitulatif
« Motifs : N catégories, N sous-catégories, N visites. Traitements : N, dont N prix à compléter. Bolt notes, protocoles,
stock : si demandés. À faire à l'écran : ordonnances types, fiches d'information. » Suite : `references/documents.md`.
