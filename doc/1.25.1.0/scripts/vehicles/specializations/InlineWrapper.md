# vehicles/specializations/InlineWrapper.lua

*[Version française](../../../fr/scripts/vehicles/specializations/InlineWrapper.md)*

Source: `dataS/scripts/vehicles/specializations/InlineWrapper.lua` — FS25 1.25.1.0

✍ Vehicle specialization for inline bale wrappers, which wrap a continuous line of bales (requires Foldable and Consumable for the wrap rolls). A bale trigger collects bales to push into the line, a wrap trigger tracks bales being wrapped, and the server builds InlineBale objects from them (InlineBale, InlineBaleSingle and Bale classes are not in this file). It animates pusher, wrapping and push-off animations, wrapping nodes that follow the bale surface, adjustable railings and steering nodes, releases the brake while pushing, consumes wrap per minute, and syncs bale lists to clients. A player can push the line off through input or an activatable. Also registers two store spec values for bale sizes (round and square), and contains the helper class InlineWrapperActivatable.

- **InlineWrapper** (l.11)
- **InlineWrapperActivatable** (l.1347)

## Functions

| Function | Line | Description |
|---|---|---|
| `InlineWrapper.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ Returns true only if the vehicle type has both Foldable and Consumable. |
| `InlineWrapper.initSpecialization()` | 28 | ✍ Registers the two shop spec types for round and square bale sizes, and the XML schema under vehicle.inlineWrapper: triggers, bale types (start node, wrap usage, railing, inline bale file, size), railings, wrapping and steering nodes, animations, pushing brake settings, move threshold, numObjectBits and sounds. |
| `InlineWrapper.registerFunctions(vehicleType: any)` | 84 | ✍ Registers the vehicle functions of the specialization: bale stream read and write, triggers callbacks, wrapping node updates, bale type lookup, railings, steering, push-off and current inline bale accessors. |
| `InlineWrapper.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Overrides getIsFoldAllowed, getIsActive, getBrakeForce and getShowConsumableEmptyWarning. |
| `InlineWrapper.registerEventListeners(vehicleType: any)` | 115 | ✍ Subscribes to load, delete, stream read and write, update, draw, action event, enter and leave vehicle and consumable variation events. |
| `InlineWrapper:onLoad(savegame: table)` | 135 | ✍ Loads triggers, bale types (validated: a start node and inline bale file are required, size decides round or square), railings, wrapping and steering nodes, animation names, push and brake settings and dirty flags. Creates the activatable and, on clients, the wrap, start and stop sounds. |
| `InlineWrapper:onPostLoad(savegame: table)` | 257 | ✍ Sets the railings animation to its end time so the railings start fully open. |
| `InlineWrapper:onDelete()` | 266 | ✍ Removes both triggers, deletes sounds and the activatable, and releases the current inline bale (wakes it, resets wrapping state and wrapper link). |
| `InlineWrapper:onReadStream(streamId: any, connection: any)` | 290 | ✍ Client side initial sync: reads the three bale lists, the current inline bale and the incompatible-bale warning flag, then registers the activatable. |
| `InlineWrapper:onWriteStream(streamId: any, connection: any)` | 310 | ✍ Server side initial sync: writes the three bale lists, the current inline bale (if any) and the warning flag. |
| `InlineWrapper:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 325 | ✍ Client side: when the dirty flag is set in the stream, reads the bale lists and current inline bale and registers the activatable. Always reads the incompatible-bale warning flag. |
| `InlineWrapper:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 350 | ✍ Server side: when the bales dirty flag is raised, writes the bale lists and the current inline bale. Always writes the warning flag. |
| `InlineWrapper:readInlineBales(name: any, streamId: any, connection: any)` | 371 | ✍ Reads a named list of bale object ids from the stream (count stored in numObjectBits bits) and replaces the list in the specialization. |
| `InlineWrapper:writeInlineBales(name: any, streamId: any, connection: any)` | 384 | ✍ Writes a named list of bale ids with its count in numObjectBits bits, warning if the list is longer than the bits allow (raise numObjectBits). |
| `InlineWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 405 | ✍ While the wrapping animation plays, updates the wrapping nodes each frame. |
| `InlineWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 417 | ✍ Main logic. Server: turns pending bales into inline bales (counts wrapped bales for stats and achievement), manages the pusher animation, brake release and the incompatible-bale flag. All sides: tracks the line steering direction, starts or stops the wrapping animation and sounds once a bale moved recently, consumes wrap on the server, moves railings, resets the push-off arm and toggles the push-off input. |
| `InlineWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 693 | ✍ Client only: shows blinking warnings when bales wait while the machine is not unfolded in the allowed range, and when an incompatible bale is present. |
| `InlineWrapper:updateWrappingNodes()` | 711 | ✍ For each wrapping node, finds the nearest bale being wrapped (skipping the pending one) and moves the node's target to the point on that bale's surface computed by the round or square helper, or back to its start translation. Resets the nodes once no inline bale remains. |
| `InlineWrapper:updateRoundBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 785 | ✍ Computes, for a round bale, the world position on its circular cross-section (32 samples, slightly inside the radius) that the wrapping node should aim at. Returns nil values if none qualifies. |
| `InlineWrapper:updateSquareBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 824 | ✍ Computes, for a square bale, the corner of its cross-section (cached as wrappingEdges) that the wrapping node should aim at, choosing the smallest angle among corners not hidden by the bale. Returns nil values if none qualifies. |
| `InlineWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 876 | ✍ Client only: when active for input, binds ACTIVATE_OBJECT to the push-off handler with the unload text, enabled according to getCanPushOff. |
| `InlineWrapper:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 893 | ✍ Refuses folding while bales are inside the inline bale trigger, otherwise defers to the parent. |
| `InlineWrapper:getIsActive(superFunc: any)` | 904 | ✍ Returns true while the brake is being released (or its set state is out of date) so the vehicle keeps updating, otherwise the parent value. |
| `InlineWrapper:getBrakeForce(superFunc: any)` | 915 | ✍ Returns 0 and records the state while pushing requires the brake to be released, otherwise the parent brake force. |
| `InlineWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 927 | ✍ For the wrap consumable type, shows the empty warning only when bales are pending and the fold time check passes. Note: the check uses `or` between the min and max comparisons, so it is always true. |
| `InlineWrapper:getIsInlineBalingAllowed()` | 947 | ✍ Returns true when the machine is unfolded within the allowed range, the pusher and push-off animations are idle at start, and wrap consumable is available. |
| `InlineWrapper:inlineBaleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 968 | ✍ Server only trigger callback for the bale pickup trigger. Tracks entering bales as pending (supported type), incompatible, or already inline; on leaving, removes them and detaches the inline bale from the wrapper once none of its bales remain. Raises the bale dirty flag. |
| `InlineWrapper:inlineWrapTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1027 | ✍ Server only trigger callback for the wrap trigger: adds or removes bales in the list of bales to wrap, keeps the vehicle active and raises the bale dirty flag. |
| `InlineWrapper:getWrapperBaleType(bale: any)` | 1047 | ✍ Returns the configured bale type matching a bale (supports wrapping, same diameter and width for round, same width, height and length for square), or nil if none matches. |
| `InlineWrapper:getAllowBalePushing(bale: any)` | 1076 | ✍ Returns false if the bale is held by a dynamic mount joint, true otherwise. |
| `InlineWrapper:updateWrapperRailings(targetPosition: any, dt: any)` | 1086 | ✍ Moves the current railing width toward the target at a fixed rate per millisecond and sets the railings animation time accordingly. |
| `InlineWrapper:updateInlineSteeringWheels(dirX: any, dirZ: any)` | 1104 | ✍ Aligns each steering node toward the given world direction (x, z), or restores its start rotation when no direction is given. Flags moving tools as dirty when available. |
| `InlineWrapper:onLeaveVehicle()` | 1127 | ✍ Resets the steering amount (rotatedTime) to 0 when the player leaves the vehicle. |
| `InlineWrapper:onEnterVehicle()` | 1133 | ✍ Restores the start rotation of all steering nodes when the player enters the vehicle. |
| `InlineWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 1146 | ✍ When the selected wrap variation carries a color, stores it as the wrap color used for new bales. |
| `InlineWrapper:getCanInteract()` | 1157 | ✍ Returns true if the local player is on foot, has access to the vehicle and stands within the interaction radius of its first component. The radius constant is defined outside this file (UNVERIFIED). |
| `InlineWrapper:getCanPushOff()` | 1178 | ✍ Returns true when an inline bale exists with no pending bale and neither the pusher nor the push-off animation is playing. |
| `InlineWrapper:setCurrentInlineBale(inlineBale: any, isClient: any)` | 1203 | ✍ Stores the current inline bale: on the server as a network id (raising the dirty flag on change), on clients as the object itself when isClient is true. |
| `InlineWrapper:getCurrentInlineBale()` | 1220 | ✍ Returns the current inline bale object resolved from the stored network id, or nil. |
| `InlineWrapper.pushOffInlineBaleEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1226 | ✍ Input callback: on press, the server pushes the bale line off directly, a client sends an InlineWrapperPushOffEvent to the server. |
| `InlineWrapper:pushOffInlineBale()` | 1238 | ✍ Starts the push-off animation forward if it is not already playing and marks the push-off as started so the arm is reset afterwards. |
| `InlineWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 1248 | ✍ Reads from a vehicle XML the min and max bale diameter (round wrappers) or length (square wrappers) over all baleType entries. Returns a table of those values, or nil if none. |
| `InlineWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 1277 | ✍ Shop display helper: returns the bale size as text in cm (a range when min differs from max), or as numbers with unit when returnValues is set, or empty values when absent. |
| `InlineWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 1313 | ✍ Store spec loader for round bale sizes: calls loadSpecValueBaleSize with the round flag. |
| `InlineWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 1319 | ✍ Store spec loader for square bale sizes: calls loadSpecValueBaleSize without the round flag. |
| `InlineWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1325 | ✍ Store spec getter for round bale sizes; returns nil if the store item has no such spec, otherwise the shared formatting result. |
| `InlineWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1335 | ✍ Store spec getter for square bale sizes; returns nil if the store item has no such spec, otherwise the shared formatting result. |
| `InlineWrapperActivatable.new(inlineWrapper: any)` | 1351 | ✍ Creates the activatable object linked to an inline wrapper, with the unload text for the activation prompt. |
| `InlineWrapperActivatable:getIsActivatable()` | 1362 | ✍ Returns true when the player can interact with the wrapper and the bale line can currently be pushed off. |
| `InlineWrapperActivatable:run()` | 1374 | ✍ Executes the activation: the server pushes the bale line off, a client sends an InlineWrapperPushOffEvent to the server. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `readInlineBales` | 85 |
| registerFunction | `writeInlineBales` | 86 |
| registerFunction | `getIsInlineBalingAllowed` | 87 |
| registerFunction | `inlineBaleTriggerCallback` | 88 |
| registerFunction | `inlineWrapTriggerCallback` | 89 |
| registerFunction | `updateWrappingNodes` | 90 |
| registerFunction | `updateRoundBaleWrappingNode` | 91 |
| registerFunction | `updateSquareBaleWrappingNode` | 92 |
| registerFunction | `getWrapperBaleType` | 93 |
| registerFunction | `getAllowBalePushing` | 94 |
| registerFunction | `updateWrapperRailings` | 95 |
| registerFunction | `updateInlineSteeringWheels` | 96 |
| registerFunction | `getCanInteract` | 97 |
| registerFunction | `getCanPushOff` | 98 |
| registerFunction | `setCurrentInlineBale` | 99 |
| registerFunction | `getCurrentInlineBale` | 100 |
| registerFunction | `pushOffInlineBale` | 101 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 107 |
| registerOverwrittenFunction | `getIsActive` | 108 |
| registerOverwrittenFunction | `getBrakeForce` | 109 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 110 |
| registerEventListener | `onLoad` | 116 |
| registerEventListener | `onPostLoad` | 117 |
| registerEventListener | `onDelete` | 118 |
| registerEventListener | `onReadStream` | 119 |
| registerEventListener | `onWriteStream` | 120 |
| registerEventListener | `onReadUpdateStream` | 121 |
| registerEventListener | `onWriteUpdateStream` | 122 |
| registerEventListener | `onUpdate` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onDraw` | 125 |
| registerEventListener | `onRegisterActionEvents` | 126 |
| registerEventListener | `onLeaveVehicle` | 127 |
| registerEventListener | `onEnterVehicle` | 128 |
| registerEventListener | `onConsumableVariationChanged` | 129 |
