# vehicles/VehicleCharacter.lua

*[Version française](../../fr/scripts/vehicles/VehicleCharacter.md)*

Source: `dataS/scripts/vehicles/VehicleCharacter.lua` — FS25 1.25.1.0

✍ Visible driver/passenger character model of a vehicle seat. It reads a character node and IK or animation settings from the vehicle XML, loads a `HumanModel` from a `PlayerStyle`, links it to the vehicle, drives IK chains (or an animation set, optionally an idle clip), hides the model when the camera is too close and throttles updates by distance. Used by the vehicle specializations that show characters; not a specialization itself.

- **VehicleCharacter** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleCharacter.new(vehicle: any, customMt: any)` | 17 | ✍ Creates the character holder for a vehicle: no node or model yet, updates allowed, empty IK targets, animation off and invisible. Accepts a custom metatable. |
| `VehicleCharacter:load(xmlFile: any, xmlNode: any)` | 34 | ✍ Reads the character settings from the vehicle XML node (`#node`, `#cameraMinDistance`, `#useAnimation`, spine and distance options, IK targets) and hides the node. Returns true if a character node was found, false otherwise. |
| `VehicleCharacter:getParentComponent()` | 71 | ✍ Returns the vehicle component that contains the character node. |
| `VehicleCharacter:loadCharacter(playerStyle: any, asyncCallbackObject: any, asyncCallbackFunction: any, asyncCallbackArguments: any)` | 77 | ✍ Asynchronously creates and loads a `HumanModel` for the given `PlayerStyle`, deleting any previous model. With a nil style it calls the callback immediately with false. Completion goes through `characterLoaded`, then the supplied callback. |
| `VehicleCharacter:characterLoaded(loadingState: any, arguments: any)` | 100 | ✍ Callback of the model load. On success links the model to the character node, applies IK targets and spine rotation, sets up the animation set or idle clip, then loads the style asynchronously. On failure deletes the model and logs an error. Always calls the user callback. |
| `VehicleCharacter:delete()` | 196 | ✍ Destroys the character by unloading the model. |
| `VehicleCharacter:unloadCharacter()` | 202 | ✍ Deletes the player model and the conditional animation player if present, and restores the distance reference node to the custom or character node. |
| `VehicleCharacter:setDirty(setAllDirty: any)` | 219 | ✍ Marks IK chains as needing recomputation: all when `setAllDirty` is true, otherwise only those whose target is itself flagged dirty. Needs a loaded model. |
| `VehicleCharacter:updateIKChains()` | 231 | ✍ Recomputes the IK chains of the player model right away. Errors if no model is loaded. |
| `VehicleCharacter:setIKChainPoseByTarget(target: any, poseId: any)` | 237 | ✍ Finds the IK chain bound to the given target and applies the pose id to it. Does nothing if no model or no matching chain. |
| `VehicleCharacter:setSpineDirty(acc: any)` | 250 | ✍ Leans the spine according to acceleration: applies a dead zone, maps acceleration to a rotation between the min and max angles, smooths it and marks IK dirty. Note: it uses `self.player.spineNode`, but `self.player` is never set in this file, so it looks unusable as is. |
| `VehicleCharacter:updateVisibility()` | 265 | ✍ Shows the character only when the style is loaded and the active camera is at least `cameraMinDistance` from the reference node (head by default); skipped if either entity is missing. |
| `VehicleCharacter:setCharacterVisibility(isVisible: any)` | 277 | ✍ Sets visibility on the character node and on the loaded player model, and remembers the state in `isVisible`. |
| `VehicleCharacter:setAllowCharacterUpdate(state: any)` | 290 | ✍ Enables or disables the regular IK dirty-flag update of the character. |
| `VehicleCharacter:getAllowCharacterUpdate()` | 296 | ✍ Returns whether the character update is allowed. |
| `VehicleCharacter:update(dt: any)` | 302 | ✍ Per-frame update for a loaded model: when the platform allows it and the vehicle is within `maxUpdateDistance` and the character visible, refreshes IK; also starts or stops the idle animation track depending on that distance. |
| `VehicleCharacter:getIKChainTargets()` | 335 | ✍ Returns the table of IK chain targets. |
| `VehicleCharacter:setIKChainTargets(targets: any, force: any)` | 341 | ✍ Replaces the IK targets (if different or forced) and, with a loaded model, applies them to the chains and marks all dirty. |
| `VehicleCharacter:getPlayerStyle()` | 356 | ✍ Returns the style of the loaded player model, or nil if none. |
| `VehicleCharacter.registerCharacterXMLPaths(schema: any, basePath: any, name: any)` | 366 | ✍ Registers the XML schema entries for a character under `basePath`: node, camera and distance options, animation flags, spine settings, update and clip distances, plus the IK chain targets. |
