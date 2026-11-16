---@meta
-- FS25 1.25.1.0 : guidedTour/GuidedTourManager.lua (generated stub, FS25 Lua Atlas)

--- Manager for guided tours, subclass of `AbstractManager`. It loads tour definitions listed in the map XML (`map.guidedTours.guidedTour` with `#filename` and `#name`), builds them with `GuidedTourUtil.createFromXML`, and saves/restores the active tour in the savegame. `GuidedTourUtil`, `GuidedTourHelp` and `onMissionStarted` are not in this file (UNVERIFIED).
---@class GuidedTourManager : AbstractManager
GuidedTourManager = {}

--- Creates the manager through `AbstractManager.new` with the given or default metatable.
---@param customMt any
---@return table
function GuidedTourManager.new(customMt) end

--- Resets the tour list, name lookup tables for tours, vehicles and placeables, and the goal, action and progress class registries.
function GuidedTourManager:initDataStructures() end

--- Loads the map's `guidedTours` section through `XMLUtil.loadDataFromMapXML`; on success calls `GuidedTourHelp.init()`. Returns whether loading succeeded.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function GuidedTourManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Iterates the guided tour entries, skipping those without filename or name or with a duplicate name (case-insensitive, stored uppercase). Each tour gets its name and index. Subscribes once to `CURRENT_MISSION_START` and always returns true.
---@param xmlFileHandle any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@return boolean
function GuidedTourManager:loadGuidedTours(xmlFileHandle, missionInfo, baseDirectory, isBaseType) end

--- Writes the active tour's name and its own saved state to the given XML file. Returns false if the file cannot be created, otherwise true (also when no tour is active).
---@param xmlFilename string
---@return boolean
function GuidedTourManager:saveToXMLFile(xmlFilename) end

--- Reads the saved tour name and, if the tour exists and loads its state, stores it as `pendingStartTour`; otherwise a warning is logged. Returns false only when the file is missing or unreadable.
---@param xmlFilename string
---@return boolean
function GuidedTourManager:loadFromXMLFile(xmlFilename) end
