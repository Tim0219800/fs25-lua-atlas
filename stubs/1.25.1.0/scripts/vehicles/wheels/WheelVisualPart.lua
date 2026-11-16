---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisualPart.lua (generated stub, FS25 Lua Atlas)

--- Base class of a visual wheel part (rim, tire, connector, additional): loads an i3d, optionally through an intermediate xml that names the file and left/right node paths, then links, offsets, scales and applies materials. Subclasses WheelVisualPartTire and WheelVisualPartConnector extend it.
---@class WheelVisualPart
WheelVisualPart = {}

--- Creates a part with its name, owning visual wheel and link node.
---@param name any
---@param visualWheel any
---@param linkNode any
---@param customMt any
function WheelVisualPart.new(name, visualWheel, linkNode, customMt) end

--- Releases the shared i3d load request.
function WheelVisualPart:delete() end

--- Reads filename (i3d or xml wrapper), node path for left/right, widthAndDiam, offset, scale, holeScale, mass, inversion and materials, then starts the shared i3d load. Returns false if there is no filename or the wrapper xml is invalid.
---@param xmlObject any
---@param key any
function WheelVisualPart:loadFromXML(xmlObject, key) end

--- Applies every loaded material to the part node.
function WheelVisualPart:postLoad() end

--- Returns the default material slot name for this part kind (inner rim, outer rim, additional, connector), or nil for other kinds.
function WheelVisualPart:getDefaultMaterialSlotName() end

--- Callback after the i3d load: finds the node by index path, passes it to `setNode` and deletes the loaded root.
---@param i3dNode any
---@param failedReason any
---@param args any
function WheelVisualPart:onPartI3DLoaded(i3dNode, failedReason, args) end

--- Links the node under the link node, positions it by offset (mirrored for the right side), then applies scale, the widthAndDiam shader parameter (or an inch-based scale if no shader parameter), hole scale and inversion.
---@param node any
function WheelVisualPart:setNode(node) end

--- Recursively sets a shader parameter on this node and all its children that are shapes.
---@param node any
---@param shaderParameterName any
---@param x any
---@param y any
---@param z any
---@param w any
function WheelVisualPart:setShaderParameterRec(node, shaderParameterName, x, y, z, w) end

--- Recursively checks whether a shape in the hierarchy has a shader parameter. Note: the check is hardcoded to the name `widthAndDiam`, ignoring the name argument.
---@param node any
---@param shaderParameterName any
function WheelVisualPart:getHasShaderParameterRec(node, shaderParameterName) end

--- Returns the part mass from XML, or 0 if none.
function WheelVisualPart:getMass() end

--- Registers the material and short material XML paths of a visual part under the given key.
---@param schema any
---@param key any
---@param name any
function WheelVisualPart.registerXMLPaths(schema, key, name) end
