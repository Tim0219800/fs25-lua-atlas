# misc/SplitShapeManager.lua

*[Version française](../../fr/scripts/misc/SplitShapeManager.md)*

Source: `dataS/scripts/misc/SplitShapeManager.lua` — FS25 1.25.1.0

✍ Manager (subclass of AbstractManager) holding the registry of wood split types: one descriptor per tree species with title, price per liter, wood chips yield and harvester rules. The 45 vanilla species are hard-coded in loadMapData rather than read from XML. Also keeps an activeYarders table, which is only initialised here.

- **SplitShapeManager** inherits from `AbstractManager` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `SplitShapeManager.new(customMt: table?) → SplitShapeManager` | 18 | ✍ Constructor: creates the manager on top of AbstractManager, using the given metatable or the default one. |
| `SplitShapeManager:initDataStructures()` | 26 | ✍ Resets the lookup tables typesByIndex and typesByName and the activeYarders list. |
| `SplitShapeManager:loadMapData() → boolean` | 36 | ✍ Calls the parent loader, then registers all built-in split types (index 1 to 45) through addSplitType with hard-coded prices, chip yields and harvester flags. In development builds it also adds the console command gsSplitTypesExport, which calls exportToXML (not defined in this file, UNVERIFIED). Returns true. |
| `SplitShapeManager:addSplitType(name: string, l10nKey: string, splitTypeIndex: integer, pricePerLiter: number, woodChipsPerLiter: number, allowsWoodHarvester: boolean, customEnvironment: string?, volumeToLiter: number?, woodHarvesterAreaThreshold: any)` | 108 | ✍ Registers a split type descriptor (name uppercased, translated title, price, chips per liter, harvester permission, harvester area threshold defaulting to 4.5, volumeToLiter defaulting to 1000). Logs an error and returns without adding if the index or the name is already taken. |
| `SplitShapeManager:getSplitTypeByIndex(index: integer) → table?` | 142 | ✍ Returns the split type descriptor for the index reported by the engine split-type query, or nil if none is registered. |
| `SplitShapeManager:getSplitTypeNameByIndex(index: integer) → string` | 155 | ✍ Returns the uppercase name of the split type for the given index, or the placeholder string "<NO_SPLIT_TYPE>" when the index is unknown. |
