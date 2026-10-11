# Outils de formation intégrés à Nextmotion

Tout ce qui est ici existe déjà dans l'application. Le rôle de Claude : **nommer le bon tuto, dire où le lancer, puis compléter**. Claude ne lance rien à la place du client (aucun outil ne le permet) : il recherche le titre exact avec `find_guide` (lecture seule) et dit « allez dans Tutos IA, lancez « <titre> » ».

## Règles d'annonce
- N'annonce un tuto que si l'option qu'il demande est active (lecture unique de `oapi_clinic_feature_list`, correspondance avec les noms d'options dans `shared/options-et-credits.md`). Si la lecture échoue ou si le client ne voit pas la ligne : « Que voyez-vous dans Tutos IA ? » et suis ce qu'il voit.
- Phrase type : « Dans Tutos IA, lancez « Créez votre premier patient » : Jarvis vous montre où cliquer, ça prend 3 minutes. »
- Un tuto d'essai crée un patient « Essai Photo » (ou un patient d'essai) : prévenir que le client peut le supprimer à la fin, lui-même.
- L'avancement d'un tuto est gardé dans le navigateur : en changer peut le remettre à zéro. Ne promets aucun suivi centralisé. « À faire ensuite » (dans Tutos IA) propose le prochain tuto.
- Une ligne grisée avec un cadenas = fonction non incluse dans l'offre : ne pas la proposer (voir `shared/options-et-credits.md`).

