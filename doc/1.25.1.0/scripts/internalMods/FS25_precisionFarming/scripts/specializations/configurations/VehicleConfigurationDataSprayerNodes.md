# internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua

*[Version française](../../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua` — FS25 1.25.1.0

✍ Helper for vehicle configuration data in Precision Farming. It reads per-configuration sprayer nozzle nodes and weed spot spray sensor nodes from the vehicle XML and hands them to the ExtendedSprayerEffects and WeedSpotSpray specializations.

- **VehicleConfigurationDataSprayerNodes** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataSprayerNodes.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Registers the configuration XML keys: sprayerNozzles.nozzle (node, translation, rotation) and weedSpotSpraySensors.sensorNode (id, node, translation, rotation, bracketSize, default 1). |
| `VehicleConfigurationDataSprayerNodes.onPrePostLoad(vehicle: any, configItem: any, configId: any)` | 28 | ✍ Called for a chosen configuration item. For each nozzle, clones a sprayer effect node and adds it through addExtendedSprayerNozzleEffect. If WeedSpotSpray is enabled, collects the sensor nodes and calls addWeedSpotSpraySensorNodes. Does nothing if the config key is empty. |
