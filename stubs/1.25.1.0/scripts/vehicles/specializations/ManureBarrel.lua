---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ManureBarrel.lua (generated stub, FS25 Lua Atlas)

---@class ManureBarrel
ManureBarrel = {}

---@param specializations any
function ManureBarrel.prerequisitesPresent(specializations) end

function ManureBarrel.initSpecialization() end

---@param vehicleType any
function ManureBarrel.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ManureBarrel.registerEventListeners(vehicleType) end

---@param savegame any
function ManureBarrel:onLoad(savegame) end

---@param attachable any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function ManureBarrel:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implementIndex any
function ManureBarrel:onPostDetachImplement(implementIndex) end

---@param superFunc any
function ManureBarrel:getAreEffectsVisible(superFunc) end

---@param superFunc any
---@param workArea any
function ManureBarrel:getIsWorkAreaActive(superFunc, workArea) end
