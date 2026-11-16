# handTools/HandToolSystem.lua

*[Version française](../../fr/scripts/handTools/HandToolSystem.md)*

Source: `dataS/scripts/handTools/HandToolSystem.lua` — FS25 1.25.1.0

✍ Manager (child of `AbstractManager`) that tracks all hand tools and hand tool holders in the world, by unique id and by click box. It saves hand tools to `handTools.xml`, loads them back through `HandToolLoadingData`, tracks pending loads for the mission start, and publishes `HANDTOOL_ADDED` and `HANDTOOL_REMOVED` on the message center. It registers the console commands `gsHandToolReload` and, with test commands, `gsHandToolsPendingLoadings`.

- **HandToolSystem** inherits from `AbstractManager` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolSystem.new() → HandToolSystem` | 50 | ✍ Creates the system with empty collections and registers its console commands; the handler functions they name are not defined in this file (UNVERIFIED). Note: `handToolsToLoad` is not initialized here although `loadHandToolFromXML` increments it. |
| `HandToolSystem:addHandTool(handTool: any)` | 127 | ✍ Adds a hand tool after checking its type and that its unique id is not already used; assigns a new unique id if it has none. Publishes `HANDTOOL_ADDED`. Returns true on success, false on error or duplicate. |
| `HandToolSystem:removeHandTool(handTool: any)` | 154 | ✍ Removes the hand tool from the list and from the unique id map, then publishes `HANDTOOL_REMOVED`. Does nothing for nil. |
| `HandToolSystem:getHandToolByUniqueId(uniqueId: any)` | 173 | ✍ Returns the hand tool with the given unique id, or nil. |
| `HandToolSystem:addHandToolHolder(handToolHolder: any)` | 191 | ✍ Adds a holder (type-checked), gives it a unique id if needed and indexes its click boxes. Returns false on a duplicate id. Note: the holder is inserted in the list before the duplicate check, so a rejected duplicate stays in the list (apparent bug). |
| `HandToolSystem:removeHandToolHolder(handToolHolder: any)` | 226 | ✍ Removes a holder from the list, the unique id map and the click box map. |
| `HandToolSystem:getHandToolHolderByUniqueId(uniqueId: any)` | 251 | ✍ Returns the holder with the given unique id, or nil. |
| `HandToolSystem:save(xmlFilename: any, usedModNames: any)` | 264 | ✍ Creates `xmlFilename` with root `handTools` and the savegame schema, writes the hand tools needing saving, then frees the XML file. |
| `HandToolSystem:saveToXML(handTools: any, xmlFile: any, usedModNames: any)` | 274 | ✍ Writes each hand tool for which `getNeedsSaving()` is true as `handTools.handTool(i)`, and saves the file only if at least one was written. |
| `HandToolSystem:saveHandToolToXML(handTool: any, xmlFile: any, index: any, i: any, usedModNames: any)` | 293 | ✍ Writes one hand tool: mod name (also recorded in `usedModNames`), network-converted and HTML-encoded config filename, then the tool's own `saveToXMLFile` data. |
| `HandToolSystem:loadHandToolFromXML(xmlFile: any, key: any)` | 356 | ✍ Reads the filename at `key`, looks up the store item and starts loading via `HandToolLoadingData` with savegame data; `loadHandToolFinished` is the callback. Returns true if a load was started, false if the store item is unknown. Note: `allowedToLoad` is a constant true. |
| `HandToolSystem:loadHandToolFinished(handTool: any, loadingState: any)` | 390 | ✍ Load callback: collects successfully loaded hand tools, remembers the first non-OK state, decrements the counter and, when it reaches 0, calls the stored async callback with the list and final state, then clears it. |
| `HandToolSystem:addPendingHandToolLoad(handTool: any)` | 414 | ✍ Marks a hand tool as pending (still loading or synchronizing). |
| `HandToolSystem:removePendingHandToolLoad(handTool: any)` | 420 | ✍ Removes a hand tool from the pending list. |
| `HandToolSystem:canStartMission()` | 431 | ✍ Returns true only if every registered hand tool is synchronized and no hand tool load is pending. |

## Messages

- publishes `MessageType.HANDTOOL_ADDED` (l.147)
- publishes `MessageType.HANDTOOL_REMOVED` (l.168)