## Où le trouver
- **Ordinateur** : le menu de votre photo (en haut à droite) > **Tutos IA** (pastille « Nouveau » jusqu'à la première ouverture). Rubrique « Commencez ici » en tête, « À faire ensuite » ensuite, « Tutoriels vidéo » en bas.
- **iPhone / iPad** : app Nextmotion > onglet **Tutos IA** (en bas). Il faut l'app en version 6.9.17 ou plus récente ; sinon : « Mettez à jour l'app Nextmotion depuis l'App Store. » (iOS / iPadOS 26 minimum.)
- **Jarvis** : la bulle en bas à droite. Il répond aux questions, propose des guides et s'ouvre de lui-même pendant le premier mois de chaque utilisateur.

## Sur quel appareil (à indiquer à chaque étape : [ordinateur] ou [iPhone/iPad])
| Geste | Appareil |
|---|---|
| Configurer, paramétrer, devis, factures, statistiques, agenda de l'équipe, appels, WhatsApp | [ordinateur] |
| Photo avant/après, annoter, vidéo, portfolio | [iPhone/iPad] |
| Signature en présentiel (devis, consentement, document administratif) | [iPhone/iPad] (ou fenêtre de signature sur l'ordinateur) |
| Consultation sur le terrain, dictée, Consult IA | [iPhone/iPad] (Consult IA aussi sur ordinateur) |
| Praticien : commencer par l'iPhone. Secrétaire / assistante : commencer par l'ordinateur. | |

## 1. Tutos IA sur ordinateur (33)
Départ conseillé : « Le parcours complet d'un patient, ordinateur + iPhone » s'il est affiché, sinon « Faites le tour de la solution ». « À faire ensuite » suit cet ordre : parcours complet, tour de la solution, premier patient, agenda, devis-facture, Consult IA, dossier patient, liste des patients, statistiques, appels, WhatsApp, conversion des devis, messagerie, leads, consommables, réglages.

### Guides pas à pas (10) : Jarvis montre l'écran, anneau lumineux sur chaque clic
| Titre exact | Durée | Option requise |
|---|---|---|
| Faites le tour de la solution | 5 min | aucune |
| Créez votre premier patient | 3 min | aucune |
| Découvrir la nouvelle interface depuis la liste des patients | 3 min | aucune |
| Découvrir le nouveau dossier patient | 7 min | aucune |
| Découvrir et configurer le nouvel agenda | 6 min | Agenda en ligne + droit agenda |
| Créer un devis, le faire signer puis le transformer en facture | 5 min | Consult Digital |
| Consult IA : transcrire une consultation et remplir le dossier | 4 min | Copilot IA |
| Explorer les statistiques et leurs trois points de vue | 5 min | aucune |
| Activer WhatsApp et paramétrer les messages automatiques | 3 min | WhatsApp inclus |
| Consulter les appels et activer la téléphonie | 3 min | aucune |

### Parcours hybride (1)
**Le parcours complet d'un patient, ordinateur + iPhone** (20 min, Capture + Consult Digital) : commence sur l'ordinateur, le client scanne un QR code avec l'iPhone, et les deux écrans avancent ensemble (patient, photo, consultation, devis signé, facture, paiement).
Précautions à dire avant : il crée un vrai patient d'essai et une vraie facture numérotée, annulée ensuite par un avoir (ces numéros sont consommés). Ne le propose sur un compte réel qu'avec l'accord explicite du titulaire. Il peut servir de test de bout en bout (voir `references/parcours-par-role.md`, « Clôture »).

### Visites de page (22) : « Découvrir cette page », 1 minute chacune
Jarvis présente l'écran où se trouve le client. Lancement : bulle Jarvis > « Découvrir cette page », ou la ligne « Visite » de Tutos IA. Sur un écran vide : « Voir avec des exemples » (données fictives, rien n'est enregistré).
- **Au quotidien** : La conversion de vos devis · La messagerie · Les leads · Vos consommables.
- **Réglages** (Paramètres) : Les réglages de l'agenda · Votre catalogue de traitements · Vos modèles de documents · La comptabilité · Vos collaborateurs · Vos modèles d'ordonnance · Le studio de visite · La téléphonie et l'agent vocal · Le centre d'intégration · Les réglages de l'IA · Les messages aux patients · Les informations patient · Le questionnaire d'antécédents · Les étiquettes de vos médias · Le parrainage · Les correspondants · Votre compte · Votre serveur privé.
- D'autres visites (tableaux de bord, patients, dossier patient, agenda, rendez-vous, appels) se lancent depuis la page concernée avec « Découvrir cette page ».
- Une visite qui ne démarre pas : « Réessayez depuis Jarvis > Découvrir cette page ».

## 2. Tutos IA sur iPhone / iPad (16)
| Groupe | Titre exact | Durée | Option requise |
|---|---|---|---|
| Premier lancement | Premier lancement et première photo avant | 3 min | Capture |
| Découverte | Bienvenue : Nextmotion en 60 secondes | 1 min | aucune |
| Photos et vidéos | Photo après et comparaison avant/après | 4 min | Capture |
| | Vidéos dynamiques avant/après et montage vidéo | 5 min | Capture |
| | Annoter une photo et reporter ses points d'injection | 2,5 min | Capture |
| | Le Portfolio : retrouver et montrer vos meilleurs avant/après | 1,5 min | Capture |
| Consultation | Faire signer un consentement et un document administratif | 5 min | Consult Digital |
| | Du traitement au devis signé, puis à la facture et au paiement | 5 min | Consult Digital |
| | Consultation IA : laisser l'IA écouter et remplir le dossier | 3 min | Copilot IA |
| | Dessiner, écrire une note, faire une prescription, remplir un document administratif | 6 min | aucune |
| Relation patient | Écrire à vos patients par chat | 3 min | Messagerie |
| | Demander un avis Google (« Demande d'évaluation positive ») | 1 min | Avis Google inclus |
| Agenda et rapports | L'Agenda : lire sa journée, bloquer un jour, prendre un rendez-vous | 4 min | Agenda en ligne |
| | Rapports : composer et lire votre tableau de bord | 3 min | aucune |
| | Leads : traiter une demande en une minute | 3 min | aucune |
| Mon cabinet | Configurer votre cabinet dans Paramètres | 4,5 min | aucune |

## 3. Jarvis : guides et parcours des 30 premiers jours
Pendant son premier mois, chaque utilisateur voit dans Jarvis la carte **« Votre parcours de formation »** et la pastille « Formation : n guides terminés sur N ». « Ne plus afficher » la masque. Ne refais pas ce parcours à sa place : branche-toi dessus (« Où en êtes-vous dans le parcours de Jarvis ? »). Passé 30 jours, les guides restent atteignables par Tutos IA ou en posant la question à Jarvis.

**Parcours d'accueil (nouveau compte), dans l'ordre** : Faites le tour de la solution · Créez votre premier patient · Découvrir et configurer le nouvel agenda · Créer un devis, le faire signer puis le transformer en facture depuis la fiche patient · Utiliser Copilot IA pour transcrire une consultation et remplir automatiquement le dossier patient · Explorer l'onglet statistiques et ses trois points de vue · Activer WhatsApp et paramétrer les messages automatiques · Consulter les appels et activer la téléphonie.

**« Je connaissais l'ancienne version » (6 guides)** : Découvrir la nouvelle interface depuis la liste des patients · Découvrir le nouveau dossier patient · Découvrir et configurer le nouvel agenda · Explorer l'onglet statistiques et ses trois points de vue · Consulter les appels et activer la téléphonie · Activer WhatsApp et paramétrer les messages automatiques.

**Autres guides, à la demande** (le catalogue évolue : cherche avec `find_guide`) : patients (ajouter un patient et le rattacher à un praticien, rechercher, exporter la liste, dicter au lieu de taper, rédiger une ordonnance avec ⌘K) · agenda (par salle, statuts des rendez-vous, confirmation par les patients) · devis et factures (blocs de texte, code promo, avoir, export du mois) · SMS (recharger, suivre la consommation) · réglages (consentement éclairé, ordonnances types liées à un soin).

## 4. Autres repères
- **Nouveautés** : menu de la photo > Nouveautés (pastille rouge quand il y a du neuf). « Pour savoir ce qui a changé, ouvrez Nouveautés. » En fin de parcours, propose de parcourir celles du mois ; ne cite aucune nouveauté précise (elles changent chaque semaine).
- **Support** : bouée « Support » en haut à droite > « Nouveau ticket » ; si une réponse ne suffit pas, « Réserver un appel support ». Jarvis répond tout de suite aux questions d'usage. Claude ne crée pas de ticket.
- **Assistant de configuration** (première connexion du titulaire, environ 3 minutes) : pose l'essentiel (clinique, logo, TVA, signature, certification NF525, équipe, application) puis envoie vers Claude pour le reste. Un invité passe par un chemin court (2 minutes). Lire ce qui est fait avant de redemander.
- **Plugin Claude** : Paramètres > Centre d'intégration > Plugin Claude (guide d'installation et vidéos).

## 5. Si ça bloque
| Symptôme | Réponse |
|---|---|
| « Je ne vois pas Tutos IA » | Menu de la photo (en haut à droite), pas dans la barre de gauche. Sinon actualiser la page. |
| Une visite ou un guide ne démarre pas | Réessayer depuis Jarvis > « Découvrir cette page » ; vérifier que la page est bien celle du tuto. |
| Jarvis a disparu | Il est dans la bulle en bas à droite ; « Ne plus afficher » ne masque que la carte de formation. |
| Pas d'onglet Tutos IA sur l'iPhone | Mettre à jour l'app (version 6.9.17 ou plus) ; iOS / iPadOS 26 minimum. |
| La progression est repartie à zéro | Elle est gardée dans le navigateur : même navigateur, même appareil. |
| Affichage décalé | Zoom du navigateur à 100 % ; navigateur à jour (Chrome, Edge ou Safari). |
| Micro muet | Autoriser le micro dans le navigateur pour app.nextmotion.net. |
| Logo absent des documents | Ré-importer un PNG à fond transparent (voir le skill configurer-compte). |
