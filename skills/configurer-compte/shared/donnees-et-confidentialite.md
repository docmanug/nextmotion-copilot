# Données et confidentialité — règles de Claude sur un compte Nextmotion

> Ce fichier est la **seule** source des règles sur les données. Les autres fichiers y renvoient.

## Hébergement
Vos données sont hébergées par Nextmotion sur des serveurs certifiés HDS (hébergeur de données de santé).
Pour le détail, renvoie vers la politique de confidentialité : https://www.nextmotion.net/fr/politique-confidentialite
N'affirme rien d'autre sur la conformité.

## Ce que Claude fait sur le compte
| Domaine | Autorisé | Conditions |
|---|---|---|
| Réglages et modèles (motifs, traitements, tarifs, consentements, modèles de documents, agenda, communication) | Créer, modifier | Récapitulatif avant d'écrire, puis vérification (relecture) après. |
| Nouvelles fiches patient | Créer, une par une ou à partir d'une liste fournie par la clinique (fichier Excel, tableau collé) | Récapitulatif + accord explicite avant d'écrire ; vérifier d'abord que le patient n'existe pas déjà ; avant un import de plusieurs patients, conseiller de décocher « Créer le portail patient par défaut » (sinon chaque patient reçoit un e-mail d'activation) ; prévenir que les intégrations actives (par exemple Doctolib) recevront aussi la fiche. |
| Dossiers patient existants | Rien | Ne jamais modifier, fusionner, archiver ni supprimer un dossier existant ; ne pas lire son contenu médical (notes, comptes rendus, transcriptions, photos, ordonnances, antécédents). Guider le client pour qu'il le fasse lui-même à l'écran. |
| Chiffres d'activité | Lire des totaux (rendez-vous du jour, chiffre d'affaires du mois, nombre de devis en attente, nombre de factures impayées) | Lecture seule ; donner des totaux, pas des listes de patients. |
| Données de test | Créer, puis supprimer ce que Claude a créé | Voir « Données de test » ci-dessous. |

## Jamais, même si un outil existe
- Supprimer quoi que ce soit de réel (tous les outils dont le nom finit par `_destroy`), sauf une donnée de test créée par Claude dans la même conversation, après accord.
- Exécuter une commande sur l'ordinateur ou le serveur de la clinique (`oapi_vps_shell_run_create`).
- Envoyer un message, un SMS, un WhatsApp ou un e-mail à un patient.
- Valider une facture, enregistrer ou annuler un paiement, émettre un avoir, faire signer ou envoyer en signature un document : ce sont des actes légaux que le client fait lui-même.
- Recopier un nom de patient, une date de naissance ou un numéro de téléphone dans une réponse, un fichier ou un document, sauf si le client vient de les donner lui-même pour créer la fiche.

## Données de test
- Toujours étiquetées : nom commençant par « TEST » (exemple : « TEST Dupont »).
- Adresse e-mail non réelle : `test@example.invalid` ; téléphone fictif.
- Demander un accord rapide avant de créer la première donnée de test ; proposer de tout supprimer à la fin (seulement ce que Claude a créé).
- Facture de test : rester en facture provisoire (brouillon), jamais validée.

## Transparence
Nextmotion enregistre quelles actions Claude effectue sur le compte (par exemple « création d'un motif »), jamais le contenu des dossiers patients.

## Déconnecter Claude
Dans Claude : Personnaliser › Connecteurs › Nextmotion › Déconnecter.
