# placeables/configurations/PlaceableConfigurationItem.lua

*[Version française](../../../fr/scripts/placeables/configurations/PlaceableConfigurationItem.md)*

Source: `dataS/scripts/placeables/configurations/PlaceableConfigurationItem.lua` — FS25 1.25.1.0

✍ Base class holding one selectable configuration entry of a placeable (name, description, price, daily upkeep, default and selectable flags, save id). It loads from the placeable XML and the savegame, and forwards lifecycle callbacks to the mixins listed in `PlaceableConfigurationItem.GLOBAL_DATA`, which is not filled in this file (UNVERIFIED where it is set). Subclasses such as the color item extend it.

- **PlaceableConfigurationItem** (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableConfigurationItem.new(configName: any, customMt: any)` | 25 | ✍ Creates a config item for a configuration name with defaults: empty name, index -1, price 0, no upkeep, not default, selectable, no save id. |
| `PlaceableConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 46 | ✍ Reads name (with optional text params), description, price, daily upkeep, default and selectable flags, save id and the shop title override from the XML. Falls back to the config key as name when empty. Returns true. |
| `PlaceableConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 73 | ✍ Writes the config name, save id and an active flag into the savegame XML at the given key. |
| `PlaceableConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 81 | ✍ Empty hook for loading per-item data from a savegame; subclasses override it. |
| `PlaceableConfigurationItem:setIndex(index: any)` | 86 | ✍ Stores the item's index and, if no save id was given in XML, uses the index as a string for the save id. |
| `PlaceableConfigurationItem:getNeedsRenaming(otherItem: any)` | 96 | ✍ Returns true when this item has the same display name as another item, so that `postLoad` can add a numeric suffix. |
| `PlaceableConfigurationItem:onPreLoad(placeable: any, configId: any)` | 102 | ✍ Calls `onPreLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id. |
| `PlaceableConfigurationItem:onLoad(placeable: any, configId: any)` | 112 | ✍ Calls `onLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id. |
| `PlaceableConfigurationItem:onPostLoad(placeable: any, configId: any)` | 122 | ✍ Calls `onPostLoad` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id. |
| `PlaceableConfigurationItem:onLoadFinished(placeable: any, configId: any)` | 132 | ✍ Calls `onLoadFinished` of every mixin in `GLOBAL_DATA` that defines it, passing the placeable, this item and the config id. |
| `PlaceableConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 142 | ✍ Calls `onSizeLoad` of every mixin in `GLOBAL_DATA` that defines it, passing this item, the XML file and the size data table. |
| `PlaceableConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 152 | ✍ After all items are loaded, appends a numeric suffix to duplicate names and logs an XML warning for duplicated save ids within the same configuration. |
| `PlaceableConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 178 | ✍ Registers the XML paths for title, name, params, desc, price, dailyUpkeep, isDefault, isSelectable and saveId, then lets each `GLOBAL_DATA` mixin register its own paths. |
| `PlaceableConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 199 | ✍ Registers the savegame XML paths for configuration name, save id and the active flag. |
