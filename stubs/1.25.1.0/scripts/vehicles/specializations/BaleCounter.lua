---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleCounter.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type includes the Baler specialization.
---@param specializations table
---@return boolean
function BaleCounter.prerequisitesPresent(specializations) end

--- Registers the dashboard XML paths for `vehicle.baleCounter.dashboards` (sessionCounter, lifetimeCounter) and the two savegame counters.
function BaleCounter.initSpecialization() end

--- Registers the vehicle function `doBaleCounterReset`.
---@param vehicleType any
function BaleCounter.registerFunctions(vehicleType) end

--- Overrides `dropBale` so every dropped bale increments the counters.
---@param vehicleType any
function BaleCounter.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onDraw, onRegisterDashboardValueTypes, onReadStream, onWriteStream, onRegisterActionEvents and onRegisterExternalActionEvents.
---@param vehicleType any
function BaleCounter.registerEventListeners(vehicleType) end

--- Zeroes both counters, restores them from a non-reset savegame, and creates the BaleCounterHUDExtension for the vehicle.
---@param savegame any
function BaleCounter:onLoad(savegame) end

--- Registers the dashboard value types `baleCounter.sessionCounter` and `baleCounter.lifetimeCounter`, bound to the spec fields and not polled (updated explicitly).
function BaleCounter:onRegisterDashboardValueTypes() end

--- Saves the session and lifetime counters as attributes of the vehicle's `baleCounter` entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleCounter:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads both counters from the stream with `BaleCounter.SEND_NUM_BITS` bits each.
---@param streamId integer
---@param connection Connection
function BaleCounter:onReadStream(streamId, connection) end

--- Server side of a client join: writes both counters to the stream with `BaleCounter.SEND_NUM_BITS` bits each.
---@param streamId integer
---@param connection Connection
function BaleCounter:onWriteStream(streamId, connection) end

--- On clients, registers the powered BALE_COUNTER_RESET input with high text priority when the vehicle is active for input, ignoring selection.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleCounter:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- When an external trigger is named `baleCounterReset`, registers the external action event callbacks for it.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function BaleCounter:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Input callback for the in-vehicle reset: calls `doBaleCounterReset`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleCounter.actionEventResetCounter(self, actionName, inputValue, callbackState, isAnalog) end

--- Registers the BALE_COUNTER_RESET input for an external trigger, resetting the counter of the given vehicle, with high text priority.
---@param data any
---@param vehicle any
function BaleCounter.externalActionEventRegister(data, vehicle) end

--- Empty update hook for the external action event; does nothing.
---@param data any
---@param vehicle any
function BaleCounter.externalActionEventUpdate(data, vehicle) end

--- Sets the session counter to 0 (the lifetime counter is kept) and sends BaleCounterResetEvent unless `noEventSend` is set. The dashboard value is not refreshed here.
---@param noEventSend any
function BaleCounter:doBaleCounterReset(noEventSend) end

--- Calls the parent `dropBale`, then adds 1 to both counters and refreshes the two dashboard values if dashboards are available. There is no server check in this function.
---@param superFunc any
---@param baleIndex any
function BaleCounter:dropBale(superFunc, baleIndex) end
