# internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/CropSensorLinkageData.lua` — FS25 1.25.1.0

✍ Precision Farming data holder that links the crop sensor to vehicles. It loads CropSensorLinkageData.xml (vehicle filenames, link nodes, price) and a sensor i3d file, offers cloned sensor nodes, and injects a yes/no cropSensor configuration into matching vehicles by overriding ConfigurationUtil.getConfigurationsFromXML.

- **CropSensorLinkageData** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `CropSensorLinkageData:delete()` | 37 | ✍ Deletes the loaded sensor nodes and clears the sensor and linkage data tables. |
| `CropSensorLinkageData:loadFromXML(_: any, _: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 49 | ✍ Map load hook: loads the linkage data once if not already loaded. Arguments are ignored and nothing is returned. |
| `CropSensorLinkageData:loadLinkageData(loadVehicleData: any, loadSensorData: any)` | 57 | ✍ Reads CropSensorLinkageData.xml: configuration price, vehicle entries with link nodes and rotation nodes, and optionally starts async loading of the sensors i3d. Flags can disable vehicle or sensor loading. Returns true. |
| `CropSensorLinkageData:onSensorDataLoaded(i3dNode: any, failedReason: any, args: any)` | 116 | ✍ Async callback: records each sensor (node, type, measurement node path, daylight requirement, rotation nodes), unlinks the nodes, deletes the loaded i3d root and the XML file. |
| `CropSensorLinkageData:getCropSensorLinkageData(configFileName: any)` | 152 | ✍ Returns the vehicle linkage entry whose filename is the end of the given config file name, or nil. |
| `CropSensorLinkageData:getClonedCropSensorNode(typeName: any)` | 167 | ✍ Finds the sensor of the given type (case-insensitive) and returns a copy of its data with a cloned node and resolved rotation and measurement nodes, or nil if the type is unknown. |
| `CropSensorLinkageData:overwriteGameFunctions(pfModule: any)` | 192 | ✍ Overrides VehicleSystem.consoleCommandReloadVehicle (reloads vehicle linkage data first) and ConfigurationUtil.getConfigurationsFromXML (adds a cropSensor yes/no configuration with the XML price to listed vehicles). |
| `CropSensorLinkageData:registerXMLPaths(schema: any)` | 246 | ✍ Registers the XML schema paths for sensors, vehicles, link nodes, rotation nodes and configuration price used by CropSensorLinkageData.xml. |
