---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VehicleSettings.lua (stub généré, atlas Lua FS25)

---@class VehicleSettings
VehicleSettings = {}

---@param specializations table
---@return boolean
function VehicleSettings.prerequisitesPresent(specializations) end

function VehicleSettings.initSpecialization() end

---@param vehicleType any
function VehicleSettings.registerFunctions(vehicleType) end

---@param vehicleType any
function VehicleSettings.registerEvents(vehicleType) end

---@param vehicleType any
function VehicleSettings.registerEventListeners(vehicleType) end

---@param savegame table
function VehicleSettings:onPreLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function VehicleSettings:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param gameSettingId string
---@param isBool boolean
function VehicleSettings:registerVehicleSetting(gameSettingId, isBool) end

function VehicleSettings:forceVehicleSettingsUpdate() end

---@param settingIndex integer
---@param state any
---@param noEventSend boolean
function VehicleSettings:setVehicleSettingState(settingIndex, state, noEventSend) end

---@param gameSettingId integer
---@return any
function VehicleSettings:getVehicleSettingState(gameSettingId) end

---@param state any
---@param vehicle any
---@param isControlling any
function VehicleSettings:onStateChange(state, vehicle, isControlling) end
