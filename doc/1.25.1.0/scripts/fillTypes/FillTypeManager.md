# fillTypes/FillTypeManager.lua

*[Version française](../../fr/scripts/fillTypes/FillTypeManager.md)*

Source: `dataS/scripts/fillTypes/FillTypeManager.lua` — FS25 1.25.1.0

✍ Manager (parent AbstractManager) owning all fill types, fill type categories, converters and fill type sound samples. It loads fill types from the base maps_fillTypes.xml, the map XML and mod XMLs, hands out lookups by index and name, builds the terrain fill layer and distance texture arrays from height types, and creates the globals FillType and FillTypeCategory (name to index). The method getFillTypesByCategoryNamesList and FillTypeDesc finalize, delete and addTerrainFillLayer are used but not in this file (UNVERIFIED).

- **FillTypeManager** inherits from `AbstractManager` (l.67)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillTypeManager.new(customMt: table?) → table` | 73 | ✍ Constructor. Creates the manager through AbstractManager.new with this class's metatable. |
| `FillTypeManager:initDataStructures()` | 80 | ✍ Resets all tables (fill types by index and name, converters, categories, sound samples, mods to load) and sets the globals FillType and FillTypeCategory to the name-to-index and category tables. |
| `FillTypeManager:loadDefaultTypes()` | 109 | ✍ Loads the base game fill types from data/maps/maps_fillTypes.xml as base types, without finalizing them. |
| `FillTypeManager:loadMapData(xmlFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 121 | ✍ Map load entry. Loads the default types, then the map's fill types through XMLUtil, then finalizes every fill type. Returns true if the map data loaded, else false. |
| `FillTypeManager:loadModFillTypes()` | 147 | ✍ Loads the queued mod fill type XML files (modsToLoad), logs how many each added, then finalizes all fill types. Does nothing if no mod entries are queued. The code that queues them is not in this file. |
| `FillTypeManager:unloadMapData()` | 173 | ✍ Deletes all fill type sound samples and calls delete on every fill type, then runs the parent unload. |
| `FillTypeManager:loadFillTypes(xmlFile: table\|integer, baseDirectory: string, isBaseType: boolean, customEnv: string?, finalizeType: any) → boolean` | 192 | ✍ Reads fill types, categories, converters and fill type sounds from an XML file or handle. For base types it first adds the UNKNOWN type and skips names that already exist; otherwise existing types are updated. Optionally finalizes each type. Returns false for a nil or 0 handle, else true. |
| `FillTypeManager:addFillType(fillTypeDesc: table) → boolean` | 315 | ✍ Registers a fill type description, assigns it the next index and fills the name, index and title lookups. Returns false and logs an error if the network limit on the number of fill types is reached. |
| `FillTypeManager:assignFillTypeTextureArraysFromTerrain(nodeId: integer, terrainRootNodeId: integer, diffuse: boolean, normal: boolean, height: boolean)` | 341 | ✍ Takes the first material of a node, lets the engine set the terrain fill plane textures (diffuse, normal, height) on it and assigns the resulting material back to the node. |
| `FillTypeManager:assignCustomFillTypeTextureArraysFromTerrain(nodeId: integer, terrainRootNodeId: integer, diffuse: string, normal: string, height: string)` | 358 | ✍ Same as assignFillTypeTextureArraysFromTerrain but uses custom texture names for diffuse, normal and height (empty string to skip). |
| `FillTypeManager:constructTerrainFillLayers(heightTypes: table, terrainRootNodeId: integer) → boolean` | 373 | ✍ Rebuilds the terrain fill layers: clears them, adds each height type's fill type as a layer, applies its visual height mappings to the terrain detail height, then finalizes the layers. Returns true. |
| `FillTypeManager:constructFillTypeDistanceTextureArray(terrainDetailHeightId: integer, typeFirstChannel: integer, typeNumChannels: integer, heightTypes: table) → boolean` | 412 | ✍ Builds the distance texture array for the terrain detail height from the fill types of the given height types, and returns the result of finalizing the constructor. |
| `FillTypeManager:getTextureArrayIndexByFillTypeIndex(index: integer) → integer` | 431 | ✍ Returns the texture array index of a fill type, or nil if it is unknown or not in the array. |
| `FillTypeManager:getPrioritizedEffectTypeByFillTypeIndex(index: integer) → string` | 440 | ✍ Returns the prioritized effect class name of a fill type (default "ShaderPlaneEffect"), or nil if the index is unknown. |
| `FillTypeManager:getSmokeColorByFillTypeIndex(index: integer, fruitColor: boolean) → table` | 450 | ✍ Returns the smoke color of a fill type. With fruitColor true it prefers the fruit smoke color and falls back to the fill color. Returns nil if the fill type is unknown. |
| `FillTypeManager:getFillTypeByIndex(index: integer) → table` | 467 | ✍ Returns the fill type object for an index, or nil. |
| `FillTypeManager:getFillTypeNameByIndex(index: integer) → string` | 475 | ✍ Returns the upper-case name of a fill type index, or nil. |
| `FillTypeManager:getFillTypeTitleByIndex(index: integer) → string` | 483 | ✍ Returns the localized title of a fill type index, as stored when the type was added, or nil. |
| `FillTypeManager:getFillTypeNamesByIndices(indices: table) → table` | 491 | ✍ Takes a set whose keys are fill type indices and returns a list of their names (order not guaranteed, since it iterates with pairs). |
| `FillTypeManager:getFillTypeIndexByName(name: string) → integer` | 504 | ✍ Returns the fill type index for a name (case-insensitive), or nil if the name is nil or unknown. |
| `FillTypeManager:getFillTypeByName(name: string) → table` | 512 | ✍ Returns the fill type object for a name (case-insensitive), or nil if the name is not a valid index name or unknown. |
| `FillTypeManager:getFillTypes() → table` | 522 | ✍ Returns the list of all fill type objects. This is the internal table; do not modify it. |
| `FillTypeManager:addFillTypeCategory(name: string, isBaseType: boolean) → integer` | 531 | ✍ Registers a fill type category by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name, or for an existing name when isBaseType is true; otherwise reuses the existing index. |
| `FillTypeManager:addFillTypeToCategory(fillTypeIndex: integer, categoryIndex: integer) → table` | 562 | ✍ Adds a fill type to a category in both directions (category to fill types, fill type to categories). Returns true on success, false if an argument is nil or the category does not exist. |
| `FillTypeManager:getFillTypesByCategoryNames(names: string, warning: string?, fillTypes: table?) → table` | 586 | ✍ Splits space-separated category names and delegates to getFillTypesByCategoryNamesList, which is not in this dump (UNVERIFIED). Returns the (optionally supplied) result table, empty if names is nil. |
| `FillTypeManager:getIsFillTypeInCategory(fillTypeIndex: string, categoryName: string) → boolean` | 660 | ✍ Returns true if the fill type index belongs to the category with the given name, false if either is unknown. |
| `FillTypeManager:getFillTypesByNames(names: string, warning: string?, fillTypes: table?) → table` | 675 | ✍ Splits space-separated fill type names and returns a list of fill type indices (despite the name), skipping UNKNOWN and duplicates. Unknown names optionally log the warning format. Appends to a supplied table if given. |
| `FillTypeManager:getFillTypesFromXML(xmlFile: XMLFile, categoryKey: string, namesKey: string, requiresFillTypes: boolean?) → table` | 708 | ✍ Reads either a category list or a name list from two XML keys and returns the matching fill types. Setting both logs a warning and returns an empty list; setting neither warns only if requiresFillTypes is true. |
| `FillTypeManager:addFillTypeConverter(name: string, isBaseType: boolean) → any` | 775 | ✍ Registers a converter by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name or, when isBaseType is true, an existing name; otherwise reuses the existing index. |
| `FillTypeManager:addFillTypeConversion(converter: integer, sourceFillTypeIndex: integer, targetFillTypeIndex: integer, conversionFactor: number)` | 806 | ✍ Stores a conversion from a source fill type to a target fill type with a factor in the given converter. Ignored if the converter or an index is nil or unknown. |
| `FillTypeManager:getConverterDataByName(converterName: string) → table` | 816 | ✍ Returns the converter data table for a converter name (case-insensitive), or nil. |
| `FillTypeManager:getSampleByFillType(fillType: integer) → table` | 824 | ✍ Returns the sound sample assigned to a fill type index (explicitly or through a default sample), or nil. |
