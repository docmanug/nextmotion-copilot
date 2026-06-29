# Finance & Communication — Réglages avancés (sections 10, 11, 12, 21, 22, 23, 24)

> **Module à la demande — proposé après le cœur de la configuration.**
> Ces sections sont des **réglages avancés** : paiements, honoraires, antécédents, emails/SMS, codes promo, champs custom. Claude les propose en fin de parcours ou quand le client les demande explicitement.

---

## Introduction

> « La configuration principale de votre compte est terminée. Il reste quelques réglages optionnels que vous pouvez faire maintenant ou plus tard — selon les options actives sur votre compte. Dites-moi ce qui vous intéresse, ou je vous propose le tour complet. »

Claude essaie de vérifier les features actives via `Nextmotion:oapi_clinic_feature_list` avant de proposer chaque section. **Si la lecture échoue** (incident serveur temporaire — cf. `shared/known-issues.md`) : ne bloque pas, n'affiche pas l'erreur ; propose les sections et, si besoin de savoir si une option payante (SMS, Compta) est incluse, demande-le au client ou tente l'écriture (elle te le dira).

---

## §11 — Moyens de paiement

> « Je configure les **modes de paiement** que vous acceptez à la clinique. Vos patients et votre équipe les verront lors de l'encaissement. »

**Pas de feature requise — disponible sur tous les comptes.**

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_payment_medium_list` — vérifier les moyens de paiement existants
- `Nextmotion:oapi_clinic_payment_medium_create` — ajouter chaque moyen de paiement

**Question client-only :**

> « Quels modes de paiement acceptez-vous ? Les plus courants :
> - Carte bancaire
> - Espèces
> - Virement bancaire
> - Chèque
>
> Vous voulez les quatre ? Ou juste certains ? »

**Défaut sûr :** Claude propose `Carte bancaire` + `Espèces` si le client ne sait pas quoi choisir.

**Écriture par lot :** Claude crée tous les moyens de paiement sélectionnés.

**Récap après création :**
> « ✅ Moyens de paiement configurés :
> - Carte bancaire
> - Espèces
> [+ autres si mentionnés]
>
> Votre équipe les retrouvera dans l'interface lors de chaque encaissement. »

---

## §10 — Répartition des honoraires (multi-praticien uniquement)

> **GATED — `consult_digital.accounting` + mode multi-praticien requis.**

### Si le compte est en mode solo (`collaborator.count = 0` ou 1 seul praticien)

> « La répartition des honoraires est une fonction multi-praticiens. Comme vous travaillez seul(e), on passe cette étape — elle n'est pas nécessaire pour vous. »

**Sauter cette section complètement.**

### Si `consult_digital.accounting` est inactif

> « La section **Répartition des honoraires** nécessite l'option Comptabilité, qui n'est pas encore activée sur votre compte. Si vous voulez la débloquer, contactez le support Nextmotion. »

**Sauter cette section.**

### Si `consult_digital.accounting` actif ET ≥2 praticiens

> « Vous travaillez avec plusieurs praticiens — je configure la **répartition des honoraires** : comment les recettes d'une consultation sont partagées entre vous. »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_accounting_distribution_list` — vérifier les répartitions existantes
- `Nextmotion:oapi_clinic_accounting_distribution_create` — créer les règles de répartition

**Question client-only :**

> « Comment voulez-vous répartir les honoraires ? Par exemple :
> - Chaque praticien garde 100 % de ses consultations
> - 70 % pour le praticien qui réalise l'acte, 30 % pour la clinique
>
> Dites-moi le pourcentage pour chaque praticien, et je configure ça. »

**Écriture par lot :** Claude crée les règles pour chaque praticien.

**Récap après création :**
> « ✅ Répartition des honoraires configurée :
> - Dr [Nom] : [X]% de ses consultations
> - [autres praticiens]
>
> Ces règles s'appliquent automatiquement à chaque facturation. »

---

## §21 — Antécédents médicaux

> « Je peux activer et configurer les **questions sur les antécédents médicaux** de vos patients — des champs affichés dans le dossier patient (allergies, traitements en cours, antécédents chirurgicaux, etc.). »

**Feature `consult_digital.patient_portal` recommandée (mais singleton disponible même sans).**

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_medical_history_retrieve` — lire la configuration actuelle des antécédents
- `Nextmotion:oapi_clinic_medical_history_update` — mettre à jour la configuration

**Question client-only :**

> « Quels antécédents voulez-vous pouvoir renseigner dans vos dossiers patients ? Les plus courants en médecine esthétique :
> - Allergies médicamenteuses
> - Traitements en cours
> - Antécédents chirurgicaux
> - Contre-indications (grossesse, allaitement, maladies auto-immunes)
> - Traitements esthétiques antérieurs
>
> Vous voulez activer tout ça, ou juste certains champs ? »

**Défaut sûr :** activer les champs standard (allergies + traitements en cours + contre-indications).

**Récap après mise à jour :**
> « ✅ Antécédents médicaux configurés. Ces champs apparaissent maintenant dans chaque dossier patient — votre équipe peut les remplir lors de la première consultation. »

---

## §23 — Templates d'emails

> « Je personnalise maintenant les **emails automatiques** que Nextmotion envoie à vos patients (confirmation de RDV, rappels, compte-rendu de consultation…). »

**Pas de feature spécifique requise pour les emails de base.**

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_communication_template_list` — lister tous les templates email existants
- `Nextmotion:oapi_communication_template_retrieve` — lire le contenu de chaque template à modifier
- `Nextmotion:oapi_communication_template_update` — mettre à jour le template

