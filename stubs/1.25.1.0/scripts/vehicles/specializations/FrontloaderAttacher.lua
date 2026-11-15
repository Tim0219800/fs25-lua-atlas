---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FrontloaderAttacher.lua (generated stub, FS25 Lua Atlas)

---@class FrontloaderAttacher
FrontloaderAttacher = {}

---@param specializations any
function FrontloaderAttacher.prerequisitesPresent(specializations) end

---@param vehicleType any
function FrontloaderAttacher.registerEventListeners(vehicleType) end

function FrontloaderAttacher.initSpecialization() end

---@param savegame any
function FrontloaderAttacher:onLoad(savegame) end

---@param implement any
function FrontloaderAttacher:onPreDetachImplement(implement) end

---@param attachable any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function FrontloaderAttacher:onPreAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end
