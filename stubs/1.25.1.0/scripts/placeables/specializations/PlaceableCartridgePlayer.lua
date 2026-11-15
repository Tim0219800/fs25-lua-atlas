---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableCartridgePlayer.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableCartridgePlayer
PlaceableCartridgePlayer = {}

---@class PlaceableCartridgePlayerActivatable
PlaceableCartridgePlayerActivatable = {}

---@param specializations table
---@return boolean
function PlaceableCartridgePlayer.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableCartridgePlayer.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableCartridgePlayer.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableCartridgePlayer.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableCartridgePlayer:onLoad(savegame) end

function PlaceableCartridgePlayer:onDelete() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableCartridgePlayer:cartridgePlayerTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function PlaceableCartridgePlayer:activatePlayer() end

---@param placeable any
function PlaceableCartridgePlayerActivatable.new(placeable) end

function PlaceableCartridgePlayerActivatable:run() end
