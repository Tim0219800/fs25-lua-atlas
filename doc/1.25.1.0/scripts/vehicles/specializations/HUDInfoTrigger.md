# vehicles/specializations/HUDInfoTrigger.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HUDInfoTrigger.md)*

Source: `dataS/scripts/vehicles/specializations/HUDInfoTrigger.lua` — FS25 1.25.1.0

✍ Vehicle specialization that adds a trigger zone around a vehicle. While the local player, on foot or inside a vehicle belonging to the same vehicle chain, stands in the zone, the vehicle HUD extensions of the root vehicle are drawn even though the player is not controlling it. The trigger tracks entered objects by network id, so it is meant for the local client's display only.


## Functions

| Function | Line | Description |
|---|---|---|
| `HUDInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite on other specializations. |
| `HUDInfoTrigger.initSpecialization()` | 24 | ✍ Registers the XML key vehicle.hudInfoTrigger#triggerNode, the node used as trigger. |
| `HUDInfoTrigger.registerFunctions(vehicleType: table)` | 36 | ✍ Registers getIsPlayerInHudInfoTrigger and getAllowHudInfoTrigger on the vehicle type. |
| `HUDInfoTrigger.registerOverwrittenFunctions(vehicleType: table)` | 44 | ✍ Empty: nothing is overridden. |
| `HUDInfoTrigger.registerEventListeners(vehicleType: table)` | 50 | ✍ Subscribes the specialization to onLoad, onDelete and onUpdate. |
| `HUDInfoTrigger:onLoad(savegame: table)` | 59 | ✍ Reads the trigger node and registers a trigger callback on it. Without a trigger node, removes the onDelete and onUpdate listeners. |
| `HUDInfoTrigger:onDelete()` | 75 | ✍ Removes the trigger registered in onLoad, if any. |
| `HUDInfoTrigger:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 87 | ✍ When the vehicle is not the one controlled and the local player is in the trigger, draws the root vehicle's HUD and keeps the vehicle awake with raiseActive. |
| `HUDInfoTrigger.onHudInfoTriggerCallback(self: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 103 | ✍ Trigger callback. Resolves the entering node to a game object or the local player and keeps a counter per network id: incremented on enter, decremented on leave and removed at zero. Ignores the vehicle itself. |
| `HUDInfoTrigger:getAllowHudInfoTrigger()` | 130 | ✍ Returns true by default; other specializations can override it to forbid the HUD display. |
| `HUDInfoTrigger:getIsPlayerInHudInfoTrigger()` | 136 | ✍ Returns true if the local player is inside the trigger: directly on foot, or through any vehicle of the player's current vehicle chain. Returns false when display is not allowed or there is no local player. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsPlayerInHudInfoTrigger` | 37 |
| registerFunction | `getAllowHudInfoTrigger` | 38 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onDelete` | 52 |
| registerEventListener | `onUpdate` | 53 |
