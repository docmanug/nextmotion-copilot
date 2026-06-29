# Fondations — Identité & Équipe (sections 2, 3, 1)

> **Module 1 du parcours — TOUJOURS exécuté en premier.**
> Tout le reste en dépend : les variables de tes documents (nom de clinique, adresse) et ton agenda (praticien requis).
> Ce module consomme : `shared/mcp-map.md` · `shared/glossary.md` · `shared/ui-paths.md`.

---

## Avant de commencer — Choix du mode produit

La toute première question à régler : **à quoi vous allez utiliser Nextmotion ?**

Claude pose la question suivante au client :

> « Vous utilisez Nextmotion pour… »
> A) **Photos et dossiers patients uniquement** (NM Capture) → parcours allégé
> B) **Consultations + gestion complète du cabinet** (Capture + Consult) → parcours complet

Ce choix détermine l'étendue de la configuration :

| Mode | Sections actives | Sections masquées |
|------|-----------------|-------------------|
| **Capture seul** | Profil (1), Identité clinique (2), Tags NM Capture | Tout l'agenda, les documents, les tarifs |
| **Capture + Consult** | Toutes les sections selon les features actives | Selon feature-gating uniquement |

**Défaut sûr :** si le client ne sait pas, partir sur **Capture + Consult** (le mode complet). Il peut toujours ignorer les sections non pertinentes.

---

## Section 2 — Identité de la clinique

**Niveau MCP : 👁 Lecture seule.** Claude peut lire les informations mais pas les modifier via MCP. Il guide l'interface.

> ⚠️ **Confirmé en prod (25/06) : aucun endpoint d'écriture sur l'identité clinique dans l'API ouverte.** Ni nom, ni adresse, ni **logo**, ni **n° TVA** ne sont modifiables via MCP. Même en superadmin (`sadmin_clinic_update`), seul le `name` (+ lien Monday + features) est éditable — **pas** logo/TVA/adresse. → Ces champs restent **UI uniquement** (`settings.my_clinic.edit`). **Trou d'API à remonter à Marcin** (logo + TVA notamment).

### Ce que Claude fait d'abord

Claude appelle `Nextmotion:oapi_clinic_list` pour lire l'identité existante et afficher au client ce qu'il voit :

```
J'ai récupéré les informations actuelles de votre clinique :
- Nom : [nom actuel]
- Adresse : [adresse actuelle]
- Logo : [présent / absent]
- Numéro TVA : [présent / absent]
- RPPS : [présent / absent]

On va vérifier et compléter tout ça.
```

### Ce que le client règle dans l'interface (guidage UI)

Référence complète : `shared/ui-paths.md` § 2

**3 actions distinctes à faire dans l'ordre :**

#### 1. Logo de la clinique

> « Votre logo apparaît sur tous vos documents (devis, factures, consentements). C'est la première chose que voient vos patients sur le papier. »

📍 ⚙️ → **Ma clinique** → **Informations générales** → logo

- Format recommandé : PNG, fond blanc ou transparent, min 200×200 px
- Défaut sûr : laisser vide pour l'instant, à ajouter avant d'envoyer les premiers documents

#### 2. Informations générales (nom, adresse, téléphone, site web)

📍 ⚙️ → **Ma clinique** → **Informations générales**

- Nom de la clinique, adresse complète (numéro, rue, code postal, ville)
- Téléphone, site web
- Défaut sûr : compléter avec l'adresse du cabinet

#### 3. TVA et RPPS

> « Le numéro TVA n'est obligatoire que si vous êtes assujetti(e) à la TVA (rare en médecine esthétique — à vérifier avec votre comptable). Le RPPS, c'est votre numéro d'identification de médecin (11 chiffres, sur votre carte CPS). »
> Voir glossaire : § RPPS, § TVA.

📍 ⚙️ → **Ma clinique** → **Informations générales**

- Numéro TVA intracommunautaire : laisser vide si non assujetti(e)
- RPPS : laisser vide si vous ne l'avez pas sous la main

**Feature `good_review` :** si active, ajouter aussi l'URL de votre page d'avis externes (Google, Doctolib…) dans le même écran.

---

## Section 3 — Praticiens & Collaborateurs

**Niveau MCP : 🟡 Partielle.** Les médecins/praticiens sont créés directement par Claude. Le personnel non-médecin (secrétaire, assistante) nécessite l'interface.

