# misc/AbstractManager.lua

*[Version française](../../fr/scripts/misc/AbstractManager.md)*

Source: `dataS/scripts/misc/AbstractManager.lua` — FS25 1.25.1.0

✍ Abstract base class for map-bound managers (BaleManager, ConsumableManager and others inherit from it). It defines the lifecycle: construction calls initDataStructures, then load and loadMapData run at startup and unloadMapData resets the state when the mission is deleted.

- **AbstractManager** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AbstractManager.new(customMt: any) → table` | 17 | ✍ Creates the manager instance with the given metatable (or the default one), calls initDataStructures and marks map data as not loaded. Prints a callstack if the argument is not a table. |
| `AbstractManager:initDataStructures()` | 31 | ✍ Empty hook that subclasses override to create their tables; called from the constructor and again on unloadMapData. |
| `AbstractManager:load() → boolean` | 37 | ✍ Hook for initial loading, returns true by default. Subclasses override it to read their own configuration. |
| `AbstractManager:loadMapData() → boolean` | 44 | ✍ Sets the loadedMapData flag and returns true. In a development version it logs an error and a callstack if map data was already loaded without being unloaded first. Subclasses extend it to read map XML. |
| `AbstractManager:unloadMapData()` | 55 | ✍ Clears loadedMapData and calls initDataStructures again, which discards all data of the manager at mission end. |
