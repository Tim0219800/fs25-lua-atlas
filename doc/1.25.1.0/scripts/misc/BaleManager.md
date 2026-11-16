# misc/BaleManager.lua

*[Version française](../../fr/scripts/misc/BaleManager.md)*

Source: `dataS/scripts/misc/BaleManager.lua` — FS25 1.25.1.0

✍ Map-bound manager (extends AbstractManager) that lists every bale type: size, fill types with capacity, variations and the shared i3d. Bale types come from the map file referenced by map.bales#filename and from mods through loadModBaleFromXML. It also runs bale fermentation timers on the server and offers cheat console commands (gsBaleAdd, gsBaleAddAll, gsBaleList) when g_addCheatCommands is set.

- **BaleManager** inherits from `AbstractManager` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleManager.new(customMt: any) → table` | 20 | ✍ Creates the manager and builds the two XML schemas, bale and mapBales, registering their paths. The schemas are stored on the class table, not on the instance. |
| `BaleManager:initDataStructures()` | 34 | ✍ Resets the lists of bale types, pending mod bales and running fermentations. |
| `BaleManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 43 | ✍ Reads map.bales#filename, loads the map bale list, then loads queued mod bales, computes SEND_NUM_BITS from the bale count and starts async shared i3d loads for each type. Registers the cheat console commands if enabled. Returns false when the map defines no bales xml. |
| `BaleManager:baleLoaded(i3dNode: integer, failedReason: integer, bale: Bale)` | 90 | ✍ Callback for the shared bale i3d: stores the root as sharedRoot, logs an error if the first child's collision group or mask differs from CollisionPreset.BALE, and removes the node from physics. |
| `BaleManager:unloadMapData()` | 111 | ✍ Frees the bale shared data, removes the gsBaleAdd and gsBaleList console commands, then calls the parent. Note: gsBaleAddAll is registered at load but not removed here. |
| `BaleManager:unloadBaleData()` | 124 | ✍ Releases each bale type's shared i3d request and deletes its shared root node. |
| `BaleManager:loadBales(xmlFile: any, baseDirectory: any)` | 139 | ✍ Iterates map.bales.bale entries of the given XML file and calls loadBaleFromXML for each; always returns true. |
| `BaleManager:loadBaleFromXML(xmlFile: any, key: any, baseDirectory: any)` | 149 | ✍ Loads one bale type from a map XML key: resolves #filename, reads #isAvailable (default true), loads the bale xml and adds the type to the list. Logs an XML error and returns false on failure. |
| `BaleManager:loadModBaleFromXML(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any)` | 177 | ✍ Queues a mod bale (xml filename, base directory, custom environment, isAvailable) in modBalesToLoad; the data is only parsed later in loadMapData. Logs an XML error and returns false if #filename is missing. |
| `BaleManager:loadBaleDataFromXML(bale: XMLFile, xmlFile: XMLFile, baseDirectory: any) → table` | 206 | ✍ Fills a bale type from its xml: i3d file (must exist), round or square flag, rounded sizes, max stack height, visual sizes, fill types with capacity and variations (default id DEFAULT). Returns false with an XML error when a file is missing, sizes required for the shape are zero, or no i3d is set; unknown fill types only warn. |
| `BaleManager:update(dt: number)` | 272 | ✍ Server only. Advances every fermentation by dt times the effective time scale, calls the bale's onFermentationUpdate when the whole-percent value changes, and on completion calls onFermentationUpdate(1) and onFermentationEnd then removes the entry. |
| `BaleManager:registerFermentation(bale: table, currentTime: number, maxTime: number)` | 303 | ✍ Adds a fermentation timer for a bale with a start time and maximum time. The max time is set to 0 when Platform.gameplay.hasBaleFermentation is false and is multiplied by the mission's economicDifficulty. |
| `BaleManager:getFermentationTime(bale: table) → number` | 323 | ✍ Returns the elapsed fermentation time stored for the bale, or 0 if it has none. |
| `BaleManager:removeFermentation(bale: table)` | 336 | ✍ Removes every fermentation entry belonging to the given bale. |
| `BaleManager:getBaleIndex(fillTypeIndex: integer, isRoundbale: boolean, width: number, height: number, length: number, diameter: number, customEnvironment: string) → integer` | 359 | ✍ Finds the index of an available bale type matching fill type, shape and size. With a customEnvironment it searches that mod's bales first, then the bales without custom environment. Returns nil if none matches. |
| `BaleManager:getBaleInfoByXMLFilename(xmlFilename: any, useVisualInfomation: any)` | 391 | ✍ Returns isRoundbale, width, height, length, diameter and maxStackHeight for a bale xml, using the visual sizes when the flag is true. Unknown files give false, 0, 0, 0, 0, 1. |
| `BaleManager:getIsBaleMatching(bale: any, fillTypeIndex: any, isRoundbale: any, width: any, height: any, length: any, diameter: any)` | 408 | ✍ Tests one bale type against a request: same round or square shape, the fill type is listed, and each non-nil size equals the type's size after rounding to 2 decimals (width and diameter for round, width, height and length for square). |
| `BaleManager:getBaleXMLFilename(fillTypeIndex: integer, isRoundbale: boolean, width: number, height: number, length: number, diameter: number, customEnvironment: any) → integer` | 447 | ✍ Wraps getBaleIndex and returns the matching bale xml filename together with its index, or nil when nothing matches. |
| `BaleManager:getBaleTypeIndexByXMLFilename(xmlFilename: any)` | 458 | ✍ Returns the index of the bale type with the given xml filename, or nil. |
| `BaleManager:getBaleXMLFilenameByIndex(baleIndex: any)` | 470 | ✍ Returns the xml filename of the bale type at the given index, or nil if the index is invalid. |
| `BaleManager:getIsRoundBale(baleIndex: any)` | 480 | ✍ Returns whether the bale type at the index is round, or nil if the index is invalid. |
| `BaleManager:getBaleCapacityByBaleIndex(baleIndex: integer, fillTypeIndex: integer) → number` | 493 | ✍ Returns the capacity defined for a fill type on the bale type at the given index; 0 when the bale or fill type is unknown. |
| `BaleManager:getPossibleCapacitiesForFillType(fillTypeIndex: any)` | 510 | ✍ Returns a list of the capacities of every bale type that supports the fill type (one entry per matching bale type, duplicates possible). |
| `BaleManager:consoleCommandAddBale(fillTypeName: any, isRoundbale: any, width: any, height: any, length: any, wrapState: any, modName: any)` | 526 | ✍ Console command gsBaleAdd (server only): spawns a bale of the given fill type, shape and size about 4 m in front of the local player and 5 m up, with optional wrap state and mod name; defaults to STRAW. Note: the height argument is also passed as the diameter. |
| `BaleManager:consoleCommandAddBaleAll(drawSizeBox: any)` | 582 | ✍ Console command gsBaleAddAll (server only): reloads data/maps/maps_bales.xml, clears the shared i3d cache and, once every i3d is loaded, spawns one physics-free bale per type, fill type and variation in a grid with 3D debug labels and optional size boxes. Replaces previously spawned debug bales. |
| `BaleManager:consoleCommandListBales()` | 690 | ✍ Console command gsBaleList: prints each bale type's xml, shape, non-zero sizes and fill type names to the log. |
| `BaleManager.registerBaleXMLPaths(schema: any)` | 712 | ✍ Registers the bale xml schema paths: i3d filename, size and visual size, mountable object settings, uvId, bale meshes, fill types (capacity, mass, materials, wrapping), variations, fermenting (output fill type, wrapping requirement, time in in-game days) and packed bale data. |
| `BaleManager.registerBaleTextureXMLPaths(schema: any, basePath: any)` | 763 | ✍ Registers the texture paths (diffuse, normal, alpha, baleNormal, netWrapDiffuse, netWrapNormal) under a base path, with fill-type-array flags for diffuse and normal; shared by fill types and variations. |
| `BaleManager.registerMapBalesXMLPaths(schema: any)` | 780 | ✍ Registers the map-level schema paths map.bales.bale(?)#filename and #isAvailable. |
