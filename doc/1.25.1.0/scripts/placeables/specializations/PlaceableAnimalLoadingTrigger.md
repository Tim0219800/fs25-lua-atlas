# placeables/specializations/PlaceableAnimalLoadingTrigger.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableAnimalLoadingTrigger.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAnimalLoadingTrigger.lua` — FS25 1.25.1.0

✍ Placeable specialization (`spec_animalLoadingTrigger`) that creates an `AnimalLoadingTrigger` from the `placeable.animalLoadingTrigger` XML section so animals can be loaded onto trailers at the placeable. It deletes the trigger with the placeable. Trigger behaviour lives in `AnimalLoadingTrigger`, not in this file.

- **PlaceableAnimalLoadingTrigger** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableAnimalLoadingTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Prerequisite check; always returns true. |
| `PlaceableAnimalLoadingTrigger.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to the placeable events `onLoad` and `onDelete`. |
| `PlaceableAnimalLoadingTrigger.registerFunctions(placeableType: any)` | 31 | ✍ Empty; this specialization registers no new functions. |
| `PlaceableAnimalLoadingTrigger.registerOverwrittenFunctions(placeableType: any)` | 36 | ✍ Empty; this specialization overrides no placeable functions. |
| `PlaceableAnimalLoadingTrigger.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Registers the `.animalLoadingTrigger` XML paths by delegating to `AnimalLoadingTrigger.registerXMLPaths`. |
| `PlaceableAnimalLoadingTrigger.registerSavegameXMLPaths(schema: any, basePath: any)` | 49 | ✍ Empty; nothing is saved by this specialization. |
| `PlaceableAnimalLoadingTrigger:onLoad(savegame: table)` | 55 | ✍ Creates an `AnimalLoadingTrigger` for the server/client role and loads it from XML. If loading fails, the trigger is deleted and left nil. |
| `PlaceableAnimalLoadingTrigger:onDelete()` | 67 | ✍ Deletes the animal loading trigger, if any, and clears the reference. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
