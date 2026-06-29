# Chemins UI débutant — Sections manuelles (sans outil MCP)

> Ces 8 sections ne peuvent pas être configurées via le MCP Nextmotion. Claude vous guide pas à pas dans l'interface. Toutes les autres sections sont gérées directement par Claude via le MCP.

**Comment repérer le menu de réglages :** dans Nextmotion, cherchez la **roue dentée ⚙️** en haut à droite de l'écran. C'est le point de départ de toutes les configurations manuelles.

---

## § 1 — Mon Profil (PIN / MFA / signature)

> Cette partie se règle à la main depuis votre profil personnel. Je vous guide.

📍 ⚙️ → **Mon compte** → **Mon profil**

- **Changer votre code PIN** : cliquez sur « Modifier le PIN », saisissez le nouveau code (4 à 6 chiffres), confirmez.
- **Activer l'authentification double facteur (MFA)** : cliquez sur « Sécurité » → « Activer la double authentification » → scannez le QR code avec une app type Google Authenticator.
- **Ajouter votre signature** : cliquez sur « Signature » → dessinez votre signature dans la zone prévue ou chargez une image PNG de votre signature → « Enregistrer ».

---

## § 2 — Ma Clinique (logo / TVA / RPPS / adresse)

> L'identité de votre clinique (nom, adresse, logo, numéro TVA) se modifie dans les réglages de la clinique. Le MCP peut la lire mais pas l'écrire — je vous guide dans l'interface.

📍 ⚙️ → **Ma clinique** → **Informations générales**

- **Logo** : cliquez sur l'image de logo (ou sur « Ajouter un logo ») → chargez un fichier PNG ou JPG (fond blanc recommandé, min 200×200 px) → « Enregistrer ».
- **Nom, adresse, téléphone** : modifiez les champs directement → « Enregistrer ».
- **Numéro TVA intracommunautaire** : champ « Numéro de TVA » → saisissez votre numéro (format FR12 123456789) → « Enregistrer ».
- **RPPS de la clinique** : champ « RPPS » → si vous ne connaissez pas ce numéro, voir le glossaire (§ RPPS) — vous pouvez laisser vide pour l'instant.

---

## § 9 — Ordonnancier

> La configuration de vos modèles d'ordonnances (papier à en-tête, signature, mentions légales) se fait manuellement. Je vous guide.

📍 ⚙️ → **Documents** → **Ordonnancier**

- Cliquez sur « + Ajouter un modèle d'ordonnance ».
- Remplissez les champs : titre du modèle (ex. « Ordonnance standard »), en-tête (votre nom, adresse, RPPS, n° d'Ordre).
- L'éditeur visuel (WYSIWYG) vous permet de formater le texte comme dans Word.
- Cliquez sur « Enregistrer » une fois satisfait(e).

> Tip : vous pouvez créer plusieurs modèles (ex. un pour les ordonnances médicales, un pour les prescriptions cosmétiques).

---

## § 12 — Codes promo

> La création et la gestion des codes de réduction se fait uniquement dans l'interface. Je vous guide.

📍 ⚙️ → **Finance** → **Codes promo**

- Cliquez sur « + Créer un code promo ».
- Remplissez les champs :
  - **Code** : le code que le patient saisira (ex. `WELCOME10`)
  - **Type de remise** : montant fixe (€) ou pourcentage (%)
  - **Valeur** : le montant ou pourcentage
  - **Date de validité** : facultatif — laisser vide si pas d'expiration
  - **Nombre d'utilisations max** : facultatif
- Cliquez sur « Créer ».

---

## § 17 — Configuration agenda (délais, auto-accept, durée par défaut)

> Les réglages fins de votre agenda en ligne (délai minimum avant RDV, acceptation automatique, durée par défaut des créneaux) se configurent dans l'interface. Je vous guide.

📍 ⚙️ → **Agenda** → **Configuration**

- **Délai minimum avant RDV** : délai minimum entre le moment où un patient prend RDV et le RDV lui-même. Ex. « 2 heures » = les patients ne peuvent pas réserver pour dans moins de 2 heures. Recommandation : 24h pour une première consultation.
- **Délai maximum avant RDV** : jusqu'à combien de jours à l'avance un patient peut réserver. Recommandation : 90 jours.
- **Acceptation automatique** : activez ou non. Si désactivé, vous devez valider manuellement chaque RDV reçu. Recommandation : activer si vous voulez gagner du temps.
- **Durée des créneaux par défaut** : durée minimale affichée en ligne. Recommandation : aligner sur votre motif de consultation le plus court (ex. 15 min).
- Cliquez sur « Enregistrer ».

---

## § 19 — Prépaiement Stripe

> La connexion à Stripe pour le prépaiement en ligne nécessite de passer par l'interface Nextmotion et de vous connecter à votre compte Stripe (ou d'en créer un). Je vous guide.

