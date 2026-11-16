# vehicles/specializations/WaterTrailer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WaterTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/WaterTrailer.lua` — FS25 1.25.1.0

✍ Specialization that lets a water trailer (needs FillUnit) be refilled from any water plane in the world, not only from a trigger. When the fill node is within 0.2 m of the water height (`self.waterY`, provided by the engine, UNVERIFIED), an activatable is offered; the server then adds water to the configured fill unit at `fillLitersPerSecond` (default 500) and syncs the state with `WaterTrailerSetIsFillingEvent`. The file also defines the helper class `WaterTrailerActivatable`.

- **WaterTrailer** (l.10)
- **WaterTrailerActivatable** (l.197)

## Functions

| Function | Line | Description |
|---|---|---|
| `WaterTrailer.prerequisitesPresent(specializations: table) → boolean` | 16 | ✍ Returns true only if the vehicle type has the `FillUnit` specialization. |
| `WaterTrailer.initSpecialization()` | 22 | ✍ Registers the XML paths `vehicle.waterTrailer#fillUnitIndex`, `#fillLitersPerSecond` (default 500), `#fillNode` (default root component) and the `refill` sound sample. |
| `WaterTrailer.registerFunctions(vehicleType: any)` | 37 | ✍ Adds `setIsWaterTrailerFilling` to the vehicle type. |
| `WaterTrailer.registerOverwrittenFunctions(vehicleType: any)` | 43 | ✍ Overrides `getDrawFirstFillText`. |
| `WaterTrailer.registerEventListeners(vehicleType: any)` | 49 | ✍ Subscribes to onLoad, onDelete, read/write stream, onUpdateTick and onPreDetach. |
| `WaterTrailer:onLoad(savegame: table)` | 61 | ✍ Reads the fill unit index, fill rate and fill node (only when an index is given), creates the activatable, loads the refill sound on the client and sets `needWaterInfo` so the engine provides the water height. Note: onUpdateTick uses `waterFillNode` without a nil check, so a missing `fillUnitIndex` would break it. |
| `WaterTrailer:onDelete()` | 84 | ✍ Removes the activatable from the activatable objects system and deletes the sound samples. |
| `WaterTrailer:onReadStream(streamId: integer, connection: Connection)` | 95 | ✍ Client join: reads the filling boolean and applies it without sending an event. |
| `WaterTrailer:onWriteStream(streamId: integer, connection: Connection)` | 104 | ✍ Server side on join: writes the current filling boolean. |
| `WaterTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 | ✍ Adds or removes the activatable depending on whether the fill node is near the water. On the server, stops filling when leaving the water, and while filling adds water to the fill unit at the configured rate (water must be an allowed fill type); stops when nothing more is added. |
| `WaterTrailer:setIsWaterTrailerFilling(isFilling: boolean, noEventSend: boolean)` | 149 | ✍ Changes the filling state: sends `WaterTrailerSetIsFillingEvent` (unless `noEventSend`), stores the state and plays or stops the refill sound on the client. |
| `WaterTrailer:getDrawFirstFillText(superFunc: any)` | 168 | ✍ Override: on the client, returns true when the trailer is selected and active for input, its fill unit is empty and has non-zero capacity; otherwise defers to the previous implementation. |
| `WaterTrailer:onPreDetach(attacherVehicle: table, implement: table)` | 185 | ✍ Removes the refill activatable just before the trailer is detached. |
| `WaterTrailerActivatable.new(trailer: any)` | 201 | ✍ Constructor: creates the activatable for the given trailer with a placeholder activate text. |
| `WaterTrailerActivatable:getIsActivatable()` | 212 | ✍ Returns true (and refreshes the text) when the trailer is active for input, its fill unit is not full and accepts water. |
| `WaterTrailerActivatable:run()` | 223 | ✍ Toggles the trailer's filling state and refreshes the displayed text. |
| `WaterTrailerActivatable:updateActivateText()` | 230 | ✍ Sets the activate text to the stop-refilling or refill label (localized), formatted with the vehicle type description. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setIsWaterTrailerFilling` | 38 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 44 |
| registerEventListener | `onLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onUpdateTick` | 54 |
| registerEventListener | `onPreDetach` | 55 |
