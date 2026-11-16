---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterLoadingStation.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter holding a reference to a loading station, stored as a network object id and chosen from a list of valid stations. It is saved by owning placeable unique id plus station index, and resolved lazily after savegame placeables have loaded.
---@class AIParameterLoadingStation : AIParameter
AIParameterLoadingStation = {}

--- Creates the parameter with type LOADING_STATION, no selection and an empty list.
---@param customMt any
function AIParameterLoadingStation.new(customMt) end

--- Writes `#stationUniqueId` (owning placeable) and `#stationIndex` for the selected station, only if both can be determined.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterLoadingStation:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads unique id and index and resolves the station; if the placeable is not loaded yet, subscribes one-shot to `LOADED_ALL_SAVEGAME_PLACEABLES` to retry.
---@param xmlFile any
---@param key any
function AIParameterLoadingStation:loadFromXMLFile(xmlFile, key) end

--- Message callback that retries resolving the station from the stored unique id and index.
---@param args any
function AIParameterLoadingStation:onPlaceableLoaded(args) end

--- Looks up the placeable by unique id and its loading station by index in the storage system, selects it and returns true; returns false if the placeable is not found.
---@param uniqueId any
---@param index any
function AIParameterLoadingStation:setLoadingStationFromUniqueId(uniqueId, index) end

--- Reads an optional network node object id for the station.
---@param streamId any
---@param connection any
function AIParameterLoadingStation:readStream(streamId, connection) end

--- Writes a presence flag and, if set, the network node object id.
---@param streamId any
---@param connection any
function AIParameterLoadingStation:writeStream(streamId, connection) end

--- Stores the network object id of the given station.
---@param loadingStation any
function AIParameterLoadingStation:setLoadingStation(loadingStation) end

--- Resolves the station from its id; returns it only if its owning placeable exists and is synchronized, otherwise nil.
function AIParameterLoadingStation:getLoadingStation() end

--- Returns the station name, or an empty string.
function AIParameterLoadingStation:getString() end

--- Replaces the selectable stations by their network ids, keeping the current one if still present, otherwise selecting the first.
---@param loadingStationIds any
function AIParameterLoadingStation:setValidLoadingStations(loadingStationIds) end

--- Selects the next station in the list, wrapping around.
function AIParameterLoadingStation:setNextItem() end

--- Selects the previous station in the list, wrapping around.
function AIParameterLoadingStation:setPreviousItem() end

--- Fails with localized errors if none is selected, it no longer exists, the fill type is not AI-supported, or its fill level for the farm is 0 or less. Fill type checks only run when a fill type index is given.
---@param fillTypeIndex any
---@param farmId any
function AIParameterLoadingStation:validate(fillTypeIndex, farmId) end
