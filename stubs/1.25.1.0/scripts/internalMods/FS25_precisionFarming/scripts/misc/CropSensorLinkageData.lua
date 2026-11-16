---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming data holder that links the crop sensor to vehicles. It loads CropSensorLinkageData.xml (vehicle filenames, link nodes, price) and a sensor i3d file, offers cloned sensor nodes, and injects a yes/no cropSensor configuration into matching vehicles by overriding ConfigurationUtil.getConfigurationsFromXML.
---@class CropSensorLinkageData
CropSensorLinkageData = {}

--- Deletes the loaded sensor nodes and clears the sensor and linkage data tables.
function CropSensorLinkageData:delete() end

--- Map load hook: loads the linkage data once if not already loaded. Arguments are ignored and nothing is returned.
---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function CropSensorLinkageData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

--- Reads CropSensorLinkageData.xml: configuration price, vehicle entries with link nodes and rotation nodes, and optionally starts async loading of the sensors i3d. Flags can disable vehicle or sensor loading. Returns true.
---@param loadVehicleData any
---@param loadSensorData any
function CropSensorLinkageData:loadLinkageData(loadVehicleData, loadSensorData) end

--- Async callback: records each sensor (node, type, measurement node path, daylight requirement, rotation nodes), unlinks the nodes, deletes the loaded i3d root and the XML file.
---@param i3dNode any
---@param failedReason any
---@param args any
function CropSensorLinkageData:onSensorDataLoaded(i3dNode, failedReason, args) end

--- Returns the vehicle linkage entry whose filename is the end of the given config file name, or nil.
---@param configFileName any
function CropSensorLinkageData:getCropSensorLinkageData(configFileName) end

--- Finds the sensor of the given type (case-insensitive) and returns a copy of its data with a cloned node and resolved rotation and measurement nodes, or nil if the type is unknown.
---@param typeName any
function CropSensorLinkageData:getClonedCropSensorNode(typeName) end

--- Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle linkage data first) and ConfigurationUtil.getConfigurationsFromXML (adds a cropSensor yes/no configuration with the XML price to listed vehicles).
---@param pfModule any
function CropSensorLinkageData:overwriteGameFunctions(pfModule) end

--- Registers the XML schema paths for sensors, vehicles, link nodes, rotation nodes and configuration price used by CropSensorLinkageData.xml.
---@param schema any
function CropSensorLinkageData:registerXMLPaths(schema) end
