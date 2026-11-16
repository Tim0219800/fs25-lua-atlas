---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisualPartTire.lua (generated stub, FS25 Lua Atlas)

--- Visual wheel part for the tire (subclass of WheelVisualPart). It can show tire pressure deformation by driving the `morphPos`/`prevMorphPos` shader parameters on tire shapes from the suspension length, when the platform setting `wheelVisualPressure` is on; it also adds the deformation to the returned suspension length.
---@class WheelVisualPartTire : WheelVisualPart
WheelVisualPartTire = {}

--- Creates a tire part through the parent constructor with deformation 0. Note: the customMt argument is ignored.
---@param name any
---@param visualWheel any
---@param linkNode any
---@param customMt any
function WheelVisualPartTire.new(name, visualWheel, linkNode, customMt) end

--- Calls the parent loader, then reads maxDeformation and initialDeformation (default min(0.04, 60 percent of the max)). Returns false if the parent load fails.
---@param xmlObject any
---@param key any
function WheelVisualPartTire:loadFromXML(xmlObject, key) end

--- When pressure visuals are enabled, computes a clamped deformation from the suspension length, updates the morph shader parameters when it changed past a platform threshold, and returns the changed flag and suspension length increased by the deformation.
---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelVisualPartTire:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

--- Calls the parent `setNode`, collects the shapes having a `morphPos` (or legacy `morphPosition`) shader parameter and initializes their morph parameters, converting the old FS22 format.
---@param node any
function WheelVisualPartTire:setNode(node) end

--- Registers the XML paths of the tire part; currently just forwards to the parent registration.
---@param schema any
---@param key any
---@param name any
function WheelVisualPartTire.registerXMLPaths(schema, key, name) end
