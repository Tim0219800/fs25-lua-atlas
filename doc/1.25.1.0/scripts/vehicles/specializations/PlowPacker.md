# vehicles/specializations/PlowPacker.lua

*[Version française](../../../fr/scripts/vehicles/specializations/PlowPacker.md)*

Source: `dataS/scripts/vehicles/specializations/PlowPacker.lua` — FS25 1.25.1.0

✍ Specialization for plows fitted with a packer that can be switched off. It requires the Plow, Cultivator and AnimatedVehicle specializations, reads vehicle.plow.packer from the XML and saves the packer state in the savegame. When the packer is on, the plow works as a cultivator-style packer (via FSDensityMapUtil) and AI ground requirements change. The packer is forced on before turning or folding; state changes are synchronised through PlowPackerStateEvent. The constants CULTIVATED_GROUND_TYPES and CLIENT_DM_UPDATE_RADIUS are used but not defined in the dump (UNVERIFIED).

- **PlowPacker** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowPacker.initSpecialization()` | 24 | ✍ Registers the XML keys under vehicle.plow.packer (inputAction, deactivateLeft/Right animations, animationSpeed, foldingConfig, partialDeactivated, lowerAnimation) and the savegame keys packerState and lastPackerState. |
| `PlowPacker.prerequisitesPresent(specializations: any)` | 49 | ✍ Returns true only if the vehicle type has the Plow, Cultivator and AnimatedVehicle specializations. |
| `PlowPacker.registerFunctions(vehicleType: any)` | 57 | ✍ Adds setPackerState and getIsPackerAllowed to the vehicle type. |
| `PlowPacker.registerOverwrittenFunctions(vehicleType: any)` | 64 | ✍ Overrides setRotationMax, setPlowAIRequirements, setFoldState, processCultivatorArea and getUseCultivatorAIRequirements. |
| `PlowPacker.registerEventListeners(vehicleType: any)` | 74 | ✍ Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onUpdateTick, onRegisterActionEvents and onSetLowered. |
| `PlowPacker:onLoad(savegame: any)` | 87 | ✍ Reads the packer XML settings. The packer counts as available only if the folding configuration matches and both deactivate animations exist. Starts with the packer active and loads the toggle texts. |
| `PlowPacker:onPostLoad(savegame: any)` | 118 | ✍ Recomputes the AI requirements, then restores packerState and lastPackerState from the savegame unless vehicles are being reset. Applies the restored animation state immediately. |
| `PlowPacker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 137 | ✍ Writes packerState, and lastPackerState when set, to the savegame, only if the packer is available. |
| `PlowPacker:onReadStream(streamId: integer, connection: Connection)` | 152 | ✍ Client side on join: reads the packer state bool and applies it with animation, if the packer is currently allowed. |
| `PlowPacker:onWriteStream(streamId: integer, connection: Connection)` | 168 | ✍ Server side on join: writes the current packer state bool to the stream when the packer is available. |
| `PlowPacker:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 180 | ✍ Server only. Restores the packer to off after a turn if it was off before, runs a fold change postponed until the packer animations end, and replays the lowering animation if it is out of step. |
| `PlowPacker:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 224 | ✍ Client only. Refreshes the text of the packer action event each tick when the packer is available. |
| `PlowPacker:setRotationMax(superFunc: any, rotationMax: any, noEventSend: any, turnAnimationTime: any)` | 234 | ✍ Server: if the plow rotation target changes, remembers the packer state in lastPackerState and forces the packer on before calling the parent function. |
| `PlowPacker:setPlowAIRequirements(superFunc: any, excludedGroundTypes: any)` | 252 | ✍ When the packer is on or partly deactivated, calls the parent with PlowPacker.CULTIVATED_GROUND_TYPES (not defined in the dump, UNVERIFIED) as excluded ground types; otherwise passes the given list. |
| `PlowPacker:setFoldState(superFunc: any, direction: any, moveToMiddle: any, noEventSend: any)` | 265 | ✍ When folding in a non-turn direction with the packer off, the server turns the packer on and postpones the real fold until its animations end. The fold direction event is still sent to others. Otherwise calls the parent. |
| `PlowPacker:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 302 | ✍ Replaces the cultivator work-area processing: erases tire tracks, then calls FSDensityMapUtil.updatePlowPackerArea and accumulates changed, stat and total areas. Remote clients far from the vehicle skip the update. Returns real area and area. |
| `PlowPacker:getUseCultivatorAIRequirements(superFunc: any) → boolean` | 331 | ✍ Always returns false, so the AI never applies cultivator requirements to this plow. |
| `PlowPacker:setPackerState(newState: any, updateAnimations: any, noEventSend: any)` | 337 | ✍ Sets or toggles (nil) the packer state. Optionally plays the left or right deactivate animation depending on plow rotation, schedules a lowering resync, updates AI requirements and sends PlowPackerStateEvent. |
| `PlowPacker:getIsPackerAllowed()` | 382 | ✍ Returns false while the turn animation plays, when the fold animation is not at its turn-on position, when a fold change is pending, or when no packer is available; true otherwise. |
| `PlowPacker:onSetLowered(lowered: any)` | 405 | ✍ If the packer is allowed and on, plays the packer lowering animation forward or in reverse to follow the lowered state. |
| `PlowPacker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 419 | ✍ Client only. Clears and registers the packer toggle action event (powered, default input IMPLEMENT_EXTRA4) when the vehicle is active for input and a packer exists. |
| `PlowPacker.updateActionEventText(self: any)` | 436 | ✍ Sets the action text to activate or deactivate depending on the packer state, and enables the action only while getIsPackerAllowed returns true. |
| `PlowPacker.actionEventPackerDeactivate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 453 | ✍ Input callback that toggles the packer by calling setPackerState with no argument. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setPackerState` | 58 |
| registerFunction | `getIsPackerAllowed` | 59 |
| registerOverwrittenFunction | `setRotationMax` | 65 |
| registerOverwrittenFunction | `setPlowAIRequirements` | 66 |
| registerOverwrittenFunction | `setFoldState` | 67 |
| registerOverwrittenFunction | `processCultivatorArea` | 68 |
| registerOverwrittenFunction | `getUseCultivatorAIRequirements` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onUpdate` | 79 |
| registerEventListener | `onUpdateTick` | 80 |
| registerEventListener | `onRegisterActionEvents` | 81 |
| registerEventListener | `onSetLowered` | 82 |
