---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WindBending.lua (generated stub, FS25 Lua Atlas)

--- Client-side specialization that makes foliage-like shapes (e.g. crop on a header or load) bend according to vehicle motion, by feeding the `directionBend` shader parameter. It has no prerequisites and registers no functions of its own; it only reacts to onLoad and onUpdate. Nodes are declared under `vehicle.windBending.windBendingNodes.windBendingNode`.
---@class WindBending
WindBending = {}

--- Always returns true: this specialization has no prerequisite specializations.
---@param specializations table
---@return boolean
function WindBending.prerequisitesPresent(specializations) end

--- Registers the XML schema paths of a wind bending node: `#node`, `#decalNode`, `#speedReferenceNode`, `#maxBending` (meters, default 0.15), `#maxBendingNeg` and `#maxBendingSpeed` (km/h, default 20).
function WindBending.initSpecialization() end

--- Empty: the specialization adds no new vehicle functions.
---@param vehicleType any
function WindBending.registerFunctions(vehicleType) end

--- Subscribes the vehicle type to onLoad and onUpdate.
---@param vehicleType any
function WindBending.registerEventListeners(vehicleType) end

--- Client only: reads each configured node, keeping it only if it is a shape with the `directionBend` shader parameter (otherwise logs an XML error). Removes the onUpdate listener on servers or when no valid node exists.
---@param savegame table
function WindBending:onLoad(savegame) end

--- For each node, derives a movement direction from the reference node's position change since the last call, then sets `directionBend` through `g_animationManager` with an amount scaled by vehicle speed over `maxBendingSpeed`. Uses the negative maximum when moving in reverse. The decal node gets the same values. Note: the speed is computed with a fixed factor of 10, not with dt.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WindBending:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
