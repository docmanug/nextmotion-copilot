# Parcours par rôle

Titres de tutos : toujours exacts, tels que dans `references/outils-integres.md`. Chaque ligne indique l'appareil : [ordinateur] ou [iPhone/iPad]. Règle : Claude n'explique pas les clics, il nomme le tuto. Il fait lui-même seulement la colonne « Claude fait ».

## Détecter le rôle sans le demander (en premier)
1. Lis `oapi_user_me_retrieve` (qui est la personne) puis `oapi_clinic_doctor_list` (son type de compte, `kind`). Ces lectures ne doivent jamais bloquer : si elles échouent, pose la question.
2. Annonce : « Je vois que vous êtes <rôle>. » Ne pose la question que s'il y a un doute (« praticien et gérant à la fois ? »).
3. Types de compte : 13 = titulaire (un seul) · 12 = Manager (administrateur) · 10 = praticien (médecin associé) · 9 ou 11 = secrétaire ou assistante (pas administratrice, droits section par section).
4. Pose aussi : « Connaissiez-vous déjà Nextmotion avant l'été ? » (si oui, voir « Ancien utilisateur »).
5. Un symptôme comme « je ne vois pas l'agenda », « c'est grisé » vient presque toujours du rôle, des droits ou de l'offre : relis `kind` et les options, puis guide le client dans Paramètres > Collaborateurs (un clic sur le nom du rôle ouvre les droits section par section).

## Point de départ commun
- Adresse : app.nextmotion.net, dans un navigateur à jour (Chrome, Edge ou Safari). Si l'affichage est décalé : zoom à 100 %. Astuce : mettre l'adresse en favori. Repère de bonne connexion : sa photo est visible en haut à droite.
- Chacun se connecte **avec son propre compte**, jamais celui du titulaire.
- Le titulaire vient de passer l'assistant de configuration : lis ce qui est fait (clinique, logo, TVA, signature, équipe) et ne le redemande pas ; dis-lui qu'il a déjà gagné ces étapes.
- Chaque nouvel utilisateur a le parcours de Jarvis pendant 30 jours (carte « Votre parcours de formation »). Ne le double pas.
- Rythme : une chose à la fois, séances courtes, fin de séance = un geste que la personne sait refaire seule dans les 48 heures. Ancre sur le quotidien : « Demain matin, quand votre premier patient arrive… ».

