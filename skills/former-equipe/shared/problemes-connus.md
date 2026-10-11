# Problèmes connus et pannes — quoi faire, sans jamais montrer d'erreur technique

> À charger dès qu'un outil échoue ou qu'un client décrit une panne. Ton et règles générales : `shared/regles-communes.md`.
> Options et crédits (SMS, minutes, signatures, stockage) : `shared/options-et-credits.md`. Données : `shared/donnees-et-confidentialite.md`.

## 1. La règle générale : une lecture qui échoue ne bloque jamais
1. **Tu n'affiches jamais l'erreur technique.** Sont interdits en sortie : « erreur de validation », « serializer », « schéma »,
   « null », « 400 », « 500 », « endpoint », « API », « JSON », et les noms d'outils `oapi_…`.
2. Tu **traduis** en une phrase simple, ou tu n'en parles pas et tu passes par un autre chemin. Exemple :
   « Je n'arrive pas à relire la liste de vos motifs pour l'instant, c'est un petit souci côté Nextmotion, sans gravité. Ça ne
   nous empêche pas d'avancer : dites-moi simplement… et je continue. »
3. Tu **appliques un repli** : une autre lecture, ou une question simple au client (« Combien de praticiens ? Voyez-vous l'Agenda
   dans votre menu ? »), ou tu poursuis l'écriture et tu vérifies autrement (le client regarde l'écran, tu relis plus tard).
4. Tu **continues le parcours.** Une lecture indisponible ne bloque jamais une écriture.
5. Tu **re-testes** avant de conclure : un incident est souvent passager. Ne décide jamais « c'est cassé » une fois pour toutes.
6. Une écriture qui échoue : « Je n'ai pas réussi à enregistrer ça du premier coup. » Réessaie **une fois** proprement ; si cela
   persiste, propose le chemin à l'écran (`shared/chemins-doctor-portal.md`) ou la bouée **Support & tickets**.

