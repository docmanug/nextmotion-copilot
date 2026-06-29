# Playbook Usage — Base de connaissance how-to (client-safe)

> Distillé depuis le playbook CSM NextMotion (build-time). Contenu : how-to, setup, troubleshooting.  
> Filtre appliqué : aucune information commerciale/interne, aucun code patient interne.  
> Consommé par : `references/aide-usage.md`.

---

## Rôles Owner vs Manager

**Quand :** Au moment de configurer les comptes de l'équipe pour la première fois, ou si l'accès d'un collaborateur semble trop large ou trop restreint.

**Comment faire / résoudre :**
- Il existe trois niveaux de rôle : **Owner** (accès total, non modifiable après coup), **Manager** (accès large), et **Praticien/Docteur** (accès centré sur la pratique médicale).
- Le **Owner** doit être la personne qui a les droits les plus larges (généralement le gérant ou responsable du cabinet). Une fois le compte Owner créé, ses permissions ne peuvent plus être restreintes.
- Définir les rôles **avant** de créer les comptes : demandez « qui doit avoir les accès les plus larges ? ».
- Ne jamais changer le rôle Owner en live — si une erreur se produit, notez-la et corrigez après la session via le support technique.
- Si un médecin n'apparaît pas dans le menu déroulant du dossier patient → vérifier ses permissions dans l'onglet Collaborateurs.
- **Erreur à éviter :** attribuer le rôle Owner à un compte temporaire ou test.

---

## Association médecin / assistante (setup et troubleshooting)

**Quand :** Dès qu'un cabinet a du personnel soignant ou administratif (assistante, secrétaire) qui crée des dossiers patients.

**Comment faire / résoudre :**

**Setup normal :**
- Chaque dossier patient **doit** être associé à un médecin dans le champ « Praticien » avant de créer la première ligne de traitement.
- Sur le compte du médecin, l'association est automatique. Sur le compte de l'assistante, elle doit être faite manuellement à chaque nouveau dossier.
- Règle à ancrer au cabinet : l'assistante associe toujours le médecin dès la création du dossier.

**Troubleshooting — « bug fantôme » :**
- **Symptômes :** le questionnaire antécédents n'apparaît pas dans le dossier, le nom du médecin ne s'affiche pas, la facturation ne fonctionne pas correctement.
- **Diagnostic :** ouvrir le dossier patient → vérifier le champ « Praticien ». S'il est vide ou affiche l'assistante, c'est la cause.
- **Solution :** associer le médecin dans le champ Praticien → rafraîchir → le questionnaire réapparaît.
- Sur la ligne de traitement, vérifier aussi que le champ Praticien est bien renseigné.

---

## IA vocale / dictée — micro qui ne fonctionne pas

**Quand :** Vous cliquez sur le micro dans NextMotion et rien ne se passe, ou un message d'erreur apparaît.

**Comment faire / résoudre :**

1. **Vérifier les permissions Chrome** : cliquez sur l'icône cadenas à gauche de l'URL → « Microphone » doit être sur « Autoriser » (pas « Bloquer »). Rechargez la page ensuite.
2. **Vérifier les permissions système** :
   - Windows : Paramètres > Confidentialité > Microphone → activer l'accès + vérifier que Chrome est autorisé.
   - Mac : Préférences Système > Sécurité et confidentialité > Confidentialité > Micro → cocher Chrome.
3. **Tester le micro** : allez sur « mictests.com » dans Chrome pour vérifier que le périphérique fonctionne.
4. **Sélectionner le bon micro** : Chrome > Paramètres > Confidentialité > Paramètres de site > Micro → choisir le bon périphérique dans la liste.
5. **Causes moins fréquentes** : extension Chrome bloquante (désactiver les extensions une par une), URL en http au lieu de https, pilote audio obsolète, antivirus bloquant.
6. **En attendant la résolution :** vous pouvez rédiger vos comptes-rendus au clavier, l'IA de suggestion de texte fonctionne indépendamment du micro.

---

## Academy NextMotion — Bloqué ou inaccessible

