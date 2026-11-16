# vehicles/WorkAreaTypeManager.lua

*[Version française](../../fr/scripts/vehicles/WorkAreaTypeManager.md)*

Source: `dataS/scripts/vehicles/WorkAreaTypeManager.lua` — FS25 1.25.1.0

✍ Manager (extends `AbstractManager`) that registers work area types and exposes them by index and name. Registering a type fills the global table `WorkAreaType` (name to index) and stores three flags per type: attracts wildlife, is an AI area, is a steering assist area. Where the types are registered is not in this file (UNVERIFIED).

- **WorkAreaTypeManager** inherits from `AbstractManager` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `WorkAreaTypeManager.new(customMt: any) → table` | 19 | ✍ Constructor, creates the manager through `AbstractManager.new`. |
| `WorkAreaTypeManager:initDataStructures()` | 27 | ✍ Resets the type list and lookup tables and rebinds the global `WorkAreaType` to the name-to-index table. |
| `WorkAreaTypeManager:addWorkAreaType(name: any, attractWildlife: any, isAIArea: any, isSteeringAssistArea: any)` | 36 | ✍ Registers a new work area type with upper-cased name and the three optional flags (default false). Logs an error and returns if the name is missing or already used. |
| `WorkAreaTypeManager:getWorkAreaTypeNameByIndex(index: any)` | 64 | ✍ Returns the type name for an index, or nil if unknown. |
| `WorkAreaTypeManager:getWorkAreaTypeIndexByName(name: any)` | 75 | ✍ Returns the index of a type by name (case-insensitive), or nil. |
| `WorkAreaTypeManager:getConfigurationDescByName(name: any)` | 84 | ✍ Returns the full descriptor table (name, index, flags) for a type name, or nil. |
| `WorkAreaTypeManager:getWorkAreaTypeByIndex(index: any)` | 93 | ✍ Returns the descriptor table stored at the given index, or nil. |
| `WorkAreaTypeManager:getWorkAreaTypeIsAIArea(index: any)` | 99 | ✍ Returns whether the type at this index is an AI area; false if the index is unknown. |
| `WorkAreaTypeManager:getWorkAreaTypeIsSteeringAssistArea(index: any)` | 109 | ✍ Returns whether the type at this index is a steering assist area; false if the index is unknown. |
