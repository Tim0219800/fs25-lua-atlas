# vehicles/specializations/LiftableAxle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/LiftableAxle.md)*

Source: `dataS/scripts/vehicles/specializations/LiftableAxle.lua` — FS25 1.25.1.0

✍ Specialization for trailers with a lift axle driven by an animation. The axle can be toggled manually (input action), automatically from a fill unit's fill level, or set to a fixed fraction so attacher joints match the height of the tractor hitch. It supports a `liftableAxle` vehicle configuration, saves its state and height, and syncs through `LiftableAxleEvent`. No prerequisites; the class table is created outside this file (UNVERIFIED where).


## Functions

| Function | Line | Description |
|---|---|---|
| `LiftableAxle.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: no other specialization is required. |
| `LiftableAxle.initSpecialization()` | 26 | ✍ Registers the `liftableAxle` configuration type, the XML paths (base and per configuration) and the savegame attributes `state` and `height`. |
| `LiftableAxle.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Registers the XML paths of one liftable axle block: input action, animation name and speed, default state, fill unit and threshold, dependent (input) attacher joints with min/max joint heights, and lift/lower texts. |
| `LiftableAxle.registerFunctions(vehicleType: table)` | 69 | ✍ Registers `setLiftableAxleState` and `getLiftableAxleAttacherJointHeight` on the vehicle type. |
| `LiftableAxle.registerOverwrittenFunctions(vehicleType: table)` | 77 | ✍ Overrides `getIsSmoothAttachUpdateAllowed`. |
| `LiftableAxle.registerEventListeners(vehicleType: table)` | 84 | ✍ Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onFillUnitFillLevelChanged, onPreAttachImplement, onPreDetachImplement, onPreAttach, onPreDetach and onRegisterActionEvents. |
| `LiftableAxle:onLoad(savegame: table)` | 100 | ✍ Picks the configuration block and loads animation, fill unit trigger, dependent joint data and texts. A numeric `defaultState` other than 0/1 becomes a fixed height. Removes every listener that is not needed (no animation, client/server role, missing data). |
| `LiftableAxle:onPostLoad(savegame: any)` | 195 | ✍ Restores the saved state and height (unless vehicles are reset) and applies them immediately without animation and without sending an event. |
| `LiftableAxle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 | ✍ Saves the axle state and, if set, the fixed height; does nothing when no animation is configured. |
| `LiftableAxle:onReadStream(streamId: any, connection: any)` | 224 | ✍ Client join: reads the state and optional fixed height and applies them instantly. |
| `LiftableAxle:onWriteStream(streamId: any, connection: any)` | 237 | ✍ Server join: writes the state and the optional fixed height. |
| `LiftableAxle:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 248 | ✍ Server only, once the vehicle is synchronised: when the watched fill unit changes, lifts the axle if its fill percentage exceeds the threshold, lowers it otherwise. |
| `LiftableAxle:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 264 | ✍ When an implement is attached to a listed joint, computes the axle fraction that matches the implement's attacher height and sets it as a fixed height. |
| `LiftableAxle:onPreDetachImplement(implement: any)` | 295 | ✍ When an implement leaves a listed joint, deactivates it; if no listed joint remains active, returns to the default state or default fixed height. |
| `LiftableAxle:onPreAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 333 | ✍ When this vehicle is attached via a listed input joint, reads the parent's hitch height (via `getLiftableAxleAttacherJointHeight` or the mean of its upper and lower distance) and sets the matching fixed height. |
| `LiftableAxle:onPreDetach(attacherVehicle: any, implement: any)` | 375 | ✍ When detached from the parent through a listed input joint, deactivates it and restores the default state or height if no such joint remains active. |
| `LiftableAxle:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 413 | ✍ Client: registers the configured input action (high text priority) while the vehicle is active for input, and refreshes its label. |
| `LiftableAxle.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 427 | ✍ Input callback: toggles the axle state. |
| `LiftableAxle.updateActionEvents(self: any)` | 434 | ✍ Sets the input hint to the lift or lower text depending on the current state. |
| `LiftableAxle:setLiftableAxleState(state: any, fixedHeight: any, skipAnimation: any, noEventSend: any)` | 445 | ✍ Sets the lift state, optionally a fixed height (0 to 1, which also forces state to height >= 0.5), and plays the animation, or skips it. Always calls `LiftableAxleEvent.sendEvent` for multiplayer sync unless `noEventSend` is set. |
| `LiftableAxle:getLiftableAxleAttacherJointHeight(attacherJointIndex: any)` | 481 | ✍ Returns the current hitch height for an attacher joint covered by an active dependent joint entry, or nil otherwise. |
| `LiftableAxle:getIsSmoothAttachUpdateAllowed(superFunc: any, implement: any)` | 501 | ✍ Override: smooth attach updating is refused while the axle animation is playing. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setLiftableAxleState` | 70 |
| registerFunction | `getLiftableAxleAttacherJointHeight` | 71 |
| registerOverwrittenFunction | `getIsSmoothAttachUpdateAllowed` | 78 |
| registerEventListener | `onLoad` | 85 |
| registerEventListener | `onPostLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onFillUnitFillLevelChanged` | 89 |
| registerEventListener | `onPreAttachImplement` | 90 |
| registerEventListener | `onPreDetachImplement` | 91 |
| registerEventListener | `onPreAttach` | 92 |
| registerEventListener | `onPreDetach` | 93 |
| registerEventListener | `onRegisterActionEvents` | 94 |
