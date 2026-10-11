# Outils du connecteur Nextmotion — ce que Claude peut lire et écrire

> Remplace l'ancienne carte des outils. Règles de données, interdits et données de test :
> `shared/donnees-et-confidentialite.md` (source unique : ici on ne fait que renvoyer vers elle).
> Règles de ton et d'accès : `shared/regles-communes.md`. Options et crédits : `shared/options-et-credits.md`.

## 1. Les noms d'outils
- Les outils s'appellent `oapi_…` (par exemple `oapi_clinic_list`). **Selon l'application, le nom est précédé du nom du
  connecteur** : **cherche par la fin du nom**. Trois outils n'ont pas le préfixe `oapi_` : `visit_retrieve`,
  `visit_update`, `visit_destroy`.
- Il y a environ **190 outils** (ne cite aucun numéro de version). Cherche un outil **une seule fois** ; s'il ne ressort pas,
  ne boucle jamais : essaie un synonyme une fois, puis contourne ou demande au client.
- Deux outils sont déjà chargés d'office : `oapi_user_me_retrieve` (qui est connecté, son rôle) et `oapi_clinic_list`
  (les cliniques, leur fuseau, leur langue).
- Les droits de Claude sont **ceux de la personne connectée** : un refus « accès refusé » veut dire que son profil n'a pas
  ce droit (voir `shared/regles-communes.md` § 10).

**Sonde de départ (silencieuse, avec `limit=0` pour compter sans tout lire)** : `oapi_clinic_list`, `oapi_clinic_feature_list`,
`oapi_clinic_visit_type_list`, `oapi_clinic_doctor_list`, `oapi_clinic_treatment_type_list`,
`oapi_clinic_document_template_list`. Elle te dit ce que le compte contient déjà (l'assistant de démarrage de l'application a
presque toujours rempli le profil, la clinique et le logo) : ne redemande jamais ce qui existe.

## 2. Les 4 outils maison
| Outil | Usage |
|---|---|
| `search_knowledge_base` | Cherche dans la base d'aide Nextmotion (jusqu'à 5 fiches « titre — extrait »). Reformule les extraits, ne cite aucun lien. S'il échoue : voir `shared/problemes-connus.md`. |
| `find_guide` | Lecture seule. Sert à **trouver le titre exact** d'un guide pas à pas de Jarvis ; réponds alors : « Allez dans Tutos IA (menu de votre avatar) et lancez « <titre> » », ou demandez à Jarvis. |
| `start_guide` | **Ne l'appelle jamais** : il ne fait rien pour le client dans Claude. |
| `emit_frontend_event` | **Ne l'appelle jamais** : même raison. |

