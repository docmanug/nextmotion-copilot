# Nextmotion Local — l'IA sur un Mac du cabinet

> Règles de données : `shared/donnees-et-confidentialite.md`. Pannes de Nextmotion Local : `references/depannage-ia.md`.
> Tu **guides** (aucun outil ne pilote le Mac). Seul le webhook « Nextmotion Local » peut être créé par toi (§ 5).

## 1. À quoi ça sert
Au lieu de passer par les fournisseurs d'IA de Nextmotion (le « cloud »), l'IA tourne **sur un Mac de la clinique**.
- Ce qui tourne sur le Mac : la transcription de Consult IA et de la dictée, les résumés, les suggestions, les
  questionnaires, les modèles (texte et photos). La barre ⌘K et Jarvis (texte) suivent le même réglage.
- **Aucune minute Copilot IA n'est décomptée** (pastille « Sur l'ordinateur du cabinet » à la place du compteur).
- Ce que dit l'écran : « Les données patients restent dans vos locaux. Si l'ordinateur est hors ligne, les
  fonctionnalités d'IA s'arrêtent au lieu de basculer vers le cloud. »
- Pour toute question de confidentialité, réponds avec **ces phrases d'écran** et la phrase d'hébergement de
  `shared/donnees-et-confidentialite.md`. Ne promets rien d'autre sur la conformité ; pour un avis juridique :
  le responsable de la protection des données (DPO) de la clinique ou le support.