**Quand :** Vous êtes bloqué sur une étape de l'Academy, une vidéo ne se lance pas, ou votre progression n'est pas enregistrée.

**Comment faire / résoudre :**

| Symptôme | Cause probable | Solution |
|----------|---------------|---------|
| Vidéo ne se lance pas | Navigateur incompatible ou bloqueur de publicité | Passer sur Chrome, désactiver AdBlock |
| Étape marquée « non complétée » | Bug de synchronisation | Vider le cache, relancer |
| Quiz impossible à valider | Réponses mal enregistrées | Recommencer le quiz depuis le début |
| Progression à 0% | Session expirée | Se déconnecter puis reconnecter |
| Certificat non généré | Toutes les étapes pas validées | Vérifier chaque étape une par une |

**Alternative immédiate :** les vidéos tutorielles sont aussi accessibles directement dans le logiciel via l'icône « télé » (rectangle bleu) à côté de chaque section — elles couvrent les mêmes sujets sans passer par l'Academy. Elles sont idéales pour former le staff en autonomie entre les sessions.

**Accès Academy :** cliquez sur l'icône Academy depuis le logiciel → parcours disponibles avec suivi de progression. Rythme recommandé : 1 module par semaine (15-20 min), idéalement entre deux patients.

---

## BoltNotes / Raccourcis de consultation

**Quand :** Vous rédigez des comptes-rendus de consultation et souhaitez gagner du temps avec des modèles de texte réutilisables.

**Comment faire / résoudre :**

- Les **BoltNotes** sont des raccourcis de texte : vous tapez `/toxine` et le logiciel insère automatiquement votre protocole complet d'injection.
- **Créer un BoltNote** : Paramètres > BoltNotes → « Nouveau BoltNote » → définir un raccourci (toujours commencer par `/`) → rédiger le texte template → laisser des `[crochets]` pour les éléments variables à chaque patient → sauvegarder → tester dans un dossier patient.
- **BoltNotes recommandés pour démarrer :**
  - `/toxine` : compte-rendu injection toxine botulique
  - `/AHlevres` : compte-rendu injection AH lèvres
  - `/AHsillons` : compte-rendu injection AH sillons
  - `/skinbooster` : compte-rendu skinbooster/mésolift
  - `/consult1` : compte-rendu première consultation
  - `/controle` : compte-rendu consultation de contrôle
  - `/postinj` : consignes post-injection standard
- **Bonnes pratiques :** raccourcis courts et intuitifs, texte structuré (produit, zone, technique, quantité), mettre à jour après quelques semaines d'utilisation.
- Pour les assistantes : utiliser la **dictée vocale** depuis l'application mobile pour noter les paramètres en séance (épilation, LED), ça s'ajoute automatiquement dans le dossier.

---

## Stocks & traçabilité produits injectables

**Quand :** Vous recevez une commande de produits, vous réalisez une injection, ou vous voulez vérifier votre stock.

**Comment faire / résoudre :**

**Créer le catalogue produits :**
1. Paramètres > Stocks → « Ajouter un produit » : nom commercial, marque, conditionnement, prix d'achat (recommandé).
2. Commencez par les 5 produits principaux ; ajoutez les autres au fur et à mesure.
3. Évitez les doublons : vérifiez avant de créer.

**Entrée de stock (réception commande) :**
1. Stocks > Entrée de stock → sélectionner le produit → scanner ou saisir le **numéro de lot** → renseigner la **date de péremption** → valider la quantité.
2. Ne jamais oublier lot et date de péremption : sans eux, pas d'alertes et traçabilité incomplète.

**Règle de déstockage :**
- Produit **entièrement utilisé** (mis à la poubelle) : indiquer 1 en déstockage.
- Produit **partiellement utilisé** (remis en stock) : indiquer 0, mais le renseigner quand même pour garder la trace.

**En consultation :** quand vous sélectionnez un produit sur une ligne de traitement, NextMotion associe automatiquement le lot au dossier du patient — c'est la traçabilité réglementaire obligatoire.

