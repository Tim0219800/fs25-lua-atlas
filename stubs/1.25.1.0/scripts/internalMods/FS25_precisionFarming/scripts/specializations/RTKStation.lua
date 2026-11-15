---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua (generated stub, FS25 Lua Atlas)

---@class RTKStation
RTKStation = {}

---@param specializations table
---@return boolean
function RTKStation.prerequisitesPresent(specializations) end

---@param placeableType any
function RTKStation.registerFunctions(placeableType) end

---@param placeableType any
function RTKStation.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function RTKStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function RTKStation.registerXMLPaths(schema, basePath) end

---@param savegame any
function RTKStation:onFinalizePlacement(savegame) end

function RTKStation:onDelete() end
