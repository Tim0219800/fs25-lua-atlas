---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VehicleSettings.lua (generated stub, FS25 Lua Atlas)

--- Specialization that mirrors selected client-side game settings onto a vehicle. Other specializations register a setting by id; the state is updated when the client's setting changes while it controls the vehicle, and is sent to the server through `VehicleSettingsChangeEvent` so server-side logic can read it with `getVehicleSettingState`. It raises `onVehicleSettingChanged`. No prerequisites.
---@class VehicleSettings
VehicleSettings = {}

--- Always returns true: no prerequisites.
---@param specializations table
---@return boolean
function VehicleSettings.prerequisitesPresent(specializations) end

--- Empty: registers nothing in the XML schema.
function VehicleSettings.initSpecialization() end

--- Adds registerVehicleSetting, setVehicleSettingState, getVehicleSettingState and forceVehicleSettingsUpdate to the vehicle type.
---@param vehicleType any
function VehicleSettings.registerFunctions(vehicleType) end

--- Registers the event `onVehicleSettingChanged`.
---@param vehicleType any
function VehicleSettings.registerEvents(vehicleType) end

--- Subscribes to onPreLoad, onUpdateTick, onStateChange and onPreAttach. Note: onPreAttach is registered but no `VehicleSettings:onPreAttach` function exists in this file.
---@param vehicleType any
function VehicleSettings.registerEventListeners(vehicleType) end

--- Initializes the empty settings list and dirty flag; on a server it removes the onUpdateTick listener since only clients send settings.
---@param savegame table
function VehicleSettings:onPreLoad(savegame) end

--- Client only: if any setting is dirty and this is a remote client (no local server), sends a `VehicleSettingsChangeEvent` to the server, then clears the vehicle dirty flag (individual setting flags stay set).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function VehicleSettings:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Registers a vehicle setting tied to a game setting id and subscribes to that setting's change message. The callback applies the new state only while the local player is active in this vehicle.
---@param gameSettingId string
---@param isBool boolean
function VehicleSettings:registerVehicleSetting(gameSettingId, isBool) end

--- Pushes the current value of every registered game setting into the vehicle (without sending an event per setting), marking them dirty so the client sends them to the server.
function VehicleSettings:forceVehicleSettingsUpdate() end

--- Sets a setting's state by index, marks it dirty and raises `onVehicleSettingChanged`. Unless `noEventSend`, a remote client first sends the settings event to the server (before the new state is stored).
---@param settingIndex integer
---@param state any
---@param noEventSend boolean
function VehicleSettings:setVehicleSettingState(settingIndex, state, noEventSend) end

--- Returns the stored state for the given game setting id, or nil if it is not registered or has no state yet.
---@param gameSettingId integer
---@return any
function VehicleSettings:getVehicleSettingState(gameSettingId) end

--- When the controlling player enters the vehicle (ENTER_VEHICLE), forces an update of all vehicle settings from the current game settings.
---@param state any
---@param vehicle any
---@param isControlling any
function VehicleSettings:onStateChange(state, vehicle, isControlling) end
