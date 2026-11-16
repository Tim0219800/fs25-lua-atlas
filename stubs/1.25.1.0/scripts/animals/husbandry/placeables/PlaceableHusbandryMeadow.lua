---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryMeadow.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a husbandry graze on a meadow. It requires `PlaceableHusbandryFood`, `PlaceableHusbandryFence` and `PlaceableHusbandryAnimals`, reads the edible fruit types (growth states eatable and eaten) from `husbandry.meadow`, and optionally uses `MeadowCreationTask` tasks to create or clear the meadow in the density map. It tracks fill level and capacity per windrow fill type, syncs them over the network and saves pending tasks; most of the meadow logic (growth updates, eating, tasks) is not present in the SDK dump.
---@class PlaceableHusbandryMeadow
PlaceableHusbandryMeadow = {}

--- Returns true only if `PlaceableHusbandryFood`, `PlaceableHusbandryFence` and `PlaceableHusbandryAnimals` are all present.
---@param specializations table
---@return boolean
function PlaceableHusbandryMeadow.prerequisitesPresent(specializations) end

--- Registers overrides of `updateInfo`, `getFoodInfos`, `getAvailableFood` and `removeFood`. The bodies of `getAvailableFood` and `removeFood` are not in the SDK dump.
---@param placeableType any
function PlaceableHusbandryMeadow.registerOverwrittenFunctions(placeableType) end

--- Subscribes to the load, delete, update, stream and update-stream events plus `onFinishedFeeding`, `onHusbandryAnimalsCreated` and `onHusbandryFenceCustomizingUserLeft`.
---@param placeableType any
function PlaceableHusbandryMeadow.registerEventListeners(placeableType) end

--- Registers the XML keys under `husbandry.meadow`: supported fruit types with eatable start/end and eaten growth state names, create and clear tasks, and the clear polygon nodes.
---@param schema any
---@param basePath any
function PlaceableHusbandryMeadow.registerXMLPaths(schema, basePath) end

--- Registers the savegame keys: create and clear tasks, and per fill type name, fill level and capacity.
---@param schema any
---@param basePath any
function PlaceableHusbandryMeadow.registerSavegameXMLPaths(schema, basePath) end

--- Initializes the meadow state and reads each supported fruit type with its three growth states (types with a missing or unknown state are skipped with a warning). Builds the optional create task and a clear task from polygon nodes, and sets `canCreateMeadow` if either exists.
---@param savegame any
function PlaceableHusbandryMeadow:onLoad(savegame) end

--- Network read: reads fill level and capacity for each fill type, then refreshes the meadow info (`updateMeadowInfo`, not in the dump).
---@param streamId any
---@param connection any
function PlaceableHusbandryMeadow:onReadStream(streamId, connection) end

--- Network write: writes fill level and capacity for each fill type.
---@param streamId any
---@param connection any
function PlaceableHusbandryMeadow:onWriteStream(streamId, connection) end

--- Client side update read: if the server sent data, reads fill levels and capacities and refreshes the meadow info. Ignored if the connection is not from the server.
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryMeadow:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side update write: sends the fill levels and capacities when the meadow dirty flag is set. Does nothing for the server connection.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryMeadow:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Loads saved fill levels and capacities for known fill types, refreshes the info, re-enqueues saved create and clear tasks as pending, and subscribes to growth period messages only when no task is pending.
---@param xmlFile any
---@param key any
function PlaceableHusbandryMeadow:loadFromXMLFile(xmlFile, key) end

--- Saves the name, fill level and capacity of each fill type, and the pending create and clear tasks if any.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryMeadow:saveToXMLFile(xmlFile, key, usedModNames) end

--- Override: adds the meadow food info entry when at least one fruit type is configured.
---@param superFunc any
function PlaceableHusbandryMeadow:getFoodInfos(superFunc) end

--- Override: adds the meadow info entry to the info list when at least one fruit type is configured.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryMeadow:updateInfo(superFunc, infoTable) end
