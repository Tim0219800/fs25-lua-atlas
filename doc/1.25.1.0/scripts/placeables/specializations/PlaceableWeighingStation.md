# placeables/specializations/PlaceableWeighingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWeighingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWeighingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization for a vehicle weighing station (weighbridge). A trigger tracks vehicle nodes on the platform and the total mass is shown on one or more digit displays configured under `placeable.weighingStation.display`. Display fonts come from the material manager.

- **PlaceableWeighingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWeighingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableWeighingStation.registerFunctions(placeableType: any)` | 24 | ✍ Registers `updateWeightDisplay`, `setWeightDisplay` and `onWeighingTriggerCallback` on the placeable type. |
| `PlaceableWeighingStation.registerEventListeners(placeableType: any)` | 32 | ✍ Subscribes to onLoad and onDelete. |
| `PlaceableWeighingStation.registerXMLPaths(schema: any, basePath: any)` | 39 | ✍ Declares the weighing station XML keys (trigger node and display settings such as node, font, alignment, size, mask, colors). |
| `PlaceableWeighingStation:onLoad(savegame: table)` | 61 | ✍ Reads the trigger node (logs an error and stops if missing), registers it, and builds each display (font material, alignment, size, scale, mask, colors) as a character line. Starts by showing 0. |
| `PlaceableWeighingStation:onDelete()` | 115 | ✍ Removes the trigger node. |
| `PlaceableWeighingStation:updateWeightDisplay()` | 126 | ✍ Resolves tracked trigger nodes to vehicles (dropping nodes that no longer exist), sums their total mass and shows the sum multiplied by 1000 (so presumably tonnes to kilograms, assumption). |
| `PlaceableWeighingStation:setWeightDisplay(mass: any)` | 153 | ✍ Formats the given number with each display mask (integer and decimal part) and writes the text to its character line. |
| `PlaceableWeighingStation:onWeighingTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 170 | ✍ Trigger callback: on enter or leave, adds or removes the other node from the tracked set and refreshes the displayed weight. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onWeighingTriggerCallback` | 25 |
| registerFunction | `updateWeightDisplay` | 26 |
| registerFunction | `setWeightDisplay` | 27 |
| registerEventListener | `onLoad` | 33 |
| registerEventListener | `onDelete` | 34 |
