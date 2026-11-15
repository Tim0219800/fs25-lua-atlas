---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TipOccluder.lua (generated stub, FS25 Lua Atlas)

---@class TipOccluder
TipOccluder = {}

---@param specializations any
function TipOccluder.prerequisitesPresent(specializations) end

function TipOccluder.initSpecialization() end

---@param vehicleType any
function TipOccluder.registerFunctions(vehicleType) end

---@param vehicleType any
function TipOccluder.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TipOccluder.registerEventListeners(vehicleType) end

---@param savegame any
function TipOccluder:onLoad(savegame) end

---@param savegame any
function TipOccluder:onLoadFinished(savegame) end

function TipOccluder:getTipOcclusionAreas() end

---@param wheels any
---@param groupId any
function TipOccluder:getWheelsWithTipOcclisionAreaGroupId(wheels, groupId) end

function TipOccluder:getRequiresTipOcclusionArea() end