## 2. Prérequis
- Un **Mac Apple silicon**, sous **macOS 27 ou plus récent**, avec un **compte administrateur** du Mac.
- Le Mac reste **allumé, sorti de veille et connecté à Internet** en permanence (l'installateur règle la mise en veille).
  Ne donne **aucune recommandation de mémoire vive** : si on te la demande, dis que Nextmotion la précise à la
  demande et renvoie vers le conseiller.
- Si le réseau du cabinet filtre le trafic : autoriser le trafic **UDP sortant sur le port 51820** (à demander à la
  personne qui gère le réseau).
- Un **seul ordinateur par clinique**.
- Côté Nextmotion : l'utilisateur qui installe doit avoir le droit de **gérer l'IA locale** (compte administrateur).
  Sinon l'écran dit « Demandez à un administrateur l'accès à l'IA locale. »

## 3. Installer, pas à pas
Sur le **Mac du cabinet**, dans un navigateur, ouvrir app.nextmotion.net :
1. **Paramètres › IA › Où s'exécute l'IA**, choisir **Sur un ordinateur de la clinique**. La carte « Configurez un Mac
   Apple silicon, laissé allumé à la clinique » apparaît.
2. Bouton **Télécharger l'installateur**, puis ouvrir le fichier téléchargé.
3. Saisir le **mot de passe administrateur du Mac** quand il est demandé.
4. À la fin, un **onglet Nextmotion** s'ouvre : « Autoriser cet ordinateur pour *votre clinique* ? ».
5. Saisir le **code à 6 chiffres affiché par l'installateur** sur le Mac. Nextmotion ne l'envoie jamais par e-mail ni
   par message.
6. Cocher « J'ai compris et je suis habilité(e) à autoriser cet ordinateur pour la clinique », puis **Autoriser** :
   « Ordinateur autorisé ».
7. **Se déconnecter** ensuite de Nextmotion sur ce Mac (« Se déconnecter de cet ordinateur »).
8. Attendre : la connexion se fait « généralement dans les deux minutes ». Le moteur d'IA télécharge son modèle au
   premier démarrage (« Téléchargement du modèle d'IA : N % », plusieurs gigaoctets).

**Sécurité :** seul un administrateur de la clinique autorise un ordinateur, **jamais à partir d'un lien ou d'un code
reçu d'un tiers**. Les liens sont à usage unique et expirent.

Erreurs possibles : « Ce lien est invalide ou a déjà été utilisé » ou « Ce lien a expiré » (relancer l'installateur) ·
« Ce code ne correspond pas à celui affiché sur l'ordinateur » (ressaisir le code du Mac) · « Cette clinique a déjà un
ordinateur d'IA locale. Retirez-le avant d'en ajouter un nouveau. » (§ 6) · « L'installateur n'est pas encore
disponible » (réessayer plus tard, support si cela dure).

## 4. Les états et le choix cloud / local
États dans Paramètres › IA : **Connecté** · **En attente de la première connexion** · **Hors ligne**, avec des lignes
« Le moteur d'IA est prêt / démarre / est arrêté », « La dictée est prête / en cours d'utilisation / démarre /
est arrêtée », « Version … ».

| Choix | Ce que dit l'écran | À savoir |
|---|---|---|
| **Dans le cloud** | « Traité par les fournisseurs d'IA de Nextmotion » | Des minutes sont décomptées ; rien à installer |
| **Sur un ordinateur de la clinique** | « Les données patients restent dans vos locaux… » | Pas de minutes ; **pas de repli automatique** vers le cloud |

- La bascule est **instantanée** et **sans perte de données**, dans les deux sens.
- On ne peut passer en local **que si l'ordinateur est « Connecté »**. Retour au cloud : toujours possible.
- **Conseil :** gardez le cloud tant que le Mac n'est pas installé et vérifié ; ne passez en local qu'une fois « Connecté ».
- Si le Mac est hors ligne, l'IA est arrêtée (Consult IA, dictée, Jarvis, ⌘K) : proposez de repasser provisoirement
  sur **Dans le cloud**.

## 5. Automatisations (n8n) sur le Mac
Le Mac fait aussi tourner **n8n**, un éditeur d'automatisations (« quand il se passe ceci, fais cela »).
1. Sur le Mac : application de barre de menus **Nextmotion Local** › **Ouvrir n8n**.
2. Créer un workflow avec un déclencheur **Webhook** ; copier l'**URL de production** (de la forme
   `http://localhost:5678/webhook/…`). L'URL « test » ne répond que si l'éditeur est ouvert.
3. **Paramètres › Centre d'intégration › Webhooks** : créer un webhook, choisir l'événement (par exemple Patient créé,
   Devis accepté, Facture validée, Rendez-vous mis à jour, Visite créée), puis **Envoyer vers : Nextmotion Local** et
   coller l'URL de production. Seules les adresses **localhost** ou **127.0.0.1** sont acceptées.
4. **Par outil, tu ne peux créer que les webhooks patient, devis, facture et paiement** (`oapi_clinic_webhook_create`,
   destination `nextmotion_local`, après récapitulatif et accord). Pour « Visite créée », « Rendez-vous mis à jour » ou
   « Demande d'avis envoyée », guide le client à l'écran (étape 3). Si l'écran répond que l'adresse n'est pas celle de
   l'ordinateur, dis : « Nextmotion Local ne livre qu'à un service de ce Mac : utilisez localhost. »
5. Alternative : le **serveur privé** (Paramètres › Serveur privé).
**Rappel :** un webhook « Visite créée » reçoit le texte des consultations enregistrées par l'IA : c'est une donnée de
santé, d'où l'intérêt de la livrer à ce Mac plutôt qu'à un service externe.

## 6. Assistance à distance, retrait, mises à jour
- **Assistance à distance.** Si le support Nextmotion doit voir ou prendre la main sur le Mac, c'est possible : menu
  **Nextmotion Local › Démarrer une session**. Pendant la session, l'assistance peut voir et contrôler l'écran, et un
  indicateur s'affiche ; elle se termine quand on l'arrête. **Ne propose jamais de la démarrer** si le client ne l'a pas
  décidé. Elle est visible dans Paramètres › IA (« L'assistance Nextmotion peut se connecter jusqu'à … ») et dans
  « Historique de l'assistance… ». N'en dis pas plus sur les outils internes.
- **Changer d'ordinateur ou arrêter, dans cet ordre :** (1) repasser sur **Dans le cloud** ; (2) **Retirer
  l'ordinateur** (Paramètres › IA) ; (3) désinstaller sur le Mac (menu Nextmotion Local › « Désinstaller Nextmotion
  Local… » — refusé tant que des photos ou vidéos de patients sont stockées sur ce Mac) ; (4) **sauvegarder avant** les
  workflows n8n, ils sont supprimés. Un ordinateur retiré est définitivement déconnecté : pour le réutiliser,
  relancer l'installateur.
- **Mises à jour** : automatiques ; la version s'affiche dans Paramètres › IA.
