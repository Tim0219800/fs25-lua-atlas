---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TensionBeltObject.lua (generated stub, FS25 Lua Atlas)

--- Marks a vehicle as an object that tension belts can strap down, with no prerequisites. It reads vehicle.tensionBeltObject: a supports flag and a list of mesh nodes used for belt calculation. Mesh nodes must be shapes with the CPU-Mesh flag, otherwise they are skipped with an XML warning. Used by the TensionBelts specialization of the carrying vehicle.
---@class TensionBeltObject
TensionBeltObject = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function TensionBeltObject.prerequisitesPresent(specializations) end

--- Registers the XML schema: supportsTensionBelts (default true) and the list of mesh nodes.
function TensionBeltObject.initSpecialization() end

--- Registers getSupportsTensionBelts, getMeshNodes and getTensionBeltNodeId.
---@param vehicleType any
function TensionBeltObject.registerFunctions(vehicleType) end

--- Subscribes to onLoad.
---@param vehicleType any
function TensionBeltObject.registerEventListeners(vehicleType) end

--- Reads the support flag and collects the valid mesh nodes, skipping (with XML warnings) missing nodes, non-shapes and shapes lacking the CPU-Mesh flag.
---@param savegame table
function TensionBeltObject:onLoad(savegame) end

--- Returns whether this vehicle may be strapped with tension belts.
function TensionBeltObject:getSupportsTensionBelts() end

--- Returns the list of valid mesh nodes used for belt calculation.
function TensionBeltObject:getMeshNodes() end

--- Returns the node of the first component, used as the belt reference node.
function TensionBeltObject:getTensionBeltNodeId() end