**Étiquette de traçabilité (application mobile) :** ouvrez le dossier patient → Traitements → ligne de traitement → icône appareil photo → photographiez l'étiquette du produit. La photo est archivée dans le dossier.

**Alertes :** le système alerte quand un produit approche de sa date de péremption ou que le stock est bas.

---

## Stockage médias & tags photos

**Quand :** Vous cherchez comment organiser vos photos patients, retrouver des avant/après, ou comprendre la consommation de stockage.

**Comment faire / résoudre :**

**Stockage :**
- Votre abonnement inclut un quota de stockage (50 Go inclus). 1 photo tablette ≈ 2-3 Mo ; 1 vidéo ≈ 50-100 Mo.
- Suivre votre consommation : Mon compte > Ma clinique > onglet Mémoire.
- **Bonnes pratiques :** standardisez les angles (face, profil D, profil G, 3/4), évitez les doublons, supprimez les photos floues ou ratées immédiatement.
- **Si vous approchez de la limite :** faites un audit rapide (supprimer les doublons, archiver les vidéos lourdes). Vous pouvez aussi télécharger un ZIP de vos médias (rangés par patient) pour archivage externe, puis faire le tri.
- Les photos supprimées du logiciel libèrent de l'espace.

**Tags photos :**
- Les tags permettent de retrouver des photos en 5 secondes au lieu de chercher patient par patient.
- **Système de tags recommandé :**
  - Par zone : Lèvres, Sillons, Pommettes, Cernes, Front, Menton, Ovale
  - Par acte : Toxine, AH, Skinbooster, Peeling, Laser, LED
  - Par timing : Avant, Après, J+7, J+15, M+1, M+3
  - Pour la communication : « Top résultat », « Publication OK » (consentement photo obtenu)
- **Créer un tag :** ouvrir une photo → « Ajouter un tag » → sélectionner ou créer → possibilité de tagger en lot.
- **Rechercher par tag :** aller dans la photothèque → filtrer par tag → tous les avant/après correspondants s'affichent.

---

## Questionnaire antécédents patients

**Quand :** Vous voulez personnaliser les questions posées à vos patients avant la consultation, ou vous cherchez à gagner du temps en salle d'attente.

**Comment faire / résoudre :**

- NextMotion propose un questionnaire standard (antécédents généraux, allergies, traitements en cours, antécédents chirurgicaux, grossesse). Vous pouvez l'enrichir avec des questions spécifiques à votre pratique.
- **Personnaliser :** Paramètres > Questionnaires → sélectionner le questionnaire → ajouter une question (texte libre, oui/non, choix multiple) → positionner dans l'ordre → prévisualiser côté patient.
- **Questions utiles selon la spécialité :**
  - Injectables : antécédents d'injections, réactions indésirables, herpès labial récurrent, anticoagulants.
  - Laser/énergie : phototype, exposition solaire récente, rétinoïdes, tatouages dans la zone.
- **Bonnes pratiques :** 15-20 questions max, privilégier les oui/non, questions importantes en premier, langage clair sans jargon. Tester vous-même le questionnaire avant de l'envoyer aux patients.
- **Mode de remplissage :**
  - Sur tablette en salle d'attente (patient autonome)
  - En amont via un lien envoyé par email (recommandé : patient arrive préparé, gain de temps en consultation)
- **Centres multi-praticiens :** un questionnaire global partagé est souvent plus pratique que des questionnaires par médecin si les patients tournent entre praticiens. Sur le compte d'un médecin, le modèle s'applique par défaut ; sur le compte d'une assistante, le médecin doit être associé au dossier pour que le questionnaire apparaisse.

---

## Facturation & extraction comptable

**Quand :** Vous voulez créer vos premiers devis/factures, paramétrer vos tarifs, ou exporter les données pour votre comptable.

**Comment faire / résoudre :**

