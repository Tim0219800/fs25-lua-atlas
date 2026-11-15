# vehicles/specializations/WaterTrailer.lua

Source : `dataS/scripts/vehicles/specializations/WaterTrailer.lua` — FS25 1.25.1.0

- **WaterTrailer** (l.10)
- **WaterTrailerActivatable** (l.197)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WaterTrailer.prerequisitesPresent(specializations: table) → boolean` | 16 |  |
| `WaterTrailer.initSpecialization()` | 22 |  |
| `WaterTrailer.registerFunctions(vehicleType: any)` | 37 |  |
| `WaterTrailer.registerOverwrittenFunctions(vehicleType: any)` | 43 |  |
| `WaterTrailer.registerEventListeners(vehicleType: any)` | 49 |  |
| `WaterTrailer:onLoad(savegame: table)` | 61 |  |
| `WaterTrailer:onDelete()` | 84 |  |
| `WaterTrailer:onReadStream(streamId: integer, connection: Connection)` | 95 |  |
| `WaterTrailer:onWriteStream(streamId: integer, connection: Connection)` | 104 |  |
| `WaterTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 |  |
| `WaterTrailer:setIsWaterTrailerFilling(isFilling: boolean, noEventSend: boolean)` | 149 |  |
| `WaterTrailer:getDrawFirstFillText(superFunc: any)` | 168 |  |
| `WaterTrailer:onPreDetach(attacherVehicle: table, implement: table)` | 185 |  |
| `WaterTrailerActivatable.new(trailer: any)` | 201 |  |
| `WaterTrailerActivatable:getIsActivatable()` | 212 |  |
| `WaterTrailerActivatable:run()` | 223 |  |
| `WaterTrailerActivatable:updateActivateText()` | 230 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setIsWaterTrailerFilling` | 38 |
| registerOverwrittenFunction | `getDrawFirstFillText` | 44 |
| registerEventListener | `onLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onUpdateTick` | 54 |
| registerEventListener | `onPreDetach` | 55 |
