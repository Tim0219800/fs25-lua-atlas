---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HUDInfoTrigger.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function HUDInfoTrigger.prerequisitesPresent(specializations) end

function HUDInfoTrigger.initSpecialization() end

---@param vehicleType table
function HUDInfoTrigger.registerFunctions(vehicleType) end

---@param vehicleType table
function HUDInfoTrigger.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function HUDInfoTrigger.registerEventListeners(vehicleType) end

---@param savegame table
function HUDInfoTrigger:onLoad(savegame) end

function HUDInfoTrigger:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HUDInfoTrigger:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param self integer
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function HUDInfoTrigger.onHudInfoTriggerCallback(self, triggerId, otherId, onEnter, onLeave, onStay) end

function HUDInfoTrigger:getAllowHudInfoTrigger() end

function HUDInfoTrigger:getIsPlayerInHudInfoTrigger() end
