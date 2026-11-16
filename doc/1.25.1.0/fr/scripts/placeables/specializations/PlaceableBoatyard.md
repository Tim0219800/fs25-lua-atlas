# placeables/specializations/PlaceableBoatyard.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableBoatyard.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBoatyard.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour le chantier naval, un site de construction de bateau piloté par une machine à états de classes `BoatyardState*` chargées depuis le XML. Elle gère une spline sur laquelle se déplace le bateau, une station de déchargement (vente) et un stockage, un déclencheur joueur, et des bateaux qui naviguent en fonction du vent via le `windUpdater`. Plusieurs de ses fonctions enregistrées n'ont pas de corps dans le dump du SDK (NON VÉRIFIÉ).

- **PlaceableBoatyard** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableBoatyard.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableBoatyard.registerFunctions(placeableType: any)` | 32 | ✍ Enregistre 13 fonctions sur le type de placeable (chargement du bateau, progression des maillages, gestion de l'état et du temps de spline, création/libération du bateau, vent, niveau de remplissage, déclencheur joueur, demande d'achat). Leurs corps ne sont pas dans le dump : NON VÉRIFIÉ. |
| `PlaceableBoatyard.registerOverwrittenFunctions(placeableType: any)` | 50 | ✍ Surcharge `collectPickObjects`, `updateInfo` et `setOwnerFarmId`. |
| `PlaceableBoatyard.registerEventListeners(placeableType: any)` | 58 | ✍ S'abonne à `onLoad`, `onDelete`, `onUpdate` et aux quatre événements de flux réseau. |
| `PlaceableBoatyard.registerXMLPaths(schema: any, basePath: any)` | 70 | ✍ Déclare les clés XML `boatyard` : spline, nœud de liaison, déclencheur joueur, fichier et récompense du bateau, maillages à visibilité progressive, états et transitions de la machine à états (déléguant aux classes `BoatyardState*`), splines de navigation avec valeurs de tangage et de roulis, station de vente et stockage. |
| `PlaceableBoatyard.registerSavegameXMLPaths(schema: any, basePath: any)` | 109 | ✍ Déclare les clés de sauvegarde `state#index` et `splineTime`, et délègue à `BoatyardStateBuilding` et `Storage`. |
| `PlaceableBoatyard:onLoad(savegame: table)` | 121 | ✍ Charge la spline, le I3D du bateau (de façon asynchrone), la station de déchargement et le stockage, le déclencheur joueur, la machine à états définie en XML avec ses transitions, les splines de navigation, et s'enregistre comme écouteur des changements de vent. Journalise des erreurs XML pour les états ou classes en double ou inconnus. |
| `PlaceableBoatyard:collectPickObjects(superFunc: any, node: any)` | 365 | ✍ Ignore les nœuds de sélection qui sont le nœud racine de remplissage exact d'un des déclencheurs de la station de déchargement ; les autres nœuds sont transmis à l'implémentation parent. |
| `PlaceableBoatyard:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 381 | ✍ Sauvegarde l'index d'état, le temps de spline et les données de l'état courant seulement si l'index d'état est supérieur à 0, et sauvegarde toujours le stockage. |
| `PlaceableBoatyard:loadFromXMLFile(xmlFile: any, key: any)` | 398 | ✍ Rejoue les états de 0 jusqu'à l'index sauvegardé via `setState`, restaure le temps de spline, puis charge les données de l'état courant et le stockage. |
| `PlaceableBoatyard:onReadStream(streamId: any, connection: any)` | 420 | ✍ Connexion côté client : lit et enregistre la station de déchargement et le stockage, rejoue les états jusqu'à l'index reçu, puis lit le temps de spline, la progression des maillages et l'index de la prochaine spline de navigation. |
| `PlaceableBoatyard:onWriteStream(streamId: any, connection: any)` | 458 | ✍ Connexion côté serveur : écrit la station de déchargement et le stockage, l'index d'état et les données de l'état courant, le temps de spline, la progression des maillages et l'index de la prochaine spline (miroir de `onReadStream`). |
| `PlaceableBoatyard:setOwnerFarmId(superFunc: any, farmId: any)` | 615 | ✍ Appelle le parent puis, si le propriétaire est `AccessHandler.EVERYONE`, enregistre la station de déchargement comme station de vente et de déchargement du stockage, sinon la retire. Le déclencheur joueur n'est visible que si le propriétaire est EVERYONE. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onBoatI3DFileLoaded` | 33 |
| registerFunction | `setMeshProgress` | 34 |
| registerFunction | `setState` | 35 |
| registerFunction | `setSplineTime` | 36 |
| registerFunction | `addSplineDistanceDelta` | 37 |
| registerFunction | `getSplineTime` | 38 |
| registerFunction | `releaseBoat` | 39 |
| registerFunction | `createBoat` | 40 |
| registerFunction | `setWindValues` | 41 |
| registerFunction | `getFillLevel` | 42 |
| registerFunction | `removeFillLevel` | 43 |
| registerFunction | `playerTriggerCallback` | 44 |
| registerFunction | `buyRequest` | 45 |
| registerOverwrittenFunction | `collectPickObjects` | 51 |
| registerOverwrittenFunction | `updateInfo` | 52 |
| registerOverwrittenFunction | `setOwnerFarmId` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onDelete` | 60 |
| registerEventListener | `onUpdate` | 61 |
| registerEventListener | `onReadStream` | 62 |
| registerEventListener | `onWriteStream` | 63 |
| registerEventListener | `onReadUpdateStream` | 64 |
| registerEventListener | `onWriteUpdateStream` | 65 |
