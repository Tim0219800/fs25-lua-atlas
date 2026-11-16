---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterUnloadingStation.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter that selects an unloading station (for example a sell point or storage) the AI should deliver to. It keeps network object ids, supports cycling through a list of valid stations, and saves the choice by owning placeable unique id plus station index. Related managers are g_currentMission.storageSystem and placeableSystem.
---@class AIParameterUnloadingStation : AIParameter
AIParameterUnloadingStation = {}

--- Creates the parameter with type UNLOADING_STATION, no selected station and an empty list of valid station ids.
---@param customMt any
function AIParameterUnloadingStation.new(customMt) end

--- Saves the selected station as the unique id of its owning placeable (`#stationUniqueId`) and its index in that placeable (`#stationIndex`). Nothing is written if the station, owner or index cannot be resolved.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterUnloadingStation:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads the station unique id and index. If the placeable is not loaded yet, it subscribes a one-shot callback on the LOADED_ALL_SAVEGAME_PLACEABLES message to retry.
---@param xmlFile any
---@param key any
function AIParameterUnloadingStation:loadFromXMLFile(xmlFile, key) end

--- Message callback that retries the station lookup using the unique id and index passed in the args table.
---@param args any
function AIParameterUnloadingStation:onPlaceableLoaded(args) end

--- Finds the placeable by unique id, fetches its unloading station at the given index from the storage system and selects it. Returns true if the placeable exists, false otherwise.
---@param uniqueId any
---@param index any
function AIParameterUnloadingStation:setUnloadingStationFromUniqueId(uniqueId, index) end

--- Reads a presence flag and, if set, the network node object id of the selected station.
---@param streamId any
---@param connection any
function AIParameterUnloadingStation:readStream(streamId, connection) end

--- Writes a presence flag and, if a station is selected, its network node object id.
---@param streamId any
---@param connection any
function AIParameterUnloadingStation:writeStream(streamId, connection) end

--- Selects the given station by storing its network object id.
---@param unloadingStation any
function AIParameterUnloadingStation:setUnloadingStation(unloadingStation) end

--- Resolves the stored id to a station object. Returns it only if its owning placeable exists and is synchronized, otherwise nil.
function AIParameterUnloadingStation:getUnloadingStation() end

--- Returns the station name for display, or an empty string if it cannot be resolved.
function AIParameterUnloadingStation:getString() end

--- Replaces the list of selectable stations with the ids of the given stations. Keeps the current selection if it is still in the list, otherwise selects the first entry.
---@param unloadingStations any
function AIParameterUnloadingStation:setValidUnloadingStations(unloadingStations) end

--- Selects the next station in the valid list, wrapping around to the first after the last.
function AIParameterUnloadingStation:setNextItem() end

--- Selects the previous station in the valid list, wrapping around to the last before the first.
function AIParameterUnloadingStation:setPreviousItem() end

--- Fails if no station is selected or it no longer exists. With a fill type, it also requires AI support for that fill type and free capacity for the farm. Returns a boolean and a localized error.
---@param fillTypeIndex any
---@param farmId any
function AIParameterUnloadingStation:validate(fillTypeIndex, farmId) end
