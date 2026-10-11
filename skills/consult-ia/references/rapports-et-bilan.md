# Chiffres, rapports, Bilan de vos consultations, téléphonie IA, analyse de peau

> Données : `shared/donnees-et-confidentialite.md` (tu lis des **totaux**, jamais des listes de patients ni des notes).
> Plusieurs cliniques : skill **multi-sites**. Options : `shared/options-et-credits.md`.

## 1. Lire son tableau de bord
**Où :** **Tableau de bord**, en haut de la barre de gauche (c'est l'accueil de chacun).
- **Trois vues**, choisies par l'utilisateur avec le sélecteur « Changer de rôle » :
  **Manager** (« Voici les performances de votre clinique », « À traiter »), **Docteur** (« Voici comment se porte votre
  activité », « Mes patients à rappeler »), **Assistant** (« Voici votre plan d'action »).
  ⚠️ Ce sont des **vues**, pas des rôles ni des droits : ne les confonds pas avec Owner / Manager / Praticien.
- **Période** : Aujourd'hui · 7 j · 30 j · 90 j · Année, avec **comparaison** à la période précédente ou à l'an dernier.
- **Un chiffre n'apparaît pas ?** C'est un droit à activer : Paramètres › Collaborateurs › fiche › autorisations
  (le propriétaire ou un administrateur le fait).
- Autres pages de chiffres : **Conversion des devis**, **Stock**, **Leads**, **Appels** (exports CSV, Excel ou PDF).
- Sur **iPhone**, l'onglet **Rapports** permet de composer son tableau de bord (tuto « Rapports : composer et lire votre
  tableau de bord » dans Tutos IA).

## 2. Lire des chiffres pour le client (avec le connecteur)
Tu peux répondre à « combien ai-je facturé en septembre ? » ou « quels soins me rapportent le plus ? » avec les
statistiques de la clinique (`oapi_clinic_statistics_treatment_types`, `…_treatment_types_income`,
`…_appointment_income`, et les totaux des factures).
- **Toujours donner la période et la clinique** lues. Plusieurs cliniques : une lecture par clinique, jamais de somme
  « au jugé » (le skill multi-sites explique le choix).
- **Des totaux, pas des listes de patients.** Pas d'extrapolation : si la période n'est pas couverte, dis-le.
- Si l'outil échoue : « Je ne peux pas lire ce chiffre pour l'instant. Vous le trouvez dans Tableau de bord, en
  choisissant la période. » (`shared/problemes-connus.md`).
- **Mon usage / Votre bilan du trimestre** (menu de l'avatar) : tu **n'inventes rien** de son contenu, tu ne cites aucun
  prix de cet écran et tu renvoies vers le conseiller Nextmotion.

## 3. Bilan de vos consultations
Un rapport **rédigé par l'IA chaque mois** à partir des consultations enregistrées avec Consult IA et des devis,
rendez-vous et factures qui ont suivi.

**Où le trouver :** **Tableau de bord**, carte **Bilan de vos consultations** (vue Manager : tout en bas ; vue Docteur :
sous les chiffres clés ; vue Assistant : « À faire après les consultations »). La carte ouvre la page du bilan.
Les rubriques de la page :
- **À faire** : demandes jamais chiffrées, devis envoyés à relancer, devis restés en brouillon, patients sans prochaine
  étape — chaque ligne a un bouton (Créer le devis, Envoyer le devis, Relancer, Proposer un RDV) et se marque **Fait**
  ou **Pas pertinent**.
- **Opportunités** : les soins évoqués dans le mois et leur suite (réalisés, devis non signé, sans devis, refusés).
- **Conseils** : « Ce que vous faites très bien », « Un levier pour le mois », le conseil du mois ; aucun classement.
- **Vos règles** : huit repères de consultation (Prochain rendez-vous fixé, Plan de traitement global, Prix annoncé
  clairement, Forfait proposé, Soin complémentaire suggéré, Résultats et risques expliqués, Objections traitées,
  Conclusion), avec la part des consultations qui les respectent.

**Les quatre chiffres du haut :** *Devis ouverts* · *Demandés, jamais chiffrés* · *Récupérables (estimation)* ·
*Patients sans prochaine étape*. « Récupérables » est une **estimation** : ce qui reste ouvert, pondéré à 50 %, 25 % ou
10 % selon l'intérêt du patient. Le lien « Comment est-il fait ? » explique la méthode.

**Quand :** le bilan arrive **le 1er de chaque mois**. Il s'affiche à partir de **10 consultations analysées** ; avant,
l'écran montre une jauge (« Encore N consultations ») ou un bilan sur les trois derniers mois. Conseil : enregistrer
toutes les consultations avec Consult IA. Une dictée de note ou un test de micro ne compte pas.

**Avertissement à répéter :** « Rédigé par l'IA… Il peut se tromper : vérifiez avant d'agir. »
**Droits :** le bilan s'affiche pour les personnes qui ont le droit de le voir (Paramètres › Collaborateurs).
**Sans Consult IA** : la carte propose « Ajouter Consult IA » avec un exemple fictif.
**Plusieurs cliniques :** le bilan du groupe est dans la vue de groupe (skill multi-sites).

**Ce que tu fais et ne fais pas :** tu **expliques** où il est et comment le lire. Tu **ne lis pas** le bilan à la place
du client (il n'est pas accessible par le connecteur) et tu ne parcours pas les transcriptions pour en fabriquer un.
Pour « combien de devis oubliés ? », renvoie vers la carte. Si le client ne la voit pas : « Cette fonction n'est pas
encore ouverte sur votre compte », conseiller Nextmotion.

## 4. Téléphonie IA (l'agent qui répond au téléphone)
**Option :** Téléphonie IA (+ minutes d'appel). **Où :** **Paramètres › Téléphonie** (onglets **Agent · Qualification ·
Transferts · Forfait**). Si l'option manque : fonction grisée avec cadenas. **Tu guides**, tu ne peux pas la configurer.
Assistant « Configurez votre standard téléphonique », en six étapes :
1. **Nom et instructions** de l'agent (bouton **Rédiger avec Jarvis** pour une première version).
2. **Langue, voix, phrase d'accueil, durée maximale** d'un appel.
3. **Enregistrement des appels** : Désactivé / Transcrire puis supprimer l'audio / Transcrire et conserver l'audio.
   Rappel de l'écran : **en France, laissez désactivé sauf base légale documentée.**
4. **Obtenir mon numéro** : un numéro français est attribué (facturé chaque mois).
5. **Redirigez les appels du cabinet vers l'agent** (renvoi total, débordement, occupé ou injoignable ; l'écran
   donne un guide par opérateur).
6. **Appel test** — **faites-le avant de rediriger la ligne.**
Ensuite : modes de réception (horaires, fermetures), conditions de **transfert** (mots-clés, durée), **qualification**
des appels par statuts, mise en pause, solde de minutes (Forfait / À la demande / Acheter).
**Journal des appels :** **Appels** (menu de gauche) › **Exporter** (CSV, Excel ou PDF). Tu ne peux pas lire les appels
par le connecteur.

## 5. Analyse de peau (option)
Option payante (« Analyse de peau »), **lancée depuis l'application iPhone/iPad** : écran « Derniers conseils avant de
lancer l'analyse de peau », puis le résultat apparaît dans le **journal du patient**, entrée « Analyse de peau ».
Chaque analyse consomme une analyse du paquet. Si le client ne l'a pas : « Contactez votre conseiller Nextmotion. »
Pour comparer ou montrer des photos, voir le skill **aide-quotidien** (application iPhone).
