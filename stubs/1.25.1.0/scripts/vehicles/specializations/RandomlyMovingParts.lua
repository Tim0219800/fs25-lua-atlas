---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RandomlyMovingParts.lua (generated stub, FS25 Lua Atlas)

---@class RandomlyMovingParts
RandomlyMovingParts = {}

---@param specializations table
---@return boolean
function RandomlyMovingParts.prerequisitesPresent(specializations) end

function RandomlyMovingParts.initSpecialization() end

---@param vehicleType any
function RandomlyMovingParts.registerFunctions(vehicleType) end

---@param vehicleType any
function RandomlyMovingParts.registerEventListeners(vehicleType) end

---@param savegame table
function RandomlyMovingParts:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function RandomlyMovingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param part table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RandomlyMovingParts:loadRandomlyMovingPartFromXML(part, xmlFile, key) end

---@param part table
---@param dt number
---@return boolean
function RandomlyMovingParts:updateRandomlyMovingPart(part, dt) end

---@param part table
---@return boolean
function RandomlyMovingParts:getIsRandomlyMovingPartActive(part) end
