# vehicles/specializations/ReverseDriving.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ReverseDriving.md)*

Source: `dataS/scripts/vehicles/specializations/ReverseDriving.lua` — FS25 1.25.1.0

✍ Vehicle specialization for tractors with a reversible driver seat (reverse driving). Requires Drivable, Enterable and AnimatedVehicle. A named animation (default reverseDriving) turns the cab, the steering wheel and character IK targets are swapped, the reverser direction and light direction follow, and the AI uses a dedicated steering node. The state is saved (isActive), sent to joining clients in the stream and synchronised by ReverseDrivingSetStateEvent. Raises onStartReverseDirectionChange and onReverseDirectionChanged.

- **ReverseDriving** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ReverseDriving.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if Drivable, Enterable and AnimatedVehicle are all present on the vehicle type. |
| `ReverseDriving.initSpecialization()` | 27 | ✍ Registers XML schema entries under vehicle.reverseDriving (IK targets, steering wheel, animation name, character hiding, inverse transmission, initial state, disabling attacher joints, AI nodes), a dashboard group flag, per-light enableDirection, and the savegame isActive key. |
| `ReverseDriving.postInitSpecialization()` | 63 | ✍ For every vehicle configuration type, registers the optional reverseDriving#isAllowed boolean (default true) so a configuration can forbid reverse driving. |
| `ReverseDriving.registerEvents(vehicleType: any)` | 76 | ✍ Declares the events onStartReverseDirectionChange and onReverseDirectionChanged on the vehicle type. |
| `ReverseDriving.registerFunctions(vehicleType: any)` | 83 | ✍ Registers reverseDirectionChanged, setIsReverseDriving and getIsReverseDrivingAllowed on the vehicle type. |
| `ReverseDriving.registerOverwrittenFunctions(vehicleType: any)` | 91 | ✍ Overrides steering wheel and direction, character visibility, AI start and AI node getters, dashboard group loading and activity, selection, additional light attributes and light activity. |
| `ReverseDriving.registerEventListeners(vehicleType: any)` | 108 | ✍ Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onVehicleCharacterChanged and onRegisterActionEvents. |
| `ReverseDriving:onLoad(savegame: table)` | 121 | ✍ Reads XML settings (reversed IK targets, steering wheel, animation name, options, AI steering node and collision trigger) and applies configuration restrictions. hasReverseDriving is true only if the animation exists and no configuration forbids it; otherwise most listeners are removed. |
| `ReverseDriving:onPostLoad(savegame: table)` | 182 | ✍ Caches the default character IK targets, restores the saved isActive state (or the initial one) and applies it with setIsReverseDriving without sending an event and with a forced update. |
| `ReverseDriving:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 | ✍ Writes the reverse driving state to the savegame, only if the vehicle supports reverse driving. |
| `ReverseDriving:onReadStream(streamId: integer, connection: Connection)` | 212 | ✍ Client side on join: reads a bool from the stream and applies it as the reverse driving state without sending an event. |
| `ReverseDriving:onWriteStream(streamId: integer, connection: Connection)` | 223 | ✍ Server side on join: writes the current reverse driving state as a bool. |
| `ReverseDriving:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 232 | ✍ While the direction is changing: hides the character if configured, fast-forwards the animation for a vehicle nobody sits in, calls reverseDirectionChanged when the animation ends, and moves smoothReverserDirection toward the target. |
| `ReverseDriving:reverseDirectionChanged(direction: number)` | 262 | ✍ Ends the change: sets the reverser direction (-1 reversed, 1 normal), restores the proper IK targets and character visibility, refreshes the light mask and raises onReverseDirectionChanged with the given direction. |
| `ReverseDriving:setIsReverseDriving(isReverseDriving: boolean, noEventSend: boolean, forceUpdate: any)` | 300 | ✍ Switches reverse driving: plays the animation forward or backward, freezes character IK updates, optionally inverts the transmission direction, zeroes the reverser, raises onStartReverseDirectionChange, sends ReverseDrivingSetStateEvent unless noEventSend, and marks the AI root node dirty. Runs also when forceUpdate is set, completing the animation instantly. |
| `ReverseDriving:getIsReverseDrivingAllowed(newState: any)` | 335 | ✍ Returns false when asked to enable reverse driving while an implement is attached on one of the disabling attacher joints; true otherwise. |
| `ReverseDriving:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 352 | ✍ Overridden: when reversed, uses the dedicated reverse steering wheel (if defined) and negates the steering direction before calling the parent. |
| `ReverseDriving:getSteeringDirection(superFunc: any)` | 368 | ✍ Overridden: returns the smoothed reverser direction when reverse driving is supported, else the parent value. |
| `ReverseDriving:getAllowCharacterVisibilityUpdate(superFunc: any)` | 379 | ✍ Overridden: the parent result, but false while the direction is changing if the character is configured to be hidden during the change. |
| `ReverseDriving:getCanStartAIVehicle(superFunc: any, jobClass: any)` | 386 | ✍ Overridden: if the vehicle has no AI steering node but supports reverse driving, the AI cannot start while reversed or while changing direction. Otherwise defers to the parent. |
| `ReverseDriving:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 406 | ✍ Overridden: after the parent loads a dashboard group, also reads its isReverseDriving condition. Returns false if the parent fails. |
| `ReverseDriving:getIsDashboardGroupActive(superFunc: any, group: any)` | 418 | ✍ Overridden: a group with an isReverseDriving condition is inactive when it does not match the current state; otherwise the parent decides. |
| `ReverseDriving:getCanBeSelected(superFunc: any)` | 430 | ✍ Overridden to always return true. |
| `ReverseDriving:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 436 | ✍ Overridden: after the parent, reads the optional enableDirection attribute of a light. Returns false if the parent fails. |
| `ReverseDriving:getIsLightActive(superFunc: any, light: any)` | 448 | ✍ Overridden: a light with enableDirection is inactive unless it equals the current reverser direction; otherwise the parent decides. |
| `ReverseDriving:getAIDirectionNode(superFunc: any)` | 460 | ✍ Overridden: while reversed returns the AI steering node if defined, else the parent node. |
| `ReverseDriving:getAIRootNode(superFunc: any)` | 471 | ✍ Overridden: while reversed returns the AI steering node if defined, else the parent node. |
| `ReverseDriving:getAIImplementCollisionTrigger(superFunc: any)` | 482 | ✍ Overridden: while reversed returns the reverse AI collision trigger if one was loaded, else the parent trigger. |
| `ReverseDriving:onVehicleCharacterChanged(character: any)` | 493 | ✍ When a character is set, finishes any pending animation update and assigns the reversed or default IK targets to it. |
| `ReverseDriving:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 512 | ✍ On clients, registers the CHANGE_DRIVING_DIRECTION action (powered action event) when active for input, with its label. |
| `ReverseDriving.actionEventToggleReverseDriving(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 526 | ✍ Input callback: toggles reverse driving if getIsReverseDrivingAllowed accepts the new state. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartReverseDirectionChange` | 77 |
| registerEvent | `onReverseDirectionChanged` | 78 |
| registerFunction | `reverseDirectionChanged` | 84 |
| registerFunction | `setIsReverseDriving` | 85 |
| registerFunction | `getIsReverseDrivingAllowed` | 86 |
| registerOverwrittenFunction | `updateSteeringWheel` | 92 |
| registerOverwrittenFunction | `getSteeringDirection` | 93 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 94 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 95 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 96 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 97 |
| registerOverwrittenFunction | `getCanBeSelected` | 98 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 99 |
| registerOverwrittenFunction | `getIsLightActive` | 100 |
| registerOverwrittenFunction | `getAIDirectionNode` | 101 |
| registerOverwrittenFunction | `getAIRootNode` | 102 |
| registerOverwrittenFunction | `getAIImplementCollisionTrigger` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onReadStream` | 111 |
| registerEventListener | `onWriteStream` | 112 |
| registerEventListener | `onUpdate` | 113 |
| registerEventListener | `onVehicleCharacterChanged` | 114 |
| registerEventListener | `onRegisterActionEvents` | 115 |
