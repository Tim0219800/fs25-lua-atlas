---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) that loads the list of known wheel models from the default wheels XML at map load. It indexes each wheel by path, filename and base directory, groups them by brand and name, and answers radius/width lookups by tire size or file name. Warns when two wheels with the same size name disagree on radius or width.
---@class WheelManager : AbstractManager
WheelManager = {}

--- Creates the manager using the given or default metatable.
---@param customMt any
---@return table
function WheelManager.new(customMt) end

--- Resets the tables: wheel list, wheels by base path, sorted typed wheel groups and filename-to-attributes map.
function WheelManager:initDataStructures() end

--- Loads the default wheels XML (WheelManager.DEFAULT_FILENAME) and fills the wheel lists. Returns true. The base directory argument is used to resolve wheel paths.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function WheelManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Parses each `wheel` entry (filename, radius, width, category, allowMixture, priority), derives brand and name from the folder path, warns on size mismatches, registers it and sorts the groups by brand, priority then name. Entries missing path, radius or width are skipped with a warning.
---@param xmlFile table
---@param key string
---@param baseDirectory string
function WheelManager:loadWheelsFromXML(xmlFile, key, baseDirectory) end

--- Returns the radius and width of the first wheel whose short filename equals the given dimension string, or nil, nil if none matches.
---@param dimension string
---@return number
---@return number
function WheelManager:getWheelRadiusAndWidthFromDimension(dimension) end

--- Returns the radius and width of the wheel whose full path equals the given filename, or nil, nil if not found.
---@param filename string
---@return number
---@return number
function WheelManager:getWheelRadiusAndWidthFromFilename(filename) end