**Feature `collaborator` :** si le count est 0, tu es en mode solo — cette section se limite au praticien principal. Si count ≥ 1, des sièges collaborateurs sont disponibles.

### Étape A — Photo de profil et signature du praticien

Avant de créer ou modifier un praticien, il faut ces deux éléments :

> « Votre photo de profil et votre signature apparaissent dans les documents signés (ordonnances, consentements). C'est mieux de les avoir dès le départ. »

**Photo de profil :** se règle dans Mon Profil (UI)
📍 ⚙️ → **Mon compte** → **Mon profil** → **Photo** → chargez une photo (JPG/PNG)

**Signature :** deux cas selon le mode produit
- **Capture actif** → votre signature se crée via l'app NM Capture (menu Signature dans l'app)
- **Capture inactif** → upload via l'interface
📍 ⚙️ → **Mon compte** → **Mon profil** → **Signature** → dessinez ou chargez un PNG de votre signature

### Étape B — Créer ou mettre à jour les praticiens via MCP

**Questions à poser au client (une par praticien / collaborateur) :**

> « Pour chaque personne qui travaille dans votre cabinet, j'ai besoin de :
> - Prénom et nom
> - Son **email** (c'est son identifiant de connexion — **obligatoire**)
> - Son **rôle** : médecin, secrétaire, assistante, manager…
> - Numéro RPPS à 11 chiffres (si médecin et disponible — laisser vide sinon)
> - Couleur souhaitée dans l'agenda (optionnel) »

**Claude crée chaque collaborateur via MCP** (⚠️ params réels — vérifiés en prod 25/06) :

```
Nextmotion:oapi_clinic_doctor_create
→ Paramètres réels :
  - clinic_id (requis)
  - email (REQUIS — login du collaborateur)
  - kind (REQUIS, entier) : 10=médecin, 9=secrétaire, 11=assistante, 12=manager, 13=owner, 8=diététicien, 5=cadre
  - first_name, last_name (requis si l'email ne matche pas un user existant)
  - color (optionnel) : HEX RGBA **8 caractères**, ex. `3498dbff` (PAS `#3498DB`, PAS 6 car.)
  - speciality (optionnel, liste — peut être omise)
  - id_no_1 / id_no_2 / id_no_3 (optionnels) : identifiants internes — y mettre le RPPS si besoin (il n'y a PAS de champ `fr_rpps`)
```

> ⚠️ **Le skill disait à tort** : `last_name/first_name/speciality/fr_rpps/color`. **FAUX** — `email`+`kind` sont requis, `fr_rpps` n'existe pas, `color` est en RGBA 8 car. Suivre l'ancienne version = appel **rejeté**.
> ✅ **Et surtout** : la secrétaire / l'assistante (non-médecins) **se créent AUSSI par ce même outil** (`kind=9` / `11`) — pas besoin de passer par l'UI (cf. Étape C).

**Vérification après création :**
```
Nextmotion:oapi_clinic_doctor_list
→ Afficher la liste des praticiens créés au client
```
**Si cette lecture échoue** (incident serveur temporaire — cf. `shared/known-issues.md`) : n'affiche pas l'erreur. La création a fonctionné ; confirme simplement « ✅ J'ai créé [Prénom Nom] » sans re-lister, ou demande au client de vérifier dans Équipe → Collaborateurs.

Si un praticien existe déjà et doit être modifié :
```
Nextmotion:oapi_doctor_update
→ Paramètres : id du praticien + champs à modifier
```

**Défaut sûr :** couleur en RGBA 8 car. (ex. `3498dbff`) ou omise. RPPS non dispo → laisser vide (ou `id_no_1`). Chaque collaborateur consomme un **siège `collaborator`** (cf. feature `collaborator`, `remaining_count`).

### Étape C — Secrétaire et personnel non-médecin

> ✅ **Vérifié en prod (25/06)** : la secrétaire/l'assistante **se créent directement via MCP** avec `oapi_clinic_doctor_create` + `kind=9` (secrétaire) / `11` (assistante) / `12` (manager) — exactement comme un médecin (Étape B). C'est la voie la plus rapide, l'agent peut le faire seul.

**Alternative UI** (si le client préfère une invitation par email plutôt qu'une création directe) :
📍 ⚙️ → **Équipe** → **Inviter un collaborateur** → email + rôle → invitation envoyée.

### Étape D — Tags NM Capture (si Capture actif)

> « Les tags Capture, c'est les mots-clés que vous associez aux photos before/after de vos patients (ex. "Lèvres", "Front", "Sillons"). Ça vous permet de retrouver et trier vos photos facilement. »

**Si la feature `capture` est active**, Claude demande :

> « Vous voulez créer des mots-clés pour vos photos before/after ? Je vous propose les plus courants en médecine esthétique — vous validez ou adaptez. »

Mots-clés suggérés : `Visage complet`, `Lèvres`, `Pommettes`, `Front`, `Glabelle`, `Pattes d'oie`, `Cernes`, `Sillons`, `Menton`, `Corps`, `Avant`, `Après`

**Note :** Les tags Capture se gèrent via l'API media (non exposée dans le MCP de config). Claude guide via l'interface NM Capture ou l'UI web.
📍 ⚙️ → **NM Capture** → **Mots-clés**

---

## Section 1 — Mon Profil (PIN / MFA / infos / photo / signature)

**Niveau MCP : ❌ Aucun (lecture seule).** Entièrement manuel, guidage UI.

> ⚠️ **Confirmé en dur (25/06) : `/open_api/v4/users/me` est READ-ONLY.** `GET` OK (`oapi_user_me_retrieve`) mais **`PATCH`/`PUT`/`POST` → 405** « method not allowed ». Donc le copilote **ne peut PAS** remplir les infos du profil, changer la langue, ni **uploader la photo / la signature** du praticien via l'API ouverte — c'est l'app/web NM (endpoint interne `NM-Authorization`) qui le fait. Ne cherche pas de tool `user_me_update` : il n'existe pas. → **UI uniquement** + **trou d'API à remonter à Marcin** (même famille que clinic logo/TVA : identité & branding non-écrivables en open API).

Référence complète : `shared/ui-paths.md` § 1

> « Votre profil personnel (code PIN de sécurité, authentification double facteur) se règle depuis votre compte. C'est rapide. »

📍 ⚙️ → **Mon compte** → **Mon profil**

- **Code PIN** : 4 à 6 chiffres, pour déverrouiller Nextmotion sur tablette
- **Double authentification (MFA)** : fortement recommandé — protège l'accès aux dossiers patients

**Défaut sûr :** le PIN peut être configuré plus tard. La MFA est recommandée mais non bloquante.

**Champs patient obligatoires :** si le mode Consult est actif, Claude propose aussi de définir quels champs du dossier patient sont obligatoires (identité, contact, adresse). Ce réglage se fait dans l'interface :
📍 ⚙️ → **Ma clinique** → **Dossier patient** → **Champs obligatoires**

Recommandation par défaut : rendre obligatoires Nom, Prénom, Date de naissance, Email ou Téléphone.

---

## Récapitulatif — Ce qui a été créé

À la fin des fondations, Claude liste ce qui a été configuré :

```
✅ Identité clinique lue (nom, adresse)
✅ Logo : [présent / à ajouter]
✅ TVA : [renseignée / vide]
✅ RPPS clinique : [renseigné / vide]

✅ Praticiens créés via MCP :
   - [Prénom Nom] — [spécialité] — RPPS [xxxxx / vide]
   [+ liste de chaque praticien]

✅ Photo de profil : [présente / à ajouter]
✅ Signature : [présente / à ajouter via Capture ou UI]

⚠️ À faire dans l'interface (si pas encore fait) :
   - Logo clinique → ⚙️ Ma clinique → Informations générales
   - Personnel non-médecin → ⚙️ Équipe → Inviter
   [+ items manquants]
```

**Vérification finale (avec replis — cf. `shared/known-issues.md`) :**
```
Nextmotion:oapi_clinic_list          → confirmer l'identité clinique lue (fiable)
Nextmotion:oapi_clinic_doctor_list   → confirmer ≥1 praticien ; si illisible, confirmer avec le client (la création a marché)
```
N'appelle pas `oapi_user_me_retrieve` en vérification : lecture instable et non requise pour la config.

---

## Prochaine étape

Une fois les fondations validées : **→ `references/catalogue.md`** (motifs de consultation, puis traitements et tarifs).

> « Maintenant qu'on a posé les bases, on va construire votre catalogue de consultations et de traitements. »