**Paramétrer les actes et tarifs :**
1. Paramètres > Facturation > Actes → créer un acte : nom, prix TTC, TVA applicable.
2. Points légaux : les actes médicaux sont généralement exonérés de TVA en France (vérifiez avec votre comptable selon votre situation).
3. Informations légales à renseigner pour les documents : nom légal de la société (pas le nom commercial !), SIRET, numéro TVA intracommunautaire, adresse siège, code APE, RPPS, assurance professionnelle.
4. Vérifiez quel niveau d'information afficher sur les devis versus les consentements (certains praticiens préfèrent retirer les diplômes des devis et les garder sur les consentements).

**Créer un devis :**
1. Ouvrir le dossier patient → ligne de traitement → « Créer un devis modifiable » (bleu).
2. Sélectionner les actes, modifier le tarif à la volée si besoin.
3. Envoyer une **copie** par mail (suivi 3 points) **et/ou** passer à la **signature sur tablette en présentiel** (NM Capture) — il n'y a **pas** de signature en ligne à distance pour un devis (voir section Workflow devis → signature iPad).

**Facturer :**
- Transformer un devis signé en facture en un clic, ou créer une facture directe.
- Encaissement : CB, espèces, chèque, virement. La numérotation est automatique.

**Export comptable :**
- Comptabilité > Export → filtrer par période (mois, trimestre, année) → télécharger le fichier Excel.
- Le fichier contient : n° facture, date, patient, montant HT/TTC, TVA, mode de paiement.
- Recommandé : export mensuel envoyé au comptable.

---

## Acomptes & encaissement différé

**Quand :** Un patient veut payer en plusieurs fois, ou vous encaissez un acompte avant le soin.

**Comment faire / résoudre :**

**Créer une facture d'acompte :**
1. Ligne de traitement → « Générer une facture » → choisir « Facture d'acompte ».
2. Entrer le montant du premier versement → sélectionner le mode de règlement → valider.
3. La facture passe en **violet** 🟣 = partiellement soldée.

**Encaisser les versements suivants :**
1. Retourner sur la facture violette → « Ajouter un règlement » → entrer le montant.
2. Quand le total = montant du soin → la facture passe en **vert** 🟢 = soldée.

**Encaissement différé :** pour les chèques, vous pouvez indiquer la date d'encaissement future. Cela impacte l'export comptable (important pour votre comptable).

**Code couleur des factures :**
| Couleur | Statut | Modifiable ? |
|---------|--------|-------------|
| 🔵 Bleu | Brouillon / attente réflexion | Oui |
| 🟠 Orange | Confirmé, attente signature | Non |
| 🟢 Vert | Signé et soldé | Non |
| 🟣 Violet | Facture partiellement soldée | Ajout de règlements possible |

---

## Consultation vs ligne de traitement

**Quand :** Vous ne savez pas quand créer une « consultation » et quand créer une « ligne de traitement », ou vous trouvez l'organisation du dossier patient un peu confuse.

**Comment faire / résoudre :**

- **La consultation** = l'échange médical avec le patient. C'est là que vous prenez des notes, suivez un motif de consultation, gardez une trace écrite de ce que vous avez discuté. C'est le dossier médical.
- **La ligne de traitement** = l'acte en lui-même. C'est là que vous créez le devis, faites signer le consentement, ajoutez les produits utilisés, et générez la facture.
- Les deux peuvent aller ensemble (consultation qui débouche sur un traitement) ou séparément (acte de routine sans note médicale).
- **Conseil :** si c'est une première consultation ou qu'il y a quelque chose de médical à noter, créez les deux. Si c'est un acte de routine récurrent, la ligne de traitement suffit.
- Pour compter les visites d'un patient : l'agenda enregistre toutes les dates de passage.

---

## Suivi mail — les 3 points (envoyé / délivré / ouvert)

**Quand :** Vous venez d'envoyer un document (consentement, devis, facture) par mail à un patient et vous voulez savoir s'il l'a bien reçu.

**Comment faire / résoudre :**

Quand un document est envoyé par mail depuis NextMotion, trois indicateurs visuels apparaissent dans le dossier :
- **1 point** ✉️ = Le mail a été **envoyé** par NextMotion.
- **2 points** 📬 = Le mail a été **délivré** dans la boîte du patient.
- **3 points** 👁️ = Le patient a **ouvert** le mail.

