# placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua

*[Version française](../../../../fr/scripts/placeables/configurations/data/PlaceableConfigurationDataObjectChange.md)*

Source: `dataS/scripts/placeables/configurations/data/PlaceableConfigurationDataObjectChange.lua` — FS25 1.25.1.0

✍ Mixin that adds object-change support to placeable configurations. Each configuration item can choose whether its object changes are applied during load or after post load, via the `#postLoadObjectChange` XML attribute. The changes themselves are handled by `ObjectChangeUtil`.

- **PlaceableConfigurationDataObjectChange** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableConfigurationDataObjectChange.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Registers the boolean `#postLoadObjectChange` path (default false) and the standard object-change XML paths under the configuration key. |
| `PlaceableConfigurationDataObjectChange.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Reads `#postLoadObjectChange` from the XML and stores it on the config item. |
| `PlaceableConfigurationDataObjectChange.onLoad(placeable: any, configItem: any, configId: any)` | 27 | ✍ If the item is not flagged post-load, applies the object changes for the chosen config id with `ObjectChangeUtil.updateObjectChanges` using the placeable's components. |
| `PlaceableConfigurationDataObjectChange.onPostLoad(placeable: any, configItem: any, configId: any)` | 36 | ✍ Same as `onLoad` but only runs when the item is flagged `postLoadObjectChange`, so the changes are applied after post load. |
