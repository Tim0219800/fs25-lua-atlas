# vehicles/specializations/AutoLoaderBales.lua

Source : `dataS/scripts/vehicles/specializations/AutoLoaderBales.lua` — FS25 1.25.1.0

- **AutoLoaderBales** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutoLoaderBales.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `AutoLoaderBales.initSpecialization()` | 24 |  |
| `AutoLoaderBales.registerFunctions(vehicleType: any)` | 50 |  |
| `AutoLoaderBales.registerOverwrittenFunctions(vehicleType: any)` | 59 |  |
| `AutoLoaderBales.registerEventListeners(vehicleType: any)` | 64 |  |
| `AutoLoaderBales:onLoad(savegame: table)` | 74 |  |
| `AutoLoaderBales:onLoadFinished(savegame: table)` | 123 |  |
| `AutoLoaderBales:onDelete()` | 148 |  |
| `AutoLoaderBales:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 177 |  |
| `AutoLoaderBales:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 193 |  |
| `AutoLoaderBales.onDeleteAutoLoaderBalesObject(self: any, object: any)` | 227 |  |
| `AutoLoaderBales.onBaleDeleted(self: any, object: any)` | 243 |  |
| `AutoLoaderBales:autoLoaderBalesTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 256 |  |
| `AutoLoaderBales:getAutoLoadBaleTypeFromBale(bale: any)` | 287 |  |
| `AutoLoaderBales:doAutoLoadBale(baleType: any, bale: any)` | 315 |  |
| `AutoLoaderBales:getIsBaleAutoLoadable(bale: any)` | 348 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `autoLoaderBalesTriggerCallback` | 51 |
| registerFunction | `getAutoLoadBaleTypeFromBale` | 52 |
| registerFunction | `doAutoLoadBale` | 53 |
| registerFunction | `getIsBaleAutoLoadable` | 54 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onLoadFinished` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |
