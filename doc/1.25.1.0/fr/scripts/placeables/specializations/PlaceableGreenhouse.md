# placeables/specializations/PlaceableGreenhouse.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableGreenhouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableGreenhouse.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une serre qui affiche des modèles de plantes sur des emplacements et anime leur croissance tant que la production tourne. Les plantes sont chargées depuis de petits fichiers XML par type de remplissage, clonées sur les noeuds d'emplacement et avancent par stades via un minuteur lié au temps de jeu ; sans eau (production sans entrées) elles se fanent. Elle déclenche aussi périodiquement effets et son d'arrosage côté client. Elle réagit aux événements de production et se combine donc avec un point de production.

- **PlaceableGreenhouse** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableGreenhouse.getRandomGrowthInterval()` | 23 | ✍ Renvoie un entier aléatoire entre GROWTH_INTERVAL_MIN et GROWTH_INTERVAL_MAX de PlaceableGreenhouse, utilisé comme durée du prochain stade de croissance (unités définies ailleurs : NON VÉRIFIÉ). |
| `PlaceableGreenhouse.getRandomWateringInterval()` | 29 | ✍ Renvoie un entier aléatoire entre WATERING_INTERVAL_MIN et WATERING_INTERVAL_MAX, utilisé comme délai avant le prochain arrosage (unités définies ailleurs : NON VÉRIFIÉ). |
| `PlaceableGreenhouse.prerequisitesPresent(specializations: table) → boolean` | 39 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableGreenhouse.initSpecialization()` | 45 | ✍ Construit le schéma XML des fichiers de plantes de serre : nom du fichier i3d, noeuds des stades de croissance, noeud flétri et correspondances i3d. |
| `PlaceableGreenhouse.registerFunctions(placeableType: any)` | 58 | ✍ Enregistre sur le type de placeable les méthodes de chargement des plantes, de placement et de stades de croissance. |
| `PlaceableGreenhouse.registerEventListeners(placeableType: any)` | 69 | ✍ Abonne la spécialisation aux événements de chargement, suppression, finalisation du placement, changement des types de sortie, changement d'état de production et mise à jour. |
| `PlaceableGreenhouse.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Déclare les plantes par type de remplissage (xmlFilename), les emplacements et noeuds parents avec l'indicateur useRandomYRot, le son d'arrosage et les noeuds d'effet. |
| `PlaceableGreenhouse:onLoad(savegame: any)` | 97 | ✍ Charge les définitions de plantes par type de remplissage connu, enregistre les emplacements depuis des noeuds et depuis les enfants de noeuds parents, et côté client le son et les effets d'arrosage. Crée un minuteur de croissance et un d'arrosage, tous deux mis à l'échelle du temps de jeu effectif ; l'effet dure WATERING_DURATION et le minuteur ne redémarre que s'il y a de l'eau. |
| `PlaceableGreenhouse:addPlantPlace(node: any, useRandomYRot: any)` | 183 | ✍ Ajoute un noeud d'emplacement de plante (rotation Y aléatoire par défaut) à la liste, sans type de remplissage ni stade pour l'instant. |
| `PlaceableGreenhouse:loadPlantFromXml(xmlFilename: any)` | 195 | ✍ Charge un fichier XML de plante et lance le chargement asynchrone d'un i3d partagé. Renvoie tout de suite la table de la plante ; ses indices de stades sont remplis plus tard par plantI3DLoadedCallback. Renvoie toujours une table, même si le XML a échoué. |
| `PlaceableGreenhouse:plantI3DLoadedCallback(i3dNode: any, failedReason: any, args: any)` | 232 | ✍ Callback de chargement : en cas de succès, stocke le noeud i3d et enregistre les stades de croissance et le stade flétri sous forme d'indices d'enfants. Supprime ensuite le fichier XML de la plante et termine la tâche de chargement. |
| `PlaceableGreenhouse:onDelete()` | 269 | ✍ Libère tout : fichiers XML de plantes non terminés, les deux minuteurs, requêtes i3d partagées, noeuds de plantes, effets et échantillons sonores. |
| `PlaceableGreenhouse:onFinalizePlacement()` | 305 | ✍ Marque la répartition des plantes comme à refaire et démarre le minuteur d'arrosage. |
| `PlaceableGreenhouse:onUpdate()` | 313 | ✍ Recalcule la répartition des plantes lorsqu'elle est marquée à refaire. |
| `PlaceableGreenhouse:onOutputFillTypesChanged(outputs: any, state: any)` | 321 | ✍ Événement de production : ajoute ou retire dans l'ensemble actif les types de sortie modifiés lorsqu'une plante existe pour eux, marque la répartition à refaire une fois synchronisé et réveille la boucle de mise à jour. |
| `PlaceableGreenhouse:onProductionStatusChanged(production: any, status: any)` | 345 | ✍ Événement de production : la serre a de l'eau sauf si l'état est MISSING_INPUTS. Un changement rafraîchit les stades des plantes ; le minuteur d'arrosage ne tourne qu'avec de l'eau et au moins un type actif. |
| `PlaceableGreenhouse:updatePlantDistribution()` | 364 | ✍ Attribue un type actif à chaque emplacement en rotation puis rafraîchit les stades. À noter : l'indice (i % nombre) + 1 fait que le premier emplacement reçoit le deuxième type quand plusieurs types sont actifs. |
| `PlaceableGreenhouse:setPlantAtPlace(fillType: any, plantPlace: any)` | 386 | ✍ Si l'emplacement contient un autre type, supprime ses noeuds de stade actuels et clone sur le noeud d'emplacement les meshes de stades de la nouvelle plante (tous les stades, visibilité réglée plus tard). |
| `PlaceableGreenhouse:updatePlantsStage()` | 418 | ✍ Sans effet sans type actif. Démarre ou arrête le minuteur de croissance selon l'eau, puis fait passer chaque emplacement au stade suivant (retour au premier après le dernier), ou au stade flétri sans eau, et bascule la visibilité des stades. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPlantFromXml` | 59 |
| registerFunction | `plantI3DLoadedCallback` | 60 |
| registerFunction | `addPlantPlace` | 61 |
| registerFunction | `updatePlantDistribution` | 62 |
| registerFunction | `setPlantAtPlace` | 63 |
| registerFunction | `updatePlantsStage` | 64 |
| registerEventListener | `onLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onFinalizePlacement` | 72 |
| registerEventListener | `onOutputFillTypesChanged` | 73 |
| registerEventListener | `onProductionStatusChanged` | 74 |
| registerEventListener | `onUpdate` | 75 |
