# Devis, factures et encaissements

Tout se passe sur [ordinateur] dans le dossier du patient, sauf mention. Chaque soin est une **ligne** ; les colonnes
**Devis** et **Facture** y portent une pastille colorée. Un cadenas sur la colonne Facture = module facturation hors offre.
Tu **guides** : valider, encaisser, rembourser, faire un avoir ou faire signer sont des actes du client
(`shared/donnees-et-confidentialite.md`).

## Les couleurs
| Facture | Sens | | Devis | Sens |
|---|---|---|---|---|
| bleu | provisoire (brouillon) | | bleu | brouillon, modifiable |
| orange | validée, **en attente de règlement** | | orange | validé, **en attente de la réponse** du patient |
| violet | facture d'acompte (partiellement réglée) | | vert | accepté (ou déjà facturé) |
| vert | réglée | | rouge | refusé |
| rouge | neutralisée | | | |
Un petit symbole signature sur la pastille Facture = signée par le patient. Pour une facture, l'orange ne veut plus dire
« attente de signature » mais « attente de règlement ».

## Faire un devis, puis le faire signer
1. Ligne de traitement → colonne **Devis** → **« + »** → **« Créer un devis »**.
2. Choisissez le modèle de devis (celui du praticien est proposé), répondez aux questions, ouvrez « Paramètres du devis » si besoin
   (« Ajouter un code promo », « Afficher le texte libre et les notes internes », « Retirer tarifs sécu », « Ajouter au parcours
   patient »). Les « Blocs de texte prédéfinis » (menu entonnoir) ajoutent des paragraphes que vous pouvez retoucher pour ce devis.
3. Puis le choix : **« Générer un devis »** (il passe en orange, non modifiable), ou **« Proposer (devis modifiable) »** /
   **« Enregistrer le brouillon »** pour garder un brouillon bleu.
4. Le devis orange attend la réponse. Menu de la pastille : Prévisualiser, Voir Pdf, Télécharger le Docx, **Envoyer par mail**,
   Envoyer à un correspondant, puis les trois façons d'obtenir la signature :
   - **« Accepter »** : le patient signe à l'écran, devant vous [ordinateur] ou [iPhone/iPad] (`references/app-iphone-ipad.md`) ;
   - **« Envoyer en signature »** : le patient reçoit un **e-mail** ; il se connecte à son portail patient pour lire et signer, quand il veut, de chez lui.
     Chaque envoi utilise **1 crédit de signature** (500 sont inclus chaque mois). S'il n'a pas d'adresse, l'écran demande
     d'abord d'en ajouter une. Ensuite la pastille propose **« Demande de signature »** : statut, « Renvoyer l'invitation »,
     « Annuler la demande » ;
   - **« Importer devis signé »** : un devis signé sur papier, scanné.
   Le patient peut aussi signer son devis, puis ses consentements, directement dans son portail (`references/portail-patient.md`).
5. Devis signé → pastille **verte**. « Refuser » le passe en rouge. « Editer les notes » ajoute une note au devis.
- Menu d'un brouillon : Modifier le devis, Supprimer le devis, Signer le brouillon de devis.
- **Suivre et relancer ses devis** : barre de gauche → **Conversion des devis** : les devis en cours, la prochaine étape, « Envoyer un rappel »
  (e-mail avec lien de signature, 1 crédit de signature par envoi), « Ajouter une note », filtre « Prochaine étape dépassée uniquement ».
- **Sur l'iPhone/iPad** les mêmes actions ont d'autres noms : « Générer un devis » (web) = « Confirmer » ; la signature finale = « Accepter ».
- Un délai de réflexion entre devis et acte : pratique courante, à valider avec votre assurance ou votre Ordre. Ne donne aucune durée.

## Facturer
Colonne **Facture** → **« + »** : 
- **« Valider »** : crée la **facture provisoire** (bleue, fenêtre « Facture provisoire »). Puis **« Entrer un règlement provisoire »**
  pour noter l'encaissement tout de suite.
- **« Créer la facture finale »** : reprend le devis signé (remises, extras et quantités sont conservés).
- **« Facture d'acompte »** : voir plus bas.
Une facture provisoire n'entre pas en comptabilité. Seules les provisoires se **suppriment** ; une facture validée se corrige par un avoir.
La numérotation est automatique : ne créez de factures définitives que volontairement.

### Facture provisoire : l'assistante prépare, le médecin valide
1. Assistante : colonne Facture → « + » → « Valider » (crée la provisoire) → « Entrer un règlement provisoire » (montant, moyen de paiement).
2. Médecin, en fin de journée : roue **Paramètres → Comptabilité → Factures**, filtre **Émetteur** + date ; la pastille bleue → **« Valider »**
   après avoir vérifié montant et moyen de paiement.
