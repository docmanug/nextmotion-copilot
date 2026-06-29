# Playbook Onboarding Nextmotion — Structure & Pédagogie (client-safe)

> Base de référence distillée pour le skill `nextmotion-copilot`, mode **Formation/Onboarding**.
> Filtre appliqué : structure + pédagogie réutilisable côté client uniquement.
> Sources distillées depuis 10 docs du board playbook interne — nomenclature, personnes, mécaniques internes exclues.
> Build-time uniquement — ce fichier n'est jamais lu au runtime par le client.

---

## Phase 1 — Accueil & Cadrage

**Objectif :** Ouvrir la session dans de bonnes conditions, recueillir le retour d'expérience du client, poser le cadre et donner de la visibilité sur ce qui va être fait.

**Durée cible :** 5 à 10 minutes.

### 1.1 Vérification technique en amont

Avant toute chose, s'assurer que les conditions sont réunies :

- Navigateur recommandé : **Google Chrome** (pas Safari, pas Firefox) — le client peut être sur un autre navigateur sans le savoir.
- Zoom du navigateur : **100 %** — un zoom différent peut décaler l'affichage des éléments.
- Partage d'écran fonctionnel (en visio) : demander confirmation visuelle avant de continuer. Si problème : proposer de couper la caméra ou de changer de navigateur.
- Connexion au bon compte : vérifier que le client est bien connecté à son propre espace et pas à un compte test ou démo.

> Astuce de prise en main : ajouter Nextmotion en favori dans la barre de raccourcis Chrome dès la première session. Ça évite de passer par Google à chaque connexion.

### 1.2 Recueil du retour d'expérience

**Règle absolue : toujours commencer par demander le retour du client avant de dérouler l'agenda.**

Exemples de formulations :
- « Avant qu'on commence, est-ce que vous avez eu le temps de tester des choses de votre côté depuis la dernière fois ? »
- « Y a-t-il des points ou des questions qui sont remontés depuis notre dernier échange ? »

Si le client remonte un bug ou un blocage :
- Valoriser le retour : "C'est parfait de me faire ce retour."
- Ne jamais minimiser le problème — s'engager à le remonter.
- Proposer immédiatement un contournement si possible.
- Prendre note pour suivi.

### 1.3 Cadrage de la session

Une fois le feedback recueilli, annoncer clairement ce qui va être fait :

- Présenter les sujets du jour en 3 à 5 points maximum.
- Préciser la durée estimée : « On a environ [durée] ensemble. »
- Rappeler que toutes les questions sont bienvenues — il n'y a pas de mauvaise question.
- Demander si la durée convient et si le client a des contraintes à signaler.

### 1.4 Questions d'orientation en début de parcours

Pour adapter le déroulé à la situation réelle du client :

- Quel type de pratique ? Solo, cabinet avec assistante(s), centre multi-praticiens ?
- Y a-t-il d'autres personnes qui utiliseront le logiciel (assistante, médecin associé) ?
- Le client vient-il d'un autre logiciel ? Si oui, lequel — et y a-t-il des données à récupérer ? (voir section Migration)
- Quels sont les 2 ou 3 usages prioritaires identifiés ? (photos, devis, facturation, agenda…)

### 1.5 Points de vigilance dès l'accueil

- **Praticien solo surchargé** : ne pas tout montrer d'un coup. Voir section Pédagogie — règles d'adaptation au praticien solo.
- **Client qui vient d'un autre logiciel** : clarifier immédiatement les attentes de migration avant le paramétrage. Voir section Migration.
- **Assistante qui prend en main seule** : elle a besoin d'un parcours adapté à son rôle (voir Parcours B, Phase 3).

---

## Phase 2 — Pré-requis & Assets

**Objectif :** Vérifier que tous les éléments nécessaires au paramétrage sont prêts avant de démarrer. Un document ou une information manquante en cours de session coûte du temps et de la concentration.

**Principe clé :** tout ce qui peut être collecté avant la session doit l'être avant la session.

### 2.1 Checklist documents à collecter avant la première session

