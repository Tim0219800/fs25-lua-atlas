---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Honk.lua (generated stub, FS25 Lua Atlas)

---@class Honk
Honk = {}

---@param specializations any
function Honk.prerequisitesPresent(specializations) end

function Honk.initSpecialization() end

---@param vehicleType any
function Honk.registerFunctions(vehicleType) end

---@param vehicleType any
function Honk.registerEventListeners(vehicleType) end

---@param savegame any
function Honk:onLoad(savegame) end

function Honk:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Honk:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function Honk:onLeaveVehicle() end

function Honk:getIsHonkAvailable() end

function Honk:setHonkInput() end

---@param isPlaying any
---@param noEventSend any
function Honk:playHonk(isPlaying, noEventSend) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Honk:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Honk.actionEventHonk(self, actionName, inputValue, callbackState, isAnalog) end
