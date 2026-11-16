---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming data holder that links the manure sensor to vehicles. It loads ManureSensorLinkageData.xml (vehicle filenames, link nodes with offset and scale, price) and a sensor i3d file, hands out cloned sensor nodes, and adds a yes/no manureSensor configuration to the listed vehicles by overriding ConfigurationUtil.getConfigurationsFromXML. Same structure as CropSensorLinkageData.
---@class ManureSensorLinkageData
ManureSensorLinkageData = {}

--- Deletes the loaded sensor nodes and clears the sensor and linkage data tables.
function ManureSensorLinkageData:delete() end

--- Map load hook: loads the linkage data once if not already loaded. Arguments are ignored and nothing is returned.
---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function ManureSensorLinkageData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

--- Reads ManureSensorLinkageData.xml: configuration price and vehicle entries with link nodes (type default DEFAULT, translation, rotation, optional scale), and optionally starts async loading of the sensors i3d. Flags can skip vehicles or sensors. Returns true.
---@param loadVehicleData any
---@param loadSensorData any
function ManureSensorLinkageData:loadLinkageData(loadVehicleData, loadSensorData) end

--- Async callback: records each sensor (node and type), unlinks the nodes, then deletes the loaded i3d root and the XML file.
---@param i3dNode any
---@param failedReason any
---@param args any
function ManureSensorLinkageData:onSensorDataLoaded(i3dNode, failedReason, args) end

--- Returns the vehicle linkage entry whose filename is the end of the given config file name, or nil.
---@param configFileName any
function ManureSensorLinkageData:getManureSensorLinkageData(configFileName) end

--- Finds the sensor of the given type (case-insensitive) and returns a copy of its data with a cloned node reset to zero translation, rotation and unit scale, or nil if the type is unknown.
---@param typeName any
function ManureSensorLinkageData:getClonedManureSensorNode(typeName) end

--- Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle linkage data first) and ConfigurationUtil.getConfigurationsFromXML (adds a manureSensor yes/no configuration at the XML price to listed vehicles).
---@param pfModule any
function ManureSensorLinkageData:overwriteGameFunctions(pfModule) end

--- Registers the XML schema paths for sensors, vehicles, link nodes and configuration price. Note: the price description text still says crop sensor config, apparently copied from the crop sensor class.
---@param schema any
function ManureSensorLinkageData:registerXMLPaths(schema) end
