# fruits/FruitTypeManager.lua

*[Version française](../../fr/scripts/fruits/FruitTypeManager.md)*

Source: `dataS/scripts/fruits/FruitTypeManager.lua` — FS25 1.25.1.0

✍ Manager (parent AbstractManager) that owns every fruit type, fruit type category and fruit-to-fill-type converter. It loads fruit types from the base maps_fruitTypes.xml and from the map XML, merges mod overrides, and exposes lookups by index, name and fill type, plus category and converter helpers. It also creates the global tables FruitType, FruitTypeCategory and FruitTypeConverter (name to index). Several methods it calls (addFruitType, loadMapFruitTypes, loadMapCategoriesAndConverters, loadCategoriesFromXML, loadConvertersFromXML, initializeFruitTypeConverters) are not defined in this dump (UNVERIFIED).

- **FruitTypeManager** inherits from `AbstractManager` (l.43)

## Functions

| Function | Line | Description |
|---|---|---|
| `FruitTypeManager.new(customMt: table?) → any` | 49 | ✍ Constructor. Creates the manager through AbstractManager.new with this class's metatable. |
| `FruitTypeManager:initDataStructures()` | 57 | ✍ Resets all lookup tables (fruit types by index, name, fill type, density type, filename, converters, windrow data, categories) and sets the globals FruitType (with UNKNOWN = 0), FruitTypeCategory and FruitTypeConverter to the name-to-index tables. |
| `FruitTypeManager:loadDefaultTypes()` | 93 | ✍ Loads the base game fruit types, categories and converters from data/maps/maps_fruitTypes.xml, flagged as base types. |
| `FruitTypeManager:loadMapData(xmlFileHandle: integer, missionInfo: table, baseDirectory: string?) → boolean` | 105 | ✍ Map load entry. Loads the map's fruit types first (stored as mod fruit types), then the default types, then the map's categories and converters, and finally initialises the converters. Returns true. |
| `FruitTypeManager:loadFruitTypes(xmlFileHandle: integer, missionInfo: table, baseDirectory: string?, isBaseType: boolean?) → boolean` | 208 | ✍ Reads fruit type entries from an XML handle, each pointing to a foliage XML loaded into a FruitTypeDesc and added to the manager. A pending mod fruit type with the same name replaces the default. Remaining mod types are added, then categories and converters are read. Stops at the network limit. |
| `FruitTypeManager:getFruitTypeByIndex(index: integer) → table` | 303 | ✍ Returns the fruit type object for an index, or nil. |
| `FruitTypeManager:getFruitTypeNameByIndex(index: integer) → string?` | 311 | ✍ Returns the upper-case name of a fruit type by index, "UNKNOWN" for index 0, or nil if the index is not known. |
| `FruitTypeManager:getFruitTypeByName(name: string) → table` | 328 | ✍ Returns the fruit type for a name (case-insensitive), or nil if the name is nil or unknown. |
| `FruitTypeManager:getFruitTypes() → table` | 352 | ✍ Returns the list of all fruit types. This is the internal table; do not modify it. |
| `FruitTypeManager:getFruitTypeIndexByFillTypeIndex(index: integer) → integer?` | 360 | ✍ Returns the fruit type index linked to a fill type index, or nil if that fill type is not a fruit. |
| `FruitTypeManager:getFruitTypeByFillTypeIndex(index: integer) → table?` | 369 | ✍ Returns the fruit type object matching a fill type index, or nil. |
| `FruitTypeManager:getFillTypeIndexByFruitTypeIndex(index: integer) → integer?` | 378 | ✍ Returns the fill type index of a fruit type, or nil if there is none. |
| `FruitTypeManager:getFillTypeByFruitTypeIndex(index: integer) → table?` | 391 | ✍ Returns the fill type object of a fruit type index, or nil. |
| `FruitTypeManager:getFillTypeNameByFruitTypeIndex(index: integer) → string?` | 400 | ✍ Returns the fill type name of a fruit type index, or nil. Note: the local variable is named fillTypeIndex but holds the fill type object. |
| `FruitTypeManager:getCutHeightByFruitTypeIndex(index: integer, isForageCutter: boolean?) → number` | 411 | ✍ Returns the cut height in metres of a fruit type. With isForageCutter it prefers the forage cut height. Defaults to 0.15 when the fruit type is unknown. |
| `FruitTypeManager:addFruitTypeCategory(name: string, isBaseType: boolean) → integer?` | 439 | ✍ Registers a fruit type category by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name, or for an existing name when isBaseType is true; otherwise an existing category index is reused. |
| `FruitTypeManager:addFruitTypeToCategory(fruitTypeIndex: integer, categoryIndex: integer) → table` | 470 | ✍ Appends a fruit type index to a category. Returns true if both arguments are non-nil, else false. It does not check that the category exists or avoid duplicates. |
| `FruitTypeManager:getFruitTypesByCategoryNames(names: string, warning: string) → array` | 483 | ✍ Takes space-separated category names and returns the list of fruit types in them, without duplicates. Unknown categories optionally log the given warning format. |
| `FruitTypeManager:getFruitTypeIndicesByCategoryNames(names: string, warning: string) → table` | 513 | ✍ Same as getFruitTypesByCategoryNames but returns fruit type indices instead of objects. |
| `FruitTypeManager:getFruitTypesByNames(names: string, warning: string?) → array` | 529 | ✍ Takes space-separated fruit type names and returns the matching fruit types, without duplicates. Unknown names optionally log the given warning format. |
| `FruitTypeManager:getFruitTypeIndicesByNames(names: string, warning: string?) → array` | 556 | ✍ Same as getFruitTypesByNames but returns fruit type indices. |
| `FruitTypeManager:getFillTypesByFruitTypeNames(names: string, warning: string?) → table` | 572 | ✍ Takes space-separated fruit type names and returns their fill type objects, without duplicates. Names with no fruit type or fill type optionally log the warning format. |
| `FruitTypeManager:getFillTypeIndicesByFruitTypeNames(names: string, warning: string?) → table` | 602 | ✍ Same as getFillTypesByFruitTypeNames but returns fill type indices. |
| `FruitTypeManager:getFillTypesByFruitTypeCategoryNames(fruitTypeCategoryNames: string, warning: string?) → table` | 618 | ✍ Takes space-separated category names and returns the fill types of all fruit types in them, without duplicates. Unknown categories optionally log the warning format. |
| `FruitTypeManager:getFillTypeIndicesByFruitTypeCategoryName(fruitTypeCategoryNames: string, warning: string?) → table` | 649 | ✍ Same as getFillTypesByFruitTypeCategoryNames but returns fill type indices. The name is singular although it accepts several category names. |
| `FruitTypeManager:isFillTypeWindrow(index: integer) → boolean` | 665 | ✍ Returns true if the fill type index is registered as a windrow fill type; false for nil or unknown. |
| `FruitTypeManager:getWindrowFillTypeIndexByFruitTypeIndex(index: integer) → integer?` | 677 | ✍ Returns the windrow fill type index of a fruit type, or nil if it has no windrow. |
| `FruitTypeManager:getFillTypeLiterPerSqm(fillTypeIndex: integer, defaultValue: number) → number` | 688 | ✍ Returns the liters per square metre for a fill type: the windrow value if its fruit type has a windrow, else the harvest value. Returns defaultValue if the fill type has no fruit type. |
| `FruitTypeManager:addFruitTypeConverter(name: string, isBaseType: boolean) → integer` | 727 | ✍ Registers a converter by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name or, if isBaseType is true, an existing name; otherwise reuses the existing index. |
| `FruitTypeManager:addFruitTypeConversion(converter: integer, fruitTypeName: integer, fillTypeName: integer, conversionFactor: number)` | 758 | ✍ Queues a fruit type to fill type conversion with a factor for a converter. It is stored as names and resolved later by initializeFruitTypeConverters (not in this dump). |
| `FruitTypeManager:getConverterDataByName(converterName: string) → table` | 772 | ✍ Returns the converter data table for a converter name (case-insensitive), or nil. |
| `FruitTypeManager:addModFoliageType(name: string, filename: string, requiredMapModName: string?)` | 781 | ✍ Records an extra foliage type (name, XML path, optional required map mod name) to load later. Only stores the request here; the loading code is not in this file. |
