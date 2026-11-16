# vehicles/configurations/VehicleConfigurationItem.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItem.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItem.lua` — FS25 1.25.1.0

✍ Base class for one entry of a vehicle configuration (for example one color, motor or wheel option). It loads the shared XML attributes (name, description, price, daily upkeep, default and selectable flags, save id, brand, icon, shop offset), then forwards lifecycle calls to every module in VehicleConfigurationItem.GLOBAL_DATA (the VehicleConfigurationData* classes). Subclasses add type-specific data and savegame or network handling.

- **VehicleConfigurationItem** (l.27)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItem.new(configName: any, customMt: any)` | 31 | ✍ Constructor. Sets configName and defaults: empty name, index -1, price and upkeep 0, not default, selectable, no save id, not a yes/no option. |
| `VehicleConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 55 | ✍ Reads the common attributes of the configuration entry from XML (name with optional text params, desc, price, dailyUpkeep, isDefault, isSelectable, saveId, brand, vehicle name and icon, shopOffset), uses the index as name if none, then calls loadConfigItem on every GLOBAL_DATA module. Returns true. |
| `VehicleConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 110 | ✍ Writes name, save id and active flag of this entry into the savegame XML at the given key. Subclasses extend it with their own data. |
| `VehicleConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 118 | ✍ Empty hook called when loading from a savegame; subclasses override it to restore their per-vehicle data. |
| `VehicleConfigurationItem:setIndex(index: any)` | 123 | ✍ Stores the index of this entry in its configuration list and, if no save id is set, uses the index as a string for the save id. |
| `VehicleConfigurationItem:getNeedsRenaming(otherItem: any)` | 133 | ✍ Returns true if this entry has the same display name as the other one, which postLoad uses to append a number. |
| `VehicleConfigurationItem:onPreLoad(object: any, configId: any)` | 139 | ✍ Forwards the pre-load stage for a vehicle object to every GLOBAL_DATA module that defines onPreLoad. |
| `VehicleConfigurationItem:onLoad(object: any, configId: any)` | 149 | ✍ Forwards the load stage for a vehicle object to every GLOBAL_DATA module that defines onLoad. |
| `VehicleConfigurationItem:onPrePostLoad(object: any, configId: any)` | 159 | ✍ Forwards the stage before post-load to every GLOBAL_DATA module that defines onPrePostLoad. |
| `VehicleConfigurationItem:onPostLoad(object: any, configId: any)` | 169 | ✍ Forwards the post-load stage to every GLOBAL_DATA module that defines onPostLoad. |
| `VehicleConfigurationItem:onLoadFinished(object: any, configId: any)` | 179 | ✍ Forwards the load-finished stage to every GLOBAL_DATA module that defines onLoadFinished. |
| `VehicleConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 189 | ✍ Forwards the size computation to every GLOBAL_DATA module that defines onSizeLoad, so configurations can change the vehicle size data. |
| `VehicleConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 199 | ✍ Static, runs after all items of a configuration are loaded. Appends a counter to duplicated names via getNeedsRenaming and logs an XML warning for duplicated save ids. |
| `VehicleConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 226 | ✍ Static. Registers the common configuration XML attributes (title, yes/no option, name, desc, price, upkeep, default, selectable, saveId, brand, vehicle name and icon, shop offsets), then lets each GLOBAL_DATA module register its own. |
| `VehicleConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 257 | ✍ Static. Registers the savegame XML attributes name, id and isActive for a configuration entry. |
