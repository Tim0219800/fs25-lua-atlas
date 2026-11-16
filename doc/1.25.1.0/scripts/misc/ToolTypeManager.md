# misc/ToolTypeManager.lua

*[Version française](../../fr/scripts/misc/ToolTypeManager.md)*

Source: `dataS/scripts/misc/ToolTypeManager.lua` — FS25 1.25.1.0

✍ Manager (subclass of AbstractManager) that registers tool type names and numbers them in registration order. Five are built in: undefined, dischargeable, pallet, trigger, bale. initDataStructures publishes the global table ToolType (NAME to index) so scripts can write ToolType.BALE.

- **ToolTypeManager** inherits from `AbstractManager` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `ToolTypeManager.new(customMt: any) → table` | 19 | ✍ Constructor: creates the manager on top of AbstractManager with the given or default metatable. |
| `ToolTypeManager:initDataStructures()` | 27 | ✍ Resets the index-to-name and name-to-index tables and assigns the global ToolType to the name-to-index table. |
| `ToolTypeManager:loadMapData() → boolean` | 37 | ✍ Calls the parent loader then registers the five built-in tool types (undefined, dischargeable, pallet, trigger, bale), giving them indices 1 to 5. Returns true. |
| `ToolTypeManager:addToolType(name: string) → table` | 54 | ✍ Registers a tool type under its uppercased name and returns its index; an existing name is not duplicated. Warns and returns nil if the name is not a valid index name. |
| `ToolTypeManager:getToolTypeNameByIndex(index: integer) → string` | 72 | ✍ Returns the tool type name for an index, or "UNDEFINED" when the index is unknown. |
| `ToolTypeManager:getToolTypeIndexByName(name: string) → integer` | 84 | ✍ Returns the tool type index for a name (case-insensitive), or the index of UNDEFINED when the name is unknown. |
| `ToolTypeManager:getNumberOfToolTypes() → integer` | 96 | ✍ Returns how many tool types are registered. |
