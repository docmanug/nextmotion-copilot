# L'espace de groupe (Multi-clinique) — écrans et libellés

> Règles : `shared/regles-communes.md`. Données : `shared/donnees-et-confidentialite.md`.
> Tu **guides** : l'espace de groupe n'a pas d'outil dans le connecteur.

## 1. Y entrer et en sortir
- **Entrer :** en bas de la barre de gauche, le sélecteur de clinique (**Changer de clinique**) › **Multi-clinique**
  (affiché seulement pour un propriétaire de groupe qui a plus d'une clinique).
- **Sortir / changer de clinique :** le même sélecteur ; on choisit une clinique et on retombe sur son tableau de bord.
  La page « Choisissez votre clinique » s'ouvre aussi à la connexion quand aucune clinique n'est retenue.
- **Pas d'entrée ?** Le compte n'est pas propriétaire d'un groupe, ou n'a qu'une clinique : l'écran renvoie vers
  Paramètres › Collaborateurs de la clinique.

## 2. Le tableau de bord du groupe
En haut : le nom du groupe, « N cliniques » et la **période** (sélecteur). Puis :
- **Aujourd'hui** : un aperçu de la journée de chaque clinique ;
- **Vue d'ensemble du groupe** : chiffres du groupe (rendez-vous, nouveaux patients, appels manqués, conversion des
  devis, chiffre d'affaires **facturé**). Note de l'écran : il s'agit du montant facturé, pas de la trésorerie encaissée ;
  pour « Trimestre », le chiffre des nouveaux patients reprend le compteur mensuel (sous-estimé) ;
- **Bilan des consultations du groupe** (voir § 3) ;
- **Comparaison des cliniques** et **CA du groupe par mois** (total groupe, part de chaque clinique).
Ne cite que ce que le client voit ; en cas d'écart avec ce qu'il lit, vérifier la période et la clinique.

## 3. Bilan des consultations du groupe
Disponible dans le tableau de bord du groupe, comme le Bilan de vos consultations d'une clinique (fonctionnement,
avertissement « Il peut se tromper : vérifiez avant d'agir » : voir le skill **consult-ia**, fiche « rapports et bilan »).
- En-tête : « {mois} · N consultations analysées dans N cliniques ».
- Chiffres du groupe : Devis ouverts, Brouillons jamais envoyés, Demandés jamais chiffrés, Récupérables (estimation),
  Patients sans prochaine étape.
- Tableau **Par clinique** (Consultations, Avec RDV, Devis ouverts, Brouillons, Jamais chiffrés, Récupérable (est.),
  Sans prochaine étape, Score des règles) ; un clic sur une clinique montre ses **praticiens** ; le bouton
  **Ouvrir le bilan de cette clinique** mène à son bilan.
- Une clinique sans assez de consultations affiche « Pas assez de consultations pour un bilan : N sur 10 ».
- Réservé aux groupes dont les cliniques utilisent **Consult IA** ; sinon l'écran montre un **exemple fictif**.
- Tu **expliques** : tu ne lis pas le bilan (`shared/donnees-et-confidentialite.md`).

## 4. Réglages dans la vue groupe
**Paramètres** (roue dentée, bas de la barre de gauche) garde les mêmes rubriques, plus **Rapports**. Le **bandeau**
en haut de chaque page dit ce qui sera modifié :
- **« Vous modifiez le groupe « … » — Ces réglages s'appliquent à toutes les cliniques du groupe. »**
  Pages : **Mes traitements** (liste, forfaits/protocoles, consentements), **Mes consultations** (motifs, bolt notes),
  **Comptabilité › Répartition des honoraires**.
- **« Vous modifiez la clinique « … » — Ces réglages ne s'appliquent qu'à cette clinique, pas à tout le groupe. »**
  Toutes les autres rubriques qui ressemblent à celles d'une clinique. Un sélecteur **Changer de clinique** permet de
  changer sans quitter la page.
- Pas de bandeau : pages propres à l'utilisateur ou au groupe (clés d'accès, sessions de connexion, Plugin Claude,
  **Collaborateurs**, **Rapports**).
**Avant d'écrire** : lis le bandeau avec le client, annonce « pour tout le groupe » ou « pour la clinique X ».

## 5. Collaborateurs du groupe
Multi-clinique › Paramètres › **Collaborateurs** : trois onglets.
- **Collaborateurs** : les équipes de toutes les cliniques.
- **Cadres** : les personnes du siège. Rôle de groupe **Administrateur** ou **Regular** (libellé resté en anglais) (à ne pas confondre avec le rôle
  d'une personne dans une clinique : Owner, Manager, Praticien…). Boutons « Ajouter un cadre », « Modifier un cadre »,
  « Supprimer le cadre » (irréversible : c'est le client qui le fait, `shared/donnees-et-confidentialite.md`).
- **Modèles d'autorisations** : des préréglages de droits pour les cadres.
L'interrupteur **Consult AI** de chaque collaborateur reste dans la fiche du collaborateur de sa clinique.

## 6. Rapports multi-sites (exports en un fichier)
**Paramètres › Rapports** (vue groupe), réservé au propriétaire du groupe.
1. « Lancez un rapport pour exporter les données de toutes les cliniques du groupe dans un seul fichier, un onglet par
   clinique. » La liste **Rapports disponibles** montre ce qui existe (par exemple la clôture comptable mensuelle).
2. Choisir un rapport, remplir ce que la fenêtre demande (période…), puis **Lancer**. « Export démarré ».
3. La liste **Exports** montre l'avancement **clinique par clinique** (une après l'autre) et se met à jour toute seule.
   **Annuler l'export** est possible tant qu'il tourne. Quand c'est prêt : « Export prêt », bouton de téléchargement.
4. Aucun export ? « Aucun export pour l'instant. Lancez l'un des rapports ci-dessus. »
Pour les exports d'**une seule** clinique (factures, patients, visites) : vue clinique, Comptabilité ou Paramètres ›
Mon compte › Ma clinique.

## 7. Le connecteur et le groupe
- Une lecture ou une écriture vaut pour **une clinique** : celle que le client a désignée (liste de `oapi_clinic_list`).
- Pour comparer des cliniques : une lecture par clinique, même période, et dis-le.
- Les options (minutes IA, SMS, signatures, sièges) se lisent pour la clinique choisie ; certaines ressources peuvent
  être partagées dans le groupe : l'écran fait foi.
- Pour des réglages **communs** (traitements, motifs, répartition des honoraires) : vue groupe, à l'écran.
