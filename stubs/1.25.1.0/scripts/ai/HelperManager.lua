---@meta
-- FS25 1.25.1.0 : ai/HelperManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (child of AbstractManager) that stores the AI helper characters: name, title, colour and a PlayerStyle for their look. It loads data/maps/maps_helpers.xml and the map's own helpers section (map.helpers.helper entries), and tracks which helpers are available or in use. Part of AbstractManager and PlayerStyle:loadFromXMLFile are not in the dump (UNVERIFIED).
---@class HelperManager : AbstractManager
HelperManager = {}

--- Constructor. Creates the manager through AbstractManager.new with the given or default metatable.
---@param customMt any
---@return table
function HelperManager.new(customMt) end

--- Resets the helper count and the tables (by name, by name-to-index, by index, available list).
function HelperManager:initDataStructures() end

--- Loads the base helper definitions from data/maps/maps_helpers.xml as base types, then closes the XML file.
---@param missionInfo any
---@param baseDirectory any
function HelperManager:loadDefaultTypes(missionInfo, baseDirectory) end

--- Calls the parent loadMapData, loads the default helpers, then loads any helpers from the map XML through XMLUtil.loadDataFromMapXML. Returns that result.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function HelperManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Reads each map.helpers.helper entry (#name, #title, #color, child playerStyle), builds a PlayerStyle and adds the helper. Returns false if the XML cannot be wrapped, true otherwise.
---@param xmlFileHandle any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@param customEnvironment any
---@return boolean
function HelperManager:loadHelpers(xmlFileHandle, missionInfo, baseDirectory, isBaseType, customEnvironment) end

--- Adds a helper under an upper-cased valid name, with a title (defaulting to the name), colour and style, and marks it available. A base type with an existing name is rejected; otherwise an existing helper gets its title and style updated.
---@param name string
---@param title string
---@param color string
---@param playerStyle any
---@param baseDir string
---@param isBaseType any
---@return boolean
function HelperManager:addHelper(name, title, color, playerStyle, baseDir, isBaseType) end

--- Returns a random helper from the currently available list. UNVERIFIED behaviour on an empty list (math.random is called with an upper bound of 0).
---@return table
function HelperManager:getRandomHelper() end

--- Returns the PlayerStyle of a random helper chosen among all helpers, whether in use or not.
---@return table
function HelperManager:getRandomHelperStyle() end

--- Returns a random helper index between 1 and the total helper count.
---@return integer
function HelperManager:getRandomIndex() end

--- Returns the helper record for an index, or nil if the index is nil or unknown.
---@param index integer
---@return table
function HelperManager:getHelperByIndex(index) end

--- Returns the helper record for a name (case-insensitive), or nil.
---@param name string
---@return table
function HelperManager:getHelperByName(name) end

--- Marks a helper as in use by removing it from the available list. Returns true if it was found there, false otherwise.
---@param helper table
---@return boolean
function HelperManager:useHelper(helper) end

--- Marks a helper as free again by appending it to the available list. It does not check for duplicates.
---@param helper table
function HelperManager:releaseHelper(helper) end

--- Returns the total number of registered helpers.
---@return integer
function HelperManager:getNumOfHelpers() end
