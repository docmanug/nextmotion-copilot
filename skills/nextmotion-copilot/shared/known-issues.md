# Résilience & limitations connues — Nextmotion Copilot

> **À charger dès qu'une lecture MCP échoue.** Ce fichier dit (1) comment réagir à
> *n'importe quelle* erreur d'outil sans jamais casser l'expérience client, et
> (2) quelles lectures sont **temporairement instables côté serveur Nextmotion**
> aujourd'hui, avec le repli à utiliser pour chacune.

---

## Règle 0 — JAMAIS de jargon d'erreur en sortie

Le client est un médecin esthétique, pas un développeur. Tu ne montres **jamais**
le texte brut d'une erreur technique. Sont **interdits en sortie** :

- « erreur de validation », « output validation », « serializer », « schéma »
- « None is not of type », « False is not of type », « null », « 400 / 500 »
- « bug de sérialisation », « endpoint », « API », « JSON », noms d'outils `oapi_*`

Quand un outil échoue, tu **traduis** en langage simple OU tu **n'en parles pas du
tout** et tu avances par un autre chemin. Exemple de traduction acceptable :

> « Je n'arrive pas à relire la liste de vos motifs pour l'instant — c'est un petit
> souci côté Nextmotion, sans gravité. Ça ne nous empêche pas d'avancer : dites-moi
> juste […] et je continue. »

---

## Protocole « lecture résiliente » (à appliquer à TOUTE lecture)

Une lecture qui échoue n'est **jamais** un motif d'arrêt. Toujours :

1. **Tu n'affiches pas l'erreur technique.** (cf. Règle 0)
2. **Tu appliques le repli** de la lecture concernée (table ci-dessous), c.-à-d. :
   lecture alternative qui fonctionne, **ou** une question simple au client, **ou**
   tu procèdes à l'écriture et tu confirmes le résultat autrement.
3. **Tu continues le parcours.** Une lecture indisponible ne bloque jamais une
   écriture : créer/mettre à jour reste possible même si tu ne peux pas re-lister.
4. **Tu re-testes avant de supposer.** Ces incidents sont temporaires : si une
   lecture remarche, traite-la normalement. Ne code jamais en dur « c'est cassé ».

**Distinction importante — lecture vs écriture :** ces incidents touchent
**la lecture** (list/retrieve). Les **écritures** (`*_create` / `*_update`)
fonctionnent. Donc tu peux configurer un compte même quand l'audit de lecture est
partiel — tu confirmes simplement le résultat par un autre moyen (lecture de
repli, ou test fonctionnel, ou confirmation du client).

---

## Lectures actuellement instables (constaté juin 2026)

Sur certains comptes, ces lectures renvoient une erreur technique alors que la
donnée existe. **Cause : côté serveur Nextmotion (schéma de sortie du connecteur),
pas le copilote.** Repli pour chacune :

