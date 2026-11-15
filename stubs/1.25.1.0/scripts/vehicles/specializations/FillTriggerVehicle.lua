---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillTriggerVehicle.lua (stub généré, atlas Lua FS25)

---@class FillTriggerVehicle
FillTriggerVehicle = {}

---@param specializations table
---@return boolean
function FillTriggerVehicle.prerequisitesPresent(specializations) end

function FillTriggerVehicle.initSpecialization() end

---@param vehicleType any
function FillTriggerVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FillTriggerVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function FillTriggerVehicle:onLoad(savegame) end

function FillTriggerVehicle:onDelete() end

---@param streamId any
---@param connection any
function FillTriggerVehicle:onWriteStream(streamId, connection) end

---@param superFunc any
function FillTriggerVehicle:getDrawFirstFillText(superFunc) end
