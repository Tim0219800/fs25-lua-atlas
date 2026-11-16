# internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/ManureSensorLinkageData.lua` — FS25 1.25.1.0

✍ Precision Farming data holder that links the manure sensor to vehicles. It loads ManureSensorLinkageData.xml (vehicle filenames, link nodes with offset and scale, price) and a sensor i3d file, hands out cloned sensor nodes, and adds a yes/no manureSensor configuration to the listed vehicles by overriding ConfigurationUtil.getConfigurationsFromXML. Same structure as CropSensorLinkageData.

- **ManureSensorLinkageData** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `ManureSensorLinkageData:delete()` | 37 | ✍ Deletes the loaded sensor nodes and clears the sensor and linkage data tables. |
| `ManureSensorLinkageData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 49 | ✍ Map load hook: loads the linkage data once if not already loaded. Arguments are ignored and nothing is returned. |
| `ManureSensorLinkageData:loadLinkageData(loadVehicleData: any, loadSensorData: any)` | 57 | ✍ Reads ManureSensorLinkageData.xml: configuration price and vehicle entries with link nodes (type default DEFAULT, translation, rotation, optional scale), and optionally starts async loading of the sensors i3d. Flags can skip vehicles or sensors. Returns true. |
| `ManureSensorLinkageData:onSensorDataLoaded(i3dNode: any, failedReason: any, args: any)` | 108 | ✍ Async callback: records each sensor (node and type), unlinks the nodes, then deletes the loaded i3d root and the XML file. |
| `ManureSensorLinkageData:getManureSensorLinkageData(configFileName: any)` | 133 | ✍ Returns the vehicle linkage entry whose filename is the end of the given config file name, or nil. |
| `ManureSensorLinkageData:getClonedManureSensorNode(typeName: any)` | 148 | ✍ Finds the sensor of the given type (case-insensitive) and returns a copy of its data with a cloned node reset to zero translation, rotation and unit scale, or nil if the type is unknown. |
| `ManureSensorLinkageData:overwriteGameFunctions(pfModule: any)` | 167 | ✍ Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle linkage data first) and ConfigurationUtil.getConfigurationsFromXML (adds a manureSensor yes/no configuration at the XML price to listed vehicles). |
| `ManureSensorLinkageData:registerXMLPaths(schema: any)` | 220 | ✍ Registers the XML schema paths for sensors, vehicles, link nodes and configuration price. Note: the price description text still says crop sensor config, apparently copied from the crop sensor class. |
