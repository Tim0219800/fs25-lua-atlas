---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisualPartConnector.lua (generated stub, FS25 Lua Atlas)

--- Visual wheel part for the connector between twin wheels (subclass of WheelVisualPart). When the visual wheel has a connected twin, it positions the connector node and feeds connector shader parameters, in inches, from the wheel widths and offsets, with two modes (connectorPos or widthAndDiam).
---@class WheelVisualPartConnector : WheelVisualPart
WheelVisualPartConnector = {}

--- Creates a connector part through the parent constructor. Note: the customMt argument is ignored; the connector metatable is always used.
---@param name any
---@param visualWheel any
---@param linkNode any
---@param customMt any
function WheelVisualPartConnector.new(name, visualWheel, linkNode, customMt) end

--- Calls the parent loader, then reads the connector options (useWidthAndDiam, usePosAndScale, diameter, offset, hookOffset, width, start/end positions and offsets, uniformScale). Returns false if the parent load fails.
---@param xmlObject any
---@param key any
function WheelVisualPartConnector:loadFromXML(xmlObject, key) end

--- Calls the parent `setNode`; if a connected wheel exists, moves the node to it and sets the connectorPos or widthAndDiam shader parameters (and connectorPosAndScale if enabled) from the wheel dimensions.
---@param node any
function WheelVisualPartConnector:setNode(node) end

--- Registers the XML paths of the connector; currently just forwards to the parent registration.
---@param schema any
---@param key any
---@param name any
function WheelVisualPartConnector.registerXMLPaths(schema, key, name) end
