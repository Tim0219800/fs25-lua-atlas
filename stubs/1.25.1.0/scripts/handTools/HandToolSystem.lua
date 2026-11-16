---@meta
-- FS25 1.25.1.0 : handTools/HandToolSystem.lua (generated stub, FS25 Lua Atlas)

--- Manager (child of `AbstractManager`) that tracks all hand tools and hand tool holders in the world, by unique id and by click box. It saves hand tools to `handTools.xml`, loads them back through `HandToolLoadingData`, tracks pending loads for the mission start, and publishes `HANDTOOL_ADDED` and `HANDTOOL_REMOVED` on the message center. It registers the console commands `gsHandToolReload` and, with test commands, `gsHandToolsPendingLoadings`.
---@class HandToolSystem : AbstractManager
HandToolSystem = {}

--- Creates the system with empty collections and registers its console commands; the handler functions they name are not defined in this file (UNVERIFIED). Note: `handToolsToLoad` is not initialized here although `loadHandToolFromXML` increments it.
---@return HandToolSystem
function HandToolSystem.new() end

--- Adds a hand tool after checking its type and that its unique id is not already used; assigns a new unique id if it has none. Publishes `HANDTOOL_ADDED`. Returns true on success, false on error or duplicate.
---@param handTool any
function HandToolSystem:addHandTool(handTool) end

--- Removes the hand tool from the list and from the unique id map, then publishes `HANDTOOL_REMOVED`. Does nothing for nil.
---@param handTool any
function HandToolSystem:removeHandTool(handTool) end

--- Returns the hand tool with the given unique id, or nil.
---@param uniqueId any
function HandToolSystem:getHandToolByUniqueId(uniqueId) end

--- Adds a holder (type-checked), gives it a unique id if needed and indexes its click boxes. Returns false on a duplicate id. Note: the holder is inserted in the list before the duplicate check, so a rejected duplicate stays in the list (apparent bug).
---@param handToolHolder any
function HandToolSystem:addHandToolHolder(handToolHolder) end

--- Removes a holder from the list, the unique id map and the click box map.
---@param handToolHolder any
function HandToolSystem:removeHandToolHolder(handToolHolder) end

--- Returns the holder with the given unique id, or nil.
---@param uniqueId any
function HandToolSystem:getHandToolHolderByUniqueId(uniqueId) end

--- Creates `xmlFilename` with root `handTools` and the savegame schema, writes the hand tools needing saving, then frees the XML file.
---@param xmlFilename any
---@param usedModNames any
function HandToolSystem:save(xmlFilename, usedModNames) end

--- Writes each hand tool for which `getNeedsSaving()` is true as `handTools.handTool(i)`, and saves the file only if at least one was written.
---@param handTools any
---@param xmlFile any
---@param usedModNames any
function HandToolSystem:saveToXML(handTools, xmlFile, usedModNames) end

--- Writes one hand tool: mod name (also recorded in `usedModNames`), network-converted and HTML-encoded config filename, then the tool's own `saveToXMLFile` data.
---@param handTool any
---@param xmlFile any
---@param index any
---@param i any
---@param usedModNames any
function HandToolSystem:saveHandToolToXML(handTool, xmlFile, index, i, usedModNames) end

--- Reads the filename at `key`, looks up the store item and starts loading via `HandToolLoadingData` with savegame data; `loadHandToolFinished` is the callback. Returns true if a load was started, false if the store item is unknown. Note: `allowedToLoad` is a constant true.
---@param xmlFile any
---@param key any
function HandToolSystem:loadHandToolFromXML(xmlFile, key) end

--- Load callback: collects successfully loaded hand tools, remembers the first non-OK state, decrements the counter and, when it reaches 0, calls the stored async callback with the list and final state, then clears it.
---@param handTool any
---@param loadingState any
function HandToolSystem:loadHandToolFinished(handTool, loadingState) end

--- Marks a hand tool as pending (still loading or synchronizing).
---@param handTool any
function HandToolSystem:addPendingHandToolLoad(handTool) end

--- Removes a hand tool from the pending list.
---@param handTool any
function HandToolSystem:removePendingHandToolLoad(handTool) end

--- Returns true only if every registered hand tool is synchronized and no hand tool load is pending.
function HandToolSystem:canStartMission() end
