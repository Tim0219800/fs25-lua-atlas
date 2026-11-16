# vehicles/specializations/AIVehicleObstacle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIVehicleObstacle.md)*

Source: `dataS/scripts/vehicles/specializations/AIVehicleObstacle.lua` — FS25 1.25.1.0

✍ Specialization intended to make a vehicle an obstacle for AI navigation. In this SDK dump only the prerequisite check and the event listener registration remain; all handler bodies (onLoad, onDelete, onUpdate, onEnterVehicle, onLeaveVehicle) are stripped, so the actual behaviour is UNVERIFIED.

- **AIVehicleObstacle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIVehicleObstacle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite specialization. |
| `AIVehicleObstacle.registerEventListeners(vehicleType: any)` | 42 | ✍ Subscribes to onLoad, onDelete, onUpdate, onEnterVehicle and onLeaveVehicle. The handler bodies are not in the dump (UNVERIFIED). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onUpdate` | 45 |
| registerEventListener | `onEnterVehicle` | 46 |
| registerEventListener | `onLeaveVehicle` | 47 |