Il n'y a pas d'icône drapeau ni de petit œil : tout passe par ces onglets.

### Encaisser, en une ou plusieurs fois
- Fenêtre **« Paiement de la facture »** : un ou plusieurs moyens de paiement avec leurs montants, ligne « Restant ».
  **« Paiement différé »** : indiquez la date (utile pour un chèque ; le comptable s'en sert). Un **code cadeau** se saisit sur chaque ligne de paiement.
  Un **code promo** se met sur le devis ou la facture (« Ajouter un code promo »).
- **Paiement partiel** : l'écran prévient « une facture d'acompte sera créée ».
- **Acompte** : colonne Facture → « + » → **« Facture d'acompte »** → saisissez le montant. Pastille **violette**. Versements suivants :
  pastille violette → **« Régler »**. Quand tout est payé : **« Créer la facture finale »** → pastille **verte**.
  « Ajouter un acompte en brouillon » existe dans le menu d'une facture validée.
- **Impayés, acomptes, bons cadeaux** : carte patient → « Voir les informations administratives » : fenêtres « Impayés », « Acomptes »,
  « Bon cadeaux » (générer, modifier, envoyer par e-mail). Un patient peut avoir un « A rembourser ».

## Corriger ou annuler
| Situation | Geste |
|---|---|
| Facture **provisoire** | Menu de la pastille → « Supprimer la facture » |
| Facture **validée**, pas encore réglée | l'encaisser (« Régler ») ou faire un avoir |
| Facture **réglée**, erreur de paiement | « Modifier l'encaissement » (changer un paiement) ou « Annuler l'encaissement » (elle redevient « Validée ») |
| Facture réglée à reprendre | colonne **Avoir** → « Faire un avoir » |
| Remboursement encore dû | menu de l'avoir → **« Rembourser »** (onglet Avoirs de la comptabilité aussi) |

## Autres gestes sur une facture
- **Refacturer un soin récurrent** : pastille d'une facture **réglée** (verte) → **« Dupliquer la facture »** : les lignes sont
  recopiées à la date du jour et « Créer la facture finale » s'ouvre. Le bouton **« Dupliquer »** de la barre de sélection fait pareil
  (une seule ligne à facture réglée sélectionnée). Pas pour les lignes de forfait. Sur l'iPhone (app 6.9.17 ou plus) : même idée sur une ligne payée.
- **Faire signer le patient** : menu de la pastille → **« Faire signer le patient »** (fenêtre « Signer la facture », tablette tendue au
  patient). N'apparaît que si le modèle de facture contient un champ de signature patient (réglage de modèle : mode configuration).
- **Envoyer** : Prévisualiser, Télécharger le PDF / le DOCX, Envoyer par e-mail, Envoyer à un correspondant.

## Retrouver et exporter
- **Comptabilité** : roue **Paramètres → Comptabilité**. Onglets Factures, Règlements, Devis, Avoirs, Répartition des honoraires,
  Moyens de paiement, Codes promo, Entité de facturation. Chaque liste a recherche et filtres (Émetteur, Modèle de document, Type de
  traitement, Moyens de paiements, Etat de la facture…). Détail des chiffres : `references/tableaux-de-bord.md`.
- **Export pour le comptable** : onglet Factures (ou Règlements) → filtrez la période → **« Exporter »** : « Télécharger les PDF »
  (toutes les factures, en zip), « Télécharger le récapitulatif (PDF) », « Télécharger l'Excel », « Télécharger l'Excel + ».
  Un export mensuel est une bonne habitude. Plusieurs cabinets : Paramètres → Rapports (`references/tableaux-de-bord.md`).
- L'interrupteur « Partagez automatiquement les documents comptables avec vos patients » est en haut de la page Comptabilité.
- **Répartition des honoraires** : onglet du même nom (quelle part pour la clinique, quelle part pour le praticien) ; l'Émetteur filtre
  par praticien. Pour la TVA et les règles fiscales, renvoyez au comptable : tu n'affirmes rien.
- **Tarifs des soins** (les « actes ») : Paramètres → **Mes traitements** → ajouter un traitement et son prix (mode configuration).

## Tutos et guides à nommer (titres à confirmer avec `find_guide`)
Tutos IA : « Créer un devis, le faire signer puis le transformer en facture » (ordinateur) · « Du traitement au devis signé, puis à la facture
et au paiement » (iPhone). Guides Jarvis : « Créer un devis depuis le dossier patient » · « Ajouter des blocs de texte prédéfinis à un devis » ·
« Appliquer un code promo sur une facture » · « Émettre un avoir et rembourser le patient depuis sa facture » · « Exporter les factures d'un mois en
PDF ou en Excel » · « Dupliquer une facture payée pour un soin récurrent » · « Faire signer une facture au patient » · « Partager automatiquement les
documents comptables avec vos patients ».
