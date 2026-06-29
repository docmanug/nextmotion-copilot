# Feature-Gating — Options Nextmotion → Domaines configurables

> Ce fichier explique comment lire les options actives d'un compte Nextmotion et quelles sections de configuration sont accessibles en fonction.

## Règle fondamentale

**Ne jamais proposer une section dont la feature est inactive.** Si une option est désactivée, Claude n'en parle pas pendant le parcours de configuration. En fin de parcours seulement, Claude peut mentionner les options verrouillées sous forme d'**upsell doux** (ex. « Si vous voulez activer la prise de RDV en ligne, Nextmotion propose l'option Agenda »).

---

## ⚠️ Si la lecture des options échoue (incident serveur temporaire)

`oapi_clinic_feature_list` peut renvoyer une erreur technique alors que les options existent (problème côté serveur Nextmotion — cf. `shared/known-issues.md`). Dans ce cas, le feature-gating devient **best-effort, jamais bloquant** :

- **Ne bloque pas, n'affiche pas l'erreur.** Le fait même que le connecteur te réponde prouve que l'option « API & Automatisations » est active (sinon aucun outil ne répondrait). La règle « stop si `api_and_automations` inactif » est donc **sans objet quand tu es déjà connecté**.
- **Mode best-effort** : propose le parcours standard. Quand tu dois savoir si une option payante (Agenda, SMS, Compta) est incluse → soit tu **demandes au client** en une phrase, soit tu **tentes l'écriture** : si l'option manque, l'écriture échoue avec un message d'option manquante (que tu traduis simplement, sans jargon).
- **Solo vs multi-praticiens** : sans les options, tu ne connais pas le quota collaborateurs. Avant de proposer l'agenda multi-praticiens ou la répartition d'honoraires, **demande simplement au client** s'il travaille seul ou à plusieurs.
- **Re-teste plus tard** : si la lecture des options remarche, reprends le feature-gating normal ci-dessous.

---

## Comment lire les features du compte

**Outil :** `Nextmotion:oapi_clinic_feature_list` (= `GET /clinics/{id}/features`)

**Format de réponse :**

```json
[
  {
    "code": "consult_digital",
    "name": "Consult Digital",
    "is_enabled": true,
    "count": null,
    "used_count": null,
    "end_time": null
  },
  {
    "code": "consult_digital.agenda",
    "name": "Agenda en ligne",
    "is_enabled": false,
    "count": null,
    "used_count": null,
    "end_time": "2026-09-30T23:59:59Z"
  }
]
```

**Règles de lecture :**

1. **N'utiliser que `is_enabled: true`** — une feature avec `is_enabled: false` est inactive, même si `end_time` est renseigné.
2. **Signaler `end_time` proche** — si une feature active a une date d'expiration dans moins de **30 jours**, prévenir le client : « Votre option [nom] expire le [date]. Pensez à la renouveler auprès du support Nextmotion. »
3. **`count`** indique le quota autorisé (ex. `count: 3` pour `collaborator` = 3 praticiens max). Ne pas dépasser ce quota lors de la configuration.
4. **`used_count`** indique ce qui est déjà utilisé. Calculer `count - used_count` pour savoir ce qui reste disponible.

---

## Table feature → domaine débloqué

| Code feature | Nom | Débloque | Si inactive : masquer |
|---|---|---|---|
| `consult_digital` | Consult Digital (socle) | Patients, catalogue (§4), motifs (§5), BoltNotes (§6), consentements (§7) | Socle requis — si absent, contacter Nextmotion |
| `consult_digital.agenda` | Agenda en ligne | **Tout l'agenda :** salles (§14), machines (§15), horaires (§16), config agenda (§17), consignes post (§18), prépaiement (§19), page RDV (§20) | Masquer toute la section Agenda ; upsell doux en fin de parcours |
| `consult_digital.accounting` | Comptabilité | Devis/factures (§8), répartition honoraires (§10), protocoles (§13) | Masquer facturation et honoraires ; les paiements de base (§11) restent accessibles sans cette feature |
| `sms_communication` | SMS | SMS — templates et envoi (§24) | Masquer la section SMS ; upsell doux (« Ajouter l'option SMS pour envoyer des rappels automatiques ») |
| `consult_digital.patient_portal` | Portail patient | Partage de documents via portail, antécédents en self-service (§21) | Masquer les options portail patient |
| `consult_digital.chat_and_video_consultation` | Téléconsultation | Configuration téléconsultation (visio, chat) | Masquer tout ce qui concerne la téléconsultation |
| `collaborator` | Collaborateurs (quota N) | Ajout de praticiens/collaborateurs (§3) jusqu'à `count` | Si `count = 0` → mode solo, masquer toutes les fonctions multi-praticiens (honoraires, agenda multi-praticiens) |
| `capture` | Capture (photo médicale) | Signature électronique via tablette/capture, intégration NM Capture app (§1) | Si inactif → signature via upload PNG uniquement |
| `good_review` | Avis patients | Envoi automatique de lien d'évaluation post-consultation (§2 — lien dans la clinique) | Masquer la configuration des avis/évaluations |
| `consult_digital.api_and_automations` | API & Automatisations | Le connecteur MCP lui-même — requis pour que Claude puisse agir | Si inactif → le MCP ne fonctionne pas ; l'ensemble du skill est bloqué ; contacter Nextmotion immédiatement |

---

## Algorithme de démarrage (feature-gating au lancement)

```
0. Tenter oapi_clinic_feature_list. Si la lecture échoue → mode best-effort
   (cf. encadré ci-dessus) : sauter directement aux étapes 6-8, sans bloquer,
   et demander/tester au besoin. Ne pas afficher l'erreur.
1. Appeler oapi_clinic_feature_list
2. Vérifier que consult_digital.api_and_automations est is_enabled = true
   → Si non : bloquer, expliquer, contacter support Nextmotion
   → Si features illisibles mais le connecteur répond : api_and_automations EST
     actif (sinon rien ne répondrait) — ne pas bloquer.
3. Vérifier que consult_digital (socle) est is_enabled = true
   → Si non : bloquer, expliquer
4. Pour chaque section du parcours :
   → Vérifier la feature associée (table ci-dessus)
   → Si is_enabled = false : exclure la section du parcours proposé
5. Pour chaque feature active avec end_time dans < 30 jours :
   → Prévenir le client (sans bloquer le parcours)
6. Si collaborator.count = 0 ou feature inactive :
   → Mode solo activé : masquer honoraires multi-praticiens
7. Construire le parcours avec uniquement les sections débloquées
8. En fin de parcours complet : lister les options non actives (upsell doux)
```

---

## Formule d'upsell doux (fin de parcours)

Si des options sont inactives, Claude peut dire :

> « Votre compte est maintenant configuré ! Vous pouvez encore débloquer ces fonctionnalités avec Nextmotion :
> - **Agenda en ligne** (`consult_digital.agenda`) → vos patients pourront prendre RDV directement depuis votre site
> - **SMS** (`sms_communication`) → envoyez des rappels de RDV automatiques par SMS
> - **Portail patient** (`consult_digital.patient_portal`) → partagez les documents directement avec vos patients
>
> Contactez le support Nextmotion si vous voulez en savoir plus. »

**Règle :** l'upsell ne bloque jamais le parcours et n'est mentionné qu'une seule fois, en fin de session.
