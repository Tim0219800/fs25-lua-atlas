---@meta
-- FS25 1.25.1.0 : forestry/TargetTreeMarker.lua (generated stub, FS25 Lua Atlas)

---@class TargetTreeMarker
TargetTreeMarker = {}

---@param vehicle any
---@param linkNode any
---@param customMt any
function TargetTreeMarker.new(vehicle, linkNode, customMt) end

---@param schema any
---@param baseKey any
function TargetTreeMarker.registerXMLPaths(schema, baseKey) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function TargetTreeMarker:loadFromXML(xmlFile, key, baseDirectory) end

function TargetTreeMarker:delete() end

---@param isActive any
function TargetTreeMarker:setIsActive(isActive) end

---@param r any
---@param g any
---@param b any
---@param isFlashing any
---@param flashingMinIntensity any
function TargetTreeMarker:setColor(r, g, b, isFlashing, flashingMinIntensity) end

---@param dt any
function TargetTreeMarker:update(dt) end

---@param x any
---@param y any
---@param z any
---@param dx any
---@param dy any
---@param dz any
---@param radius any
---@param offset any
function TargetTreeMarker:setPosition(x, y, z, dx, dy, dz, radius, offset) end

---@param i3dNode any
---@param failedReason any
function TargetTreeMarker:onI3DLoaded(i3dNode, failedReason) end
