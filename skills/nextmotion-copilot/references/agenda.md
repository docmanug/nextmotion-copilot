# Agenda — Salles, Machines, Horaires & Page RDV (sections 14-20)

> **Module GATED — `consult_digital.agenda` requis.**
> Ce module ne s'ouvre que si l'option Agenda en ligne est active sur votre compte Nextmotion.

---

## ⛔ GATE — Vérification de l'option Agenda

**Avant toute chose**, Claude essaie de vérifier que la feature `consult_digital.agenda` est active via `Nextmotion:oapi_clinic_feature_list`.

**Si cette lecture échoue** (incident serveur temporaire — cf. `shared/known-issues.md`) : ne bloque pas, n'affiche pas l'erreur. Demande simplement au client : « Est-ce que la **prise de rendez-vous en ligne** fait partie de votre offre Nextmotion ? » — ou tente la configuration : si l'option n'est pas incluse, la création de salle/horaire échouera avec un message d'option manquante (que tu traduis simplement). Puis continue.

### Si `consult_digital.agenda` est inactif (`is_enabled: false`)

> « Je vois que l'option **Agenda en ligne** n'est pas encore activée sur votre compte. Cela signifie que vos patients ne peuvent pas encore prendre rendez-vous en ligne, et je ne peux pas configurer les horaires ni les salles pour l'instant.
>
> Si vous voulez activer cette option, contactez le support Nextmotion — ils pourront la débloquer sur votre offre. Une fois activée, revenez ici et on configure tout ça ensemble ! »

**Ne pas dérouler la suite du module.** Passer directement aux extras ou clôturer le parcours.

### Si `consult_digital.agenda` est actif (`is_enabled: true`)

Continuer avec la vérification des prérequis ci-dessous.

---

## ✅ Prérequis avant de configurer l'agenda

Avant de créer des salles ou des horaires, Claude vérifie que la **base est en place**. Sans ces deux éléments, l'agenda ne peut pas fonctionner.

**Claude vérifie silencieusement (avec replis si une lecture échoue — cf. `shared/known-issues.md`) :**
- Motifs de consultation : `Nextmotion:oapi_clinic_visit_type_list`. **Si illisible**, utilise `Nextmotion:oapi_clinic_sub_visit_type_list` (sous-motifs) + `Nextmotion:oapi_clinic_visit_type_category_list` (catégories) : s'il y a des sous-motifs/catégories, le catalogue est peuplé. En dernier recours, demande au client.
- Praticien : `Nextmotion:oapi_clinic_doctor_list`. **Si illisible**, demande au client : « Vous avez bien au moins un praticien dans votre compte ? » — ne bloque pas sur la lecture.

### Si un prérequis manque

> « Pour configurer votre agenda, il me faut d'abord deux choses en place :
> - **Au moins un motif de consultation** (ex. "1ère consultation", "Injection acide hyaluronique")
> - **Au moins un praticien** dans votre compte Nextmotion
>
> On dirait que [motifs / le praticien] manque encore. Je vous propose de régler ça d'abord — on revient à l'agenda juste après ! »

Renvoyer vers `references/fondations.md` (praticien) ou `references/catalogue.md` (motifs).

### Si les deux prérequis sont présents

> « Parfait — j'ai trouvé [N] motif(s) de consultation et [N] praticien(s). On peut configurer l'agenda ! »

---

## §14 — Salles de consultation

> « Je crée maintenant vos **salles de consultation** — les espaces physiques où se déroulent les rendez-vous. Pas besoin d'en avoir plusieurs si vous travaillez seul(e) dans un cabinet. »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_appointment_room_list` — vérifier si des salles existent déjà
- `Nextmotion:oapi_clinic_appointment_room_create` — créer chaque salle

**Questions client-only :**

> « Combien avez-vous de salles de consultation ? Et comment on les appelle ? Par exemple : "Salle principale", "Salle laser", "Salle 1"… »

**Défaut sûr** : si le client ne sait pas comment les nommer, Claude propose `Salle principale`.

**Écriture par lot :** Claude crée toutes les salles mentionnées en un seul passage.

**Récap après création :**
> « ✅ J'ai créé [N] salle(s) :
> - Salle principale (ID : …)
> - [autres salles]
>
> Vous pouvez en ajouter d'autres à tout moment. »

---

## §15 — Machines et équipements

