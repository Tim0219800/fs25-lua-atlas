# vehicles/specializations/PushHandTool.lua

*[Version française](../../../fr/scripts/vehicles/specializations/PushHandTool.md)*

Source: `dataS/scripts/vehicles/specializations/PushHandTool.lua` — FS25 1.25.1.0

✍ Specialization for walk-behind (push hand) motorized tools such as pedestrian mowers: the driver character walks behind the machine, placed by two ground raycasts and wheel positions, with a handle node, spine bending, custom IK chains and conditional animations. It also has an optional drive mode (animation, capped speed and gear ratio, own character), cutter effects driven by the mower state and network sync of drive mode and effects. Requires Enterable; the code also uses Motorized, Drivable and Foldable specs (UNVERIFIED how the type guarantees them). The class table itself is declared outside the visible dump lines.


## Functions

| Function | Line | Description |
|---|---|---|
| `PushHandTool.initSpecialization()` | 19 | ✍ Registers the XML schema under vehicle.pushHandTool (raycast nodes and smoothing, wheels, handle limits, spine, IK chains, effects, drive mode, custom chain limits, conditional animation) and the savegame driveModeIsActive key. |
| `PushHandTool.prerequisitesPresent(specializations: table) → boolean` | 82 | ✍ Returns true only if the Enterable specialization is present. |
| `PushHandTool.registerFunctions(vehicleType: any)` | 88 | ✍ Registers getRaycastPosition, playerRaycastCallback, postAnimationUpdate, customVehicleCharacterLoaded and setPushHandToolDriveMode on the vehicle type. |
| `PushHandTool.registerOverwrittenFunctions(vehicleType: any)` | 98 | ✍ Overrides setVehicleCharacter, deleteVehicleCharacter, getAllowCharacterVisibilityUpdate, setActiveCameraIndex and getIsFoldAllowed. |
| `PushHandTool.registerEventListeners(vehicleType: any)` | 108 | ✍ Subscribes to load, post load, delete, stream read/write, update stream read/write, update, action events, enter vehicle, camera changed and vehicle character changed events. |
| `PushHandTool:onLoad(savegame: any)` | 125 | ✍ Reads all XML settings, builds animation parameters, the player target node, wheel lists, handle, spine, IK targets, cutter effects (client), custom chain limits and drive mode (stores base motor speed and gear ratio). Sets a grass test area requirement and registers a post animation callback. |
| `PushHandTool:onPostLoad(savegame: any)` | 256 | ✍ If the savegame says drive mode was active, re-enables it without an event and fast-forwards its animation. |
| `PushHandTool:onDelete()` | 268 | ✍ Deletes the cutter effects and removes the post animation callback. |
| `PushHandTool:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 277 | ✍ Saves the drive mode state, only when a drive mode animation name is configured. |
| `PushHandTool:onReadStream(streamId: integer, connection: Connection)` | 288 | ✍ Client on join: reads the drive mode bool, applies it without an event and fast-forwards the animation. |
| `PushHandTool:onWriteStream(streamId: integer, connection: Connection)` | 298 | ✍ Server on join: writes the drive mode state. |
| `PushHandTool:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 309 | ✍ Client: reads whether cutter effects run, plus fruit type and growth state when they do, and stops the effects when they ended. |
| `PushHandTool:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 334 | ✍ Server: writes the effects-running flag, with fruit growth state (4 bits) and fruit type when running. |
| `PushHandTool:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 349 | ✍ Per frame: drives cutter effects (server decides from the mower's last cut, client follows the stream), computes smoothed wheel speed for conditional animation parameters and updates the character animation, adjusts the spine target by direction, and moves the player node behind the tool using the two raycasts, wheel slope and smoothing. If raycasts fail while entered, hides the character and forces an outside camera. |
| `PushHandTool:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 603 | ✍ On clients with a drive mode character, registers the IMPLEMENT_EXTRA4 powered action to toggle drive mode when active for input. |
| `PushHandTool.actionEventToggleDriveMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 620 | ✍ Input callback that toggles drive mode by calling setPushHandToolDriveMode without argument. |
| `PushHandTool:setVehicleCharacter(superFunc: any, playerStyle: any)` | 626 | ✍ Overridden: reloads the normal vehicle character with customVehicleCharacterLoaded as callback, and loads the drive mode character when a player style is given. Note: the parent function is never called. |
| `PushHandTool:deleteVehicleCharacter(superFunc: any)` | 643 | ✍ Overridden: calls the parent, then also unloads the drive mode character. |
| `PushHandTool:customVehicleCharacterLoaded(loadingState: any, arguments: any)` | 654 | ✍ Character load callback. On success it raises onVehicleCharacterChanged, duplicates the IK chain nodes into helper transform groups, applies custom joint limits, assigns the IK targets and solvers (40 iterations), registers the conditional animation parameters and initialises the animation from vehicle.pushHandTool.playerConditionalAnimation. |
| `PushHandTool.driveModeVehicleCharacterLoaded(self: any, loadingState: any, arguments: any)` | 749 | ✍ Callback for the drive mode character: on success, shows it unless the camera is inside and updates its IK chains. |
| `PushHandTool:setPushHandToolDriveMode(driveModeState: any, noEventSend: any)` | 765 | ✍ Sets or toggles (nil) drive mode. On change: swaps motor max forward speed and min gear ratio, updates cruise control limits, plays the animation, folds the tool and hides the normal character. Always sends PushHandToolDriveModeEvent unless noEventSend, even if unchanged. |
| `PushHandTool:getAllowCharacterVisibilityUpdate(superFunc: any)` | 798 | ✍ Overridden: false when the parent refuses, when entered with an inside camera, when raycasts are invalid, or while drive mode is active or animating with its own character. Otherwise true. |
| `PushHandTool:setActiveCameraIndex(superFunc: any, index: any)` | 830 | ✍ Overridden: while raycasts are invalid, replaces an inside camera index by the first outside camera before calling the parent. |
| `PushHandTool:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 854 | ✍ Overridden: returns false while drive mode is active, else the parent result. |
| `PushHandTool:onEnterVehicle(isControlling: any)` | 865 | ✍ Hides the character when controlling with an inside camera or when the raycasts are invalid. |
| `PushHandTool:onCameraChanged(activeCamera: any, camIndex: any)` | 891 | ✍ When entered, hides the normal character for an inside camera and sets the drive mode character visible only for outside cameras. |
| `PushHandTool:onVehicleCharacterChanged(character: any)` | 910 | ✍ When entered with an inside camera, hides the new character. When the character is removed, clears the IK node copies and the spine node. |
| `PushHandTool:postAnimationUpdate(dt: any)` | 930 | ✍ Callback run after animations while active: tilts the handle from the hand-to-target distance within its limits, applies the spine rotation split by ratio over three spine nodes, then (outside drive mode) updates the IK chains, copies the duplicated IK node transforms back and applies the chain poses. |
| `PushHandTool:getRaycastPosition(node: any)` | 1006 | ✍ Casts a 2 m ray down from the node (slightly steepened along world Y) against the player collision mask. Returns the hit x, y, z and distance, or nil when nothing valid is hit (distance above 0.35 and hit lower than 0.25 below the node). |
| `PushHandTool:playerRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any)` | 1023 | ✍ Raycast callback: ignores hits on this vehicle (returns true to continue), otherwise stores the hit position and distance and stops the ray by returning false. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getRaycastPosition` | 89 |
| registerFunction | `playerRaycastCallback` | 90 |
| registerFunction | `postAnimationUpdate` | 91 |
| registerFunction | `customVehicleCharacterLoaded` | 92 |
| registerFunction | `setPushHandToolDriveMode` | 93 |
| registerOverwrittenFunction | `setVehicleCharacter` | 99 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 100 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 101 |
| registerOverwrittenFunction | `setActiveCameraIndex` | 102 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onDelete` | 111 |
| registerEventListener | `onReadStream` | 112 |
| registerEventListener | `onWriteStream` | 113 |
| registerEventListener | `onReadUpdateStream` | 114 |
| registerEventListener | `onWriteUpdateStream` | 115 |
| registerEventListener | `onUpdate` | 116 |
| registerEventListener | `onRegisterActionEvents` | 117 |
| registerEventListener | `onEnterVehicle` | 118 |
| registerEventListener | `onCameraChanged` | 119 |
| registerEventListener | `onVehicleCharacterChanged` | 120 |
