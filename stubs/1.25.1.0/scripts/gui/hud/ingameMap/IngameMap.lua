---@meta
-- FS25 1.25.1.0 : gui/hud/ingameMap/IngameMap.lua (generated stub, FS25 Lua Atlas)

---@class IngameMap : HUDElement
IngameMap = {}

---@param customMt table?
---@return table
function IngameMap.new(customMt) end

function IngameMap:delete() end

---@param isFullscreen any
function IngameMap:setFullscreen(isFullscreen) end

---@param state any
---@param force any
function IngameMap:toggleSize(state, force) end

function IngameMap:resetSettings() end

---@param isAllowed any
function IngameMap:setAllowToggle(isAllowed) end

---@param filename any
---@param worldSizeX any
---@param worldSizeZ any
---@param fieldColor any
---@param grassFieldColor any
function IngameMap:loadMap(filename, worldSizeX, worldSizeZ, fieldColor, grassFieldColor) end

---@param worldSizeX any
---@param worldSizeZ any
function IngameMap:setWorldSize(worldSizeX, worldSizeZ) end

---@param mapHotspot any
function IngameMap:addMapHotspot(mapHotspot) end

---@param mapHotspot any
function IngameMap:removeMapHotspot(mapHotspot) end

---@param hotspot any
function IngameMap:setSelectedHotspot(hotspot) end

function IngameMap:drawPlayersCoordinates() end

function IngameMap:drawLatencyToServer() end

---@param hotspot any
---@param smallVersion any
---@param scale any
---@param doDebug any
function IngameMap:drawHotspot(hotspot, smallVersion, scale, doDebug) end

---@param uiScale number
function IngameMap:setScale(uiScale) end

---@param uiScale any
function IngameMap:storeScaledValues(uiScale) end

function IngameMap:getBackgroundPosition() end

function IngameMap:createBackground() end

function IngameMap:createComponents() end

---@param baseX any
---@param baseY any
---@param baseWidth any
---@param baseHeight any
function IngameMap:createToggleMapSizeGlyph(baseX, baseY, baseWidth, baseHeight) end
