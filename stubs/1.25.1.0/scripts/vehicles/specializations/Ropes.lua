---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Ropes.lua (generated stub, FS25 Lua Atlas)

---@class Ropes
Ropes = {}

---@param specializations table
---@return boolean
function Ropes.prerequisitesPresent(specializations) end

function Ropes.initSpecialization() end

---@param vehicleType any
function Ropes.registerFunctions(vehicleType) end

---@param vehicleType any
function Ropes.registerEventListeners(vehicleType) end

---@param savegame table
function Ropes:onLoad(savegame) end

---@param savegame table
function Ropes:onLoadFinished(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Ropes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Ropes:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param adjusterNode any
---@param xmlFile any
---@param key any
function Ropes:loadAdjusterNode(adjusterNode, xmlFile, key) end

---@param dt any
function Ropes:updateRopes(dt) end

---@param adjusterNodes any
function Ropes:updateAdjusterNodes(adjusterNodes) end
