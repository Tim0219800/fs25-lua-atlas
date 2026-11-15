---@meta
-- FS25 1.25.1.0 : ai/NavigationSystem.lua (stub généré, atlas Lua FS25)

---@class NavigationSystem
NavigationSystem = {}

---@param customMt any
function NavigationSystem.new(customMt) end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function NavigationSystem:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param args any
function NavigationSystem:onNavigationMarkerLoaded(i3dNode, failedReason, args) end

function NavigationSystem:delete() end

---@param xmlFilename any
function NavigationSystem:saveToXMLFile(xmlFilename) end

function NavigationSystem:updateMarker() end

function NavigationSystem:draw() end

---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
function NavigationSystem:navigateTo(x, y, z, dirX, dirY, dirZ) end

function NavigationSystem:stop() end
