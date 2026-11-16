# internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/SprayerNodeData.lua` — FS25 1.25.1.0

✍ Precision Farming data holder for sprayer add-ons (spot spraying, See and Spray, pulse width modulation). It loads SprayerNodeData.xml (config prices, spray sound, sensor types, per-vehicle effect and sensor nodes) plus the nozzle effect and sensor i3d files, and provides cloned nodes and sound samples. It adds weedSpotSpray and pulseWidthModulation yes/no configurations to listed vehicles through ConfigurationUtil.getConfigurationsFromXML.

- **SprayerNodeData** (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `SprayerNodeData:delete()` | 42 | ✍ Deletes the nozzle effect node, every sensor type node, releases their shared i3d requests, deletes the sound samples and clears the linkage data. |
| `SprayerNodeData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 69 | ✍ Map load hook: calls loadData once if not already loaded. Arguments are ignored and nothing is returned. |
| `SprayerNodeData:getConfigPrices()` | 77 | ✍ Returns three prices read from the XML (per meter of work width): weed spot spray, See and Spray, pulse width modulation. |
| `SprayerNodeData:getClonedSectionSamples(name: any, linkNode: any, modifierTargetObject: any)` | 83 | ✍ Clones the named sample (for example spray) onto the given link node with a modifier target object. Logs a warning and returns nil if the sample does not exist. |
| `SprayerNodeData:loadData(loadVehicleData: any, loadEffect: any)` | 95 | ✍ Reads SprayerNodeData.xml: three config prices, the spray sound, sensor types (async shared i3d load) and per-vehicle configurations of effect nodes and sensor nodes. Also starts loading the nozzle effect i3d. Flags can skip effects or vehicle data. Returns true. |
| `SprayerNodeData.onSprayerEffectLoaded(self: any, i3dNode: any, failedReason: any, args: any)` | 182 | ✍ Async callback (called with self as first argument): keeps the first child of the loaded i3d as the nozzle effect node, unlinks it and deletes the i3d root. |
| `SprayerNodeData.onWeedSensorLoaded(self: any, i3dNode: any, failedReason: any, sensorType: any)` | 193 | ✍ Async callback: resolves the sensor node by its path, resets its transform, unlinks it and appends the sensor type to self.sensorTypes, then deletes the i3d root. |
| `SprayerNodeData:getClonedSprayerEffectNode()` | 209 | ✍ Returns a clone of the nozzle effect node with the liquid fertilizer sprayer material applied if available, or nil if the effect is not loaded. |
| `SprayerNodeData:getClonedSprayerWeedSensorNode(sensorTypeId: any)` | 226 | ✍ Returns a clone of the sensor node with the given type id and a boolean telling whether it has a scalable bracket. Returns nil and false if the id is unknown. |
| `SprayerNodeData:getSprayerNodeData(configFileName: any, configurations: any)` | 238 | ✍ Finds the vehicle entry matching the end of the config file name and returns the configuration chosen by the vehicle's configuration name (first one as fallback) plus the vehicle entry, or nil if the vehicle is not listed. |
| `SprayerNodeData:overwriteGameFunctions(pfModule: any)` | 262 | ✍ Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle data first) and ConfigurationUtil.getConfigurationsFromXML (adds weedSpotSpray and pulseWidthModulation yes/no configurations, price 1 for the yes option, to listed vehicles that lack them). |
| `SprayerNodeData:registerXMLPaths(schema: any)` | 343 | ✍ Registers the XML schema paths for config prices, spray sound, sensor types, and per-vehicle effect and sensor nodes of SprayerNodeData.xml. |
