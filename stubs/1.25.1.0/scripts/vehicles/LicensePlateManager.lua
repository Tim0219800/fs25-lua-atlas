---@meta
-- FS25 1.25.1.0 : vehicles/LicensePlateManager.lua (generated stub, FS25 Lua Atlas)

--- Per-map manager of license plates, a subclass of AbstractManager exposed as `g_licensePlateManager`. On map load it reads the file referenced by `map.licensePlates#filename`, loads each plate i3d asynchronously into LicensePlate objects, and reads the font name, colors and default placement. It also holds the static helpers that serialize plate data to network streams and to savegame XML. The constants PLATE_TYPE, PLATE_POSITION, PLACEMENT_OPTION and SEND_NUM_BITS_* are used here but defined outside the visible code (UNVERIFIED).
---@class LicensePlateManager : AbstractManager
LicensePlateManager = {}

--- Constructor. Delegates to `AbstractManager.new` with this class metatable unless a custom one is given.
---@param customMt table?
---@return table
function LicensePlateManager.new(customMt) end

--- Resets the plate list, color configurations, availability flag and shared i3d request ids.
function LicensePlateManager:initDataStructures() end

--- Loads license plates from the file named in the map XML, if any, and always returns true. Frees the XML right away unless asynchronous plate loads still need it.
---@param xmlFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function LicensePlateManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Deletes all plates, releases the shared i3d requests and the XML file, then calls the parent unload.
function LicensePlateManager:unloadMapData() end

--- Reads font name, color settings (plate material, shader parameter, custom colors, optionally brand default colors darker than a brightness limit) and default placement. Starts async loading of each plate i3d.
---@param xmlFile table
---@param baseDirectory string
function LicensePlateManager:loadLicensePlatesFromXML(xmlFile, baseDirectory) end

--- Async callback when a plate i3d is loaded: unlinks the plate node, builds a LicensePlate from XML and stores it if valid, deletes the loaded i3d root. When the last request finishes, closes the XML and updates availability.
---@param i3dNode integer
---@param failedReason integer
---@param args table?
function LicensePlateManager:licensePlateI3DFileLoaded(i3dNode, failedReason, args) end

--- Tells whether at least one plate was loaded and the font material exists. Returns the font material object rather than a strict boolean when both hold.
---@return boolean
function LicensePlateManager:getAreLicensePlatesAvailable() end

--- Returns a clone of the last loaded plate with the preferred type, or of the first plate if none matches. Returns nil when there are no plates. The caller owns the clone.
---@param preferedType integer
---@param includeFrame boolean?
---@return table
function LicensePlateManager:getLicensePlate(preferedType, includeFrame) end

--- Returns the value list of a plate variation, or nil if the variation does not exist.
---@param licensePlate table
---@param variationIndex integer
---@return table
function LicensePlateManager:getLicensePlateValues(licensePlate, variationIndex) end

--- Returns a table with variation 1, random characters from the first plate, the default color index and the default placement. Without plates, characters and color are nil.
---@return table
function LicensePlateManager:getRandomLicensePlateData() end

--- Returns the color list and the default color index.
---@return table
---@return integer
function LicensePlateManager:getAvailableColors() end

--- Returns the default placement option index.
---@return integer
function LicensePlateManager:getDefaultPlacementIndex() end

--- Returns the font material of this map from `g_materialManager`, using the font name and the mod environment.
---@return table
function LicensePlateManager:getFont() end

--- Reads plate data from a network stream: a validity bool, then variation, color, placement and a list of characters stored as font character indices. Returns a table with default values if the data is flagged invalid.
---@param streamId integer
---@param connection integer
---@return table
function LicensePlateManager.readLicensePlateData(streamId, connection) end

--- Writes plate data to a network stream, mirroring `readLicensePlateData`. Only writes the fields if all required ones are present; otherwise writes just a false flag.
---@param streamId integer
---@param connection integer
---@param licensePlateData table
function LicensePlateManager.writeLicensePlateData(streamId, connection, licensePlateData) end

--- Reads plate data (configuration file, variation, color, placement, characters) from savegame XML at the key. Returns nil if there is no variation attribute. The filename is converted from network form unless absolute paths are used.
---@param xmlFile XMLFile
---@param key string
---@param useAbsolutePaths boolean
---@return table
function LicensePlateManager.loadLicensePlateDataFromXML(xmlFile, key, useAbsolutePaths) end

--- Writes plate data to XML at the key, only if all required fields exist. The configuration filename is converted to network form unless absolute paths are used.
---@param xmlFile XMLFile
---@param key string
---@param licensePlateData table
---@param useAbsolutePaths boolean
function LicensePlateManager.saveLicensePlateDataToXML(xmlFile, key, licensePlateData, useAbsolutePaths) end

--- Creates, once, the XML schema for the map license plate file (plates, font, color configurations, placement) and stores it in `LicensePlateManager.xmlSchema`. Note: the shader parameter default is registered as "colorSale" while loading uses "colorScale".
function LicensePlateManager.createLicensePlateXMLSchema() end