📍 ⚙️ → **Finance** → **Prépaiement en ligne**

- Cliquez sur « Connecter Stripe ».
- Vous serez redirigé(e) vers Stripe pour créer ou connecter votre compte.
- Suivez les étapes Stripe (identité, coordonnées bancaires, IBAN).
- Une fois connecté(e), revenez dans Nextmotion → activez le prépaiement → définissez le montant ou pourcentage de prépaiement.
- Cliquez sur « Enregistrer ».

> Note : Stripe prélève une commission sur chaque transaction. Vérifiez les tarifs Stripe avant d'activer.

---

## § 20 — Page RDV en ligne (publication)

> La publication de votre page de réservation en ligne est une **action publique** — les patients pourront réserver dès que vous cliquez sur « Publier ». Je vous guide, et je vous demanderai de confirmer avant de procéder.

📍 ⚙️ → **Agenda** → **Page de réservation en ligne**

- Vérifiez d'abord que tous les réglages sont corrects : plages de disponibilité, motifs de consultation, praticiens.
- **Personnaliser la page** : ajoutez une photo de couverture, un message d'accueil, les informations de votre clinique.
- **Tester la page** : cliquez sur « Aperçu » pour voir ce que verront les patients.
- **Code d'intégration** (embed code) : si vous avez un site web et voulez intégrer le bouton de RDV, copiez le code HTML fourni et transmettez-le à votre webmaster.
- **Publier** : cliquez sur « Publier la page » → confirmez. À partir de ce moment, les patients peuvent réserver en ligne.

> Assurez-vous d'avoir terminé la configuration des plages de disponibilité et des motifs de consultation (via MCP) avant de publier.

---

## § 22 — Champs custom patient

> Les champs personnalisés dans le dossier patient (ex. « Numéro de carte fidélité », « Référent », « Allergie spécifique ») se créent manuellement. Je vous guide.

📍 ⚙️ → **Patients** → **Champs personnalisés**

- Cliquez sur « + Ajouter un champ ».
- Choisissez le type de champ :
  - **Texte court** : pour une information courte (ex. un code, un nom)
  - **Texte long** : pour une note ou description
  - **Date** : pour une date (ex. date de premier traitement)
  - **Oui/Non** : pour une case à cocher
  - **Liste déroulante** : pour un choix parmi plusieurs options
- Donnez un nom clair au champ (ex. « Référent médecin »).
- Définissez si le champ est **obligatoire** ou facultatif.
- Cliquez sur « Enregistrer ».

> Ces champs apparaîtront dans chaque dossier patient et pourront être remplis lors des consultations.

---

## § 5 (L3) — Sous-motifs de consultation (niveau 3)

> Les niveaux L1, L2 **et L3** sont normalement créés directement par Claude via MCP (les sous-motifs en passant le tableau `sub_visit_types`). Ce guidage UI n'est qu'un **repli** si l'API est indisponible ou si vous préférez ajouter les sous-motifs à la main.

📍 ⚙️ → **Consultations** → *sélectionnez un motif L2* → **Sous-motifs**

- Cliquez sur le motif L2 dans la liste (ex. « Injection acide hyaluronique »).
- Dans la fiche du motif, cliquez sur l'onglet **Sous-motifs** ou sur « + Ajouter un sous-motif ».
- Donnez un nom au sous-motif (ex. « Lèvres », « Pommettes », « Sillons nasogéniens »).
- Définissez la durée spécifique si elle est différente du motif parent.
- Cliquez sur « Enregistrer ».
- Répétez pour chaque sous-motif.
