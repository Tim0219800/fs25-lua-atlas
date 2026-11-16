# placeables/specializations/PlaceableLeveling.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableLeveling.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableLeveling.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable décrivant comment le terrain est nivelé et peint autour d'un bâtiment lors de son placement. Elle charge les zones de nivellement (aplanies, avec un type de sol optionnel), les zones de peinture seule et les paramètres de lissage, puis construit des objets TerrainDeformation mis en file dans la file de déformation du terrain. Aucun prérequis ; la déformation est lancée à la demande par le code de placement.

- **PlaceableLeveling** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableLeveling.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableLeveling.registerFunctions(placeableType: table)` | 25 | ✍ Enregistre les méthodes de nivellement : chargeurs de zones, objets de déformation, ajout de zone, application et les deux accesseurs. |
| `PlaceableLeveling.registerEventListeners(placeableType: table)` | 38 | ✍ Abonne la spécialisation à l'événement de chargement. |
| `PlaceableLeveling.registerXMLPaths(schema: XMLSchema, basePath: string)` | 46 | ✍ Déclare les attributs de nivellement (requireLeveling, maxSmoothDistance, maxSlope, maxEdgeAngle, smoothingGroundType, realignAfterLeveling) et les entrées levelArea et paintArea avec noeuds début, largeur, hauteur et groundType. |
| `PlaceableLeveling:onLoad(savegame: table)` | 68 | ✍ Lit les réglages de nivellement (maxSmoothDistance est borné entre 0 et 10 avec un avertissement, pente et angle d'arête valent 45 par défaut), avertit si le bloc leveling manque et charge les zones de nivellement et de peinture. Vérifie aussi l'ancien élément rampAreas. |
| `PlaceableLeveling:loadLevelArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 114 | ✍ Lit une zone de nivellement (trois noeuds et un groundType optionnel) dans la table ; renvoie false avec un avertissement si un noeud manque. |
| `PlaceableLeveling:loadPaintArea(xmlFile: XMLFile, key: string, area: table) → boolean` | 147 | ✍ Comme loadLevelArea mais pour les zones de peinture seule, avec des avertissements adaptés. |
| `PlaceableLeveling:getDeformationObjects(terrainRootNode: integer, forBlockingOnly: boolean, isBlocking: boolean) → array` | 180 | ✍ Construit les objets TerrainDeformation pour un noeud de terrain : un pour toutes les zones de nivellement (carte de zones bloquées, brosse et limites de lissage extérieur, masque de collision, petits déplacements maximaux) et, hors mode blocage seul, un objet de peinture pour les zones de peinture. Renvoie une liste vide sans racine de terrain valide. L'appelant en est propriétaire et les supprime. |
| `PlaceableLeveling:addDeformationArea(deformationObject: TerrainDeformation, area: table, terrainBrushId: integer, writeBlockedAreaMap: boolean)` | 241 | ✍ Convertit les trois noeuds d'une zone en coordonnées monde, calcule les deux vecteurs d'arête depuis le coin de départ et ajoute le parallélogramme à l'objet de déformation avec l'id de brosse et l'indicateur d'écriture de la carte de zones bloquées. |
| `PlaceableLeveling:getRequiresLeveling() → boolean` | 261 | ✍ Indique si le placeable demande un nivellement du terrain. |
| `PlaceableLeveling:getRequiresRealignAfterLeveling() → boolean` | 268 | ✍ Indique si le placeable est réaligné en hauteur après le nivellement (vrai par défaut). |
| `PlaceableLeveling:applyDeformation(isPreview: boolean, callback: function)` | 277 | ✍ Exécute les objets de déformation l'un après l'autre via g_terrainDeformationQueue, en aperçu ou pour de bon, en cumulant le volume déplacé. Le callback reçoit l'état, le volume total et un nom d'objet bloquant en cas d'échec, et les objets sont supprimés via le gestionnaire de tâches asynchrones. Appelle le callback immédiatement avec succès s'il n'y a rien à faire. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadLevelArea` | 26 |
| registerFunction | `loadPaintArea` | 27 |
| registerFunction | `addDeformationArea` | 28 |
| registerFunction | `applyDeformation` | 29 |
| registerFunction | `getDeformationObjects` | 30 |
| registerFunction | `getRequiresLeveling` | 31 |
| registerFunction | `getRequiresRealignAfterLeveling` | 32 |
| registerEventListener | `onLoad` | 39 |
