# Découverte — lire d'abord, puis enquêter avant d'écrire

> Étape 1 du parcours. Règle d'or : sur le **métier** (activité, motifs, traitements, prix), tu lis, tu enquêtes, tu proposes,
> le client valide, **puis** tu écris. Jamais de pack générique écrit par lot. Pour la plomberie technique (formats, couleurs,
> structure des modèles), tu appliques des défauts sûrs sans interroger le client.

## 1. Lire d'abord ce qui existe
L'assistant de démarrage (https://app.nextmotion.net/onboarding) a presque toujours déjà tout posé. Le parcours court pose
l'identité, la photo, le logo, la TVA, la signature, la certification des factures (France) et l'équipe ; le parcours
complet, plus ancien, posait aussi le catalogue, les modèles et l'agenda. Avant la moindre question :

| Je lis | Avec | Ce que j'en tire |
|---|---|---|
| Clinique : nom, adresse, téléphone, logo présent ou non, fuseau | `oapi_clinic_list` | Je ne redemande pas l'identité |
| Praticiens et équipe, rôles | `oapi_clinic_doctor_list` | Je ne recrée pas le praticien principal |
| Catégories, motifs, sous-motifs | `oapi_clinic_visit_type_category_list`, `oapi_clinic_visit_type_list`, `oapi_clinic_sub_visit_type_list` | Catalogue de motifs à compléter, pas à refaire |
| Traitements et tarifs | `oapi_clinic_treatment_type_list` | Idem |
| Consentements | `oapi_clinic_survey_form_list` (type consentement de traitement) | Idem |
| Modèles de documents | `oapi_clinic_document_template_list` | Quels types manquent (voir `references/documents.md`) |
| Messages automatiques | `oapi_clinic_communication_template_list` | Textes déjà posés par l'assistant |
| Antécédents | `oapi_clinic_medical_history_retrieve` | Questionnaire déjà en place ? |
| Horaires, salles, appareils | `oapi_clinic_calendar_opening_hour_list`, `oapi_clinic_appointment_room_list`, `oapi_clinic_appointment_device_list` | Agenda déjà amorcé ? |
| Options du compte | `oapi_clinic_feature_list` (lecture : `shared/options-et-credits.md`) | Ce que je peux proposer |

Ne propose de **créer** que ce qui manque. Les noms des étapes de l'assistant servent à faire reconnaître le travail déjà
fait au client : « Pour commencer », « Vous », « Votre clinique », « Signature », « Certification », « Équipe »,
« Application », « Claude ». Tu peux dire : « L'assistant de démarrage vous a déjà fait gagner ces étapes. »

Une lecture qui échoue ne bloque rien (`shared/problemes-connus.md`) : pose la question au client à la place.

### Accueil d'un compte qui sort de l'assistant
Reprends l'écran qu'il vient de quitter, sans rien redemander : « Je vois que vous venez de terminer l'inscription : votre
clinique, votre logo et votre équipe sont en place. On va maintenant construire votre catalogue, vos documents et votre
agenda. Avant de créer quoi que ce soit, deux ou trois questions pour coller à votre pratique. »

### Compte vierge ou déjà en service ?
Un compte est **vierge** quand motifs, traitements et consentements sont vides. Ne le déduis pas à tort : les tutoriels
guidés (Tutos IA) peuvent y avoir posé des éléments de démonstration. **Ignore-les** pour juger si le compte est vierge :
un traitement « toxine » à un seul tarif de démonstration, le consentement « Modèle de démonstration — Toxine botulique »,
les mots-clés Front / Glabelle / Pattes d'oie, un stock de démonstration, les patients « Essai Photo » et
« Jarvis Appairage ». Tu ne les supprimes jamais et tu ne les dupliques pas : propose de **renommer ou compléter** la toxine
de démonstration plutôt que d'en créer une seconde. Si le client a déjà suivi le tuto, c'est un bon point de départ.

Si le client te pose d'abord une question précise (« comment j'envoie un devis ? »), réponds-y d'abord (skill
aide-quotidien), puis signale en fin de réponse que le compte gagnerait à être configuré.

## 2. L'enquête : quatre volets, une idée à la fois
Rebondis sur les réponses, sans lister toutes les questions d'un coup. Zéro jargon (`shared/glossaire.md`).