Les points apparaissent en temps réel — rafraîchissez la page pour les voir évoluer.

**Usage pratique :** si un patient affirme ne rien avoir reçu, vous pouvez vérifier immédiatement l'état réel de l'envoi. Pour les consentements, les 3 points constituent une trace que le patient a bien reçu et consulté le document avant le soin.

---

## Workflow devis → signature iPad (NM Capture)

**Quand :** Vous voulez faire signer un devis ou un consentement à votre patient directement sur tablette pendant la consultation.

**Comment faire / résoudre :**

1. **Créer la ligne de traitement** : dossier patient → section Traitements → « Ajouter un traitement » → sélectionner le soin → modifier le tarif si besoin.
2. **Générer le consentement** : depuis la ligne de traitement → « Consentement » → vérifier le contenu → envoyer par mail (les 3 points apparaissent) ou passer directement à la signature.
3. **Créer le devis modifiable (bleu)** : « Créer un devis modifiable » → le devis est modifiable tant qu'il est bleu.
4. **Confirmer le devis (orange)** : quand le patient revient pour signer → « Générer un devis » → le devis passe en orange, non modifiable.
5. **Signature sur iPad** : ouvrir l'application **NM Capture** sur l'iPad → se connecter avec les identifiants NextMotion → le devis/consentement en attente apparaît → le patient signe directement sur l'écran → le document signé remonte automatiquement dans NextMotion → le devis passe en vert ✅.

**Point d'attention :** vérifiez que le mot de passe NM Capture fonctionne sur l'iPad avant la consultation.

---

## Délais de réflexion par type de soin

**Quand :** Vous paramétrez vos consentements et souhaitez intégrer les délais de réflexion réglementaires, ou vous voulez vérifier que vos documents sont conformes.

**Comment faire / résoudre :**

En France, les actes de médecine esthétique sont soumis à un délai de réflexion obligatoire entre la remise du document et la réalisation de l'acte. Ce délai varie selon le type de soin.

**Délais courants (à valider avec votre assurance ou ordre professionnel) :**
- **24 heures :** mésothérapie, peeling, thermolyse haute fréquence.
- **15 jours :** acide hyaluronique, skin boosters, inducteurs de collagène (Sculptra, Radiesse…), Profhilo, radiofréquence, ulthérapie/HIFU.

