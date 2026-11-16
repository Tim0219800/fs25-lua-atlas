# misc/ConsumableManager.lua

*[Version française](../../fr/scripts/misc/ConsumableManager.md)*

Source: `dataS/scripts/misc/ConsumableManager.lua` — FS25 1.25.1.0

✍ Map-bound manager (extends AbstractManager) for consumables such as animal feed items: consumable types with a UI title, and consumable variations with price, capacity, unit text, i3d meshes (normal, consuming state, tension belt), metadata and shader parameters. Data comes from ConsumableManager.DEFAULT_FILENAME (defined outside this file, UNVERIFIED) and mod xmls queued with addModConsumable. Variations are capped by ConsumableManager.MAX_NUM_VARIATIONS (defined elsewhere).

- **ConsumableManager** inherits from `AbstractManager` (l.19)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConsumableManager.new(customMt: any) → table` | 24 | ✍ Creates the manager, empty type and variation tables, and the two XML schemas (consumable and consumables), stored on the class table. |
| `ConsumableManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 48 | ✍ Reads the default consumables xml: types (name uppercased, title required) and consumable file references, loading each file's variations; then loads queued mod consumables with their custom environment and empties the queue. |
| `ConsumableManager:unloadMapData() → boolean` | 89 | ✍ Deletes the object, consuming and tension belt nodes of every variation, empties the variation list, releases the shared i3d requests, then calls the parent. Note: the in-code doc line wrongly says it loads data on map load. |
| `ConsumableManager:addModConsumable(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 119 | ✍ Queues a mod consumable xml (filename, custom environment, base directory) to be loaded in loadMapData. |
| `ConsumableManager:loadConsumableVariationsFromXML(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 130 | ✍ Loads every consumableVariation of an xml. Entries missing type, name or title are skipped with a warning; the name is prefixed with the custom environment. Starts async i3d loads for object, consumingObject and tensionBeltObject, reads metadata values and shader parameters, and rejects duplicate names and any variation beyond the maximum. |
| `ConsumableManager:consumableI3DFileLoaded(i3dNode: any, failedReason: any, arguments: any)` | 263 | ✍ Async callback: finds the node by path in the loaded i3d, zeroes its position and rotation, unlinks it and stores it in the variation under the requested field (node, consumingNode or tensionBeltNode); warns if the node is not found. Deletes the i3d root. |
| `ConsumableManager:getConsumableMeshByIndex(index: any, addTensionBeltMesh: any)` | 283 | ✍ Returns a clone of the variation's mesh node and, when requested and available, a clone of its tension belt mesh linked under it, as a second value. Nil if the index or the mesh is missing. |
| `ConsumableManager:getConsumableConsumingMeshByIndex(index: any)` | 307 | ✍ Returns a clone of the consuming-state mesh (falling back to the normal mesh) with the variation's shader parameters applied recursively, per material slot when a slot name is given. Nil if the variation or its normal mesh is missing. |
| `ConsumableManager:getConsumableVariationIndexByName(name: any, customEnvironment: any)` | 332 | ✍ Returns the variation index for a name, trying the custom-environment-prefixed name first. Returns 0 when unknown. |
| `ConsumableManager:getConsumableVariationNameByIndex(index: any)` | 351 | ✍ Returns the variation's registered name, or the string UNKNOWN if the index is invalid. |
| `ConsumableManager:getConsumableVariationCapacityAndUnitByIndex(index: any)` | 362 | ✍ Returns the capacity of one unit and its unit text for UI display; two nils if the index is invalid. |
| `ConsumableManager:getConsumableVariationShaderParameterByIndex(index: any)` | 373 | ✍ Returns the variation's list of shader parameters, or nil if the index is invalid. |
| `ConsumableManager:getConsumableVariationMetaDataByIndex(index: any)` | 384 | ✍ Returns the variation's metadata table (name to number, string or vector), or nil if the index is invalid. |
| `ConsumableManager:getConsumableVariationsByType(typeName: any)` | 395 | ✍ Returns the titles of all variations of a type as a list, plus a table mapping each list position to the real variation index. |
| `ConsumableManager:getConsumableVariationPriceByIndex(index: any)` | 410 | ✍ Returns the price per unit of a variation, or nil if the index is invalid. |
| `ConsumableManager:getTypeTitle(typeName: any)` | 421 | ✍ Returns the UI title of a consumable type (falling back to the type name), or nil if the type is unknown. Type names are stored uppercased. |
| `ConsumableManager.registerConsumableXMLPaths(schema: any)` | 432 | ✍ Registers the schema paths of a consumable xml: variation type, price, name, title, capacity, unit text, object, consumingObject and tensionBeltObject (filename and node), metaData values and shader parameters. |
| `ConsumableManager.registerConsumablesXMLPaths(schema: any)` | 460 | ✍ Registers the schema paths of the main consumables xml: types (name, title) and references to consumable files. |
