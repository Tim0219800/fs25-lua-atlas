---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisualPart.lua (stub généré, atlas Lua FS25)

---@class WheelVisualPart
WheelVisualPart = {}

---@param name any
---@param visualWheel any
---@param linkNode any
---@param customMt any
function WheelVisualPart.new(name, visualWheel, linkNode, customMt) end

function WheelVisualPart:delete() end

---@param xmlObject any
---@param key any
function WheelVisualPart:loadFromXML(xmlObject, key) end

function WheelVisualPart:postLoad() end

function WheelVisualPart:getDefaultMaterialSlotName() end

---@param i3dNode any
---@param failedReason any
---@param args any
function WheelVisualPart:onPartI3DLoaded(i3dNode, failedReason, args) end

---@param node any
function WheelVisualPart:setNode(node) end

---@param node any
---@param shaderParameterName any
---@param x any
---@param y any
---@param z any
---@param w any
function WheelVisualPart:setShaderParameterRec(node, shaderParameterName, x, y, z, w) end

---@param node any
---@param shaderParameterName any
function WheelVisualPart:getHasShaderParameterRec(node, shaderParameterName) end

function WheelVisualPart:getMass() end

---@param schema any
---@param key any
---@param name any
function WheelVisualPart.registerXMLPaths(schema, key, name) end
