# placeables/specializations/PlaceableRiceFieldActivatable.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableRiceFieldActivatable.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRiceFieldActivatable.lua` — FS25 1.25.1.0

✍ Helper class (not a specialization) that lets the local player interact with one rice field of a PlaceableRiceField. It follows the activatable interface (getIsActivatable, getDistance, run) and opens RiceFieldDialog to choose a water level target. Client-side UI object.

- **PlaceableRiceFieldActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldActivatable.new(riceFieldPlaceable: any)` | 15 | ✍ Creates the activatable for a rice field placeable with no field selected yet and the generic interact text. |
| `PlaceableRiceFieldActivatable:getIsActivatable()` | 28 | ✍ True only if a field index is set, the field exists and the local player's farm can access the land at the field's player trigger. |
| `PlaceableRiceFieldActivatable:setRiceFieldIndex(fieldIndex: any)` | 42 | ✍ Sets which field of the placeable this activatable targets (nil clears it). |
| `PlaceableRiceFieldActivatable:getDistance(posX: any, posY: any, posZ: any)` | 48 | ✍ Returns the horizontal distance (XZ) from the given position to the field's player trigger, or math.huge if no field is selected or it has no trigger node. |
| `PlaceableRiceFieldActivatable:run()` | 63 | ✍ Opens RiceFieldDialog; if accepted, sets the field's water height target to the max water level times the chosen percentage via setWaterHeightTarget. |
