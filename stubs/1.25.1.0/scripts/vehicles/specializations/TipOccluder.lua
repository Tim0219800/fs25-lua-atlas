---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TipOccluder.lua (generated stub, FS25 Lua Atlas)

--- Specialization (no prerequisites) that defines ground areas where material must not be tipped, for example under the wheels. Areas come from vehicle.tipOccluder.occlusionArea in XML, and are also auto-built from wheels that share a tipOcclusionAreaGroupId (a box around those wheels' contact zone). Other systems read them through getTipOcclusionAreas.
---@class TipOccluder
TipOccluder = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function TipOccluder.prerequisitesPresent(specializations) end

--- Registers the XML schema of occlusionArea entries: start, width and height nodes.
function TipOccluder.initSpecialization() end

--- Registers getTipOcclusionAreas, getWheelsWithTipOcclisionAreaGroupId and getRequiresTipOcclusionArea.
---@param vehicleType any
function TipOccluder.registerFunctions(vehicleType) end

--- Empty: registers no overridden functions.
---@param vehicleType any
function TipOccluder.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onLoadFinished.
---@param vehicleType any
function TipOccluder.registerEventListeners(vehicleType) end

--- Reads every occlusionArea with its three nodes into the list (skipping incomplete ones) and warns about the old FS17-FS19 key.
---@param savegame any
function TipOccluder:onLoad(savegame) end

--- For wheels with a tipOcclusionAreaGroupId, creates one area per group (three transform nodes) and resizes it to cover the wheels' contact footprint. Warns in dev mode if the vehicle requires an area but has none.
---@param savegame any
function TipOccluder:onLoadFinished(savegame) end

--- Returns the list of occlusion areas, each with start, width and height nodes.
function TipOccluder:getTipOcclusionAreas() end

--- Returns a new table of the wheels whose physics has the given tipOcclusionAreaGroupId. Note: 'Occlision' is misspelled in the name.
---@param wheels any
---@param groupId any
function TipOccluder:getWheelsWithTipOcclisionAreaGroupId(wheels, groupId) end

--- Returns false by default; other specializations can override it to demand at least one occlusion area.
function TipOccluder:getRequiresTipOcclusionArea() end
