---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Honk.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that adds a horn to drivable vehicles (requires Drivable). It loads one sound from vehicle.honk, binds the HONK input action while the vehicle is active for input, and plays or stops the sound while the key is held. Honk state changes are broadcast through HonkEvent so other clients hear it.
---@class Honk
Honk = {}

--- Returns true only if the vehicle type has the Drivable specialization.
---@param specializations any
function Honk.prerequisitesPresent(specializations) end

--- Registers the sound sample XML paths under vehicle.honk (key "sound").
function Honk.initSpecialization() end

--- Registers getIsHonkAvailable, setHonkInput and playHonk on the vehicle type.
---@param vehicleType any
function Honk.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdate, onLeaveVehicle and onRegisterActionEvents.
---@param vehicleType any
function Honk.registerEventListeners(vehicleType) end

--- Resets the input and playing flags and, on clients, loads the horn sample. On a dedicated server removes the onUpdate listener.
---@param savegame any
function Honk:onLoad(savegame) end

--- Deletes the horn sound sample.
function Honk:onDelete() end

--- Client only, for the controlled vehicle: starts the horn while the input is pressed and the sample is not already playing, stops it once released, and clears the pressed flag each frame.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Honk:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stops the horn when the player leaves the vehicle, without sending a network event.
function Honk:onLeaveVehicle() end

--- Returns true by default; can be overridden by other specializations to disable the horn.
function Honk:getIsHonkAvailable() end

--- Marks the horn input as pressed for the current frame.
function Honk:setHonkInput() end

--- Sends HonkEvent, stores the playing state, then plays the sample on clients if the vehicle is active, or stops it. Pass noEventSend to avoid re-broadcasting.
---@param isPlaying any
---@param noEventSend any
function Honk:playHonk(isPlaying, noEventSend) end

--- Client only: rebuilds the action events and, when the vehicle is active for input and has a horn sample, binds InputAction.HONK with a low-priority help text.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Honk:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback for the HONK action: calls setHonkInput on the vehicle.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Honk.actionEventHonk(self, actionName, inputValue, callbackState, isAnalog) end
