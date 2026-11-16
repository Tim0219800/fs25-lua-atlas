# vehicles/specializations/ExternalVehicleControl.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ExternalVehicleControl.md)*

Source: `dataS/scripts/vehicles/specializations/ExternalVehicleControl.lua` — FS25 1.25.1.0

✍ Vehicle specialization that lets an on-foot player operate vehicle functions from outside the vehicle. Player triggers are declared under vehicle.externalVehicleControl; other specializations answer the onRegisterExternalActionEvents event to add actions per trigger. A helper class, ExternalVehicleControlActivatable, plugs each trigger into the activatable-objects system and handles input registration. Note: the file does not create the ExternalVehicleControl table or FUNCTION_XML_PATH itself (UNVERIFIED where they are defined).

- **ExternalVehicleControlActivatable** (l.174)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExternalVehicleControl.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no prerequisite specialization is needed. |
| `ExternalVehicleControl.initSpecialization()` | 26 | ✍ Registers the trigger node XML key (vehicle.externalVehicleControl.trigger(?)#node) and the delayed function path with its name attribute, so other specializations can add their own sub-keys. |
| `ExternalVehicleControl.registerEvents(vehicleType: table)` | 41 | ✍ Declares the custom vehicle event onRegisterExternalActionEvents. |
| `ExternalVehicleControl.registerFunctions(vehicleType: table)` | 48 | ✍ Registers the vehicle function registerExternalActionEvent. |
| `ExternalVehicleControl.registerOverwrittenFunctions(vehicleType: table)` | 55 | ✍ Empty: this specialization overrides no vehicle function. |
| `ExternalVehicleControl.registerEventListeners(vehicleType: table)` | 61 | ✍ Subscribes to onLoadFinished, onDelete and onUpdateTick. |
| `ExternalVehicleControl:onLoadFinished(savegame: table)` | 70 | ✍ Builds the trigger list from XML (warns if the node lacks the PLAYER collision bit), adds each trigger, raises onRegisterExternalActionEvents for every named function and creates its activatable. With no trigger, it removes the onDelete and onUpdateTick listeners. |
| `ExternalVehicleControl:onDelete()` | 110 | ✍ Removes each trigger from the engine and its activatable from the activatable-objects system. |
| `ExternalVehicleControl:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 128 | ✍ For every trigger with the player in range, refreshes the activatable text and keeps the vehicle awake with raiseActive. |
| `ExternalVehicleControl:registerExternalActionEvent(trigger: any, name: any, registerFunc: any, updateFunc: any)` | 140 | ✍ Adds an action entry (registration callback and optional text-update callback) to a trigger's control function list and returns that entry. Meant to be called from onRegisterExternalActionEvents listeners. |
| `ExternalVehicleControl.onExternalVehicleControlTriggerCallback(trigger: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 157 | ✍ Trigger callback: only reacts to the local player's root node. On enter it marks the player in range and adds the activatable; on any other state it clears the flag and removes it. |
| `ExternalVehicleControlActivatable.new(vehicle: any, trigger: any)` | 178 | ✍ Constructor: stores the vehicle and trigger, initializes an empty activate text and calls updateText once. |
| `ExternalVehicleControlActivatable:registerCustomInput(inputContext: any)` | 191 | ✍ Calls each registered control function's registration callback with the vehicle, but only in the on-foot player input context, to avoid failed registrations when tabbing into the vehicle. |
| `ExternalVehicleControlActivatable:removeCustomInput(inputContext: any)` | 209 | ✍ Removes the input action events registered for each control function of the trigger. |
| `ExternalVehicleControlActivatable:getIsActivatable()` | 217 | ✍ Returns true if the player may access the vehicle (access handler) and is inside the trigger. |
| `ExternalVehicleControlActivatable:run()` | 227 | ✍ Empty: activation does nothing by itself, actions come from the registered input events. |
| `ExternalVehicleControlActivatable:getDistance(x: any, y: any, z: any)` | 232 | ✍ Returns the distance from the given world position to the trigger node. |
| `ExternalVehicleControlActivatable:updateText()` | 239 | ✍ Calls each control function's update callback (if any) with the vehicle so action texts and states stay current. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onRegisterExternalActionEvents` | 42 |
| registerFunction | `registerExternalActionEvent` | 49 |
| registerEventListener | `onLoadFinished` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onUpdateTick` | 64 |
