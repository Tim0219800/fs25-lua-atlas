---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BunkerSiloInteractor.lua (generated stub, FS25 Lua Atlas)

--- Small specialization that lets a bunker silo hook into a vehicle: the silo stores a callback on the vehicle and the vehicle calls it to report fill level changes with a world position. The class itself does not decide when to notify; other specializations or the silo code call notifiyBunkerSilo (the spelling is in the source).
---@class BunkerSiloInteractor
BunkerSiloInteractor = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function BunkerSiloInteractor.prerequisitesPresent(specializations) end

--- Registers setBunkerSiloInteractorCallback and notifiyBunkerSilo on the vehicle type.
---@param vehicleType any
function BunkerSiloInteractor.registerFunctions(vehicleType) end

--- Registers the onLoad listener only.
---@param vehicleType any
function BunkerSiloInteractor.registerEventListeners(vehicleType) end

--- Resets the stored callback and its target to nil.
---@param savegame any
function BunkerSiloInteractor:onLoad(savegame) end

--- Stores the function and target object to invoke later; passing nil values clears the link. Only one callback is kept at a time.
---@param callback function
---@param callbackTarget table
function BunkerSiloInteractor:setBunkerSiloInteractorCallback(callback, callbackTarget) end

--- If a callback is set, calls it with the target, this vehicle, the changed fill level, the fill type and the x, y, z position. Does nothing otherwise.
---@param changedFillLevel any
---@param fillType any
---@param x any
---@param y any
---@param z any
function BunkerSiloInteractor:notifiyBunkerSilo(changedFillLevel, fillType, x, y, z) end
