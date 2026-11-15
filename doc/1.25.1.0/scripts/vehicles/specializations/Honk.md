# vehicles/specializations/Honk.lua

Source: `dataS/scripts/vehicles/specializations/Honk.lua` — FS25 1.25.1.0

- **Honk** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Honk.prerequisitesPresent(specializations: any)` | 18 |  |
| `Honk.initSpecialization()` | 24 |  |
| `Honk.registerFunctions(vehicleType: any)` | 33 |  |
| `Honk.registerEventListeners(vehicleType: any)` | 41 |  |
| `Honk:onLoad(savegame: any)` | 51 |  |
| `Honk:onDelete()` | 67 |  |
| `Honk:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 74 |  |
| `Honk:onLeaveVehicle()` | 92 |  |
| `Honk:getIsHonkAvailable()` | 98 |  |
| `Honk:setHonkInput()` | 104 |  |
| `Honk:playHonk(isPlaying: any, noEventSend: any)` | 111 |  |
| `Honk:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 132 |  |
| `Honk.actionEventHonk(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 148 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsHonkAvailable` | 34 |
| registerFunction | `setHonkInput` | 35 |
| registerFunction | `playHonk` | 36 |
| registerEventListener | `onLoad` | 42 |
| registerEventListener | `onDelete` | 43 |
| registerEventListener | `onUpdate` | 44 |
| registerEventListener | `onLeaveVehicle` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
