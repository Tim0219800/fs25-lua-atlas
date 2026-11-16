# ai/HelperManager.lua

*[Version française](../../fr/scripts/ai/HelperManager.md)*

Source: `dataS/scripts/ai/HelperManager.lua` — FS25 1.25.1.0

✍ Manager (child of AbstractManager) that stores the AI helper characters: name, title, colour and a PlayerStyle for their look. It loads data/maps/maps_helpers.xml and the map's own helpers section (map.helpers.helper entries), and tracks which helpers are available or in use. Part of AbstractManager and PlayerStyle:loadFromXMLFile are not in the dump (UNVERIFIED).

- **HelperManager** inherits from `AbstractManager` (l.27)

## Functions

| Function | Line | Description |
|---|---|---|
| `HelperManager.new(customMt: any) → table` | 32 | ✍ Constructor. Creates the manager through AbstractManager.new with the given or default metatable. |
| `HelperManager:initDataStructures()` | 39 | ✍ Resets the helper count and the tables (by name, by name-to-index, by index, available list). |
| `HelperManager:loadDefaultTypes(missionInfo: any, baseDirectory: any)` | 49 | ✍ Loads the base helper definitions from data/maps/maps_helpers.xml as base types, then closes the XML file. |
| `HelperManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 58 | ✍ Calls the parent loadMapData, loads the default helpers, then loads any helpers from the map XML through XMLUtil.loadDataFromMapXML. Returns that result. |
| `HelperManager:loadHelpers(xmlFileHandle: any, missionInfo: any, baseDirectory: any, isBaseType: any, customEnvironment: any) → boolean` | 68 | ✍ Reads each map.helpers.helper entry (#name, #title, #color, child playerStyle), builds a PlayerStyle and adds the helper. Returns false if the XML cannot be wrapped, true otherwise. |
| `HelperManager:addHelper(name: string, title: string, color: string, playerStyle: any, baseDir: string, isBaseType: any) → boolean` | 95 | ✍ Adds a helper under an upper-cased valid name, with a title (defaulting to the name), colour and style, and marks it available. A base type with an existing name is rejected; otherwise an existing helper gets its title and style updated. |
| `HelperManager:getRandomHelper() → table` | 141 | ✍ Returns a random helper from the currently available list. UNVERIFIED behaviour on an empty list (math.random is called with an upper bound of 0). |
| `HelperManager:getRandomHelperStyle() → table` | 148 | ✍ Returns the PlayerStyle of a random helper chosen among all helpers, whether in use or not. |
| `HelperManager:getRandomIndex() → integer` | 155 | ✍ Returns a random helper index between 1 and the total helper count. |
| `HelperManager:getHelperByIndex(index: integer) → table` | 163 | ✍ Returns the helper record for an index, or nil if the index is nil or unknown. |
| `HelperManager:getHelperByName(name: string) → table` | 174 | ✍ Returns the helper record for a name (case-insensitive), or nil. |
| `HelperManager:useHelper(helper: table) → boolean` | 186 | ✍ Marks a helper as in use by removing it from the available list. Returns true if it was found there, false otherwise. |
| `HelperManager:releaseHelper(helper: table)` | 199 | ✍ Marks a helper as free again by appending it to the available list. It does not check for duplicates. |
| `HelperManager:getNumOfHelpers() → integer` | 206 | ✍ Returns the total number of registered helpers. |