**Comment paramétrer :**
1. Ouvrir le consentement du soin concerné.
2. Intégrer le délai en toutes lettres dans le corps du texte (ex : « Un délai de réflexion de 15 jours est prévu entre la remise de ce document et la réalisation de l'acte »).
3. Valider soin par soin avec votre praticien.

**Bon à savoir :** vous pouvez choisir le wording du soin dans vos documents (ex : « injection haut du visage » plutôt que le terme technique). NextMotion respecte votre choix de formulation.

---

## Envoi de documents & activation des avis Google

**Quand :** Vos documents envoyés par mail sont bloqués, ou vous voulez activer l'envoi automatique de demandes d'avis Google.

**Comment faire / résoudre :**

**Paramétrage email expéditeur :**
1. Paramètres > Communication → renseigner le nom d'expéditeur (nom du cabinet, pas du médecin) et l'adresse email de réponse (ex : secretariat@votrecabinet.fr).
2. **Problème fréquent : envois bloqués** → cause : l'adresse email paramétrisée est incorrecte ou vide. Solution : vérifier et corriger dans Paramètres > Communication.
3. Toujours tester l'envoi sur une adresse test avant de passer en production (vérifier que l'expéditeur et le nom s'affichent correctement).

**Demande d'avis Google :**
1. Le bouton « Demander un avis » envoie un message au patient avec un lien vers votre fiche Google Business.
2. Personnaliser le message avec le nom de votre cabinet et le lien Google.
3. Utiliser uniquement après une consultation positive et avec l'accord implicite du patient.

---

## Activation connecteur Doctolib

**Quand :** Vous souhaitez connecter votre agenda Doctolib à NextMotion pour que les patients se créent automatiquement.

**Comment faire / résoudre :**

1. NextMotion active le connecteur de son côté (à demander à votre interlocuteur NextMotion).
2. Vous contactez Doctolib et vous leur dites : « Je souhaite connecter mon agenda Doctolib à mon logiciel médical NextMotion. NextMotion a déjà fait le nécessaire côté technique, le connecteur est ouvert de leur côté. Vous n'avez plus qu'à vous brancher pour que la connexion se fasse. »
3. Une fois actif : un patient qui prend RDV sur Doctolib apparaît automatiquement dans NextMotion avec toutes ses données administratives.

**En attendant l'activation :** la création manuelle d'un patient prend environ 30 secondes. Continuez à utiliser NextMotion normalement — tout se synchronisera automatiquement une fois la connexion active.

---

## Bonnes pratiques navigateur & affichage

**Quand :** L'interface s'affiche mal, des boutons sont manquants, ou vous avez des lenteurs.

**Comment faire / résoudre :**

- **Navigateur :** utilisez toujours **Google Chrome**. Sur Safari ou Firefox, vous pouvez rencontrer des problèmes d'affichage ou de performance.
- **Zoom :** réglez le zoom de Chrome à **100%** (Ctrl+0 / Cmd+0). Vous devez voir le bouton de déconnexion bleu en haut à droite — s'il n'est pas visible, vous êtes trop zoomé.
- **Vider le cache** (si affichage bizarre) : Ctrl+Shift+Delete / Cmd+Shift+Delete → « Images et fichiers en cache » → « Toutes les périodes » → « Effacer les données » → recharger NextMotion.

| Symptôme | Cause probable | Solution |
|----------|---------------|---------|
| Interface tronquée / décalée | Zoom ≠ 100% | Ctrl+0 |
| Photos ne se chargent pas | Cache saturé | Vider le cache |
| Boutons non cliquables | Navigateur incompatible | Passer sur Chrome |
| Lenteurs importantes | Trop d'onglets ouverts | Fermer les onglets inutiles |
| Micro / caméra non détectés | Permissions navigateur | Autoriser dans les paramètres Chrome |

- **Sur tablette iPad :** utilisez Safari à jour ou Chrome ; activez la rotation automatique de l'écran.

---

## Workflow facture provisoire (assistante → validation médecin)

**Quand :** Vos assistantes encaissent des patients pour des soins délégués et vous voulez garder le contrôle de la comptabilité.

**Comment faire / résoudre :**

**Étape 1 — L'assistante encaisse en créant une facture provisoire :**
1. Dossier patient → ligne de traitement → cliquer sur le **+** → choisir **Facture provisoire** (jamais une facture définitive).
2. Renseigner le montant et le mode de règlement → confirmer.
3. La facture provisoire n'entre **pas** dans la comptabilité officielle — c'est un brouillon.

**Étape 2 — Le médecin valide en fin de journée :**
1. Comptabilité (icône drapeau) → filtrer sur son nom et la date → les factures provisoires apparaissent avec un **petit œil**.
2. Cliquer sur l'œil → vérifier le montant et le mode de règlement → comparer avec les tickets CB.
3. Si tout est correct → **Valider** → la facture devient définitive.

**Règle d'or :** former les assistantes à ne créer que des factures provisoires. Une facture définitive créée par erreur peut être supprimée, mais crée un trou dans la numérotation (le comptable n'apprécie pas).

**Configuration des droits :** dans Collaborateurs → profil Assistante → conserver l'accès aux factures mais leur préciser verbalement : « factures provisoires uniquement ».

---

## Dossier patient en centre multi-praticiens

**Quand :** Votre cabinet a plusieurs médecins et vous voulez que les dossiers patients soient organisés de façon cohérente pour toute l'équipe.

**Comment faire / résoudre :**

