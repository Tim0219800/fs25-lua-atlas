# vehicles/specializations/ShallowWaterObstacles.lua

*[English version](../../../../scripts/vehicles/specializations/ShallowWaterObstacles.md)*

Source: `dataS/scripts/vehicles/specializations/ShallowWaterObstacles.lua` — FS25 1.25.1.0

✍ Spécialisation qui enregistre des nœuds de véhicule comme obstacles dans la simulation d'eau peu profonde (`g_currentMission.shallowWaterSimulation`), pour que les véhicules en mouvement repoussent l'eau. Les écouteurs d'événements ne sont enregistrés que si `Platform.hasShallowWaterSimulation` est vrai. La classe de simulation n'est pas dans le dump : son traitement des obstacles est NON VÉRIFIÉ. Les entrées XML viennent de `vehicle.shallowWaterObstacle.obstacleNode`.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ShallowWaterObstacles.prerequisitesPresent(specializations: any)` | 18 | ✍ Retourne toujours true : aucune autre spécialisation n'est requise. |
| `ShallowWaterObstacles.initSpecialization()` | 24 | ✍ Déclare le schéma XML des nœuds d'obstacle : nœud, nœud de direction (par défaut le nœud), taille en mètres (1 1 1 par défaut) et décalage local. |
| `ShallowWaterObstacles.registerFunctions(vehicleType: any)` | 39 | ✍ Enregistre `loadObstacleNodeFromXML` sur le type de véhicule. |
| `ShallowWaterObstacles.registerEventListeners(vehicleType: any)` | 45 | ✍ S'abonne à onPostLoad, onLoadFinished et onDelete, uniquement si la plateforme gère la simulation d'eau peu profonde ; sinon n'enregistre rien. |
| `ShallowWaterObstacles:onPostLoad(savegame: any)` | 57 | ✍ Charge toutes les entrées `obstacleNode` du XML. Si aucune n'est valide, retire les autres écouteurs et vide la liste. |
| `ShallowWaterObstacles:onLoadFinished(savegame: table)` | 80 | ✍ Enregistre chaque nœud d'obstacle auprès de la simulation d'eau (`addObstacle` avec taille, callback et décalage). Ignoré tant que le véhicule est dans l'état de configuration en boutique. |
| `ShallowWaterObstacles:onDelete()` | 93 | ✍ Retire tous les obstacles enregistrés de la simulation d'eau peu profonde. |
| `ShallowWaterObstacles:loadObstacleNodeFromXML(xmlFile: any, key: any, obstacleNode: any)` | 107 | ✍ Lit un obstacle (nœud, nœud de direction, taille, décalage) et initialise sa dernière position. Retourne false avec un avertissement XML si le nœud manque. |
| `ShallowWaterObstacles.getShallowWaterParameters(obstacleNode: any)` | 127 | ✍ Callback fourni à la simulation : retourne les vitesses x et z du nœud (direction unitaire du déplacement depuis le dernier appel fois la vitesse signée du véhicule fois 1000) et l'angle de cap autour de Y du nœud de direction. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadObstacleNodeFromXML` | 40 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onLoadFinished` | 51 |
| registerEventListener | `onDelete` | 52 |
