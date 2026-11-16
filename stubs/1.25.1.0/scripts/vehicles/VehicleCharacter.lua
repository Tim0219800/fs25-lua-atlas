---@meta
-- FS25 1.25.1.0 : vehicles/VehicleCharacter.lua (generated stub, FS25 Lua Atlas)

--- Visible driver/passenger character model of a vehicle seat. It reads a character node and IK or animation settings from the vehicle XML, loads a `HumanModel` from a `PlayerStyle`, links it to the vehicle, drives IK chains (or an animation set, optionally an idle clip), hides the model when the camera is too close and throttles updates by distance. Used by the vehicle specializations that show characters; not a specialization itself.
---@class VehicleCharacter
VehicleCharacter = {}

--- Creates the character holder for a vehicle: no node or model yet, updates allowed, empty IK targets, animation off and invisible. Accepts a custom metatable.
---@param vehicle any
---@param customMt any
function VehicleCharacter.new(vehicle, customMt) end

--- Reads the character settings from the vehicle XML node (`#node`, `#cameraMinDistance`, `#useAnimation`, spine and distance options, IK targets) and hides the node. Returns true if a character node was found, false otherwise.
---@param xmlFile any
---@param xmlNode any
function VehicleCharacter:load(xmlFile, xmlNode) end

--- Returns the vehicle component that contains the character node.
function VehicleCharacter:getParentComponent() end

--- Asynchronously creates and loads a `HumanModel` for the given `PlayerStyle`, deleting any previous model. With a nil style it calls the callback immediately with false. Completion goes through `characterLoaded`, then the supplied callback.
---@param playerStyle any
---@param asyncCallbackObject any
---@param asyncCallbackFunction any
---@param asyncCallbackArguments any
function VehicleCharacter:loadCharacter(playerStyle, asyncCallbackObject, asyncCallbackFunction, asyncCallbackArguments) end

--- Callback of the model load. On success links the model to the character node, applies IK targets and spine rotation, sets up the animation set or idle clip, then loads the style asynchronously. On failure deletes the model and logs an error. Always calls the user callback.
---@param loadingState any
---@param arguments any
function VehicleCharacter:characterLoaded(loadingState, arguments) end

--- Destroys the character by unloading the model.
function VehicleCharacter:delete() end

--- Deletes the player model and the conditional animation player if present, and restores the distance reference node to the custom or character node.
function VehicleCharacter:unloadCharacter() end

--- Marks IK chains as needing recomputation: all when `setAllDirty` is true, otherwise only those whose target is itself flagged dirty. Needs a loaded model.
---@param setAllDirty any
function VehicleCharacter:setDirty(setAllDirty) end

--- Recomputes the IK chains of the player model right away. Errors if no model is loaded.
function VehicleCharacter:updateIKChains() end

--- Finds the IK chain bound to the given target and applies the pose id to it. Does nothing if no model or no matching chain.
---@param target any
---@param poseId any
function VehicleCharacter:setIKChainPoseByTarget(target, poseId) end

--- Leans the spine according to acceleration: applies a dead zone, maps acceleration to a rotation between the min and max angles, smooths it and marks IK dirty. Note: it uses `self.player.spineNode`, but `self.player` is never set in this file, so it looks unusable as is.
---@param acc any
function VehicleCharacter:setSpineDirty(acc) end

--- Shows the character only when the style is loaded and the active camera is at least `cameraMinDistance` from the reference node (head by default); skipped if either entity is missing.
function VehicleCharacter:updateVisibility() end

--- Sets visibility on the character node and on the loaded player model, and remembers the state in `isVisible`.
---@param isVisible any
function VehicleCharacter:setCharacterVisibility(isVisible) end

--- Enables or disables the regular IK dirty-flag update of the character.
---@param state any
function VehicleCharacter:setAllowCharacterUpdate(state) end

--- Returns whether the character update is allowed.
function VehicleCharacter:getAllowCharacterUpdate() end

--- Per-frame update for a loaded model: when the platform allows it and the vehicle is within `maxUpdateDistance` and the character visible, refreshes IK; also starts or stops the idle animation track depending on that distance.
---@param dt any
function VehicleCharacter:update(dt) end

--- Returns the table of IK chain targets.
function VehicleCharacter:getIKChainTargets() end

--- Replaces the IK targets (if different or forced) and, with a loaded model, applies them to the chains and marks all dirty.
---@param targets any
---@param force any
function VehicleCharacter:setIKChainTargets(targets, force) end

--- Returns the style of the loaded player model, or nil if none.
function VehicleCharacter:getPlayerStyle() end

--- Registers the XML schema entries for a character under `basePath`: node, camera and distance options, animation flags, spine settings, update and clip distances, plus the IK chain targets.
---@param schema any
---@param basePath any
---@param name any
function VehicleCharacter.registerCharacterXMLPaths(schema, basePath, name) end
