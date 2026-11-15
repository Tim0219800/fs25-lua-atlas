---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/ToolConnectionHoseMount.lua (generated stub, FS25 Lua Atlas)

---@class ToolConnectionHoseMount
ToolConnectionHoseMount = {}

---@param vehicle any
---@param customMt any
function ToolConnectionHoseMount.new(vehicle, customMt) end

function ToolConnectionHoseMount:delete() end

---@param callback any
---@param callbackTarget any
function ToolConnectionHoseMount:setCallback(callback, callbackTarget) end

---@param success any
function ToolConnectionHoseMount:onFinished(success) end

---@param startTarget any
---@param endTarget any
function ToolConnectionHoseMount:setReferenceTargets(startTarget, endTarget) end

---@param linkNode any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ToolConnectionHoseMount:setLinkNode(linkNode, x, y, z, rx, ry, rz) end

---@param xmlFilename any
---@param baseDirectory any
function ToolConnectionHoseMount:loadFromXML(xmlFilename, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param args any
function ToolConnectionHoseMount:onI3DLoaded(i3dNode, failedReason, args) end

---@param length any
function ToolConnectionHoseMount:setLength(length) end

---@param node any
---@param sourceTarget any
---@param newType any
function ToolConnectionHoseMount:addHoseTarget(node, sourceTarget, newType) end

function ToolConnectionHoseMount:createToolConnectionHoses() end

---@param schema any
function ToolConnectionHoseMount.registerExternalXMLPaths(schema) end