| Lecture qui peut échouer | Ce qu'elle servait à lire | Repli à utiliser |
|---|---|---|
| `oapi_clinic_feature_list` | Les options actives du compte (feature-gating) | **Ne bloque pas.** Si le connecteur te répond (même avec des erreurs ailleurs), c'est que l'option API est active. Propose le parcours standard ; si tu as besoin de savoir si une option payante (Agenda, SMS, Compta) est dans l'offre → **demande-le au client en une phrase**, ou tente l'écriture : si l'option manque, l'écriture le dira. cf. `feature-gating.md`. |
| `oapi_user_me_retrieve` | Le profil de l'utilisateur connecté | **Ignore.** Non requis pour configurer. Ne l'appelle pas en vérification finale. |
| `oapi_clinic_doctor_list` / `oapi_doctor_retrieve` | La liste des praticiens | **Demande au client** combien de praticiens et leurs noms. La création (`oapi_clinic_doctor_create`) et la modif fonctionnent — tu confirmes juste « c'est créé » sans re-lister. Pour le prérequis agenda : demande au client de confirmer qu'au moins un praticien existe. |
| `oapi_clinic_visit_type_list` / `oapi_visit_type_retrieve` | Les motifs de consultation (L2) | **Lis les sous-motifs** via `oapi_clinic_sub_visit_type_list` (fonctionne) et les **catégories** via `oapi_clinic_visit_type_category_list` (fonctionne) : ça suffit à savoir si le catalogue est peuplé. La création/modif de motifs fonctionne (« activer à l'agenda » = `display_in_agenda` via `oapi_visit_type_update`, une écriture). Le seul blocage est d'**énumérer** les motifs préexistants (besoin de leurs IDs). Pour « activer tous les motifs » en masse sans pouvoir les lister → propose au client de le faire depuis l'écran **Catalogue → Motifs** de Nextmotion, ou fais-le dès que la lecture remarche. Tu connais déjà les IDs des motifs que tu crées toi-même. |
| `oapi_clinic_document_template_list` | Les modèles de documents (devis/factures…) | **Procède à la création/maj** sans audit préalable, puis confirme avec le client ; ou guide l'audit visuel dans l'UI (Documents). `retrieve` par id peut échouer de la même façon. |

**Lectures qui FONCTIONNENT** (utilise-les sans crainte, et comme replis) :
`oapi_clinic_list`, `oapi_clinic_visit_type_category_list`,
`oapi_clinic_sub_visit_type_list`, `oapi_clinic_appointment_room_list`,
`oapi_clinic_treatment_type_list`, `oapi_clinic_treatment_pricing_list`,
`oapi_clinic_product_list`, `oapi_clinic_communication_template_list`,
`oapi_clinic_survey_form_list`, `oapi_clinic_calendar_opening_hour_list`,
`oapi_clinic_payment_medium_list`, `oapi_clinic_visit_type_opening_hour_list`
(exige un `sub_visit_type_id`). **Toutes les écritures fonctionnent.**

---

## Tool-search burial — un outil ne « ressort » pas dans Claude Desktop

Dans Claude Desktop, le connecteur (181 outils) **surface les outils à la demande**
via une recherche. Certains outils au nom court/générique — surtout
**`oapi_clinic_list`** — **ne ressortent pas** : la description du paramètre
`clinic_id` de presque tous les autres outils contient « Available clinic IDs can be
retrieved via e.g. `clinic_list` », donc une recherche « clinic list » renvoie des
dizaines d'outils qui *mentionnent* `clinic_list` et **enterrent l'outil lui-même**.
⚠️ Ce n'est **pas** un problème de lecture (`oapi_clinic_list` répond très bien une
fois appelé) — c'est un problème de **surfaçage**.

**Règle anti-boucle (impérative).** Cherche un outil **une seule fois** par son nom
exact. S'il ne ressort pas, **ne relance JAMAIS la recherche en boucle** (le client
voit « je cherche… je cherche… » = expérience cassée). Prends un repli :

- Pour **`oapi_clinic_list`** → demande directement au client :
  « Quel est l'identifiant de votre clinique ? Il est dans l'URL de votre compte
  Nextmotion, après `/clinics/`. » Réutilise ce `clinic_id` toute la session.
- Pour un **autre outil** qui ne ressort pas → tente un synonyme de recherche **une
  fois** ; sinon, contourne (autre outil équivalent) ou explique simplement au client
  ce que tu ne peux pas faire là, sans jargon.

(Correctif serveur en cours : nettoyage des descriptions d'outils côté Nextmotion
pour dé-enterrer `clinic_list` & co.)

---

## `survey_form_create` (consentements / BoltNotes) — erreur 500 à la création

Créer un consentement ou un BoltNote via `oapi_clinic_survey_form_create` peut renvoyer
une **erreur 500** à cause de deux bugs serveur dans le traitement de `fields_tmpl` :

1. **Ids de questions non générés à la création.** À la *modification*, le serveur
   complète les `id` manquants ; à la **création, non** → une question sans `id` (ou
   avec un `id` non-UUID) provoque un 500. **Repli : génère un `id` UUID valide pour
   CHAQUE question.**
2. **Types 3/4 (choix radio/cases) cassés.** Le serveur lit `boxes[].text` alors que le
   schéma documente `boxes[].val` → 500. **Repli : n'utilise que les types 1 (texte),
   2 (oui/non), 7 (date) ; évite 3/4.**

Structure sûre + exemple : `references/documents.md` § 7. Ce sont des bugs serveur (ils
devraient renvoyer un 400, pas un 500) — un payload bien formé (UUID ids + types 1/2/7)
les contourne et la création réussit. **Ne montre jamais le 500 brut au client** : si ça
échoue malgré un payload sûr, reformule (« je n'ai pas réussi à enregistrer le
consentement du premier coup ») et propose de réessayer, ou la création en UI
(⚙️ → Consentements).

---

## Si une écriture échoue

Une écriture qui renvoie une erreur d'**option manquante** (ex. créer une salle
sans l'option Agenda) → traduis : « Cette partie demande l'option [Agenda/SMS/…],
qui ne semble pas incluse dans votre offre. Contactez le support Nextmotion pour
l'activer, et on reprend juste après. » Puis passe à un autre domaine.

Une écriture qui échoue pour une autre raison technique → ne montre pas l'erreur
brute ; reformule (« je n'ai pas réussi à enregistrer ça du premier coup »),
retente une fois proprement, et si ça persiste, propose le chemin UI.
