---@meta
-- FS25 1.25.1.0 : vehicles/specializations/IKChains.lua (generated stub, FS25 Lua Atlas)

---@class IKChains
IKChains = {}

---@param specializations any
function IKChains.prerequisitesPresent(specializations) end

function IKChains.initSpecialization() end

---@param vehicleType any
function IKChains.registerEventListeners(vehicleType) end

---@param savegame any
function IKChains:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function IKChains:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
