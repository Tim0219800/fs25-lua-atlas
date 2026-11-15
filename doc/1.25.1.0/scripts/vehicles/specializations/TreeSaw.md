# vehicles/specializations/TreeSaw.lua

Source: `dataS/scripts/vehicles/specializations/TreeSaw.lua` — FS25 1.25.1.0

- **TreeSaw** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TreeSaw.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `TreeSaw.initSpecialization()` | 23 |  |
| `TreeSaw.registerEventListeners(vehicleType: any)` | 45 |  |
| `TreeSaw:onLoad(savegame: table)` | 61 |  |
| `TreeSaw:onDelete()` | 95 |  |
| `TreeSaw:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 107 |  |
| `TreeSaw:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 119 |  |
| `TreeSaw:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 131 |  |
| `TreeSaw:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 187 |  |
| `TreeSaw:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 250 |  |
| `TreeSaw:onDeactivate()` | 264 |  |
| `TreeSaw:onTurnedOn()` | 273 |  |
| `TreeSaw:onTurnedOff()` | 283 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onReadUpdateStream` | 48 |
| registerEventListener | `onWriteUpdateStream` | 49 |
| registerEventListener | `onUpdate` | 50 |
| registerEventListener | `onUpdateTick` | 51 |
| registerEventListener | `onDraw` | 52 |
| registerEventListener | `onDeactivate` | 53 |
| registerEventListener | `onTurnedOn` | 54 |
| registerEventListener | `onTurnedOff` | 55 |