## Titulaire praticien (13)
| À faire PAR CLAUDE (configuration) | À suivre dans Tutos IA |
|---|---|
| Motifs de consultation, traitements et tarifs, consentements, modèles de documents : skill configurer-compte | [ordinateur] Faites le tour de la solution · Créez votre premier patient · Découvrir le nouveau dossier patient |
| Invitation de l'équipe (voir « Kit d'arrivée ») | [iPhone/iPad] Bienvenue : Nextmotion en 60 secondes · Premier lancement et première photo avant · Photo après et comparaison avant/après · Annoter une photo et reporter ses points d'injection |
| Vérifier un aperçu de document (logo, signature) | [iPhone/iPad] Faire signer un consentement et un document administratif · Du traitement au devis signé, puis à la facture et au paiement |
| | [ordinateur] ou [iPhone/iPad] Consult IA (« Consult IA : transcrire… » / « Consultation IA : laisser l'IA écouter… ») · [ordinateur] Explorer les statistiques et leurs trois points de vue (vue Docteur) |

Ordre de la boucle d'un praticien : photo, consultation, documents, devis puis facture. Praticien seul : maîtriser « créer un patient + faire un devis » avant stocks et statistiques.

## Médecin associé (10)
Son compte existe déjà (créé par le titulaire) et il a le parcours de Jarvis.
- [ordinateur] Découvrir le nouveau dossier patient · Consult IA (« Consult IA : transcrire… ») · Explorer les statistiques… (vue Docteur).
- [iPhone/iPad] les mêmes tutos de pratique que le titulaire (photo, consentement, devis signé, consultation IA).
- Claude fait : vérifier qu'il apparaît bien dans l'agenda et que l'accès à Consult IA est activé sur sa fiche collaborateur ; relire ses droits. Les changements de droits se font à l'écran (Paramètres > Collaborateurs).

## Secrétaire ou assistante (9 ou 11)
Elle prend en main un compte déjà configuré : le quotidien d'abord, pas le paramétrage.
- [ordinateur], dans l'ordre : Faites le tour de la solution · Créez votre premier patient · Découvrir et configurer le nouvel agenda · Créer un devis, le faire signer puis le transformer en facture · Consulter les appels et activer la téléphonie.
- Guides à la demande (à chercher avec `find_guide`) : Ajouter un patient et le rattacher à un praticien · Rechercher un patient depuis la liste des patients · Gérer les statuts de vos rendez-vous · Demander aux patients de confirmer leur rendez-vous.
- Visites de page utiles : La messagerie · Les leads · La conversion de vos devis.
- [iPhone/iPad] Écrire à vos patients par chat · L'Agenda : lire sa journée, bloquer un jour, prendre un rendez-vous · Leads : traiter une demande en une minute.
- Claude fait : rien à configurer. Aide à retrouver un patient ou un devis par les totaux et les chemins, sans recopier de noms (voir `shared/donnees-et-confidentialite.md`).
- Rôles : une assistante n'est pas administratrice. Lui donner le rôle Manager (administrateur, qui voit et modifie les réglages sensibles) est une **recommandation à confirmer avec le titulaire**, pas une règle.

## Manager (12)
Administrateur de la clinique : à réserver à quelqu'un de confiance. Ordre : statistiques (vue Manager) > conversion des devis > collaborateurs et droits > agenda de l'équipe > consommables > messages automatiques.
- [ordinateur] Explorer les statistiques et leurs trois points de vue · Découvrir et configurer le nouvel agenda · Consulter les appels et activer la téléphonie · Activer WhatsApp et paramétrer les messages automatiques ; visites de réglages (Vos collaborateurs, Vos consommables, Les messages aux patients) si le client les voit.
- [iPhone/iPad] Rapports : composer et lire votre tableau de bord · Configurer votre cabinet dans Paramètres.
- Claude fait : droits et collaborateurs (avec l'accord du titulaire), modèles de documents, communications automatiques.

## Gérant de plusieurs sites (clinique-témoin)
1. Former d'abord **une clinique-témoin** avec les tutos classiques (titulaire, assistante…), comme ci-dessus.
2. Montrer ensuite l'espace de groupe (« Multi-clinique », dans le sélecteur de clinique en bas de la barre de gauche) : réglages partagés, exports de tous les sites. Le détail est dans le skill multi-sites.
3. Dire clairement : les tutos et les visites de Jarvis se lancent **depuis une clinique**, pas depuis la vue de groupe. Pour les suivre, choisir une clinique avec « Changer de clinique ».
4. Distinguer le rôle dans une clinique (titulaire, Manager, praticien, assistante…) et le rôle dans le groupe (**Administrateur** ou **Regular**, libellé resté en anglais).

## Ancien utilisateur
Si la personne connaissait Nextmotion avant l'été, ou décrit des écrans ou des boutons que tu ne reconnais pas : invite-la d'abord à passer sur la nouvelle interface (app.nextmotion.net/?nm_app=2), puis propose les **6 guides « Je connaissais l'ancienne version »** (titres dans `references/outils-integres.md`, section 3). Ne décris jamais un écran de l'ancienne interface. Ne cite aucune date d'arrêt.

## Installer l'app iPhone / iPad et s'y connecter
Nom : « l'app Nextmotion » (fiche App Store : NM Capture), https://apps.apple.com/fr/app/nm-capture/id1540112534. Même nom partout.
1. Installer l'app. Prérequis : iPhone ou iPad sous iOS / iPadOS 26 minimum. Si l'iPad est trop ancien : « Utilisez Nextmotion dans le navigateur de l'iPad. »
2. Se connecter avec **le même e-mail et le même mot de passe que sur le web** (Face ID possible ensuite).
3. Mettre l'app à jour (6.9.17 ou plus récente) pour avoir les Tutos IA, la dictée et Consult IA ; 6.9.18 pour le parcours « ordinateur + iPhone ».
4. Onglet **Tutos IA** > « Commencez ici » (« Premier lancement et première photo avant »).
- **Jamais** de « mot de passe iPad du client » : ne le demande pas, ne le note nulle part, et dis au client de ne jamais communiquer son mot de passe, ni celui de l'iPad. Vérification utile : « Arrivez-vous à vous connecter à l'app sur l'iPad avec vos identifiants Nextmotion ? »
- **Android** : « L'application officielle est sur iPhone et iPad. Une première version Android existe mais n'est pas encore recommandée. » Ne la propose pas à l'installation.
- Compte « app photo seulement » (choix « Uniquement l'app photo NM Capture » dans l'assistant) : les deux étapes finales sont installer l'app et s'y connecter, puis suivre les Tutos IA de la section Photos et vidéos.

## Kit d'arrivée d'un collaborateur
Claude peut préparer l'arrivée, mais **créer le compte envoie aussitôt un e-mail d'invitation** de Nextmotion à la personne.
1. Demande : prénom, nom, e-mail (c'est son identifiant), rôle. Annonce : « La personne va recevoir un e-mail d'invitation de Nextmotion tout de suite. » Attends un OK explicite sur ces quatre éléments.
2. Vérifie les places restantes (`oapi_clinic_feature_list`) avant.
3. Crée avec `oapi_clinic_doctor_create` : `email` et `kind` requis (10 praticien, 9 secrétaire, 11 assistante, 12 Manager) ; `first_name` et `last_name` si l'e-mail n'existe pas encore ; `color` facultative. Pour une secrétaire, une assistante ou un Manager : `display_in_calendar_provider_view` à faux (sinon elle apparaît comme praticien dans l'agenda). Le RPPS va dans `id_no_1`.
4. **Jamais** de compte de type 13 (titulaire) par outil, ni de promotion vers ce type. Pour un Manager (12), demande d'abord la confirmation du titulaire. Changer un rôle plus tard : `oapi_doctor_update`, avec le même accord. Le type applique le jeu de droits du rôle ; seuls les ajustements fins se font à l'écran (Paramètres > Collaborateurs > clic sur le nom du rôle).
5. Remets au titulaire ce texte, adapté au rôle réel :
```
Kit de démarrage Nextmotion — <prénom>
Mon identifiant : mon e-mail   ·   Mon rôle : <rôle>
Ce que je vais voir en arrivant : une invitation par e-mail, un assistant de 2 minutes,
puis la bulle Jarvis (en bas à droite) qui me guide pendant mon premier mois.
Adresse de connexion : app.nextmotion.net (en favori dès maintenant).
Ce que je ferai chaque jour : 1. … 2. … 3. …   (à compléter avec le titulaire)
Pour apprendre à mon rythme : menu de ma photo > Tutos IA (ordinateur) et onglet Tutos IA de l'app iPhone.
En cas de blocage : la bouée Support en haut à droite, ou la bulle Jarvis.
```
6. Le nouvel arrivant retrouve ses tutos dans Tutos IA dès sa première connexion.

## Clôture : test de bout en bout et plan de la semaine
- **Avant de créer un patient d'essai**, regarde si le client en a déjà un (par exemple « Essai Photo », laissé par un tuto) : utilise-le au lieu d'en créer un autre.
- Si « Le parcours complet d'un patient, ordinateur + iPhone » est disponible et que le titulaire est d'accord, fais-en le test (ses précautions sont dans `references/outils-integres.md`). Sinon, patient « TEST » créé selon `shared/donnees-et-confidentialite.md`. Jamais de facture de test validée.
- **Point d'étape** (facultatif) : voir le skill (couche VALIDER).
- **Plan de la semaine** : 1. refaire seul, sur le patient d'essai, ce qui a été vu (48 h) ; 2. suivre « À faire ensuite » dans Tutos IA ; 3. traiter les premiers vrais patients ; 4. personnaliser consentements et modèles de devis ; 5. relancer le plugin vers le 15e jour avec « où j'en suis dans ma formation ? ». Parcourir les Nouveautés du mois.
- Si une réponse ne suffit pas : bouée Support > Nouveau ticket, puis « Réserver un appel support ». Pour une séance d'accompagnement, répondre à l'e-mail du conseiller Nextmotion reçu à l'arrivée (je ne peux pas la planifier).
