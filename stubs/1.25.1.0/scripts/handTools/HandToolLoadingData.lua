---@meta
-- FS25 1.25.1.0 : handTools/HandToolLoadingData.lua (generated stub, FS25 Lua Atlas)

--- Container of everything needed to load a hand tool: store item or XML filename, owner farm, savegame data, registration, drop and save flags. It resolves the hand tool type and class through `g_handToolTypeManager`, then delegates to `loadHandTool`, which is not defined in this file (UNVERIFIED, probably added elsewhere).
---@class HandToolLoadingData
HandToolLoadingData = {}

--- Creates a loading data object with defaults: invalid, owner `AccessHandler.EVERYONE`, saved, droppable, registered, not forced to server.
---@param customMt any
---@return table
function HandToolLoadingData.new(customMt) end

--- Sets the hand tool XML file to load, if the file exists; otherwise logs an error with a call stack. Does not touch `isValid`.
---@param filename string
function HandToolLoadingData:setFilename(filename) end

--- Sets the store item and takes its XML filename; marks the data valid only if a store item is given, else logs an error.
---@param storeItem table
function HandToolLoadingData:setStoreItem(storeItem) end

--- Sets the owner farm id for the loaded hand tool.
---@param ownerFarmId integer
function HandToolLoadingData:setOwnerFarmId(ownerFarmId) end

--- Sets whether the hand tool is registered after loading.
---@param isRegistered boolean
function HandToolLoadingData:setIsRegistered(isRegistered) end

--- Sets the savegame data (table with `xmlFile` and `key`) used when loading from a savegame.
---@param savegameData table
function HandToolLoadingData:setSavegameData(savegameData) end

--- Stores the callback, resolves type and class from the XML; on failure calls the callback with nil and `HandToolLoadingState.ERROR`, otherwise calls `loadHandTool` (loading is probably asynchronous, UNVERIFIED). Callback signature: target, handTool, loadingState, arguments.
---@param callback function?
---@param callbackTarget table?
---@param callbackArguments table?
function HandToolLoadingData:load(callback, callbackTarget, callbackArguments) end
