---@meta
-- FS25 1.25.1.0 : forestry/ForestryHook.lua (generated stub, FS25 Lua Atlas)

---@class ForestryHook
ForestryHook = {}

---@param vehicle any
---@param linkNode any
---@param customMt any
function ForestryHook.new(vehicle, linkNode, customMt) end

---@param schema any
---@param baseKey any
function ForestryHook.registerXMLPaths(schema, baseKey) end

function ForestryHook:isValid() end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function ForestryHook:loadFromXML(xmlFile, key, baseDirectory) end

---@param xmlFile any
function ForestryHook:loadFromConfigXML(xmlFile) end

function ForestryHook:clone() end

function ForestryHook:delete() end

---@param dt any
function ForestryHook:update(dt) end

---@param nodeId any
---@param isActiveDirty any
function ForestryHook:setTargetNode(nodeId, isActiveDirty) end

---@param x any
---@param y any
---@param z any
function ForestryHook:setTargetPosition(x, y, z) end

---@param nodeId any
---@param index any
function ForestryHook:setSubTargetNode(nodeId, index) end

function ForestryHook:resetSubTargetNodes() end

---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ForestryHook:link(node, x, y, z, rx, ry, rz) end

---@param x any
---@param y any
---@param z any
---@param dx any
---@param dz any
function ForestryHook:setPositionAndDirection(x, y, z, dx, dz) end

---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param maxRadius any
---@param tx any
---@param ty any
---@param tz any
function ForestryHook:mountToTree(splitShapeId, x, y, z, maxRadius, tx, ty, tz) end

---@param visibility any
function ForestryHook:setVisibility(visibility) end

function ForestryHook:getRopeTargetPosition() end

function ForestryHook:getRopeTarget() end

function ForestryHook:getRopeTargets() end

---@param i3dNode any
---@param failedReason any
function ForestryHook:onI3DLoaded(i3dNode, failedReason) end
