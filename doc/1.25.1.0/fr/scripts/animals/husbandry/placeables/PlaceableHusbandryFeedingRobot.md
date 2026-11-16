# animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua

*[English version](../../../../../scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui ajoute un robot d'alimentation automatique à un élevage. Elle exige `PlaceableHusbandryFood`, instancie la classe nommée dans `placeable.husbandry.feedingRobot#class` à partir d'un fichier de configuration, la déplace le long de splines définies dans le XML et lie son état de conduite à des objets animés optionnels. Elle relaie aussi les flux réseau et les données de sauvegarde vers le robot et lui fait préparer un mélange proportionnel à la consommation de l'élevage (la classe du robot n'est pas dans ce fichier).

- **PlaceableHusbandryFeedingRobot** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHusbandryFeedingRobot.prerequisitesPresent(specializations: table) → boolean` | 29 | ✍ Renvoie vrai uniquement si la spécialisation `PlaceableHusbandryFood` est présente. |
| `PlaceableHusbandryFeedingRobot.registerFunctions(placeableType: any)` | 35 | ✍ Enregistre la méthode `onFeedingRobotLoaded` sur le type de placeable. |
| `PlaceableHusbandryFeedingRobot.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Enregistre les surcharges de `setOwnerFarmId`, `updateFeeding`, `collectPickObjects` et `updateInfo`. |
| `PlaceableHusbandryFeedingRobot.registerEventListeners(placeableType: any)` | 50 | ✍ S'abonne à `onLoad`, `onPostLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` et `onWriteStream`. |
| `PlaceableHusbandryFeedingRobot.registerXMLPaths(schema: any, basePath: any)` | 61 | ✍ Enregistre les clés XML sous `husbandry.feedingRobot` : noeud d'attache, classe, fichier de configuration, entrées de spline (noeud, direction, indicateur de nourrissage, longueur fictive, arrêt en fin) et objets animés dépendants. |
| `PlaceableHusbandryFeedingRobot.registerSavegameXMLPaths(schema: any, basePath: any)` | 79 | ✍ Enregistre les chemins XML de sauvegarde en déléguant à `FeedingRobot.registerSavegameXMLPaths`. |
| `PlaceableHusbandryFeedingRobot:onLoad(savegame: any)` | 87 | ✍ Ne fait rien sans noeud XML `feedingRobot`. Sinon exige le fichier, la classe et le noeud d'attache (état d'erreur s'ils manquent), crée et enregistre le robot avec un chargement asynchrone, ajoute les splines ou points d'attente fictifs et mémorise les objets animés dépendants. |
| `PlaceableHusbandryFeedingRobot:onPostLoad(savegame: any)` | 159 | ✍ Pour chaque objet animé dépendant, bloque son déclenchement pendant que le robot roule et lui fait prendre la direction configurée quand le robot se met en route. Nécessite la spécialisation des objets animés. |
| `PlaceableHusbandryFeedingRobot:onFeedingRobotLoaded(robot: any, args: any)` | 189 | ✍ Rappel de fin de chargement du robot : termine la tâche de chargement du placeable. |
| `PlaceableHusbandryFeedingRobot:onDelete()` | 195 | ✍ Supprime l'objet robot d'alimentation s'il existe. |
| `PlaceableHusbandryFeedingRobot:onFinalizePlacement()` | 205 | ✍ Transmet la finalisation du placement au robot d'alimentation. |
| `PlaceableHusbandryFeedingRobot:onReadStream(streamId: any, connection: any)` | 214 | ✍ Lecture réseau : lit l'identifiant d'objet du robot, ses données de flux, puis termine son enregistrement côté client. |
| `PlaceableHusbandryFeedingRobot:onWriteStream(streamId: any, connection: any)` | 225 | ✍ Écriture réseau : écrit l'identifiant d'objet du robot et ses données de flux, et l'enregistre dans le flux de la connexion. |
| `PlaceableHusbandryFeedingRobot:loadFromXMLFile(xmlFile: any, key: any)` | 236 | ✍ Délègue le chargement de la sauvegarde au robot d'alimentation. |
| `PlaceableHusbandryFeedingRobot:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 245 | ✍ Délègue l'écriture de la sauvegarde au robot d'alimentation. |
| `PlaceableHusbandryFeedingRobot:setOwnerFarmId(superFunc: any, farmId: any)` | 254 | ✍ Surcharge : appelle le parent, puis donne le même identifiant de ferme propriétaire au robot d'alimentation. |
| `PlaceableHusbandryFeedingRobot:updateFeeding(superFunc: any)` | 265 | ✍ Surcharge : sur le serveur demande au robot de créer un mélange valant 1,5 fois la consommation horaire de nourriture, mise à l'échelle par l'ajustement temporel de l'environnement, puis appelle le parent. |
| `PlaceableHusbandryFeedingRobot:collectPickObjects(superFunc: any, node: any)` | 279 | ✍ Surcharge : ignore les noeuds appartenant au robot d'alimentation pour qu'ils ne soient pas collectés comme objets sélectionnables ; sinon délègue au parent. |
| `PlaceableHusbandryFeedingRobot:updateInfo(superFunc: any, infoTable: any)` | 292 | ✍ Surcharge : appelle le parent puis laisse le robot ajouter ses propres entrées d'information. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onFeedingRobotLoaded` | 36 |
| registerOverwrittenFunction | `setOwnerFarmId` | 42 |
| registerOverwrittenFunction | `updateFeeding` | 43 |
| registerOverwrittenFunction | `collectPickObjects` | 44 |
| registerOverwrittenFunction | `updateInfo` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onFinalizePlacement` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
