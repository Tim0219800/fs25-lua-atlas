# vehicles/specializations/AIFieldWorker.lua

*[English version](../../../../scripts/vehicles/specializations/AIFieldWorker.md)*

Source: `dataS/scripts/vehicles/specializations/AIFieldWorker.lua` — FS25 1.25.1.0

✍ Spécialisation qui permet à un véhicule conduisible doté d'AIJobVehicle d'effectuer du travail de champ par l'IA : elle garde une liste de stratégies de conduite (enregistrées dans AIFieldWorker.registeredDriveStrategies) et transforme leurs cibles de direction en commandes de conduite à chaque image. Dans ce dump, la majeure partie du fichier est vide : la logique d'enregistrement, de démarrage et d'arrêt (startFieldWorker, getIsFieldWorkActive, etc.) et les clés XML sont NON VÉRIFIÉES ; seules sept fonctions sont visibles.

- **AIFieldWorker** (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIFieldWorker.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Renvoie vrai uniquement si le type de véhicule possède à la fois AIJobVehicle et Drivable. |
| `AIFieldWorker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 202 | ✍ Écrit l'indicateur isActive, demande à chaque stratégie de conduite de remplir les données de reconstruction, puis laisse chaque classe de stratégie enregistrée sauvegarder ces données dans l'entrée du véhicule via son éventuelle saveToXML. |
| `AIFieldWorker:onReadStream(streamId: integer, connection: Connection)` | 228 | ✍ Côté client à la connexion : lit un booléen et, s'il est vrai, appelle startFieldWorker pour que le client reflète un travail de champ déjà en cours (startFieldWorker n'est pas dans le dump, NON VÉRIFIÉ). |
| `AIFieldWorker:onWriteStream(streamId: integer, connection: Connection)` | 238 | ✍ Côté serveur à la connexion : écrit si le travailleur de champ est actif. À noter : spec.isActive est écrit sans garde contre nil, alors que saveToXMLFile en prévoit une. |
| `AIFieldWorker:updateAIFieldWorker(dt: number)` | 318 | ✍ Étape IA à chaque image quand le travail de champ est actif : demande à chaque stratégie de conduite une cible et une vitesse jusqu'à ce que l'une réponde, termine le travail comme réussi si aucune ne donne de cible valide, limite la vitesse près du point d'arrêt, selon la limite du véhicule et le régulateur, puis conduit vers le point avec AIVehicleUtil.driveToPoint et déclenche onAIFieldWorkerActive. Les vitesses sont dans l'unité de driveToPoint (km/h, NON VÉRIFIÉ). |
| `AIFieldWorker:updateAIFieldWorkerDriveStrategies()` | 575 | ✍ Reconstruit la liste des stratégies de conduite quand des outils IA existent : supprime les anciennes, puis crée une instance par stratégie enregistrée dont la fonction de test accepte l'un des véhicules de l'arbre attelé, et lie chacune à ce véhicule. |
| `AIFieldWorker:aiContinue(superFunc: any)` | 655 | ✍ Surcharge : appelle le parent puis, si le travail de champ est actif et que le véhicule ne tourne pas, déclenche onAIFieldWorkerContinue et l'événement d'outil correspondant, et efface l'indicateur de blocage. |
