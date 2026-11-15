---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisualPartTire.lua (stub généré, atlas Lua FS25)

---@class WheelVisualPartTire : WheelVisualPart
WheelVisualPartTire = {}

---@param name any
---@param visualWheel any
---@param linkNode any
---@param customMt any
function WheelVisualPartTire.new(name, visualWheel, linkNode, customMt) end

---@param xmlObject any
---@param key any
function WheelVisualPartTire:loadFromXML(xmlObject, key) end

---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelVisualPartTire:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

---@param node any
function WheelVisualPartTire:setNode(node) end

---@param schema any
---@param key any
---@param name any
function WheelVisualPartTire.registerXMLPaths(schema, key, name) end
