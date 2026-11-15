---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableInfoTrigger.lua (stub généré, atlas Lua FS25)

---@class PlaceableInfoTrigger
PlaceableInfoTrigger = {}

---@param specializations table
---@return boolean
function PlaceableInfoTrigger.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableInfoTrigger.registerEvents(placeableType) end

---@param placeableType any
function PlaceableInfoTrigger.registerEventListeners(placeableType) end

---@param placeableType any
function PlaceableInfoTrigger.registerFunctions(placeableType) end

---@param schema any
---@param basePath any
function PlaceableInfoTrigger.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableInfoTrigger:onLoad(savegame) end

function PlaceableInfoTrigger:onDelete() end

function PlaceableInfoTrigger:onFinalizePlacement() end

function PlaceableInfoTrigger:onDraw() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableInfoTrigger:onInfoTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param info any
function PlaceableInfoTrigger:updateInfo(info) end