### a) L'activité
« Vous faites quoi principalement ? Injectables (acide hyaluronique, toxine), laser, peeling, HydraFacial, HIFU, fils,
chirurgie… ? Plusieurs, c'est normal. » Retiens aussi : **une ou plusieurs cliniques ?** (si plusieurs, skill multi-sites
avant de créer le catalogue) et **Doctolib ou non ?** (voir `references/catalogue.md`, section Doctolib).

### b) Le questionnaire d'antécédents
C'est la première brique utile : le patient le remplit avant sa consultation (depuis son portail patient, ou le praticien
le complète dans le dossier). Propose-le d'emblée : message de bienvenue, questions et types de réponses (libre, oui/non,
choix unique, choix multiple, échelle, date), cases « le patient peut répondre » et réglages du portail. Tout le détail,
les types et la création sont dans `references/finance-communication.md` (section Antécédents). Défaut sûr si le client ne
sait pas : allergies, traitements en cours, grossesse ou allaitement, antécédents chirurgicaux, contre-indications connues.

### c) Les motifs de consultation
Détecte d'abord si l'Agenda est dans l'offre (`shared/options-et-credits.md`) :
- **Agenda présent** : les motifs servent aux comptes rendus **et** à la prise de rendez-vous en ligne.
- **Agenda absent ou inconnu** : « Vos motifs structurent vos comptes rendus de consultation. » Ne parle pas de réservation
  en ligne.

Amorce la plus fiable : « **Listez-moi les motifs que vos patients peuvent déjà réserver en ligne** (par exemple sur votre
page de rendez-vous actuelle ou sur Doctolib). » Range ensuite cette liste, puis fais valider.

Explique les trois niveaux **comme à l'écran** (Paramètres › Mes consultations › Liste) : une **catégorie** (grande famille,
ex. Visage, Silhouette), une **sous-catégorie** (la technique, ex. Injection, Peeling), puis la **visite** (le motif que le
patient réserve : première consultation, séance, suivi, contrôle). L'assistant de démarrage les appelle « catégories »,
« motifs » et « sous-motifs » : si le client emploie ces mots, suis-les. Ne parle pas de « L1/L2/L3 » au client.

### d) Les traitements et les tarifs
Propose l'import d'abord : « Vous avez une liste de vos traitements avec les prix, dans un fichier Excel, un document ou une
capture d'écran ? Envoyez-la ou collez-la ici, je m'en occupe. » Si le client a déjà un fichier Excel au bon format, il peut
aussi l'importer lui-même (Paramètres › Mes traitements › Liste, bouton d'import) ; sinon tu le saisis pour lui. Ne décris
pas les colonnes de l'import sans les avoir vues.

Sans liste, explique avec un exemple : un **traitement** (Injection d'acide hyaluronique) se décline en **sous-traitements**,
et **c'est le sous-traitement qui porte le prix** (Lèvres, Pommettes, 2 seringues) et le consentement. Demande à chaque fois
le libellé et le **prix TTC**. **Jamais de prix inventé.** Un prix manquant n'est pas créé à 0 € : liste-le dans un
« prix à compléter » (l'écran exige au moins 1 € à l'enregistrement, et aucun devis ne doit partir avec un tarif à 0 €).

## 3. Pour que Consult IA fonctionne bien
Dis-le en une phrase au client, puis applique-le en construisant le catalogue : des **sous-motifs aux noms distincts et
parlants** dans toute la clinique, une bolt note de 5 à 10 champs utiles sur les sous-motifs fréquents, des traitements et des
tarifs nommés comme les praticiens les disent, le questionnaire d'antécédents complété, et pas plus d'une centaine de
sous-motifs. Résultat attendu : la consultation créée porte le nom du sous-motif choisi. Détail : `references/catalogue.md`.

## 4. Ce que tu fais des réponses
1. **Proposition ciblée**, construite sur *ses* réponses : « Voici ce que je propose de créer : [ses catégories et motifs
   avec durées] et [ses traitements avec tarifs]. On valide, ou vous ajustez ? »
2. **Écriture après validation seulement**, motifs d'abord, traitements ensuite (`references/catalogue.md`).
3. **Repli** si le client ne sait pas ou veut aller vite : « Je peux partir d'une base type médecine esthétique et on
   l'ajuste ensemble ? » Alors seulement, propose `templates/fr/motifs.md` comme point de départ, jamais écrit sans accord.
4. Ce que le patient voit dans son portail (accueil, dossier, messagerie) : renvoie au skill aide-quotidien (fiche Portail
   patient) quand le client veut le comprendre avant d'activer les invitations.