## 2. Les cas à connaître
| Ce qui se passe | Ce que tu fais |
|---|---|
| **La liste des cliniques ne se charge pas** du premier coup | Réessaie **une fois** (cherche « clinics »). Sinon demande l'identifiant : il n'est plus dans l'adresse ; il est dans le menu de l'**avatar** (en haut à droite), sous le nom de la clinique, avec un bouton pour le copier. |
| **La base d'aide (`search_knowledge_base`) ne répond pas** ou ne trouve rien | N'affiche pas l'erreur, ne réponds pas de mémoire. Réponds avec les fichiers du skill (`shared/chemins-doctor-portal.md`, `references/…`) et propose la bouée **Support & tickets** ou de demander à Jarvis. Quand elle répond, reformule les extraits sans citer de lien. |
| **Accès refusé** à une écriture | Ce n'est pas une panne : « Votre profil n'a pas ce droit. Demandez au propriétaire du compte. » (Paramètres › Collaborateurs › Modifier › Autorisations). Ne propose plus ces écritures à un secrétaire ou assistant. |
| **Le connecteur refuse l'accès** (après le premier mois) | Explique simplement, sans prix : « L'accès de Claude à votre compte n'est plus ouvert sur votre offre. Parlez-en à votre conseiller Nextmotion, ou activez l'option « API & automatisations » (le propriétaire clique sur la fonction grisée dans Paramètres › Centre d'intégration). » Voir `shared/regles-communes.md` § 11. |
| **« Plus de siège libre »** (ajout d'un collaborateur) | « Votre offre n'a plus de siège libre : vous pouvez en ajouter un ou passer à l'offre supérieure. » |
| **Un outil n'est pas trouvé** | Une seule recherche, puis un synonyme une fois, puis contourne ou explique ce que tu ne peux pas faire, sans jargon. Jamais de boucle. |
| **Documents : la liste des modèles est vide** (ou « aucun modèle de document ») | L'assistant de démarrage n'a pas été terminé. Crée d'abord le devis et la facture (puis les autres types), à partir de la liste officielle des champs automatiques. |
| **La génération d'un consentement est refusée** | Une ligne de tarif n'a pas de consentement relié. Vérifie que chaque tarif qui en demande un en a un (Paramètres › Mes traitements › Liste › colonne « Consentement »). |
| **Un consentement ou une bolt note s'enregistre mal** | Donne un identifiant à chaque question (UUID) et des types de questions de 1 à 7 ; vérifie que le texte du document n'est pas vide. |
| **Produit absent du catalogue** | On ne peut pas en créer un « libre » : dis-le au client et renvoie-le vers la bouée Support & tickets. |
| **Doctolib : agendas vides** | Vérifie : une spécialité sur chaque catégorie de motifs, des visites dans chaque sous-catégorie, les types de visite attribués aux praticiens (Paramètres › Agenda › Praticiens). Toute modification part tout de suite vers Doctolib quand la passerelle est active. |
| **Une fonction annoncée n'apparaît pas** | Soit elle est grisée avec un cadenas (hors offre, voir `shared/regles-communes.md` § 9), soit elle n'est pas encore ouverte sur ce compte : ne promets rien, renvoie vers le conseiller. |

## 3. IA : Consult IA, dictée, Nextmotion Local
Le micro n'est presque jamais la cause d'une panne de Consult IA. Ordre des vérifications (détail dans le skill Consult IA) :
1. Lire le **message affiché sous la transcription** et le redire en français simple ;
2. vérifier le **compteur de minutes** (infobulle près de « Ouvrir Copilot IA ») ;
3. recharger la page ;
4. choisir le bon micro dans le menu « Micro » du Copilot ;
5. cadenas du navigateur (autoriser le micro) ;
6. une autre application occupe le micro ;
7. le réseau ;
8. en dernier, la bouée Support & tickets.
Navigateurs : Chrome recommandé ; Edge et Safari fonctionnent.

| Symptôme | Cause et réponse |
|---|---|
| **Consult IA sur iPad ou iPhone « tourne » mais rien n'est enregistré à l'arrêt** | L'app est trop ancienne. Vérifier la version (Réglages de l'iPhone › Général › Stockage de l'iPhone › Nextmotion, ou l'App Store) et **mettre à jour** (la dernière version est l'idéal ; la version 6.9.13 est un minimum pour Consult IA, la 6.9.17 pour la dictée de la note). Il faut iOS ou iPadOS 26. Si l'appareil est trop ancien : utiliser Nextmotion dans le navigateur de l'ordinateur ou de l'iPad. N'en dis pas plus sur la cause. |
| **Nextmotion Local « Hors ligne » ou « En attente de la première connexion »** | 1) Lire la pastille dans Paramètres › IA ; 2) le Mac est allumé, branché, connecté, pas en veille ni éteint à heure fixe ; 3) le menu « Nextmotion Local » de la barre de menus du Mac indique « Prêt » ; 4) si le réseau du cabinet filtre, autoriser la sortie UDP 51820 ; 5) le modèle d'IA est peut-être encore en téléchargement ; 6) attendre environ 2 minutes ; 7) en dernier recours « Retirer cet ordinateur » puis relancer l'installateur. Tant que le Mac est hors ligne, l'IA est arrêtée : proposer de repasser provisoirement sur **« Dans le cloud »**. |
| **Plus de minutes** | « Plus de minutes Copilot IA : contactez Nextmotion pour recharger. » (voir `shared/options-et-credits.md`). |
| **Consult IA « n'est pas activé pour vous »** (iPhone) | Interrupteur « Consult AI » de la fiche du collaborateur (Paramètres › Collaborateurs › Modifier) ou réglage de la clinique dans Paramètres › IA. |
| **Réponse de l'IA fausse ou incomplète** | L'IA peut se tromper : le client relit et corrige avant de valider. |

## 4. Application iPhone / iPad et portail
| Ce qui se passe | Ce que tu dis |
|---|---|
| **« Où trouver l'app ? »** | Dans l'App Store, **« NM Capture »** (https://apps.apple.com/fr/app/nm-capture/id1540112534) ; une fois installée, elle s'appelle Nextmotion à l'écran. iOS ou iPadOS 26 au minimum. Se connecter avec le même e-mail et le même mot de passe que sur le web. |
| **Android** | « L'application officielle est sur iPhone et iPad. Une première version Android existe mais n'est pas encore recommandée. » Ne la propose pas à l'installation. |
| **3D, Magic Mirror** | C'est une autre application, **Nextmotion 3D**, pas NM Capture. Aucune information de prix. |
| **Les Rapports de l'iPhone montrent des chiffres alors que « Tableau de bord » est décoché** | C'est connu : sur l'iPhone, les rapports restent visibles même si l'autorisation « Tableau de bord » est retirée. Ne dis pas à un client qu'en décochant cette case il cache ses chiffres sur l'iPhone ; si la confidentialité des chiffres compte, préviens-le et note-le. |
| **Le patient n'arrive pas à entrer dans son portail** | Voir le skill d'aide au quotidien (renvoyer le lien d'invitation ou de connexion depuis le menu ⋮ du dossier). |
| **L'abonnement est géré dans l'App Store** | Voir `shared/options-et-credits.md` (abonnement payé via l'App Store). |

## 5. À ne pas annoncer
- La signature automatique sur « l'iPad associé au poste » n'est pas disponible : ne la présente pas.
- Ne promets jamais l'import automatique de patients depuis un autre logiciel : tu sais créer des fiches à partir d'une liste
  fournie par le client, dans le cadre de `shared/donnees-et-confidentialite.md`.
- Ne promets ni date de livraison, ni nouveauté à venir, ni geste commercial.
