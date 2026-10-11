# Agenda — horaires, salles, appareils, réservation en ligne

> Étape 5. Écran : **Paramètres › Agenda**, huit onglets : Horaires d'ouverture · Réservation en ligne · Salles · Praticiens ·
> Appareils · Consignes pré-consultation · Confirmation par prépaiement · Flux ICS, plus un bouton **Paramètres** (en haut à
> droite). Dis toujours au client où retrouver ce que tu as créé (par exemple « Paramètres › Agenda › Salles »).

## 1. L'Agenda est-il dans l'offre ?
Lis les options (`shared/options-et-credits.md`). Si la lecture échoue, **demande** : « Vous voyez Agenda dans le menu de gauche ?
Il est actif, ou grisé avec un cadenas ? » Tu ne tentes pas d'écrire « pour voir ».
**Absent** : « Cette fonction n'est pas incluse dans votre offre : l'Agenda apparaît grisé avec un cadenas dans Nextmotion.
En cliquant dessus, vous voyez une démonstration et comment l'ajouter (si vous êtes le propriétaire du compte ; sinon, demandez
à votre conseiller de vous rappeler). » Ne déroule pas la suite ; passe à `references/finance-communication.md`.

## 2. Prérequis (lis, ne devine pas)
- **Au moins un praticien** (`oapi_clinic_doctor_list`) et **au moins une visite** réservable (`oapi_clinic_sub_visit_type_list`).
  Sinon : « Il me faut d'abord un motif de consultation et un praticien. » → `references/catalogue.md`, `references/fondations.md`.
- **Chaque praticien a ses motifs** (`visit_types` sur sa fiche, ou Paramètres › Agenda › Praticiens). Sans eux, il n'est pas
  réservable. À vérifier avant le bouclage.
- Les heures suivent le **fuseau de la clinique** (`shared/regles-communes.md` § 7), jamais de l'UTC brut ni « Paris » par défaut.

## 3. Salles et appareils (facultatifs)
- **Salles** (`oapi_clinic_appointment_room_list`, `oapi_clinic_appointment_room_create`) : « Combien avez-vous de salles, comment
  les appelle-t-on ? » (défaut : « Salle principale »). Un cabinet qui travaille seul n'en a pas besoin.
