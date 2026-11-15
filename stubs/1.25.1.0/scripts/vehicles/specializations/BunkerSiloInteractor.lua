---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BunkerSiloInteractor.lua (generated stub, FS25 Lua Atlas)

---@class BunkerSiloInteractor
BunkerSiloInteractor = {}

---@param specializations table
---@return boolean
function BunkerSiloInteractor.prerequisitesPresent(specializations) end

---@param vehicleType any
function BunkerSiloInteractor.registerFunctions(vehicleType) end

---@param vehicleType any
function BunkerSiloInteractor.registerEventListeners(vehicleType) end

---@param savegame any
function BunkerSiloInteractor:onLoad(savegame) end

---@param callback function
---@param callbackTarget table
function BunkerSiloInteractor:setBunkerSiloInteractorCallback(callback, callbackTarget) end

---@param changedFillLevel any
---@param fillType any
---@param x any
---@param y any
---@param z any
function BunkerSiloInteractor:notifiyBunkerSilo(changedFillLevel, fillType, x, y, z) end