**⚠️ Important :** Claude **met à jour les templates existants uniquement**. Il ne peut pas en créer de nouveaux ni changer l'identité d'envoi (adresse email expéditeur) — ces actions se font dans l'UI.

**Question client-only :**

> « Voulez-vous personnaliser le contenu des emails automatiques ? Par exemple, ajouter le nom de votre clinique, une formule de politesse, un numéro de téléphone ?
>
> Je peux aussi vérifier quels emails sont actuellement configurés et vous montrer leur contenu. »

**Écriture :** Claude liste les templates disponibles, vous propose ceux à personnaliser, puis les met à jour un par un.

**Ce qui reste dans l'UI :**
- Créer un nouveau template (pas encore disponible en MCP)
- Configurer l'adresse email expéditeur (identité d'envoi)
- Configurer DKIM/SPF (voir `shared/glossary.md` → « DKIM / SPF »)

📍 ⚙️ → **Communication** → **Templates emails** (pour les réglages non-MCP)

**Récap après mise à jour :**
> « ✅ Vos modèles d'emails sont mis à jour. Vos patients recevront des emails avec le contenu personnalisé. »

---

## §24 — Templates SMS

> **GATED — feature `sms_communication` requise.**

### Si `sms_communication` est inactif

> « L'envoi de SMS automatiques n'est pas encore activé sur votre compte. Si vous voulez débloquer les rappels SMS (très efficaces pour réduire les no-shows !), contactez le support Nextmotion pour ajouter l'option SMS. »

**Sauter cette section.**

### Si `sms_communication` est actif

> « Je personnalise maintenant vos **SMS automatiques** (rappels de RDV, confirmations…). »

**Ce que Claude fait via MCP :**
- `Nextmotion:oapi_clinic_communication_template_list` — lister les templates SMS
- `Nextmotion:oapi_communication_template_retrieve` — lire chaque template SMS
- `Nextmotion:oapi_communication_template_update` — mettre à jour le template SMS

**⚠️ Important :** Claude **met à jour les templates existants uniquement**. Le pack de crédits SMS et l'identité d'envoi SMS se gèrent dans l'UI.

**À savoir sur les SMS** (voir `shared/glossary.md` → « concaténation SMS ») :
- Un SMS = 160 caractères max. Au-delà, il est découpé en plusieurs SMS (chaque partie consomme des crédits).
- Garder les messages courts et clairs.

**Question client-only :**

> « Quel message voulez-vous envoyer à vos patients pour leur rappeler leur rendez-vous ? Essayez de rester en dessous de 160 caractères. Par exemple :
> "Rappel RDV Dr [Nom] le [date] à [heure]. Pour annuler : [téléphone]. À bientôt !" »

**Ce qui reste dans l'UI :**
- Acheter un pack de crédits SMS
- Configurer l'identité d'envoi SMS (numéro ou nom expéditeur)

📍 ⚙️ → **Communication** → **SMS**

**Récap après mise à jour :**
> « ✅ Vos modèles de SMS sont mis à jour. Vos patients recevront un rappel par SMS avant chaque rendez-vous. »

---

## §12 — Codes promo

> « Les codes de réduction pour vos patients se créent directement dans l'interface Nextmotion — je vous guide. »

**Cette section se gère dans l'UI.** Voir `shared/ui-paths.md` §12.

📍 ⚙️ → **Finance** → **Codes promo**

> « Dites-moi quand vous avez créé vos codes promo, ou si vous voulez qu'on passe à la suite. »

---

## §22 — Champs personnalisés patient

> « Les champs sur mesure dans les dossiers patients (ex. "Référent médecin", "Numéro de carte fidélité") se configurent dans l'interface Nextmotion. »

**Cette section se gère dans l'UI.** Voir `shared/ui-paths.md` §22.

📍 ⚙️ → **Patients** → **Champs personnalisés**

> « Dites-moi si vous voulez ajouter des champs personnalisés — je vous guide dans l'interface. »

---

## Récap du module Finance & Communication

À la fin de ce module, Claude liste ce qui a été configuré :

> « Voilà ce qu'on a mis en place dans les réglages avancés :
> ✅ Moyens de paiement : [liste]
> [✅ / ➖] Répartition honoraires : [configurée / non applicable (solo) / option inactive]
> [✅ / ➖] Antécédents médicaux : [configurés / non modifiés]
> [✅ / ➖] Emails : [templates mis à jour / non modifiés]
> [✅ / ➖] SMS : [templates mis à jour / option inactive]
> [⏳ / ➖] Codes promo : [à créer dans l'UI si nécessaire]
> [⏳ / ➖] Champs custom : [à créer dans l'UI si nécessaire]
>
> Votre compte Nextmotion est maintenant entièrement configuré ! »
