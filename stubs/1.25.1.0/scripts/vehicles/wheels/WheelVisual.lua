---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisual.lua (generated stub, FS25 Lua Atlas)

---@class WheelVisual
WheelVisual = {}

---@param vehicle any
---@param wheel any
---@param linkNode any
---@param isLeft any
---@param rimOffset any
---@param baseDirectory any
---@param customMt any
function WheelVisual.new(vehicle, wheel, linkNode, isLeft, rimOffset, baseDirectory, customMt) end

function WheelVisual:delete() end

---@param xmlObject any
function WheelVisual:loadFromXML(xmlObject) end

function WheelVisual:postLoad() end

---@param connectedVisualWheel any
---@param offset any
function WheelVisual:setConnectedWheel(connectedVisualWheel, offset) end

function WheelVisual:getWidthAndOffset() end

function WheelVisual:getIsTireInverted() end

function WheelVisual:getTireNode() end

function WheelVisual:getAdditionalMass() end

---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelVisual:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

function WheelVisual:addShallowWaterObstacle() end

function WheelVisual:removeShallowWaterObstacle() end

function WheelVisual:getShallowWaterParameters() end

---@param schema any
---@param key any
function WheelVisual.registerXMLPaths(schema, key) end