- **Appareils** (`oapi_clinic_appointment_device_*` ; onglet « Appareils » à l'écran, « machine » dans la fenêtre) : laser,
  HydraFacial… Facultatif ; saute si le client n'en déclare pas.
- Comme pour les horaires, **rattache les visites** (`visit_types` et `sub_visit_types`) à chaque salle et appareil : sinon elles
  ne sont pas proposées à la réservation. `activate_online_booking` ouvre la salle à la réservation en ligne (accord du client).
- Absence ou congé : `oapi_clinic_calendar_absence_create`, plutôt qu'un horaire modifié.

## 4. Horaires d'ouverture
Demande : « Quels jours et à quelles heures ? (ex. lundi, mardi, jeudi 9 h à 12 h 30 et 14 h à 18 h ; vendredi 9 h à 13 h) ».
Sans réponse, propose une base (lundi, mercredi, vendredi 9 h à 12 h 30 et 14 h à 18 h ; jeudi matin) et fais valider.
`oapi_clinic_calendar_opening_hour_create` : `visit_types`, **`sub_visit_types`**, `slots_count` (rendez-vous simultanés possibles)
et `calendar_event` (`start_time`, `end_time`, `doctors` ou `appointment_rooms` : **au moins l'un des deux**, `recurrence`).
- **Piège n°1** : liste **toujours** les `sub_visit_types` concernés, pas seulement les `visit_types`. Sinon le moteur de réservation
  ne trouve **aucun créneau** pour une visite.
- Récurrence : `one_time`, `daily`, `daily_mon_through_fri`, `daily_mon_through_sat`, `weekly_on_day_of_week` (un `start_time`
  tombant le bon jour), `biweekly_on_day_of_week`, `custom`.
- Heures au format avec décalage horaire de la clinique (ex. `2026-12-01T09:00:00+01:00`), l'été comme l'hiver.
- Crée praticien par praticien, toutes les plages en un passage. Vérifie : `oapi_clinic_calendar_opening_hour_list`.

## 5. Les réglages de l'agenda (à l'écran)
Bouton **Paramètres** en haut à droite de Paramètres › Agenda (« Paramètres de l'agenda »). Cinq interrupteurs, enregistrés tout
seuls : accepter automatiquement les demandes de rendez-vous ; ajouter au parcours patient en « salle d'attente » ; synchroniser
parcours patient et agenda ; délai minimum avant réservation ; « Demander aux patients de confirmer leur rendez-vous ».
Il n'y a pas de délai maximum ni de durée de créneau par défaut : la durée d'un créneau est celle de la visite
(Mes consultations).
**Confirmation des rendez-vous par e-mail** (facultatif, **éteinte par défaut**, ne l'active qu'avec l'accord du client) : trois
choix de délai (2 jours avant, 24 heures avant, ou personnalisé de 1 à 168 heures). L'e-mail « Demande de confirmation de rendez-vous » se
personnalise dans Paramètres › Communication › Emails (`references/finance-communication.md`).

## 6. Consignes avant et après le rendez-vous
Onglet **Consignes pré-consultation** (Paramètres › Agenda) : on y règle, par visite, ce que le patient reçoit avant (et après) sa
consultation. Les e-mails de suivi envoyés après un **soin** sont un autre réglage, par traitement (`references/catalogue.md` § 5).
Écran seulement pour l'onglet ; guide le client, et en cas de doute demande ce qu'il voit.

## 7. Prépaiement (acompte à la réservation)
Deux étapes, **faites par le client** : (1) Paramètres › Centre d'intégration › Intégration native › **Stripe** › Connecter ;
(2) Paramètres › Agenda › **Confirmation par prépaiement** : activer, choisir le montant, les messages et « Encaisser le montant
si ». Il faut aussi la case « Prépaiement » sur les visites concernées (`references/catalogue.md` § 1). Guide pas à pas.

## 8. Réservation en ligne : il n'y a pas de bouton « Publier »
Il n'y a ni « Publier » ni « Aperçu ». Une visite devient réservable en ligne dès qu'elle a le canal **RDV @**
(`display_in_appointment_form`) **et** des horaires. L'onglet **Réservation en ligne** donne le lien principal, le code à intégrer
sur un site et des liens personnalisés.
**Confirmation obligatoire** avant d'ouvrir des visites au public ou de transmettre le lien : « Une fois ouvertes, vos patients
pourront les réserver tout de suite. Vous confirmez ? » Si le client préfère attendre, laisse `display_in_appointment_form` à faux
et note la tâche.

## 9. Test de bouclage (obligatoire)
1. `oapi_clinic_calendar_opening_hour_list` : les plages créées.
2. `oapi_clinic_visit_type_opening_hour_list` avec **`start_date` et `end_date` couvrant les quatre prochaines semaines** et un
   filtre sur une visite (`sub_visit_type_id`, pris dans `oapi_clinic_sub_visit_type_list`). Sans dates, l'outil ne regarde
   que le mois en cours : ne conclus **jamais** à l'échec d'après un seul appel sans dates. C'est une recherche de créneaux.
3. Si aucun créneau : motifs non rattachés à la plage, praticien sans ses motifs, visite non ouverte à l'agenda.
4. **Essai de bout en bout (facultatif)** : avec l'accord du client, un patient de test (règles de
   `shared/donnees-et-confidentialite.md` : nom « TEST … », e-mail non réel, téléphone fictif) et `oapi_appointment_request_create`
   (créneau, e-mail, prénom, nom, date de naissance, téléphone). **La demande de rendez-vous crée son propre patient** : il y en a
   donc deux à supprimer en fin d'essai (seulement ce que tu as créé, après accord), et le rendez-vous ne disparaît pas en supprimant
   l'autre patient. Ne présume pas qu'aucun message ne part vers l'adresse saisie.
Annonce : « Un patient peut réserver dès maintenant » seulement si un créneau ressort.

## 10. Ailleurs
Statuts de rendez-vous personnalisés (menu du statut › « Gérer les statuts ») et agenda sur iPhone/iPad (jour, semaine,
liste, mois, absences) : skill aide-quotidien.
Récapitulatif : salles, appareils, horaires, confirmation et prépaiement (faits ou à faire), réservation en ligne (ouverte ou non).
