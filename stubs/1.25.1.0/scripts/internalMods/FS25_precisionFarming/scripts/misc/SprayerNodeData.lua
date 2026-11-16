---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming data holder for sprayer add-ons (spot spraying, See and Spray, pulse width modulation). It loads SprayerNodeData.xml (config prices, spray sound, sensor types, per-vehicle effect and sensor nodes) plus the nozzle effect and sensor i3d files, and provides cloned nodes and sound samples. It adds weedSpotSpray and pulseWidthModulation yes/no configurations to listed vehicles through ConfigurationUtil.getConfigurationsFromXML.
---@class SprayerNodeData
SprayerNodeData = {}

--- Deletes the nozzle effect node, every sensor type node, releases their shared i3d requests, deletes the sound samples and clears the linkage data.
function SprayerNodeData:delete() end

--- Map load hook: calls loadData once if not already loaded. Arguments are ignored and nothing is returned.
---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function SprayerNodeData:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

--- Returns three prices read from the XML (per meter of work width): weed spot spray, See and Spray, pulse width modulation.
function SprayerNodeData:getConfigPrices() end

--- Clones the named sample (for example spray) onto the given link node with a modifier target object. Logs a warning and returns nil if the sample does not exist.
---@param name any
---@param linkNode any
---@param modifierTargetObject any
function SprayerNodeData:getClonedSectionSamples(name, linkNode, modifierTargetObject) end

--- Reads SprayerNodeData.xml: three config prices, the spray sound, sensor types (async shared i3d load) and per-vehicle configurations of effect nodes and sensor nodes. Also starts loading the nozzle effect i3d. Flags can skip effects or vehicle data. Returns true.
---@param loadVehicleData any
---@param loadEffect any
function SprayerNodeData:loadData(loadVehicleData, loadEffect) end

--- Async callback (called with self as first argument): keeps the first child of the loaded i3d as the nozzle effect node, unlinks it and deletes the i3d root.
---@param self any
---@param i3dNode any
---@param failedReason any
---@param args any
function SprayerNodeData.onSprayerEffectLoaded(self, i3dNode, failedReason, args) end

--- Async callback: resolves the sensor node by its path, resets its transform, unlinks it and appends the sensor type to self.sensorTypes, then deletes the i3d root.
---@param self any
---@param i3dNode any
---@param failedReason any
---@param sensorType any
function SprayerNodeData.onWeedSensorLoaded(self, i3dNode, failedReason, sensorType) end

--- Returns a clone of the nozzle effect node with the liquid fertilizer sprayer material applied if available, or nil if the effect is not loaded.
function SprayerNodeData:getClonedSprayerEffectNode() end

--- Returns a clone of the sensor node with the given type id and a boolean telling whether it has a scalable bracket. Returns nil and false if the id is unknown.
---@param sensorTypeId any
function SprayerNodeData:getClonedSprayerWeedSensorNode(sensorTypeId) end

--- Finds the vehicle entry matching the end of the config file name and returns the configuration chosen by the vehicle's configuration name (first one as fallback) plus the vehicle entry, or nil if the vehicle is not listed.
---@param configFileName any
---@param configurations any
function SprayerNodeData:getSprayerNodeData(configFileName, configurations) end

--- Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle data first) and ConfigurationUtil.getConfigurationsFromXML (adds weedSpotSpray and pulseWidthModulation yes/no configurations, price 1 for the yes option, to listed vehicles that lack them).
---@param pfModule any
function SprayerNodeData:overwriteGameFunctions(pfModule) end

--- Registers the XML schema paths for config prices, spray sound, sensor types, and per-vehicle effect and sensor nodes of SprayerNodeData.xml.
---@param schema any
function SprayerNodeData:registerXMLPaths(schema) end
