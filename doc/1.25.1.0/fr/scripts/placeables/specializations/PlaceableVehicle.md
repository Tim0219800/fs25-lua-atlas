# placeables/specializations/PlaceableVehicle.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableVehicle.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableVehicle.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une entrée du menu de construction qui ne fait qu'apparaître des véhicules. Sur le serveur (ou le client en aperçu de construction), elle charge les véhicules listés sous `placeable.placeableVehicle.vehicle` et les accroche à des nœuds ; une fois le placement final, le serveur les détache, les ajoute à la physique et les enregistre. Le placeable lui-même est alors supprimé au lieu d'être enregistré.

- **PlaceableVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableVehicle.registerFunctions(vehicleType: any)` | 24 | ✍ Enregistre `onFinishLoadingVehicle` sur le type de placeable. |
| `PlaceableVehicle.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Surcharge `collectPickObjects` et `register` sur le type de placeable. |
| `PlaceableVehicle.registerEventListeners(placeableType: any)` | 37 | ✍ S'abonne à onLoad, onFinalizePlacement et onDelete. |
| `PlaceableVehicle.registerXMLPaths(schema: any, basePath: any)` | 45 | ✍ Déclare les clés XML de chaque véhicule (`#xmlFilename` et `#linkNode`) sous `placeable.placeableVehicle.vehicle`. La liste exacte vient des lignes d'enregistrement, en partie NON VÉRIFIÉ. |
| `PlaceableVehicle:onLoad(savegame: table)` | 57 | ✍ Serveur ou client en aperçu de construction seulement : pour chaque véhicule ayant un fichier et un nœud d'accroche, lance un chargement asynchrone à la pose du nœud, en aperçu de boutique ou en véhicule possédé non enregistré, lié à une tâche de chargement. |
| `PlaceableVehicle:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, vehicleData: any)` | 96 | ✍ Callback de chargement : si le placeable est en cours de suppression, supprime les véhicules chargés ; sinon les retire de la physique, fixe la ferme propriétaire et lie leurs composants au nœud d'accroche. Journalise une erreur en cas d'échec et termine toujours la tâche de chargement. |
| `PlaceableVehicle:onFinalizePlacement()` | 132 | ✍ Serveur seulement, et pas avec un générateur d'icônes : remet les composants des véhicules sous le nœud racine en conservant leur pose monde, ajoute les véhicules à la physique et les enregistre, puis vide la liste en attente. |
| `PlaceableVehicle:onDelete()` | 156 | ✍ Supprime les véhicules encore présents dans la liste en attente (ceux non libérés lors du placement). |
| `PlaceableVehicle:register(alreadySent: any)` | 168 | ✍ Surcharge l'enregistrement : hors aperçu de construction, le placeable se supprime lui-même et n'est donc jamais synchronisé aux clients ; seuls les véhicules créés subsistent. |
| `PlaceableVehicle:collectPickObjects(superFunc: any, node: any)` | 179 | ✍ Ignore un nœud qui est l'un des nœuds d'accroche de véhicule (retour sans appeler le parent), afin qu'il ne soit pas collecté comme objet pointable ; les autres nœuds passent à la fonction parente. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onFinishLoadingVehicle` | 25 |
| registerOverwrittenFunction | `collectPickObjects` | 31 |
| registerOverwrittenFunction | `register` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onFinalizePlacement` | 39 |
| registerEventListener | `onDelete` | 40 |
