# placeables/specializations/PlaceableDestructible.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableDestructible.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableDestructible.lua` — FS25 1.25.1.0

✍ Placeable specialization that lets a constructible placeable be destroyed and repaired by moving between its constructible states (XML `destruct` and `repair` transitions, resolved through `getConstructibleStateIndexByName`). It requires `PlaceableConstructible`, adds an optional player trigger with an activatable, a repair bonus and a destruction sound, and saves the repairing farm id. Many of its registered functions (`destruct`, `destructed`, `startRepairDestructible`, `finalizeConstruction`, etc.) have no body in the dump: UNVERIFIED.

- **PlaceableDestructible** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableDestructible.registerXMLPaths(schema: any, basePath: any)` | 20 | ✍ Declares the `destructible` XML keys: trigger node, destruct and repair state transitions (`from`/`to`), repair bonus and a `destructed` sound. |
| `PlaceableDestructible.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 | ✍ Declares the savegame key `repairingFarm#id`. |
| `PlaceableDestructible.prerequisitesPresent(specializations: table) → boolean` | 42 | ✍ Returns true only if the `PlaceableConstructible` specialization is present. |
| `PlaceableDestructible.registerFunctions(placeableType: any)` | 48 | ✍ Registers seven functions, among them `destruct`, `destructed`, `startRepairDestructible`, `getCanRepairDestructible`, `getCanBeDestructedByTwister` and `onDestructibleTriggerCallback`. Only the trigger callback has a body in the dump. |
| `PlaceableDestructible.registerOverwrittenFunctions(placeableType: any)` | 60 | ✍ Overrides `finalizeConstruction`; its replacement has no body in the dump (UNVERIFIED). |
| `PlaceableDestructible.registerEventListeners(placeableType: any)` | 66 | ✍ Subscribes to `onLoad`, `onDelete` and `onFinalizePlacement`; no `onDelete` body appears in the dump (UNVERIFIED). |
| `PlaceableDestructible:onLoad(savegame: table)` | 75 | ✍ Builds the destruct and repair transition tables from the XML by state name (logging an XML error on an unknown state), reads the repair bonus and trigger node (warning if it lacks the player collision bit), loads the destruction sound on clients and creates the `DestructibleActivatable`. |
| `PlaceableDestructible:onFinalizePlacement()` | 147 | ✍ Registers the destructible trigger callback on the trigger node, if one is defined. |
| `PlaceableDestructible:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 156 | ✍ Saves the repairing farm id when one is set. |
| `PlaceableDestructible:loadFromXMLFile(xmlFile: any, key: any)` | 166 | ✍ Restores the repairing farm id if the farm still exists; otherwise logs a warning. Note: the warning passes `xmlFile` as first argument of `Logging.warning`, which looks like a mistake. |
| `PlaceableDestructible:onDestructibleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any)` | 283 | ✍ Trigger callback: adds the destructible activatable when the local player enters, removes it when the player leaves. |

## Specialization

| Type | Name | Line |
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
