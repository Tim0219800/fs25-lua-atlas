---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Shovel.lua (generated stub, FS25 Lua Atlas)

--- Specialization for shovels and buckets that scoop loose material (height-map fill types) from the ground into a fill unit and can tip it out by tilting. It requires FillUnit, FillVolume, Dischargeable and BunkerSiloInteractor. The pickup runs on the server in onUpdateTick over one or more `vehicle.shovel.shovelNode` entries; the loading fill type is synchronised to clients through the update stream so they can play the fill effect. Discharge is driven by the tilt angle of a `dischargeInfo` node instead of the normal toggle.
---@class Shovel
Shovel = {}

--- Returns true only if the vehicle type has FillUnit, FillVolume, Dischargeable and BunkerSiloInteractor.
---@param specializations any
function Shovel.prerequisitesPresent(specializations) end

--- Declares the XML schema: global flags (`ignoreFillUnitFillType`, `useSpeedLimit`), the shovelNode attributes (node, fill unit, load info, width, length, offsets, movement and angle conditions, liters per second, smoothing), the `dischargeInfo` node and angles, and the fill effects.
function Shovel.initSpecialization() end

--- Registers `loadShovelNode`, `getShovelNodeIsActive`, `getCanShovelAtPosition`, `getShovelTipFactor` and `getIsShovelEffectState`.
---@param vehicleType any
function Shovel.registerFunctions(vehicleType) end

--- Overrides the discharge hooks (`getIsDischargeNodeActive`, `getDischargeNodeEmptyFactor`, `handleDischarge`, `handleDischargeOnEmpty`, `handleDischargeRaycast`, `getCanToggleDischargeToObject`, `getCanToggleDischargeToGround`) plus `getWearMultiplier` and `doCheckSpeedLimit`.
---@param vehicleType any
function Shovel.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onDelete, onUpdateTick and onFillUnitFillLevelChanged.
---@param vehicleType any
function Shovel.registerEventListeners(vehicleType) end

--- Reads the global flags, every `shovelNode`, the `dischargeInfo` (node plus min/max speed angles, which are mandatory when the node is set) and the client fill effects, and allocates the dirty flag. Removes the network and tick listeners if no shovel node loaded. Note: returns false when the angles are missing, before the effects and dirty flag are set up.
---@param savegame any
function Shovel:onLoad(savegame) end

--- Deletes the fill effects.
function Shovel:onDelete() end

--- Client on join: reads the current loading fill type from the stream.
---@param streamId any
---@param connection any
function Shovel:onReadStream(streamId, connection) end

--- Server on join: writes the current loading fill type to the stream.
---@param streamId any
---@param connection any
function Shovel:onWriteStream(streamId, connection) end

--- Client side: when the server flagged a change, reads the new loading fill type.
---@param streamId any
---@param timestamp any
---@param connection any
function Shovel:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: if the effect dirty flag is set in the mask, writes true and the loading fill type; otherwise writes false.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Shovel:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: for each active shovel node, scoops material along the node line from the density height map into the fill unit (limited by free capacity, liters per second and farmland access), may raise capacity temporarily, notifies the bunker silo, resets the fill level for inactive nodes with `resetFillLevel`, and smooths the ground when moving backward. Tracks the loading fill type with a 500 ms hold and raises the dirty flag on change. Client: starts or stops the fill effects.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Shovel:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server: once the fill level falls back to the default capacity, restores the default capacity of a fill unit whose capacity the shovel had increased.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Shovel:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Reads one shovel node (node, fill unit, load info, size, offsets, movement, liters per second converted to per millisecond, max pickup angle, attacher requirement, reset/ignore flags, smoothing settings). Returns false with an XML warning if the node is missing.
---@param xmlFile any
---@param key any
---@param shovelNode any
function Shovel:loadShovelNode(xmlFile, key, shovelNode) end

--- Returns whether the node may pick up now: moving forward along its local z (if movement is required, updating its last position), pickup angle not above the maximum, and an attacher vehicle present when required.
---@param shovelNode any
function Shovel:getShovelNodeIsActive(shovelNode) end

--- For the discharge node tied to the shovel discharge info, returns false while the tip factor is 0; otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function Shovel:getIsDischargeNodeActive(superFunc, dischargeNode) end

--- Multiplies the parent's empty factor by the tip factor for the shovel's discharge node, so tipping further empties faster.
---@param superFunc any
---@param dischargeNode any
function Shovel:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

--- Skips the parent handling for the shovel's own discharge node when a discharge info node exists; other nodes use the parent.
---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Shovel:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- Skips the parent handling entirely when a discharge info node is defined.
---@param superFunc any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Shovel:handleDischargeOnEmpty(superFunc, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- For the shovel discharge node: sets the discharge state to OBJECT when the raycast hits an object that accepts the fill type and has free capacity, otherwise back to OFF; with no object, sets GROUND if tipped, filled, allowed on ground, owned land and valid position, else shows warnings for the active player. Other nodes use the parent.
---@param superFunc any
---@param dischargeNode any
---@param hitObject any
---@param hitShape any
---@param hitDistance any
---@param hitFillUnitIndex any
---@param hitTerrain any
function Shovel:handleDischargeRaycast(superFunc, dischargeNode, hitObject, hitShape, hitDistance, hitFillUnitIndex, hitTerrain) end

--- Returns false when a discharge info node exists (tilt controls discharge); otherwise defers to the parent.
---@param superFunc any
function Shovel:getCanToggleDischargeToObject(superFunc) end

--- Returns false when a discharge info node exists; otherwise defers to the parent.
---@param superFunc any
function Shovel:getCanToggleDischargeToGround(superFunc) end

--- Returns 0 to 1 from the angle between the discharge info node's z axis and the world vertical, interpolated between `minSpeedAngle` and `maxSpeedAngle` (radians); returns 0 below the minimum or without a node.
function Shovel:getShovelTipFactor() end

--- Returns whether a fill type is currently being loaded, and that fill type (FillType.UNKNOWN if none).
---@return boolean
function Shovel:getIsShovelEffectState() end

--- Adds the work wear multiplier to the parent value while material is being loaded.
---@param superFunc any
---@return number
function Shovel:getWearMultiplier(superFunc) end

--- Returns true if the parent does, or if `useSpeedLimit` is set and the vehicle is turned on (or cannot be turned on).
---@param superFunc any
---@return boolean
function Shovel:doCheckSpeedLimit(superFunc) end

--- Returns whether the node may pick up at its current position: always true if farmland state is ignored or the line is in a free access area, otherwise both ends of the node width must be on land the active farm can access. Returns false for a nil node.
---@param shovelNode any
function Shovel:getCanShovelAtPosition(shovelNode) end

--- Debug helper: appends the discharge node angle, min and max speed angles (in degrees) and the resulting tip factor (or an out-of-range text) to the given values table.
---@param values any
function Shovel:updateDebugValues(values) end
