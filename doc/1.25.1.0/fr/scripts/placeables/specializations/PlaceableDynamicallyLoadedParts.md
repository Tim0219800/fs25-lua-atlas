# placeables/specializations/PlaceableDynamicallyLoadedParts.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui charge au chargement des éléments supplémentaires depuis des fichiers i3d externes et les attache au placeable. Pour chaque élément, le XML donne le fichier, le nœud source, le nœud d'attache, la position, la rotation, un paramètre de shader et des changements d'objet ; les maillages skinnés sont validés pour qu'un maillage et ses os soient toujours liés ensemble, ce qui évite un plantage du moteur.

- **PlaceableDynamicallyLoadedParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableDynamicallyLoadedParts.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableDynamicallyLoadedParts.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `onDynamicallyPartI3DLoaded`, le rappel de chargement asynchrone. |
| `PlaceableDynamicallyLoadedParts.registerEventListeners(placeableType: any)` | 30 | ✍ S'abonne à `onLoad`, `onDelete` et `onFinalizePlacement` ; aucun corps d'`onFinalizePlacement` n'apparaît dans le dump (NON VÉRIFIÉ). |
| `PlaceableDynamicallyLoadedParts.registerXMLPaths(schema: any, basePath: any)` | 38 | ✍ Déclare les clés `dynamicallyLoadedParts.dynamicallyLoadedPart(?)` : `filename`, `node`, `linkNode`, `position`, `rotationNode`, `rotation`, `shaderParameterName`, `shaderParameter`, ainsi que les clés de changement d'objet. |
| `PlaceableDynamicallyLoadedParts:onLoad(savegame: table)` | 60 | ✍ Pour chaque élément ayant un nom de fichier, crée une tâche de chargement et demande le i3d partagé de façon asynchrone (rappel `onDynamicallyPartI3DLoaded`) ; avertit pour les éléments sans nom de fichier. |
| `PlaceableDynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 88 | ✍ Rappel asynchrone : trouve le nœud, rejette l'élément si les shapes skinnés et leurs os ne sont pas tous inclus, puis le retire de la physique, applique position, rotation, paramètre de shader et changements d'objet, l'attache sous le nœud d'attache et l'enregistre. Termine toujours la tâche de chargement ; renvoie true en cas de succès, false sinon. |
| `PlaceableDynamicallyLoadedParts:onDelete()` | 237 | ✍ Libère les demandes de chargement i3d partagées et supprime les nœuds de tous les éléments chargés. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onDynamicallyPartI3DLoaded` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