> « Si vous utilisez des **machines ou appareils médicaux** spécifiques (laser, ultrasons, hydrajet…), je peux les ajouter à l'agenda. Cela vous permettra de voir si une machine est disponible en même temps qu'un créneau. »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_appointment_device_list` — vérifier les machines existantes
- `Nextmotion:oapi_clinic_appointment_device_create` — créer chaque machine

**Question client-only :**

> « Est-ce que vous avez des appareils à déclarer ? (laser, hydrajet, ultrasons, etc.) Si non, on passe — c'est facultatif. »

**Défaut sûr** : si le client n'utilise pas de machines spécifiques, on saute cette étape.

**Écriture par lot :** Claude crée toutes les machines mentionnées.

**Récap après création :**
> « ✅ J'ai ajouté [N] machine(s) :
> - Laser CO₂ (ID : …)
> - [autres]
>
> Ces machines seront visibles dans le calendrier pour éviter les conflits de réservation. »

---

## §16 — Horaires d'ouverture

> « On configure maintenant vos **plages de disponibilité** — les créneaux horaires où vos patients pourront prendre rendez-vous en ligne. »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_calendar_opening_hour_list` — vérifier les horaires existants
- `Nextmotion:oapi_clinic_calendar_opening_hour_create` — créer chaque plage horaire

> 🔴 **GOTCHA vérifié en prod (25/06) — sinon ZÉRO créneau réservable.** Une plage horaire doit lister **explicitement ses `sub_visit_types`**, pas seulement `visit_types`. Si tu ne mets que les motifs L2 (`visit_types`) mais pas les sous-motifs (`sub_visit_types`), le moteur de réservation renvoie **0 créneau** dès qu'un patient cherche un sous-motif (ex. « Injection HA – Lèvres »). → Mets **toujours** les `sub_visit_types` concernés dans chaque plage.
>
> **Structure réelle :** `oapi_clinic_calendar_opening_hour_create(clinic_id, visit_types:[…], sub_visit_types:[…], slots_count, calendar_event:{ start_time, end_time, doctors:[…], recurrence })`. Récurrence hebdo = `recurrence:"weekly_on_day_of_week"` avec un `start_time` tombant le bon jour. **Heures = heure locale Paris + offset** (ex. `2026-06-22T09:00:00+02:00`). Au moins **un `doctors` OU un `appointment_rooms`** est requis sur l'event.

**Question client-only :**

> « Dites-moi vos jours et heures de travail. Par exemple :
> - Lundi, mardi, jeudi : 9h00 à 12h30 et 14h00 à 18h00
> - Vendredi : 9h00 à 13h00
>
> Vous pouvez aussi me dire si certains jours sont uniquement pour des urgences ou pour certains types de consultation. »

**Défaut sûr** : si le client n'est pas sûr, Claude propose des horaires types médecine esthétique :
- Lundi, mercredi, vendredi : 9h00–12h30 et 14h00–18h00
- Jeudi : 9h00–12h30

**⚠️ RAPPEL TIMEZONE — IMPORTANT :**

Les heures doivent être envoyées en **heure locale Paris avec l'offset**, jamais en UTC brut.

