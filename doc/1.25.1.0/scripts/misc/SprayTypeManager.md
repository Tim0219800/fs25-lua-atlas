# misc/SprayTypeManager.lua

*[Version française](../../fr/scripts/misc/SprayTypeManager.md)*

Source: `dataS/scripts/misc/SprayTypeManager.lua` — FS25 1.25.1.0

✍ Manager (subclass of AbstractManager) for spray types: fertilizer, lime and herbicide products tied to a fill type of the same name, with a consumption rate in liters per second and a ground type. Defaults come from data/maps/maps_sprayTypes.xml, then the map XML (key map.sprayTypes.sprayType) can add or modify entries. initDataStructures also publishes the global table SprayType (name to index).

- **SprayTypeManager** inherits from `AbstractManager` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `SprayTypeManager.new(customMt: any) → table` | 19 | ✍ Constructor: creates the manager on top of AbstractManager with the given or default metatable. |
| `SprayTypeManager:initDataStructures()` | 26 | ✍ Resets the spray type lists and lookup tables (by name, index, fill type index) and assigns the global SprayType to the name-to-index table, so mods can read SprayType.NAME. |
| `SprayTypeManager:loadDefaultTypes()` | 74 | ✍ Loads the base game spray types from data/maps/maps_sprayTypes.xml and registers them as base types, then closes the XML file. |
| `SprayTypeManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 83 | ✍ Calls the parent loader, loads the default spray types, then lets XMLUtil read the map's own sprayTypes section (and mod additions) through loadSprayTypes. Returns the result of that helper. |
| `SprayTypeManager:loadSprayTypes(xmlFile: any, missionInfo: any, isBaseType: any) → boolean` | 92 | ✍ Iterates over map.sprayTypes.sprayType entries of an XML file, reading #name, #litersPerSecond, #type and #sprayGroundType (via FieldSprayType) and calling addSprayType for each. Always returns true. |
| `SprayTypeManager:addSprayType(name: string, litersPerSecond: number, typeName: any, sprayGroundType: any, isBaseType: any) → table` | 117 | ✍ Creates a spray type bound to the fill type of the same name, or updates an existing one. The type must be FERTILIZER, LIME or HERBICIDE, otherwise a warning is printed and nil is returned. A base type that already exists is rejected; a later definition only overrides litersPerSecond and sprayGroundType (ground type defaults to 1). |
| `SprayTypeManager:getSprayTypeByIndex(index: integer) → table` | 172 | ✍ Returns the spray type object at the given index, or nil if the index is nil or unknown. |
| `SprayTypeManager:getSprayTypeByName(name: string) → table` | 183 | ✍ Returns the spray type with the given name (case-insensitive, uppercased internally), or nil. |
| `SprayTypeManager:getFillTypeNameByIndex(index: integer) → string` | 195 | ✍ Returns the name registered for a spray type index. Despite the method name, the index is a spray type index, not a fill type index. |
| `SprayTypeManager:getFillTypeIndexByName(name: string) → integer` | 206 | ✍ Returns the spray type index for a name (case-insensitive), or nil. Despite the name, it is a spray type index, not a fill type index. |
| `SprayTypeManager:getFillTypeByName(name: string) → table` | 218 | ✍ Returns the spray type object for a name (case-insensitive), or nil. Same result as getSprayTypeByName despite its name. |
| `SprayTypeManager:getSprayTypeByFillTypeIndex(index: any)` | 228 | ✍ Returns the spray type linked to a fill type index, or nil when that fill type is not a spray product. |
| `SprayTypeManager:getSprayTypeIndexByFillTypeIndex(index: integer) → integer` | 239 | ✍ Returns the spray type index for a fill type index, or nil if the fill type has no spray type. |
| `SprayTypeManager:getSprayTypes() → table` | 252 | ✍ Returns the ordered list of all registered spray types. |
