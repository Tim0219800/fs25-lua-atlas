# placeables/specializations/PlaceableDestructible.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableDestructible.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDestructible.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui permet à un placeable constructible d'être détruit puis réparé en passant d'un état constructible à un autre (transitions XML `destruct` et `repair`, résolues via `getConstructibleStateIndexByName`). Elle requiert `PlaceableConstructible`, ajoute un déclencheur joueur optionnel avec un activable, un bonus de réparation et un son de destruction, et sauvegarde l'id de la ferme qui répare. Beaucoup de ses fonctions enregistrées (`destruct`, `destructed`, `startRepairDestructible`, `finalizeConstruction`, etc.) n'ont pas de corps dans le dump : NON VÉRIFIÉ.

- **PlaceableDestructible** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableDestructible.registerXMLPaths(schema: any, basePath: any)` | 20 | ✍ Déclare les clés XML `destructible` : nœud de déclencheur, transitions d'état de destruction et de réparation (`from`/`to`), bonus de réparation et son `destructed`. |
| `PlaceableDestructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 | ✍ Déclare la clé de sauvegarde `repairingFarm#id`. |
| `PlaceableDestructible.prerequisitesPresent(specializations: table) → boolean` | 42 | ✍ Renvoie true seulement si la spécialisation `PlaceableConstructible` est présente. |
| `PlaceableDestructible.registerFunctions(placeableType: any)` | 48 | ✍ Enregistre sept fonctions, dont `destruct`, `destructed`, `startRepairDestructible`, `getCanRepairDestructible`, `getCanBeDestructedByTwister` et `onDestructibleTriggerCallback`. Seul le rappel du déclencheur a un corps dans le dump. |
| `PlaceableDestructible.registerOverwrittenFunctions(placeableType: any)` | 60 | ✍ Surcharge `finalizeConstruction` ; son remplacement n'a pas de corps dans le dump (NON VÉRIFIÉ). |
| `PlaceableDestructible.registerEventListeners(placeableType: any)` | 66 | ✍ S'abonne à `onLoad`, `onDelete` et `onFinalizePlacement` ; aucun corps d'`onDelete` n'apparaît dans le dump (NON VÉRIFIÉ). |
| `PlaceableDestructible:onLoad(savegame: table)` | 75 | ✍ Construit les tables de transition de destruction et de réparation depuis le XML par nom d'état (erreur XML si un état est inconnu), lit le bonus de réparation et le nœud de déclencheur (avertissement s'il n'a pas le bit de collision joueur), charge le son de destruction côté client et crée le `DestructibleActivatable`. |
| `PlaceableDestructible:onFinalizePlacement()` | 147 | ✍ Enregistre le rappel du déclencheur de destruction sur le nœud de déclencheur, s'il est défini. |
| `PlaceableDestructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 156 | ✍ Sauvegarde l'id de la ferme qui répare, s'il est défini. |
| `PlaceableDestructible:loadFromXMLFile(xmlFile: any, key: any)` | 166 | ✍ Restaure l'id de la ferme qui répare si la ferme existe encore, sinon journalise un avertissement. À noter : l'avertissement passe `xmlFile` comme premier argument de `Logging.warning`, ce qui ressemble à une erreur. |
| `PlaceableDestructible:onDestructibleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any)` | 283 | ✍ Rappel du déclencheur : ajoute l'activable de destruction quand le joueur local entre, le retire quand il sort. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `destruct` | 49 |
| registerFunction | `destructed` | 50 |
| registerFunction | `startRepairDestructible` | 51 |
| registerFunction | `getCanRepairDestructible` | 52 |
| registerFunction | `onDestructibleTriggerCallback` | 53 |
| registerFunction | `getCanBeDestructedByTwister` | 54 |
| registerFunction | `startedRepairDestructible` | 55 |
| registerOverwrittenFunction | `finalizeConstruction` | 61 |
| registerEventListener | `onLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onFinalizePlacement` | 69 |
