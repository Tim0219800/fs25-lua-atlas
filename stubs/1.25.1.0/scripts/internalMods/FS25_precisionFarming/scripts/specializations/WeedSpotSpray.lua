---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/WeedSpotSpray.lua (stub généré, atlas Lua FS25)

---@class WeedSpotSpray
WeedSpotSpray = {}

---@param specializations table
---@return boolean
function WeedSpotSpray.prerequisitesPresent(specializations) end

function WeedSpotSpray.initSpecialization() end

---@param vehicleType any
function WeedSpotSpray.registerFunctions(vehicleType) end

---@param vehicleType any
function WeedSpotSpray.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WeedSpotSpray.registerEventListeners(vehicleType) end

---@param savegame any
function WeedSpotSpray:onPreLoad(savegame) end

---@param savegame any
function WeedSpotSpray:onLoad(savegame) end

---@param dt any
function WeedSpotSpray:onEndWorkAreaProcessing(dt) end

function WeedSpotSpray:getIsSpotSprayEnabled() end

---@param linkData any
function WeedSpotSpray:addWeedSpotSpraySensorNodes(linkData) end

---@param superFunc any
---@param fillType any
---@param dt any
function WeedSpotSpray:getSprayerUsage(superFunc, fillType, dt) end

---@param superFunc any
---@param effectData any
---@param effectNode any
---@param linkNode any
---@param linkNodeData any
function WeedSpotSpray:addExtendedSprayerNozzleEffect(superFunc, effectData, effectNode, linkNode, linkNodeData) end

---@param superFunc any
---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function WeedSpotSpray:updateExtendedSprayerNozzleEffectState(superFunc, effectData, dt, isTurnedOn, lastSpeed) end

---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function WeedSpotSpray:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end