Autre outil **à ne pas appeler** : `oapi_jarvis_skill_browse` (contenu interne à l'assistant Jarvis, non destiné aux clients).

## 3. Outils par domaine
Les noms ci-dessous sont complets. « Supprimer (interdit) » = les outils dont le nom finit par `_destroy` : règle et seule
exception (donnée de test créée par Claude) dans `shared/donnees-et-confidentialite.md`. Les mentions entre parenthèses
sont des garde-fous :
- *interdit absolu* : ne jamais appeler (exécution de commandes sur l'ordinateur ou le serveur de la clinique) ;
- *acte du client* ou *envoi réel : interdit* : valider, encaisser, rembourser, signer, envoyer un message à un patient
  sont des actes que le client fait lui-même à l'écran (voir le fichier de données) ;
- *sur demande explicite* : seulement si le client le demande clairement, avec un récapitulatif avant et un accord ;
- *dossier existant : interdit* : écrit dans un dossier patient réel ; ne jamais l'appeler sur un vrai patient (seule
  exception : la fiche « TEST » que tu as créée, voir le fichier de données) ;
- *contenu médical : ne pas lire* : renvoie des notes, transcriptions, antécédents, photos ou messages ; sert seulement à
  compter (`limit=0`), jamais à lire ou recopier le contenu ;
- *[dossiers patient]* : ces outils touchent à des dossiers réels. Tu t'en sers pour **créer une fiche** (après
  vérification d'un doublon), pour **compter** (`limit=0`) ou pour les **chiffres d'activité**, jamais pour parcourir ni
  recopier le contenu d'un dossier. Tout le reste : voir le fichier de données.

- **Absences (congés)** — lire : `oapi_calendar_absence_retrieve`, `oapi_clinic_calendar_absence_list` ; écrire : `oapi_calendar_absence_update`, `oapi_clinic_calendar_absence_create` ; supprimer (interdit) : `oapi_calendar_absence_destroy`
- **Appels téléphoniques** [dossiers patient] — écrire : `oapi_clinic_call_create` (dossier existant : interdit)
- **Assistant Jarvis** — lire : `oapi_jarvis_skill_browse` (ne pas appeler)
- **Avoirs** [dossiers patient] — écrire : `oapi_clinic_credit_note_create` (acte du client)
- **Catégories de motifs (niveau 1)** — lire : `oapi_clinic_visit_type_category_list`, `oapi_visit_type_category_retrieve` ; écrire : `oapi_clinic_visit_type_category_create`, `oapi_clinic_visit_type_category_reorder`, `oapi_visit_type_category_update` ; supprimer (interdit) : `oapi_visit_type_category_destroy`
- **Clinique, options, questionnaire de santé** — lire : `oapi_clinic_feature_list`, `oapi_clinic_list`, `oapi_clinic_medical_history_retrieve` ; écrire : `oapi_clinic_medical_history_update`
- **Collaborateurs / praticiens** — lire : `oapi_clinic_doctor_list`, `oapi_doctor_retrieve` ; écrire : `oapi_clinic_doctor_create`, `oapi_doctor_update` ; supprimer (interdit) : `oapi_doctor_destroy`
- **Comparaisons avant/après** [dossiers patient] — lire : `oapi_patient_photo_compare_list` (contenu médical : ne pas lire)
- **Consentement signé (PDF)** [dossiers patient] — écrire : `oapi_treatment_consent_form_upload` (dossier existant : interdit ; peu fiable : guider vers l'écran)
- **Consultations (groupes de traitements)** [dossiers patient] — lire : `oapi_clinic_consultation_list`, `oapi_consultation_retrieve` ; écrire : `oapi_clinic_consultation_create` (dossier existant : interdit), `oapi_consultation_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_consultation_destroy`
- **Conversations (chat patients)** [dossiers patient] — lire : `oapi_clinic_chat_contact_list`, `oapi_contact_message_list` (contenu médical : ne pas lire) ; écrire : `oapi_contact_message_create` (envoi réel : interdit)
- **Demandes de rendez-vous en ligne** [dossiers patient] — lire : `oapi_appointment_request_list`, `oapi_appointment_request_retrieve` ; écrire : `oapi_appointment_request_create`
- **Devis** [dossiers patient] — lire : `oapi_clinic_quote_list`, `oapi_quote_retrieve` ; écrire : `oapi_consultation_quote_create` (dossier existant : interdit), `oapi_quote_update` (dossier existant : interdit), `oapi_quote_validate` (acte du client) ; supprimer (interdit) : `oapi_quote_destroy`
- **Factures** [dossiers patient] — lire : `oapi_clinic_invoice_list`, `oapi_invoice_retrieve` ; écrire : `oapi_consultation_invoice_create` (dossier existant : interdit), `oapi_invoice_pay` (acte du client), `oapi_invoice_update` (dossier existant : interdit), `oapi_invoice_validate` (acte du client) ; supprimer (interdit) : `oapi_invoice_destroy`
- **Formulaires : BoltNotes et consentements** — lire : `oapi_clinic_survey_form_list`, `oapi_survey_form_autocomplete_list`, `oapi_survey_form_retrieve` ; écrire : `oapi_clinic_survey_form_create`, `oapi_survey_form_update` ; supprimer (interdit) : `oapi_survey_form_destroy`
- **Historique de communication** [dossiers patient] — écrire : `oapi_clinic_communication_record_create` (dossier existant : interdit)
- **Horaires d'ouverture** — lire : `oapi_calendar_opening_hour_retrieve`, `oapi_clinic_calendar_opening_hour_list` ; écrire : `oapi_calendar_opening_hour_update`, `oapi_clinic_calendar_opening_hour_create` ; supprimer (interdit) : `oapi_calendar_opening_hour_destroy`
- **Inventaire / produits** — lire : `oapi_clinic_global_product_list`, `oapi_clinic_product_list`, `oapi_clinic_product_retrieve` ; écrire : `oapi_clinic_product_create`, `oapi_clinic_product_update` ; supprimer (interdit) : `oapi_clinic_product_destroy`
- **Machines / équipements** — lire : `oapi_appointment_device_retrieve`, `oapi_clinic_appointment_device_list` ; écrire : `oapi_appointment_device_update`, `oapi_clinic_appointment_device_create` ; supprimer (interdit) : `oapi_appointment_device_destroy`
- **Modèles de documents** — lire : `oapi_clinic_document_template_list`, `oapi_document_template_autocomplete_list`, `oapi_document_template_retrieve` ; écrire : `oapi_clinic_document_template_create`, `oapi_document_template_duplicate`, `oapi_document_template_update` ; supprimer (interdit) : `oapi_document_template_destroy`
- **Modèles e-mail / SMS / WhatsApp** — lire : `oapi_clinic_communication_template_list`, `oapi_communication_template_autocomplete_list`, `oapi_communication_template_retrieve` ; écrire : `oapi_communication_template_update`
- **Montages photo** [dossiers patient] — lire : `oapi_patient_media_montage_list` (contenu médical : ne pas lire)
- **Motifs de consultation (niveaux 2 et 3)** — lire : `oapi_clinic_sub_visit_type_list`, `oapi_clinic_visit_type_list`, `oapi_sub_visit_type_retrieve`, `oapi_visit_type_retrieve` ; écrire : `oapi_clinic_visit_type_create`, `oapi_clinic_visit_type_opening_hour_list`, `oapi_clinic_visit_type_reorder`, `oapi_visit_type_update` ; supprimer (interdit) : `oapi_visit_type_destroy`
- **Moyens de paiement personnalisés** — lire : `oapi_clinic_payment_medium_list`, `oapi_payment_medium_retrieve` ; écrire : `oapi_clinic_payment_medium_create`, `oapi_payment_medium_update` ; supprimer (interdit) : `oapi_payment_medium_destroy`
- **Ordinateur cloud de la clinique** — lire : `oapi_clinic_vps_list` (interdit absolu), `oapi_vps_shell_run_list` (interdit absolu), `oapi_vps_shell_run_retrieve` (interdit absolu) ; écrire : `oapi_vps_shell_run_cancel` (interdit absolu), `oapi_vps_shell_run_create` (interdit absolu)
- **Ordonnances de patients** [dossiers patient] — lire : `oapi_patient_prescription_list` (contenu médical : ne pas lire), `oapi_prescription_retrieve` (contenu médical : ne pas lire) ; écrire : `oapi_patient_prescription_create` (dossier existant : interdit), `oapi_prescription_sign` (acte du client), `oapi_prescription_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_prescription_destroy`
- **Paiements** [dossiers patient] — lire : `oapi_clinic_payment_list`, `oapi_payment_retrieve` ; écrire : `oapi_payment_update` (acte du client) ; supprimer (interdit) : `oapi_payment_destroy`
- **Parcours patient (agenda)** [dossiers patient] — lire : `oapi_clinic_calendar_journey_list`
- **Patients** [dossiers patient] — lire : `oapi_clinic_patient_list`, `oapi_patient_medical_history_retrieve` (contenu médical : ne pas lire), `oapi_patient_retrieve`, `oapi_patient_stats` ; écrire : `oapi_clinic_patient_create`, `oapi_patient_medical_history_update` (dossier existant : interdit), `oapi_patient_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_patient_destroy`
- **Photos / médias** [dossiers patient] — lire : `oapi_patient_media_record_list` (contenu médical : ne pas lire)
- **Prospects (leads)** [dossiers patient] — lire : `oapi_clinic_lead_list`, `oapi_lead_retrieve` ; écrire : `oapi_clinic_lead_create`, `oapi_lead_convert_to_patient` (dossier existant : interdit), `oapi_lead_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_lead_destroy`
- **Protocoles (forfaits)** — lire : `oapi_clinic_treatment_package_list`, `oapi_treatment_package_item_list`, `oapi_treatment_package_retrieve`, `oapi_treatment_package_user_accounting_distribution_list` ; écrire : `oapi_clinic_treatment_package_create`, `oapi_treatment_package_extract` (dossier existant : interdit), `oapi_treatment_package_item_create`, `oapi_treatment_package_item_update`, `oapi_treatment_package_items_replace`, `oapi_treatment_package_update`, `oapi_treatment_package_user_accounting_distribution_replace` ; supprimer (interdit) : `oapi_treatment_package_destroy`, `oapi_treatment_package_item_destroy`
- **Rendez-vous** [dossiers patient] — lire : `oapi_calendar_appointment_retrieve`, `oapi_calendar_appointment_treatment_list`, `oapi_clinic_calendar_appointment_list` ; écrire : `oapi_calendar_appointment_reschedule` (dossier existant : interdit), `oapi_calendar_appointment_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_calendar_appointment_destroy`
- **Répartition des honoraires** — lire : `oapi_accounting_distribution_retrieve`, `oapi_clinic_accounting_distribution_list` ; écrire : `oapi_accounting_distribution_update`, `oapi_clinic_accounting_distribution_create` ; supprimer (interdit) : `oapi_accounting_distribution_destroy`
- **Salles** — lire : `oapi_appointment_room_retrieve`, `oapi_clinic_appointment_room_list` ; écrire : `oapi_appointment_room_update`, `oapi_clinic_appointment_room_create` ; supprimer (interdit) : `oapi_appointment_room_destroy`
- **Statistiques** — lire : `oapi_clinic_statistics_appointment_income`, `oapi_clinic_statistics_treatment_types`, `oapi_clinic_statistics_treatment_types_income`
- **Suivi après soin (par traitement)** — lire : `oapi_post_treatment_config_retrieve` ; écrire : `oapi_post_treatment_config_update`
- **Traitements de patients** [dossiers patient] — lire : `oapi_patient_treatment_list`, `oapi_treatment_retrieve` ; écrire : `oapi_patient_treatment_create` (dossier existant : interdit), `oapi_treatment_update` (dossier existant : interdit) ; supprimer (interdit) : `oapi_treatment_destroy`
- **Types de traitements et tarifs** — lire : `oapi_clinic_treatment_pricing_list`, `oapi_clinic_treatment_type_list`, `oapi_treatment_pricing_retrieve`, `oapi_treatment_pricing_user_accounting_distribution_list`, `oapi_treatment_type_retrieve` ; écrire : `oapi_clinic_treatment_type_create`, `oapi_treatment_pricing_user_accounting_distribution_replace`, `oapi_treatment_type_update` ; supprimer (interdit) : `oapi_treatment_type_destroy`
- **Utilisateur connecté** — lire : `oapi_user_me_retrieve`
- **Visites** [dossiers patient] — lire : `oapi_clinic_visit_list`, `visit_retrieve` (contenu médical : ne pas lire) ; écrire : `oapi_clinic_visit_create` (dossier existant : interdit), `visit_update` (dossier existant : interdit) ; supprimer (interdit) : `visit_destroy`
- **Webhooks** — lire : `oapi_clinic_webhook_list`, `oapi_webhook_retrieve` ; écrire : `oapi_clinic_webhook_create` (sur demande explicite ; événements patient, devis, facture, paiement seulement), `oapi_webhook_update` (sur demande explicite) ; supprimer (interdit) : `oapi_webhook_destroy`
- **Étiquettes (sources, statuts de leads)** — lire : `oapi_clinic_object_label_list`

## 4. Règles de forme (ce qui fait échouer un appel)
**Modifier = relire puis renvoyer l'objet complet.** Presque tous les outils `*_update` sont des remplacements complets :
ne renvoie jamais seulement le champ modifié. Fais d'abord le `retrieve` (ou lis la liste), change ce qui doit l'être, puis
renvoie l'objet avec ses **champs obligatoires** :

| Outil de modification | Champs obligatoires |
|---|---|
| `oapi_doctor_update` | spécialité |
| `oapi_visit_type_update` | sujet (nom du motif) + couleur |
| `oapi_treatment_type_update` | nom |
| `oapi_document_template_update` | nom + modèle |
| catégorie de motifs, salle, machine, moyen de paiement, protocole | nom |
| répartition des honoraires | nom + modèle de répartition |
| questionnaire d'antécédents | modèle du questionnaire |
| modèle de message (e-mail, SMS, WhatsApp) | texte du modèle |
| patient | e-mail, prénom, nom, genre |

**Les listes imbriquées sont remplacées, pas complétées.** Dans une modification, les lignes de tarifs d'un traitement, les
sous-motifs d'un motif et les lignes d'un protocole : **ce qui est absent de la liste renvoyée est supprimé**. Renvoie donc
toute la liste, en y ajoutant ou modifiant seulement ce qu'il faut.

**Listes limitées à 50 résultats.** Par défaut une liste renvoie au plus 50 éléments (jusqu'à 100 avec `limit=100`). La réponse
contient `count` (le total) et `next`. Si `count` est plus grand que ce que tu as reçu, **demande la page suivante** avec
`offset` avant de conclure. Pour **compter sans tout lire**, utilise `limit=0`. Ne dis jamais « il n'y en a pas » sur une
seule page de 50.

**Listes officielles de variables : à lire, pas à recopier.** Avant d'écrire le texte d'un modèle, lis la liste officielle
et n'invente aucun code :
- `oapi_document_template_autocomplete_list` (paramètre type : 0 ordonnance, 1 devis, 2 facture, 3 facture d'acompte, 4 avoir,
  6 droit à l'image, 7 document administratif, 8 compte rendu de visite) : champs automatiques et ceux qui sont obligatoires ;
- `oapi_communication_template_autocomplete_list` (paramètre type : le type de message) pour les e-mails, SMS et WhatsApp ;
- `oapi_survey_form_autocomplete_list` (type obligatoire : `bolt_note` ou `treatment_consent`) pour les questionnaires et
  consentements.
Les modèles de secours du skill ne servent que si ces outils ne répondent pas.

**Réordonner** (motifs, catégories de motifs) : le corps attendu est **une liste d'objets `{id}`** dans le nouvel ordre,
pas une simple liste d'identifiants. Outils : `oapi_clinic_visit_type_reorder`, `oapi_clinic_visit_type_category_reorder`.

**Valeurs à connaître**
| Sujet | Valeurs |
|---|---|
| Rôle d'un collaborateur (`kind`) | 5 cadre, 8 diététicien, 9 secrétaire, 10 médecin, 11 assistant(e), 12 manager, 13 propriétaire. **Ne jamais créer ni promouvoir un propriétaire (13) avec un outil** ; pour un manager (12), demander d'abord l'accord du propriétaire. Le rôle applique un jeu de droits ; les ajustements fins se font à l'écran (Paramètres › Collaborateurs › Modifier › Autorisations). |
| Type de document | 0 ordonnance, 1 devis, 2 facture, 3 acompte, 4 avoir, 6 droit à l'image, 7 administratif, 8 compte rendu de visite. Acompte et avoir : le champ « modèle de facture » est à renseigner. |
| Champ automatique dans un modèle | `<input class="embed-autocomplete CODE--autocomplete" type="button" value="<libellé>">` (seul le CODE compte, le libellé est décoratif). |
| Formulaires (`fields_tmpl.q[].type`) | 1 texte, 2 oui/non, 3 choix unique, 4 choix multiple, 5 échelle, 6 image, 7 date. Type de formulaire : `bolt_note` ou `treatment_consent` ; le texte visible est dans `note_tmpl.template.html` (ne jamais le laisser vide). |
| Récurrence d'un horaire | one_time, daily, daily_mon_through_fri, daily_mon_through_sat, weekly_on_day_of_week, biweekly_on_day_of_week, custom |
| Moyens de paiement | Carte, espèces, virement, chèque, etc. **existent déjà** : l'outil ne crée que des moyens **supplémentaires**. Lis d'abord la liste. |
| Répartition des honoraires | Exactement 2 lignes (clinique, praticien) dont les pourcentages font 100. Surcharges par praticien : outils `*_user_accounting_distribution_*`. |
| Webhook (`oapi_clinic_webhook_create`) | Destination `url` (par défaut) ou `nextmotion_local` (adresse `localhost` ou `127.0.0.1` seulement). Sur demande explicite. Événements possibles par l'outil : patient, devis, facture, paiement seulement ; « Visite créée », « Rendez-vous mis à jour » et « Demande d'avis envoyée » se règlent à l'écran. |

**Détails utiles**
- Un traitement (`oapi_treatment_type_update`) : prix **TTC** en décimal dans les lignes de tarifs, `vat_rate` obligatoire ;
  le nom de la variante est dans « détails » ; les liaisons se font avec le motif ou le sous-motif au singulier. Pour
  relier des tarifs à un protocole, lis d'abord `oapi_clinic_treatment_pricing_list` / `oapi_treatment_pricing_retrieve`
  pour récupérer les identifiants des lignes.
- Les produits viennent du **catalogue global** (`oapi_clinic_global_product_list`) : on ajoute au stock un produit du
  catalogue (`oapi_clinic_product_create`), on n'en crée pas de « libre ». Produit absent du catalogue : dis-le au client
  et renvoie vers la bouée Support & tickets.
- Motif : une **BoltNote** se rattache à un motif (champ de la BoltNote dans le motif), pas à un traitement.
- Suivi après soin : `oapi_post_treatment_config_*` est **par type de traitement** (e-mails programmés), ce n'est pas un
  texte global de clinique.
- Créneaux : `oapi_clinic_visit_type_opening_hour_list` est une recherche de créneaux ; donne une date de début et de fin
  (par exemple les 4 prochaines semaines), sinon il ne regarde que le mois en cours. Un seul appel sans dates ne prouve rien.
- Dépôt d'un PDF de consentement signé : peu fiable depuis Claude ; guide le client vers le dossier patient à l'écran.
- La demande de rendez-vous en ligne (`oapi_appointment_request_create`) **crée son propre patient** : c'est une donnée de
  test de plus à signaler (règles dans le fichier de données).

## 5. Chiffres d'activité (lecture seule)
Pour répondre à « combien ai-je facturé ? », « quels soins me rapportent le plus ? » : `oapi_clinic_statistics_appointment_income`,
`oapi_clinic_statistics_treatment_types`, `oapi_clinic_statistics_treatment_types_income`, et le `count` des listes
(`limit=0`) de rendez-vous, de devis et de factures. **Donne la période et la clinique, n'extrapole pas, donne des totaux et
pas des listes de patients.** Cadre exact : fichier de données.

## 6. Ce qui se fait par outil, et ce qui se guide à l'écran
Les chemins d'écran sont dans `shared/chemins-doctor-portal.md`.

| Domaine | Par outil | À l'écran (guide le client) |
|---|---|---|
| Profil (code PIN, double authentification, signature) | lecture seule (`oapi_user_me_retrieve` dit si un code PIN existe) | tout |
| Ma clinique (nom, adresse, logo, TVA, fuseau, langue) | lecture partielle (pas de TVA ni de numéro d'identification) | tout |
| Collaborateurs | complet (rôles ci-dessus ; réservation en ligne, Consult IA, motifs réservables) | droits fins par module |
| Traitements et tarifs | complet (produits, ordonnances liées, sous-tarifs, rappel de prochain soin) | fiche d'information PDF |
| Motifs (catégorie › sous-catégorie › visite) | complet (BoltNote liée, prix, rappel, prépaiement par motif, réordonnancement) | |
| BoltNotes, consentements | complet (voir `bolt_note`, `treatment_consent`) | envoi du PDF signé |
| Modèles de documents (8 types) | complet, **y compris la mise en page de l'ordonnance (type 0)** | « Mes prescriptions » (ordonnances types) |
| Honoraires, protocoles, salles, machines, horaires, absences | complet | |
| Moyens de paiement | complet pour les moyens **supplémentaires** | moyens de base |
| Codes promo, bons cadeaux | aucun | tout |
| Réglages d'agenda (confirmation par e-mail, etc.) | aucun | tout |
| Consignes avant le rendez-vous | aucun | tout |
| Consignes après soin | par type de traitement | |
| Prépaiement Stripe | aucun (le prépaiement **par motif** se règle par outil) | connexion Stripe, activation |
| Page de réservation en ligne | aucun | tout |
| Antécédents (questionnaire de la clinique) | écriture du questionnaire de la clinique | réglages portail |
| Champs additionnels patient | aucun | tout |
| E-mails, SMS, WhatsApp | modification et activation de chaque modèle ; **pas de création** de nouveau type | interrupteurs d'envoi |
| Inventaire | ajout depuis le catalogue global | produit hors catalogue |
| IA, Nextmotion Local, téléphonie IA | aucun | tout |
| Webhooks | complet (sur demande explicite) | |

Une section « sans outil » n'est jamais un échec : tu **guides** pas à pas (`shared/chemins-doctor-portal.md`), tu demandes
ce que le client voit, et tu notes ce qui reste à faire dans le récapitulatif de fin.
