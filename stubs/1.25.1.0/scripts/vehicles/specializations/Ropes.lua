---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Ropes.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles with visual ropes drawn by a shader on a base node. On the client it reads `vehicle.ropes.rope` entries and each frame pushes shader parameters (cv0, cv2, cv3, cv4) so the rope stretches from the base node to the target node, with optional parameter adjusters driven by node rotation or translation. It has no prerequisites and does nothing on a dedicated server.
---@class Ropes
Ropes = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function Ropes.prerequisitesPresent(specializations) end

--- Declares the `vehicle.ropes.rope` XML schema: base/target nodes and parameters, plus the `baseParameterAdjuster` and `targetParameterAdjuster` children (node, rotation or translation axis and range, min/max target parameters).
function Ropes.initSpecialization() end

--- Registers `loadAdjusterNode`, `updateRopes` and `updateAdjusterNodes` on the vehicle type.
---@param vehicleType any
function Ropes.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onLoadFinished and onPostUpdate.
---@param vehicleType any
function Ropes.registerEventListeners(vehicleType) end

--- Client only: reads each rope (skipping entries without base/target parameters, with a warning), sets the initial shader parameters on the base node and loads the adjusters. Removes the load-finished and post-update listeners if not client or no rope was loaded. Note: the adjuster keys are built without a dot (`ropeKey .. "baseParameterAdjuster"`), which seems to prevent them from being read.
---@param savegame table
function Ropes:onLoad(savegame) end

--- Forces a full rope refresh by calling `updateRopes(9999)` once loading is complete.
---@param savegame table
function Ropes:onLoadFinished(savegame) end

--- Legacy entry point kept for backwards compatibility; it simply calls `Ropes.onPostUpdate` (not registered as a listener in this file).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Ropes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Calls `updateRopes(dt)` every frame to refresh the rope shader parameters.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Ropes:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one adjuster (node, rotation or translation axis and range, min/max target parameters). Returns false with an XML warning if the node or either min/max parameter set is missing.
---@param adjusterNode any
---@param xmlFile any
---@param key any
function Ropes:loadAdjusterNode(adjusterNode, xmlFile, key) end

--- For each rope, sets shader parameters cv0 (base plus adjuster offset), cv2, cv3 (target position in base space) and cv4 (target parameters plus adjuster offset in base space). The `dt` argument is not used.
---@param dt any
function Ropes:updateRopes(dt) end

--- Sums the contributions of a list of adjusters: each maps its node's rotation or translation on one axis to 0..1 over its range and interpolates between its min and max target parameters. Returns the summed x, y, z.
---@param adjusterNodes any
function Ropes:updateAdjusterNodes(adjusterNodes) end
