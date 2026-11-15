---@meta
-- FS25 1.25.1.0 : forestry/ForestryRope.lua (generated stub, FS25 Lua Atlas)

---@class ForestryRope
ForestryRope = {}

---@param vehicle any
---@param linkNode any
---@param customMt any
function ForestryRope.new(vehicle, linkNode, customMt) end

---@param schema any
---@param baseKey any
function ForestryRope.registerXMLPaths(schema, baseKey) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function ForestryRope:loadFromXML(xmlFile, key, baseDirectory) end

---@param xmlFile any
function ForestryRope:loadFromConfigXML(xmlFile) end

---@param linkNode any
function ForestryRope:clone(linkNode) end

function ForestryRope:delete() end

---@param dt any
function ForestryRope:update(dt) end

---@param length any
function ForestryRope:setLength(length) end

---@param nodeId any
---@param isActiveDirty any
function ForestryRope:setTargetNode(nodeId, isActiveDirty) end

---@param x any
---@param y any
---@param z any
function ForestryRope:setTargetPosition(x, y, z) end

---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ForestryRope:link(node, x, y, z, rx, ry, rz) end

---@param x any
---@param y any
---@param z any
---@param dx any
---@param dz any
function ForestryRope:setPositionAndDirection(x, y, z, dx, dz) end

---@param visibility any
function ForestryRope:setVisibility(visibility) end

---@param valid any
function ForestryRope:setEmissiveColor(valid) end

---@param i3dNode any
---@param failedReason any
function ForestryRope:onI3DLoaded(i3dNode, failedReason) end