- Choisir l'organisation en **équipe** avant de commencer à créer des dossiers.
- **Option recommandée — Bloc Médecin / Bloc Délégable :**
  - Groupe « Actes médicaux » → injections, consultations, prescriptions.
  - Groupe « Soins délégués » → épilations, LED, soins visage, PRF.
- **Option par type de soin :** un groupe par spécialité (greffe capillaire, injections, épilations) — adapté si les médecins sont très spécialisés.
- **Ne pas :** laisser chaque médecin organiser différemment, créer plus de 3-4 groupes, oublier d'associer le patient au bon médecin sur chaque ligne.
- Traçabilité comptable par médecin : filtrez par médecin dans l'onglet comptabilité pour voir le chiffre d'affaires par praticien.

---

## Fiche info post-soin & envoi automatique au patient

**Quand :** Vous voulez envoyer automatiquement à vos patients des consignes post-traitement par email.

**Comment faire / résoudre :**

1. Préparez votre fiche post-soin en PDF (conseils à suivre après le traitement, 1 page suffit pour commencer).
2. Aller dans la configuration du traitement concerné → ajouter la fiche info en PDF → associer au bon traitement.
3. **Flux patient :** le médecin ou l'assistante crée la ligne de traitement → la fiche info est disponible en un clic → elle est envoyée par mail au patient → le patient la consulte chez lui.
4. La trace d'envoi reste dans le dossier (suivi des 3 points).
5. Commencez par les soins les plus fréquents : injections, épilation laser, peelings, PRP/PRF.

**Pourquoi c'est utile :** traçabilité médicale (le patient a bien reçu les consignes), meilleure expérience patient, réduction des appels post-soin.

---

## Motifs de consultation — Organisation

**Quand :** Vous configurez vos motifs de consultation pour la première fois, ou vous trouvez que votre liste est trop longue ou en doublon.

**Comment faire / résoudre :**

- **Les motifs de consultation** servent à : prendre des notes structurées dans le journal patient, identifier pourquoi le patient est venu, alimenter vos statistiques.
- **Deux approches :**
  - **Généraliste (recommandée pour démarrer) :** Première consultation, Consultation de suivi, Contrôle, Séance. Menu court, simple à utiliser.
  - **Détaillée (si vous voulez voir en un coup d'œil) :** Première consultation Injection, Séance Laser épilatoire, etc. Menu plus long mais très informatif.
- **Erreurs fréquentes :** créer des doublons entre motifs et traitements, avoir trop de motifs dès le départ (commencez par les 10 principaux), oublier « 1ère consultation » et « Contrôle ».
- **Règles de nommage :** soyez spécifique (« Injection AH lèvres » plutôt que « Injection »), cohérent (même format : Acte + Zone), sans doublon orthographique. Séparez consultation et acte.
- **Paramétrer :** Paramètres > Motifs de consultation → Ajouter un motif → renseigner le nom. Une barre de recherche dans le logiciel vous permet de retrouver rapidement un motif même si la liste est longue.
- Vous pouvez ajouter des motifs plus tard — pas besoin de tout créer dès le début.

---

## Notes & alertes internes sur un patient

**Quand :** Vous voulez laisser une information importante visible par toute l'équipe à l'ouverture du dossier patient (allergie, contre-indication, préférence patient).

**Comment faire / résoudre :**

NextMotion propose deux types d'annotations discrètes visibles uniquement par l'équipe :

- **Notes partagées (texte libre) :** visibles en premier à l'ouverture du dossier, partagées avec toute l'équipe. Idéales pour les allergies, contre-indications, informations importantes à ne pas oublier. Exemple : « Allergie à [produit] — à vérifier avant toute injection. »
- **Indicateurs visuels sur la liste patients :** deux icônes discrètes permettent de signaler un point d'attention au sein de l'équipe. Le patient ne les voit pas.

**Bonnes pratiques :** mettez-vous d'accord en équipe sur la signification de chaque indicateur pour que tout le monde utilise les mêmes codes. Utilisez les notes partagées pour toute information clinique importante (allergies, contre-indications, particularités médicales).