#### Informations légales du cabinet

- [ ] Nom légal de la structure (attention : peut être différent du nom commercial ou de l'enseigne)
- [ ] Forme juridique (SAS, SARL, SELARL, micro-BNC, exercice libéral pur…)
- [ ] Numéro SIRET / SIREN
- [ ] Numéro TVA intracommunautaire (format FR + 11 chiffres, si applicable)
- [ ] Code APE (ex. : 86.21Z pour médecin généraliste à orientation esthétique)
- [ ] Numéro RPPS du praticien
- [ ] Adresse du cabinet (si différente du siège social)

> Point d'attention : le nom légal de la société et le nom commercial du cabinet ne sont pas toujours identiques. Il est important de clarifier les deux dès le départ pour que les documents envoyés aux patients soient corrects.

#### Identité visuelle

- [ ] Logo du cabinet en PNG (fond transparent de préférence ; fond blanc sinon)
- [ ] Logo de chaque enseigne si multi-marques
- [ ] Signature numérisée de chaque médecin (fond transparent si possible)

> Pour numériser une signature : signer sur une feuille blanche, photographier en bonne lumière, ou utiliser un outil de signature en ligne (type Smallpdf, DocuSign…).

#### Documents modèles existants

- [ ] Modèles de consentements utilisés actuellement (format papier ou Word)
- [ ] Modèles de devis existants
- [ ] Textes de présentation du cabinet ou du praticien

#### Configuration et accès

- [ ] Identifiants de connexion Nextmotion créés et fonctionnels
- [ ] Mot de passe iPad du client (si signature sur iPad prévu)
- [ ] Coordonnées bancaires et RIB (pour la configuration de la facturation)

### 2.2 Checklist données à préparer

- [ ] Liste des motifs de consultation habituels (injections, laser, soin, bilan…) avec durée estimée de chaque
- [ ] Liste des produits/consommables à tracer si gestion de stocks souhaitée
- [ ] Tarifs par acte (pour préremplir les devis)
- [ ] Liste des collaborateurs à créer et leur rôle souhaité (voir Parcours C/D)
- [ ] Intégrations tierces souhaitées : connecteur Doctolib ? Espace patient à activer ?

### 2.3 Vérification rapide avant de démarrer

Avant de passer au paramétrage, confirmer a minima :

1. Le client peut se connecter sans difficulté sur Chrome.
2. Le logo est disponible (format et qualité corrects).
3. Le client a une idée de ses motifs de consultation principaux.
4. Les questions ouvertes de migration sont identifiées (voir section Migration).

Si un élément manque, noter le point et planifier comment le récupérer — ne pas bloquer la session pour ça, sauf si c'est bloquant (ex. : pas de SIRET pour la facturation).

---

## Phase 3 — Parcours Guidé par Rôle

**Objectif :** Dérouler la configuration et la prise en main dans un ordre logique, adapté au rôle et au profil du client.

**Principe de séquencement :** aller du plus urgent au moins urgent. Pour un cabinet qui démarre, la priorité est : navigateur correct → compte configuré → premier patient test → devis → facturation. Les fonctions avancées viennent après.

### Parcours A — Titulaire (médecin solo ou médecin principal)

#### Étape 1 — Paramétrage du navigateur et de l'environnement de travail

1. Ouvrir Chrome, vérifier le zoom à 100 %.
2. Ajouter Nextmotion en favori dans la barre de raccourcis.
3. Se connecter au bon compte et vérifier que l'accès est fluide.

#### Étape 2 — Paramétrage de l'identité du cabinet

1. Uploader le logo (vérifie l'aperçu dans les documents).
2. Saisir les informations légales (nom, SIRET, TVA, adresse).
3. Ajouter la signature numérisée du praticien.
4. Vérifier l'aperçu d'un document vierge pour s'assurer que logo + signature s'affichent correctement.

#### Étape 3 — Motifs de consultation

C'est l'une des étapes les plus importantes : les motifs structurent tout le flux de prise de RDV et de consultation.

- Créer chaque motif de consultation : nom, durée, couleur dans l'agenda.
- Regrouper les motifs par famille si la liste est longue (injections / lasers / soins…).
- Vérifier l'ordre d'affichage : les motifs les plus courants doivent apparaître en premier.
- Adapter les noms aux habitudes du cabinet — pas de jargon médical si l'assistante prend les RDV.

> Bonne pratique : commencer par 5 à 8 motifs essentiels. On peut en ajouter à tout moment — mieux vaut une liste courte et maîtrisée qu'une liste exhaustive dès le départ.

#### Étape 4 — Configuration de la facturation

1. Vérifier les mentions légales (SIRET, TVA, numérotation des factures).
2. Configurer le modèle de facture : en-tête, pied de page, mentions spécifiques si profession réglementée.
3. Paramétrer les règles de TVA selon la nature des actes (actes médicaux vs actes esthétiques).
4. Créer un devis ou une facture test pour vérifier l'aperçu.

#### Étape 5 — BoltNotes et raccourcis de consultation

Les BoltNotes sont des phrases ou blocs de texte préremplissables dans le compte-rendu de consultation.

- Créer les formulations types que le praticien utilise régulièrement (ex. : "Injection de [produit] — zones traitées : [zones]").
- Les organiser par catégorie de soin.
- Avantage : gain de temps considérable en consultation, moins de frappe répétitive.

#### Étape 6 — Workflow patient complet (sur patient test)

Ne jamais tester avec de vrais patients. Créer un patient fictif avec un nom clairement test (ex. : "Jean TEST") et parcourir le flux dans l'ordre :

1. Créer la fiche patient (informations, antécédents, questionnaire).
2. Ouvrir une consultation : sélectionner le motif, documenter.
3. Prendre des photos et les associer à la fiche.
4. Créer un devis à partir du modèle.
5. Faire signer le devis sur iPad (ou tester l'envoi par email pour signature à distance).
6. Émettre la facture.
7. Vérifier l'envoi de la confirmation au patient.

**Règle d'or : faire faire, pas juste montrer.** Après la démonstration, demander au client de reproduire les étapes seul. C'est pendant cet exercice que les vraies questions émergent.

#### Étape 7 — Fonctions avancées (session 2 ou Academy)

Ces fonctions peuvent attendre une deuxième session ou être apprises via les vidéos tutorielles de l'Academy :

- Gestion des stocks et traçabilité des produits injectables
- Facturation d'acomptes et encaissement différé
- Connecteur Doctolib (si souhaité)
- Espace patient (invitation et activation)
- Rapports et statistiques

---

### Parcours B — Assistante / Secrétaire

L'assistante n'a pas besoin du paramétrage — elle prend en main un compte déjà configuré par le titulaire. Son parcours est centré sur les tâches du quotidien.

**Priorités pour ce rôle :** accueil patient, gestion de l'agenda, devis, facturation, envoi de documents.

#### Étape 1 — Prise en main de l'interface

- Connexion avec son propre compte (jamais le compte du médecin).
- Exploration du menu principal : où se trouve chaque section.
- Raccourci navigateur et zoom 100 %.

#### Étape 2 — Gestion de l'agenda et des patients

1. Créer un nouveau RDV : sélectionner le patient, le motif, le créneau.
2. Modifier un RDV existant (déplacer, annuler, noter un motif d'annulation).
3. Créer la fiche d'un nouveau patient.
4. Retrouver un patient existant (recherche par nom, par date de naissance).

#### Étape 3 — Devis et documents

1. Ouvrir un devis depuis la fiche patient.
2. Sélectionner le modèle adapté au traitement prévu.
3. Valider et envoyer pour signature (iPad ou email).
4. Vérifier le suivi de l'envoi (les 3 états possibles : envoyé / délivré / ouvert).
5. Envoyer un document post-soin au patient par email.

#### Étape 4 — Facturation de base

1. Comprendre la différence entre facture provisoire et facture définitive.
2. Enregistrer un paiement.
3. Émettre la facture définitive.

#### Point essentiel — Rôles Owner vs Manager

- **Owner** : accès complet, y compris paramétrage, suppression de données, création de comptes. Réservé au titulaire.
- **Manager** : accès fonctionnel (agenda, patients, devis, facturation, photos). Rôle standard pour une assistante.

> Erreur courante : donner le rôle Owner à l'assistante. Si l'assistante modifie accidentellement la configuration, cela peut affecter tous les documents et le flux de travail du cabinet. Le rôle Manager est suffisant pour l'ensemble des tâches quotidiennes d'une assistante.

---

### Parcours C — Médecin Associé

Même logique que le Parcours A, mais le compte existe déjà (créé par le titulaire). Points spécifiques :

- Vérifier que l'association médecin / assistante est bien configurée dans les paramètres.
- Clarifier l'organisation des dossiers patients en contexte multi-praticiens : qui voit quoi, traçabilité par praticien.
- Vérifier l'association patient-médecin pour la traçabilité comptable.

---

### Parcours D — Titulaire qui crée un compte collaborateur

Quand le titulaire souhaite intégrer un nouvel arrivant :

1. Créer le compte collaborateur : Paramètres > Collaborateurs > Nouveau.
2. Définir le rôle : Owner (uniquement si médecin principal) ou Manager (assistante, praticien associé sans admin).
3. Paramétrer l'association médecin / assistante.
4. Remettre le kit d'orientation au nouvel arrivant (voir ci-dessous).

#### Kit d'orientation pour le nouvel arrivant

Fiche à compléter et remettre en début de prise en main :

- Mon identifiant de connexion Nextmotion : ___
- Mon rôle dans Nextmotion : ___
- Les 3 actions que je ferai tous les jours : ___, ___, ___
- En cas de blocage, je contacte : ___ (le titulaire ou le support Nextmotion)
- Pour apprendre à mon rythme : l'Academy Nextmotion (accessible depuis le menu principal)

---

## Phase 4 — Test & Go-Live

**Objectif :** Valider que tout fonctionne avant d'utiliser le logiciel avec de vrais patients. Le client doit repartir de cette phase avec la certitude que son compte est prêt.

**Principe fondateur :** ne jamais passer au go-live sans avoir testé le flux complet au moins une fois. Un problème découvert en formation se corrige en 5 minutes — le même problème découvert en consultation avec un vrai patient crée de la frustration et de la méfiance.

### 4.1 Pendant la formation — créer des données test

**Règle absolue : les données test sont créées par l'utilisateur lui-même dans l'interface, pas par un outil automatique.** Le copilote guide pas-à-pas, mais c'est le client qui manipule.

Parcours à faire faire (l'utilisateur exécute, le copilote accompagne) :
- Créer un patient fictif avec un nom clairement test (ex. : "Marie TEST", date de naissance fictive).
- Parcourir le flux complet : fiche → consultation → photo → devis → signature → facture.
- Tester la signature depuis l'appareil réel (iPad ou envoi email à distance).
- Créer une facture test pour vérifier l'aperçu complet avec logo + signature + mentions légales.

> Important : pendant la phase de test, toutes les données créées sont des données fictives. Avant le go-live, elles seront archivées ou supprimées. Aucun nettoyage manuel n'est nécessaire de la part du client.

### 4.2 Points à valider avant de déclarer le compte prêt

- [ ] Connexion fluide sur Chrome, zoom 100 %
- [ ] Logo et signature s'affichent correctement sur les documents
- [ ] Un devis test peut être créé, signé et envoyé par email
- [ ] La facture générée comporte les bonnes mentions légales (SIRET, TVA si applicable)
- [ ] Le suivi email fonctionne (les 3 états s'affichent bien)
- [ ] Si assistante : elle peut se connecter avec son propre compte
- [ ] Si Doctolib activé : tester la synchronisation dans les deux sens

### 4.3 Résolution des blocages courants avant go-live

| Symptôme | Cause probable | Action |
|----------|---------------|--------|
| Affichage décalé ou éléments manquants | Zoom navigateur ≠ 100 % | Régler Chrome à 100 %, vider le cache |
| Academy bloquée ou inaccessible | Cache navigateur | Vider le cache, essayer en navigation privée |
| Micro ou IA vocale ne fonctionne pas | Autorisation micro non accordée | Chrome > Paramètres > Confidentialité > Microphone > Autoriser Nextmotion |
| Logo ou signature absents dans les documents | Mauvais format ou upload incomplet | Re-uploader en PNG fond transparent, vérifier l'aperçu |

### 4.4 Encourager le test immédiat après la formation

Une formation suivie d'une absence prolongée du logiciel = oubli quasi certain. Le client doit toucher le logiciel dans les jours qui suivent.

Message à transmettre :
> « Une fois qu'on a vu les choses ensemble, c'est souvent dans les jours qui suivent qu'il faut essayer, tester, s'amuser avec le logiciel. Si on attend six mois, on oublie — et il faut repartir de zéro. »

Proposition concrète : identifier un premier vrai cas d'usage simple que le client peut faire seul dès le lendemain (ex. : créer la fiche de son prochain patient).

### 4.5 Go-live

1. Supprimer ou archiver le patient test (ou laisser le client le faire seul — ça renforce l'appropriation).
2. Identifier le premier vrai patient ou flux à traiter.
3. Rappeler l'accès au support Nextmotion pour les questions après go-live.
4. Confirmer la disponibilité pour un point de suivi rapide si nécessaire.

---

## Phase 5 — Clôture & Plan d'Action

**Objectif :** Terminer la session sur une note claire et positive. Le client doit savoir exactement ce qu'il a appris, ce qu'il lui reste à faire, et comment continuer.

**Durée cible :** 5 minutes maximum.

### 5.1 Signaler la fin du temps disponible

Ne pas laisser la session s'étirer sans fin. Annoncer la fin clairement quelques minutes avant :
> « On arrive vers la fin de notre rendez-vous. On peut prendre encore quelques minutes si besoin, mais je voulais qu'on prenne le temps de faire le point ensemble. »

### 5.2 Récapituler ce qui a été vu

Lister en 3 à 5 points les sujets couverts pendant la session. Exemple :
> « On a vu ensemble : la configuration de l'identité du cabinet, les motifs de consultation, le workflow patient avec le devis et la facturation, et les BoltNotes. »

### 5.3 Donner la priorité n°1 pour la semaine à venir

Message clé sur l'autonomisation :
> « La priorité maintenant, c'est que vous rentriez dans le logiciel et que vous alliez section par section, en regardant les vidéos tutorielles. C'est comme ça que le paramétrage devient vraiment le vôtre. Si vous passez dans chaque section et que vous regardez les vidéos associées, votre logiciel est prêt à fonctionner. »

### 5.4 Identifier les points non couverts

S'il reste des sujets non traités, les nommer explicitement et définir comment les traiter :
- Ressource de l'Academy correspondante
- Point téléphonique de 15 minutes sur le sujet précis
- Session complémentaire planifiée

### 5.5 Plan d'action post-formation

| Priorité | Action | Délai suggéré |
|----------|--------|---------------|
| 1 | Tester les fonctions vues en formation sur des données fictives | Dans les 48 h |
| 2 | Paramétrer les sections non couvertes (vidéos Academy) | Semaine 1 |
| 3 | Traiter les premiers vrais patients dans Nextmotion | Semaine 1 |
| 4 | Finaliser les modèles de devis et consentements personnalisés | Semaine 1–2 |
| 5 | Point de suivi : questions après 2 semaines d'usage | J+15 |

### 5.6 Rassurer sur la disponibilité et l'accompagnement dans la durée

Un des freins les plus courants est la crainte d'être livré à soi-même après la formation.

Message à transmettre :
> « Je reste disponible si vous avez des questions ou si vous êtes bloqué sur un point. On peut se refaire des petits points de 15 minutes par téléphone ou en visio, autant de fois que nécessaire. L'objectif, c'est que vous ayez une utilisation vraiment fluide. »

### 5.7 Planifier le prochain rendez-vous

Avant de raccrocher, proposer une date pour le prochain point :
> « Est-ce qu'on peut d'ores et déjà bloquer un créneau pour la semaine prochaine, juste pour faire un retour rapide sur comment ça s'est passé ? »

---

## Pédagogie

### Framework 80/60 — Cadrer les attentes de couverture

Aucun logiciel ne couvre 100 % des besoins d'un cabinet. En formation, quand le client liste des fonctionnalités manquantes ou compare Nextmotion à un "logiciel idéal", le framework 80/60 permet de recadrer la conversation honnêtement.

**L'idée centrale :**
- Un logiciel qui couvre **80 % des besoins** est déjà une excellente solution.
- La solution actuelle du client en couvre peut-être **60 %**.
- L'objectif de la prise en main : identifier et maîtriser les fonctions qui couvrent ces 80 %.

**Structure en 4 temps :**

1. **Reconnaître** — "Je comprends que vous ayez des attentes élevées, et c'est tout à fait normal."
2. **Cadrer** — "Le logiciel parfait n'existe pas. Aucune solution ne couvrira 100 % de vos besoins."
3. **Comparer** — "L'objectif, c'est de passer de là où vous êtes aujourd'hui à 80 % ou plus de satisfaction."
4. **Engager** — "Regardons ensemble quels sont les usages prioritaires pour vous et concentrons-nous dessus."

**À ne pas faire :** utiliser ce framework pour esquiver de vraies lacunes du produit. Il sert à gérer les attentes, pas à éviter les problèmes réels.

---

### Adaptation du rythme — Praticien solo

Le praticien qui exerce seul cumule la pratique médicale, l'administratif, la gestion des stocks, la communication et le changement de logiciel. L'onboarding est une charge supplémentaire dans un quotidien déjà chargé.

**Profil type :**
- Gère tout sans délégation possible
- Temps très limité en semaine (consultations le matin, admin en fin de journée)
- Forte exigence de qualité, mais peu de fenêtres disponibles pour la mise en place

**Règles d'adaptation :**

1. **Sessions courtes** — 45 à 60 minutes maximum par session, puis pause ou prochain rendez-vous.
2. **Un flux à la fois** — maîtriser le flux "créer un patient + faire un devis" avant de passer aux photos ou aux stocks.
3. **Répétition guidée** — toujours faire manipuler le client, ne pas juste montrer. "À votre tour, essayez de faire [action]."
4. **Ancrage sur le quotidien** — "Demain matin, quand votre premier patient arrive, voilà ce que vous ferez dans Nextmotion."
5. **Fin de session = 1 action concrète** — le client repart avec une chose qu'il sait faire seul.

**Urgences réelles vs urgences perçues**

En début de parcours, faire un tri clair entre ce qui est urgent et ce qui peut attendre :

| Urgences réelles (à traiter en priorité) | Peut attendre (session 2 ou Academy) |
|------------------------------------------|--------------------------------------|
| Migration des données si l'ancien logiciel est résilié | Personnalisation fine des devis |
| Connexion Doctolib si les patients prennent déjà des RDV | Gestion des stocks |
| Facturation si le client démarre sa comptabilité sur Nextmotion | Statistiques et rapports |
| Paramétrage des motifs de consultation | Espace patient |

---

### Boucle pédagogique — Expliquer → Montrer → Faire faire → Valider

À chaque étape clé de la formation, appliquer cette séquence :

1. **Expliquer** — "Voilà à quoi sert cette fonction et comment elle s'insère dans le flux de travail."
2. **Montrer** — faire la manipulation en direct, en commentant ce qui est fait.
3. **Faire faire** — "À votre tour, essayez de [action précise]." Observer sans intervenir sauf blocage.
4. **Valider** — "Parfait. Vous avez une question avant qu'on passe à la suite ?"

**Validation active :** ne jamais supposer que le client a compris parce qu'il n'a pas posé de question. Demander explicitement : "Est-ce que ça vous parle ?" ou "Vous voulez qu'on refasse cette étape ensemble ?"

---

### Adaptation langue & niveau

- **Éviter le jargon non traduit** — utiliser "fiche patient" plutôt que "dossier CRM", "modèle de document" plutôt que "template", "acceptation de devis" plutôt que "workflow de validation".
- **Référence au glossaire** — en cas de terme technique, s'appuyer sur `shared/glossary.md`.
- **S'adapter au rythme du client** — un client qui pose beaucoup de questions ou qui parle lentement a besoin de plus d'espace et d'un rythme plus lent.
- **Centre multi-praticiens ou manager de clinique** — profil souvent plus à l'aise avec les outils numériques. Adapter le niveau de détail en conséquence, aller plus vite sur les bases.

---

## Migration depuis un ancien logiciel

### Contexte fréquent

Beaucoup de clients arrivent avec des données existantes dans un autre logiciel (agenda, dossiers patients, photos, devis). Bien anticiper la transition évite les frustrations et les retards.

### Questions à poser dès la Phase 1

- Quel logiciel est utilisé actuellement ?
- Depuis combien de temps ? Combien de dossiers patients actifs environ ?
- Y a-t-il des photos à récupérer ? Des devis signés à archiver ?
- Le client souhaite-t-il migrer les données historiques, ou repartir proprement à partir de maintenant ?

### Options de migration

**Option A — Démarrage propre (recommandé dans la majorité des cas)**

- Repartir à zéro dans Nextmotion pour tous les nouveaux patients.
- Conserver l'ancien logiciel en lecture seule pour consulter l'historique si besoin.
- Avantage : simple, rapide, sans risque de données corrompues ou mal formatées.
- Idéal pour : Excel, Google Drive, papier, logiciels sans export standard.

**Option B — Import de données**

- Possible pour certains formats et certains logiciels sources.
- Nécessite que le client contacte lui-même son ancien logiciel pour demander l'export (le client est titulaire de ses données).
- Délai variable selon le logiciel source : de 1 à 10 jours pour recevoir les données.
- Une fois le lien d'export reçu, le client le transmet à l'équipe Nextmotion qui gère l'import.
- Après import : prévoir un rendez-vous de vérification pour s'assurer que les dossiers clés sont bien présents.

> Point critique sur le timing : si le client continue à travailler sur l'ancien logiciel pendant que l'import est en cours, les nouvelles données ajoutées après l'export ne seront pas dans Nextmotion. Idéalement, la migration se fait au moment exact où le client est prêt à basculer.

### Recommandations pratiques

1. **Période de double utilisation** — prévoir 2 à 4 semaines de coexistence : l'ancien logiciel reste disponible pour consulter l'historique, et tous les nouveaux patients sont créés dans Nextmotion.
2. **Données photos** — les photos stockées dans Drive ou Dropbox ne sont pas transférées automatiquement. Planifier un tri et un upload manuel des photos clés, ou conserver le Drive comme archive de référence.
3. **Anciens devis et consentements** — les documents signés antérieurement peuvent rester dans l'ancien système ou être archivés manuellement. Nextmotion gère les nouveaux documents à partir du go-live.
4. **Pas de pression** — il n'y a aucune obligation de tout migrer immédiatement. Un démarrage progressif est souvent plus serein et plus sûr.

### Cas spécifiques

| Logiciel source | Recommandation |
|-----------------|---------------|
| Doctolib agenda | Maintenir Doctolib pour la visibilité patient ; Nextmotion gère la partie clinique via le connecteur — pas de migration d'agenda nécessaire |
| Amesla | Export possible — contacter le support Amesla pour le format ; photos à traiter manuellement |
| MédiStory | Export possible selon version — vérifier avec le support Nextmotion |
| Excel / Google Sheets | Démarrage propre conseillé — les données tabulaires ne correspondent pas au format Nextmotion |
| Papier / archive manuelle | Démarrage propre — repartir à zéro dans Nextmotion |
