# vehicles/specializations/TireTracks.lua

Source : `dataS/scripts/vehicles/specializations/TireTracks.lua` — FS25 1.25.1.0

- **TireTracks** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TireTracks.prerequisitesPresent(specializations: any)` | 17 |  |
| `TireTracks.initSpecialization()` | 23 |  |
| `TireTracks.registerFunctions(vehicleType: any)` | 28 |  |
| `TireTracks.registerOverwrittenFunctions(vehicleType: any)` | 37 |  |
| `TireTracks.registerEventListeners(vehicleType: any)` | 42 |  |
| `TireTracks:onPreLoad(savegame: table)` | 51 |  |
| `TireTracks:onDelete()` | 63 |  |
| `TireTracks:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 |  |
| `TireTracks:getAllowTireTracks()` | 91 |  |
| `TireTracks:addTireTrackNode(wheel: any, parent: any, linkNode: any, tireTrackAtlasIndex: any, width: any, radius: any, inverted: any, activeFunc: any)` | 97 |  |
| `TireTracks:removeTireTrackNode(tireTrackNodeIndex: any)` | 126 |  |
| `TireTracks:updateTireTrackNode(tireTrackNode: any, allowTireTracks: any)` | 134 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getAllowTireTracks` | 29 |
| registerFunction | `addTireTrackNode` | 30 |
| registerFunction | `removeTireTrackNode` | 31 |
| registerFunction | `updateTireTrackNode` | 32 |
| registerEventListener | `onPreLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onUpdate` | 45 |
