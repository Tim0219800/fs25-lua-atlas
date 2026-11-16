# objects/Storage.lua

*[Version française](../../fr/scripts/objects/Storage.md)*

Source: `dataS/scripts/objects/Storage.lua` — FS25 1.25.1.0

✍ Generic multi-fill-type storage (silo, bunker, extension) extending Object. It tracks fill levels per fill type with optional per-type capacities, a shared total capacity or single-type mode, start levels, fill planes (static or dynamic) for visuals, daily upkeep costs, and server-to-client synchronization through a dirty flag with a configurable threshold. Unloading and loading stations register themselves with it, and other code can listen for fill level changes. Loaded from the owning placeable's XML.

- **Storage** inherits from `Object` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Storage.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Registers the storage XML attributes: node, capacity, sync threshold, multiple fill types flag, upkeep cost, fill type lists or categories, extension flag, per-type capacities, start levels, fill planes and the dynamic fill plane. |
| `Storage.registerSavegameXMLPaths(schema: any, basePath: any)` | 42 | ✍ Registers the savegame paths: owner `#farmId` and one `node(?)` entry per stored fill type with its name and level. |
| `Storage.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 54 | ✍ Constructor: builds the Object and initializes empty tables for unloading stations, loading stations and fill level listeners, plus rootNode 0 and `foreignSilo` false. |
| `Storage:load(components: table, xmlFile: table, key: string, i3dMappings: table, baseDirectory: any) → boolean` | 74 | ✍ Loads the storage from XML: accepted fill types from categories, names or per-type capacities (error and false if none), start levels with clamping rules, fill planes (custom class or `FillPlane`), the dynamic fill plane, extension flag and dirty flag. Subscribes to `FARM_DELETED`. |
| `Storage:delete()` | 214 | ✍ Unsubscribes from messages, deletes the fill planes, clears the station and listener tables, then calls the parent delete. |
| `Storage:readStream(streamId: integer, connection: table)` | 235 | ✍ Client side initial sync: after the parent data, reads for each sorted fill type an optional Float32 level (preceded by a bool) and applies it with `setFillLevel`. |
| `Storage:writeStream(streamId: integer, connection: table)` | 251 | ✍ Server side initial sync: writes each fill level above zero as a bool plus Float32 and records it as last synced. |
| `Storage:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 268 | ✍ Client side: if the server flagged a storage update, reads all fill levels in sorted fill type order and applies them with `setFillLevel`. |
| `Storage:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 288 | ✍ Server side: when the storage dirty flag is set in the mask, writes all fill levels (bool plus Float32 when above zero) and records them as last synced. |
| `Storage:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 308 | ✍ Loads from a savegame: restores the owner farm (default `AccessHandler.EVERYONE`), zeroes all levels, then sets each saved `node(i)` level for supported fill types, warning for unknown or unsupported ones. Returns true. |
| `Storage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 | ✍ Saves the owner farm id and one `node(i)` entry for each fill type whose level is above zero. |
| `Storage:empty()` | 362 | ✍ Sets every fill level to 0 directly, raising the dirty flag on the server for each. Does not notify listeners or update fill planes. Note: last-synced values are not reset here. |
| `Storage:updateFillPlanes()` | 373 | ✍ Sets each static fill plane's state to level divided by capacity for its fill type (1 if capacity is not positive). |
| `Storage:getIsFillTypeSupported(fillType: integer) → boolean` | 391 | ✍ Returns true if the fill type is in the accepted set. |
| `Storage:getFillLevel(fillType: integer) → number` | 399 | ✍ Returns the current level for a fill type, or 0 if unsupported. |
| `Storage:getFillLevels()` | 405 | ✍ Returns the internal table of fill levels indexed by fill type (not a copy). |
| `Storage:getCapacity(fillType: any)` | 411 | ✍ Returns the custom capacity of the fill type, or the storage's general capacity if none is defined. |
| `Storage:setFillLevel(fillLevel: number, fillType: integer, fillInfo: table)` | 420 | ✍ Clamps and sets the level of a fill type. On change it notifies listeners (when the change exceeds 0.1 or the rounded value changed), raises the server dirty flag at threshold, empty or full, updates fill planes, and adds or removes material on the dynamic fill plane using the optional `fillInfo` area. |
| `Storage:getFreeCapacity(fillType: integer) → number` | 471 | ✍ Returns the remaining room for a fill type: 0 if unsupported; per-type or shared total capacity in multi-type mode; in single-type mode 0 when another type is already stored. |
| `Storage:getSupportedFillTypes()` | 506 | ✍ Returns the internal set of accepted fill types (keys are fill type indices). |
| `Storage:hourChanged()` | 512 | ✍ Server only: charges the owner farm hourly upkeep (cost per level and day divided by 24, times the economy cost multiplier) over all stored levels, as property maintenance. |
| `Storage:addUnloadingStation(station: any)` | 527 | ✍ Registers an unloading station that uses this storage. |
| `Storage:removeUnloadingStation(station: any)` | 533 | ✍ Unregisters an unloading station from this storage. |
| `Storage:addLoadingStation(loadingStation: any)` | 539 | ✍ Registers a loading station that uses this storage. |
| `Storage:removeLoadingStation(loadingStation: any)` | 545 | ✍ Unregisters a loading station from this storage. |
| `Storage:farmDestroyed(farmId: any)` | 551 | ✍ Message handler for farm deletion: if the deleted farm owns this storage, sets all accepted fill types to 0. |
| `Storage:addFillLevelChangedListeners(func: any)` | 563 | ✍ Adds a callback called as `func(fillType, delta)` when a level changes. |
| `Storage:removeFillLevelChangedListeners(func: any)` | 569 | ✍ Removes a previously added fill level change callback. |
| `Storage:draw()` | 575 | ✍ Debug rendering: shows a table of fill levels and capacities near the storage node, added as a frame element to the debug manager. |

## Messages

- subscribes `MessageType.FARM_DELETED` (l.207)
