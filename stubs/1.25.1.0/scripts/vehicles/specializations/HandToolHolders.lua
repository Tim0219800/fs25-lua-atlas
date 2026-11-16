---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HandToolHolders.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that gives a vehicle one or more hand tool holders, created through the HandToolHolder class from the vehicle XML (optionally per configuration). It names each holder after the vehicle and brand, saves and restores their contents, synchronizes them to joining clients, and forwards the owner farm. It raises the events onHandToolStoredInHolder and onHandToolTakenFromHolder. It declares no prerequisitesPresent in this file.
---@class HandToolHolders
HandToolHolders = {}

--- Registers the vehicle events onHandToolStoredInHolder and onHandToolTakenFromHolder.
---@param vehicleType any
function HandToolHolders.registerEvents(vehicleType) end

--- Registers onHandToolHolderFinished as a vehicle function, used as the load-finished callback of each holder.
---@param vehicleType any
function HandToolHolders.registerFunctions(vehicleType) end

--- Overrides setOwnerFarmId so the owner is propagated to the holders.
---@param vehicleType any
function HandToolHolders.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, saveToXMLFile, onWriteStream, onReadStream and onRegistered. Note: no onRegistered function is defined in this file, so that listener may be UNVERIFIED.
---@param vehicleType any
function HandToolHolders.registerEventListeners(vehicleType) end

--- Picks the holder configuration (falling back to the plain vehicle.handToolHolders node), builds a display name from brand and vehicle name, and starts loading every handToolHolder asynchronously with a loading task.
---@param savegame any
function HandToolHolders:onLoad(savegame) end

--- Load-finished callback: sets the holder's owner farm, hooks store and pickup callbacks to the two vehicle events, adds it to the list and restores its saved state matching its index. Always closes the loading task.
---@param handToolHolder any
---@param args any
function HandToolHolders:onHandToolHolderFinished(handToolHolder, args) end

--- Deletes every hand tool holder and clears the list.
function HandToolHolders:onDelete() end

--- Saves each holder under handToolHolder entries with a 1-based index attribute, delegating the content to the holder.
---@param xmlFile any
---@param key any
---@param usedModNames any
function HandToolHolders:saveToXMLFile(xmlFile, key, usedModNames) end

--- Server side: writes each holder's network id and state to the connecting client and registers the holder object in that stream.
---@param streamId any
---@param connection any
function HandToolHolders:onWriteStream(streamId, connection) end

--- Client side: reads each holder's network id and state, then finishes registering the holder object with the client.
---@param streamId any
---@param connection any
function HandToolHolders:onReadStream(streamId, connection) end

--- Calls the parent, then passes the same owner farm id to every holder without sending another network event.
---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function HandToolHolders:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
