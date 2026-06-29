# Guide d'installation — Nextmotion Copilot pour Claude Desktop

> Version 1.0 — juin 2026  
> Pour toute question : support@nextmotion.net

---

## Prérequis

Avant de commencer, vérifiez les 3 points suivants :

1. **Claude Desktop installé et à jour**  
   Téléchargez la dernière version sur [claude.ai/download](https://claude.ai/download).  
   Version minimale requise : Claude Desktop 1.x (avec support des Compétences et des Connecteurs).

2. **Abonnement compatible**  
   Nextmotion Copilot nécessite un abonnement Claude **Pro** ou **Team**.  
   (Le plan gratuit ne supporte pas les Compétences ni les Connecteurs.)

3. **Exécution de code activée**  
   Dans Claude Desktop : **Réglages → Général → Exécution de code → Activer**.  
   Sans cette option, certaines vérifications automatiques de votre configuration ne fonctionneront pas.

---

## Étape 1 — Activer le connecteur MCP Nextmotion

Le connecteur MCP permet à Claude d'accéder directement à votre compte Nextmotion (lecture et écriture de vos paramètres) sans que vous ayez besoin de copier-coller de clés ou de codes.

1. Ouvrez Claude Desktop.
2. Cliquez sur **Réglages** (icône ⚙️ en bas à gauche).
3. Dans le menu de gauche, cliquez sur **Connecteurs**.
4. Cliquez sur **+ Ajouter un connecteur**.
5. Recherchez **Nextmotion** dans la liste des connecteurs disponibles.
6. Cliquez sur **Connecter** — une fenêtre d'authentification Nextmotion s'ouvre.
7. Connectez-vous avec votre **identifiant et mot de passe Nextmotion habituels**.
8. Acceptez les permissions demandées (accès à votre compte clinique).
9. La fenêtre se ferme — le connecteur apparaît maintenant avec un statut **Connecté** (point vert).

> Vous n'avez rien à copier-coller. L'authentification OAuth se fait entièrement via votre session Nextmotion.

---

## Étape 2 — Installer le skill Nextmotion Copilot

1. Téléchargez le fichier **`nextmotion-copilot.zip`** fourni par Nextmotion (lien dans votre email d'onboarding).
2. **Ne décompressez pas le zip** — Claude Desktop lit directement le fichier compressé.
3. Ouvrez Claude Desktop.
4. Cliquez sur **Réglages** (icône ⚙️).
5. Dans le menu de gauche, cliquez sur **Compétences**.
6. Cliquez sur **+ Ajouter une compétence**.
7. Cliquez sur **Depuis un fichier** et sélectionnez le fichier `nextmotion-copilot.zip`.
8. Claude Desktop affiche le nom **Nextmotion Copilot** — cliquez sur **Installer**.
9. La compétence apparaît dans votre liste avec un statut **Active**.

---

## Étape 3 — Vérifier que tout fonctionne

1. Ouvrez une **nouvelle conversation** dans Claude Desktop (bouton ✏️ en haut à gauche).
2. Tapez exactement :

   ```
   configure mon compte Nextmotion
   ```

3. Claude doit répondre en **français**, lire automatiquement votre compte, et proposer un **plan de configuration en plusieurs étapes** en commençant par les fondations (identité de la clinique, praticiens).

> Si Claude demande « quel compte ? » ou ne mentionne pas Nextmotion dans sa réponse, consultez la section Dépannage ci-dessous.

---

## Dépannage

### Le connecteur Nextmotion n'est pas détecté

**Symptôme :** Claude répond « je n'ai pas accès à votre compte Nextmotion » ou ne propose pas de lire votre configuration.

**Solutions :**
1. Vérifiez que le connecteur est bien **Connecté** (Réglages → Connecteurs → statut vert).
2. Si le statut est **Déconnecté** ou **Erreur** : cliquez sur le connecteur → **Reconnecter** → refaites l'authentification OAuth.
3. Ouvrez une **nouvelle conversation** (pas une conversation existante) — les connecteurs ne s'activent que dans les nouvelles conversations.
4. Si le problème persiste : déconnectez le connecteur, attendez 30 secondes, reconnectez.

---

### L'exécution de code n'est pas activée

**Symptôme :** Claude ne peut pas effectuer les vérifications automatiques et indique une erreur liée à l'exécution.

**Solution :**  
Réglages → Général → **Exécution de code** → basculer sur **Activé** → relancer Claude Desktop.

---

### Le skill n'apparaît pas après installation

**Symptôme :** La compétence n'est pas visible dans la liste après upload.

**Solutions :**
1. Vérifiez que vous avez uploadé le fichier `.zip` (pas un dossier décompressé).
2. Relancez Claude Desktop complètement (Fichier → Quitter, puis ré-ouvrir).
3. Vérifiez votre abonnement : Réglages → Abonnement → doit afficher **Pro** ou **Team**.

---

### Claude répond en anglais

Le skill est configuré pour répondre en français. Si Claude bascule en anglais :  
Commencez la conversation par : **« Réponds-moi en français. Configure mon compte Nextmotion. »**

---

## Ce que Claude peut faire (et ne peut pas faire)

**Claude fait directement via le connecteur :**
- Créer et configurer vos praticiens et collaborateurs
- Créer vos motifs de consultation, types de traitements et tarifs
- Créer vos consentements éclairés et documents (devis, factures)
- Configurer vos salles, machines et horaires d'ouverture
- Configurer vos moyens de paiement et distributions d'honoraires

**Claude vous guide étape par étape (dans l'application Nextmotion) :**
- Logo clinique, numéro RPPS, TVA (données légales sensibles)
- Configuration fine de l'agenda (délais de réservation, acceptation auto)
- Prépaiement Stripe, codes promo, ordonnancier

Dans les deux cas, Claude ne vous laissera jamais devant une impasse : il agit quand il peut, et vous guide précisément quand il ne peut pas.

---

## Trame de script vidéo — Tuto d'installation (3-4 minutes)

### [00:00 — 00:20] Accroche

**À l'écran :** Logo Nextmotion + Claude Desktop côte à côte.

**Script :** « Dans cette vidéo, on va connecter votre compte Nextmotion à Claude Desktop en moins de 5 minutes. Après ça, vous pourrez configurer tout votre compte en parlant à Claude, en français, sans jamais chercher un menu. »

---

### [00:20 — 00:40] Vérification des prérequis

**À l'écran :** Claude Desktop ouvert, Réglages → Général.

**Script :** « D'abord, on vérifie que l'exécution de code est bien activée. Réglages, Général — ici, Exécution de code, je bascule sur Activé. C'est indispensable pour que Claude puisse vérifier votre configuration en temps réel. »

---

### [00:40 — 01:40] Étape 1 — Connecteur MCP

**À l'écran :** Réglages → Connecteurs → recherche "Nextmotion" → clic Connecter → fenêtre OAuth Nextmotion → connexion → retour Claude avec statut vert.

**Script :** « Maintenant le connecteur. Réglages, Connecteurs, plus Ajouter. Je recherche Nextmotion… je clique Connecter. Une fenêtre s'ouvre — c'est votre page de connexion Nextmotion habituelle. J'entre mes identifiants… j'accepte… et voilà, le connecteur est connecté. Point vert. Claude a maintenant accès à votre compte, de façon sécurisée. »

---

### [01:40 — 02:30] Étape 2 — Installation du skill

**À l'écran :** Réglages → Compétences → Ajouter → sélection nextmotion-copilot.zip → Installer → liste des compétences avec "Nextmotion Copilot" Active.

**Script :** « On installe maintenant le skill. Réglages, Compétences, plus Ajouter. Je clique sur Depuis un fichier, je sélectionne le zip que vous avez reçu par email — nextmotion-copilot.zip. Je clique Installer. Et voilà, Nextmotion Copilot apparaît dans ma liste, statut Active. »

---

### [02:30 — 03:20] Étape 3 — Test de démarrage

**À l'écran :** Nouvelle conversation → saisie "configure mon compte Nextmotion" → réponse Claude montrant l'audit du compte et le plan par étapes.

**Script :** « On teste. Nouvelle conversation. Je tape : configure mon compte Nextmotion. Claude lit automatiquement mon compte… et me propose un plan de configuration par étapes, en commençant par les fondations. Il sait déjà ce qui est configuré et ce qui manque. C'est parti. »

---

### [03:20 — 03:50] Dépannage rapide

**À l'écran :** Réglages → Connecteurs → statut → Reconnecter.

**Script :** « Si Claude ne voit pas votre compte, allez dans Réglages, Connecteurs, vérifiez le statut. Si c'est rouge, cliquez Reconnecter et refaites l'authentification. Ouvrez aussi une nouvelle conversation — les connecteurs s'activent uniquement dans les nouvelles conversations. »

---

### [03:50 — 04:00] Conclusion

**À l'écran :** Claude en pleine configuration de compte (animation ou capture d'écran).

**Script :** « Vous êtes prêt. Claude connaît votre compte Nextmotion et va vous guider étape par étape. Pour toute question : support@nextmotion.net. »

---

## Évolution — Format Plugin Claude Desktop

> Section technique, pour information.

Le format **plugin Claude Desktop** (panneau « Plugins personnels ») permettra à terme de bundler en un seul paquet : le skill Nextmotion Copilot **et** la déclaration du connecteur MCP Nextmotion (authentification OAuth), avec gestion des mises à jour automatiques.

**Question en cours de validation chez Anthropic :** un plugin peut-il embarquer un connecteur MCP OAuth distant (`mcp.nextmotion.net`) ? Si oui, l'installation passera en une seule étape (zéro configuration manuelle). Si non, le mode actuel (connecteur + skill séparés) reste le standard, avec le tuto vidéo pour guider l'installation.

Pour l'instant, l'installation se fait en 2 temps (Étape 1 : connecteur + Étape 2 : skill), ce qui reste simple avec la vidéo ci-dessus.
