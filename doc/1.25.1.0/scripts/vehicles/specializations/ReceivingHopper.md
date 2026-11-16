# vehicles/specializations/ReceivingHopper.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ReceivingHopper.md)*

Source: `dataS/scripts/vehicles/specializations/ReceivingHopper.lua` — FS25 1.25.1.0

✍ Vehicle specialization for receiving hoppers that take tipped goods (such as potatoes) and optionally spawn boxes (pallet-like vehicles) to fill. Requires FillUnit and Dischargeable. Box spawning runs on the server only, can be toggled by the player with an action event, is synchronised through ReceivingHopperSetCreateBoxesEvent and saved as createBoxes in the savegame. XML under vehicle.receivingHopper: fill unit index, spawn place node and one box file per fill type.

- **ReceivingHopper** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ReceivingHopper.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Returns true only if the vehicle type has both the FillUnit and Dischargeable specializations. |
| `ReceivingHopper.initSpecialization()` | 27 | ✍ Registers the XML schema entries (fill unit index, box spawn place node, box fill type and filename) and the savegame key for createBoxes. |
| `ReceivingHopper.registerFunctions(vehicleType: any)` | 44 | ✍ Registers setCreateBoxes, getCanSpawnNextBox, collisionTestCallback, createBox and onCreateBoxFinished on the vehicle type. |
| `ReceivingHopper.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Overrides handleDischargeRaycast and getCanBeSelected on the vehicle type. |
| `ReceivingHopper.registerEventListeners(vehicleType: any)` | 61 | ✍ Subscribes to onLoad, onUpdateTick, onRegisterActionEvents and onFillUnitFillLevelChanged. |
| `ReceivingHopper:onLoad(savegame: table)` | 71 | ✍ Warns about deprecated XML keys, reads the fill unit index, spawn place and the fill type to box file map, and restores createBoxes from the savegame. Removes the onUpdateTick listener when not on the server. |
| `ReceivingHopper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 127 | ✍ Writes the createBoxes flag into the vehicle savegame XML. |
| `ReceivingHopper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 138 | ✍ Server tick. When box creation is on and the discharge state is off, creates a new box if getCanSpawnNextBox allows it. |
| `ReceivingHopper:setCreateBoxes(state: boolean, noEventSend: boolean)` | 153 | ✍ Changes the box creation flag. If the value differs it sends ReceivingHopperSetCreateBoxesEvent (unless noEventSend), refreshes the action text and forgets the last box. |
| `ReceivingHopper:getCanSpawnNextBox()` | 167 | ✍ Returns true if no box is being created, the current fill type has a box file, the previous box is full and an overlap box test at the spawn place finds no other object or player. |
| `ReceivingHopper:collisionTestCallback(transformId: any)` | 199 | ✍ Overlap callback: flags the spawn place as occupied when the hit node belongs to a registered object or player other than this vehicle. |
| `ReceivingHopper:createBox()` | 210 | ✍ Server only. Loads the box vehicle for the current fill type at the spawn place with VehicleLoadingData, owned by the hopper's farm, and calls onCreateBoxFinished when done. |
| `ReceivingHopper:onCreateBoxFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 237 | ✍ Loading callback: clears the creating flag and, on success, stores the first loaded vehicle as the last box. |
| `ReceivingHopper:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 248 | ✍ Overridden discharge raycast handler. Sets the discharge state to OBJECT while the hit object accepts the fill type and has free capacity, and back to OFF when not. The parent function is not called. |
| `ReceivingHopper:getCanBeSelected(superFunc: any)` | 269 | ✍ Overridden to always return true, so the hopper can be selected by the player. |
| `ReceivingHopper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 275 | ✍ On clients, rebuilds the action events and, when active for input, registers IMPLEMENT_EXTRA to toggle box creation, then updates its text. |
| `ReceivingHopper:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 289 | ✍ Keeps the vehicle awake (raiseActive) whenever the changed fill unit still holds some fill. |
| `ReceivingHopper.actionEventToggleBoxCreation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 297 | ✍ Input callback that flips the box creation flag through setCreateBoxes. |
| `ReceivingHopper.updateActionEvents(self: any)` | 304 | ✍ Sets the action text to the enable or disable pallet spawning label according to the current createBoxes state. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setCreateBoxes` | 45 |
| registerFunction | `getCanSpawnNextBox` | 46 |
| registerFunction | `collisionTestCallback` | 47 |
| registerFunction | `createBox` | 48 |
| registerFunction | `onCreateBoxFinished` | 49 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 55 |
| registerOverwrittenFunction | `getCanBeSelected` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onUpdateTick` | 63 |
| registerEventListener | `onRegisterActionEvents` | 64 |
| registerEventListener | `onFillUnitFillLevelChanged` | 65 |