- En été (heure d'été) : `+02:00` → ex. `2026-06-25T09:00:00+02:00`
- En hiver (heure normale) : `+01:00` → ex. `2026-12-01T09:00:00+01:00`

Claude applique automatiquement le bon offset selon la date. Le client n'a jamais à s'en préoccuper.

**Écriture par lot :** Claude crée toutes les plages horaires en un seul passage, praticien par praticien. **Si la liste des praticiens est illisible** (cf. `shared/known-issues.md`), demande au client les noms (ou confirme qu'il n'y a qu'un seul praticien) et crée les horaires sans chercher à re-lister.

**Récap après création :**
> « ✅ Vos horaires d'ouverture sont configurés :
> - Lundi 9h00–12h30 et 14h00–18h00
> - [autres jours]
>
> Ces plages sont maintenant visibles pour vos patients en ligne. »

---

## §17 — Configuration de l'agenda (délais, auto-accept, durée par défaut)

> « Quelques réglages fins de l'agenda se font dans l'interface Nextmotion — je vous guide pas à pas. »

**Cette section se gère dans l'UI.** Voir `shared/ui-paths.md` §17.

Points clés à configurer :
- **Délai minimum avant RDV** (recommandation : 24h pour une première consultation)
- **Délai maximum avant RDV** (recommandation : 90 jours)
- **Acceptation automatique** des RDV (recommandation : activée)
- **Durée par défaut des créneaux**

📍 ⚙️ → **Agenda** → **Configuration**

> « Dites-moi quand vous avez fait ces réglages — on passe à la suite ! »

---

## §18 — Consignes post-traitement

> « Je configure maintenant les **consignes après consultation** que vos patients reçoivent automatiquement après leur rendez-vous. Par exemple : "Évitez le soleil 48h après l'injection", "Pas de sport pendant 24h"… »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_post_treatment_config_retrieve` — lire la configuration existante
- `Nextmotion:oapi_post_treatment_config_update` — mettre à jour les consignes post-traitement

**Question client-only :**

> « Quelles consignes voulez-vous envoyer à vos patients après une consultation ? Vous pouvez me donner un texte général, ou des consignes spécifiques par type de traitement. »

**Défaut sûr :** si le client n'a pas de consignes spécifiques, Claude propose les consignes du pack modèles (disponibles dans `templates/`).

**Récap après mise à jour :**
> « ✅ Consignes post-traitement configurées. Vos patients les recevront automatiquement après chaque rendez-vous. »

**Consignes pré-traitement = UI uniquement.** Ces consignes (avant le rendez-vous) sont gérées dans l'interface Nextmotion.

📍 ⚙️ → **Agenda** → **Consignes pré-traitement**

---

## §19 — Prépaiement Stripe

> « Le prépaiement en ligne (pour que les patients versent un acompte au moment de la réservation) se configure dans l'interface Nextmotion, via un lien avec Stripe. Je vous guide. »

**Cette section se gère dans l'UI.** Voir `shared/ui-paths.md` §19.

📍 ⚙️ → **Finance** → **Prépaiement en ligne**

Note : Stripe est une plateforme de paiement tierce. La connexion demande de créer ou de connecter un compte Stripe.

> « Dites-moi si vous souhaitez activer le prépaiement — je vous guide à travers les étapes. »

---

## §20 — Page de réservation en ligne

> « La dernière étape : **publier votre page de réservation** pour que vos patients puissent prendre rendez-vous depuis votre site ou un lien direct. C'est une **action publique** — je vous demanderai de confirmer avant de la rendre visible. »

**Cette section se gère dans l'UI.** Voir `shared/ui-paths.md` §20.

**⚠️ Confirmation obligatoire avant publication.** Claude demande explicitement :

> « Je suis prêt(e) à vous aider à publier votre page de réservation. Une fois publiée, vos patients pourront y accéder immédiatement. Est-ce que vous confirmez que vous voulez la rendre publique maintenant ? »

Si le client confirme → guidage UI étape par étape.
Si le client veut attendre → noter la tâche pour plus tard, passer au test de bouclage.

📍 ⚙️ → **Agenda** → **Page de réservation en ligne**

---

## ✅ TEST DE BOUCLAGE — Vérification finale

> « Maintenant que l'agenda est configuré, je vérifie que tout est en ordre et qu'un patient peut vraiment prendre rendez-vous. »

**Claude exécute le test de bouclage :**

1. `Nextmotion:oapi_clinic_calendar_opening_hour_list` — lister toutes les plages horaires créées
2. `Nextmotion:oapi_clinic_visit_type_opening_hour_list` — vérifier qu'un créneau ressort comme réservable. **Cet outil exige un `sub_visit_type_id`** : prends-en un via `Nextmotion:oapi_clinic_sub_visit_type_list` (qui fonctionne même quand la liste des motifs est illisible) et passe-le en paramètre.
3. **(option) Test de bout en bout** : tu peux créer un **patient de test** et **réserver réellement un créneau** via `Nextmotion:oapi_appointment_request_create` (cf. SKILL.md §Données de test), puis proposer le nettoyage (supprimer le patient de test ; le RDV de test se retire avec, ou dans l'agenda en UI). C'est le moyen le plus fiable de prouver que l'agenda fonctionne.

**Si des créneaux sont bien disponibles :**

> « ✅ Test de bouclage réussi !
>
> J'ai vérifié votre agenda :
> - [N] plage(s) horaire(s) configurée(s) : [lundi 9h-12h30 et 14h-18h, etc.]
> - [N] motif(s) associé(s) à des créneaux disponibles : [1ère consultation, Injection, etc.]
>
> **Un patient peut réserver en ligne dès maintenant.** L'agenda est opérationnel ! »

**Si aucun créneau n'est disponible (anomalie) :**

> « Je vois qu'il n'y a pas encore de créneau disponible pour les réservations. Cela peut arriver si les motifs de consultation ne sont pas encore associés aux plages horaires.
>
> Vérifions ensemble — quelle est la prochaine étape que vous voulez qu'on règle ? »

Claude diagnostique et corrige (recréer les horaires manquants, associer les motifs, etc.).

---

## Récap du module Agenda

À la fin de ce module, Claude liste ce qui a été configuré :

> « Voilà ce qu'on a mis en place pour votre agenda :
> ✅ [N] salle(s) de consultation créée(s)
> [✅ / ➖] [N] machine(s) ajoutée(s) (ou aucune machine déclarée)
> ✅ Horaires d'ouverture configurés
> ✅ Consignes post-traitement activées
> [✅ / ⏳] Page de réservation : publiée / à publier ultérieurement
> ✅ Test de bouclage : un RDV est réservable en ligne
>
> Votre agenda est prêt ! Vous voulez qu'on configure autre chose, ou vous préférez tester en allant sur votre page de réservation ? »
