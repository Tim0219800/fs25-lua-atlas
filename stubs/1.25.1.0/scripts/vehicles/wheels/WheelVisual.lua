---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelVisual.lua (generated stub, FS25 Lua Atlas)

--- One visual wheel (tire plus rims and extras) of a vehicle wheel, made of visual parts loaded from XML under a transform group linked to the wheel. It supports a connected twin wheel, reports width, offset, tire node and added mass, forwards per-frame updates to its parts, and can register a shallow-water obstacle with the mission simulation.
---@class WheelVisual
WheelVisual = {}

--- Creates the visual wheel, linking a new transform group named visualWheel to the given node. Defaults to width 0.5 and radius 0.5.
---@param vehicle any
---@param wheel any
---@param linkNode any
---@param isLeft any
---@param rimOffset any
---@param baseDirectory any
---@param customMt any
function WheelVisual.new(vehicle, wheel, linkNode, isLeft, rimOffset, baseDirectory, customMt) end

--- Deletes all visual parts, removes the shallow-water obstacle and deletes the root node.
function WheelVisual:delete() end

--- Loads physics width/radius, rim diameter, an optional rim material template and every visual part type from WheelVisual.PARTS, adding the rim offset to parts other than innerRim and additional. Returns true if at least one part loaded.
---@param xmlObject any
function WheelVisual:loadFromXML(xmlObject) end

--- Applies the rim material to inner and outer rim parts, then calls `postLoad` on every part.
function WheelVisual:postLoad() end

--- Links this wheel to a twin wheel with a signed offset and positions its node along X beside it, taking both widths and the left/right side into account.
---@param connectedVisualWheel any
---@param offset any
function WheelVisual:setConnectedWheel(connectedVisualWheel, offset) end

--- Returns the wheel width and its X offset; when a tire part exists the offset includes the tire part offset (sign depends on left/right).
function WheelVisual:getWidthAndOffset() end

--- Returns the inverted flag if the wheel has a tire part, otherwise false.
function WheelVisual:getIsTireInverted() end

--- Returns the node of the first tire part, or nil if none.
function WheelVisual:getTireNode() end

--- Returns the summed mass of all visual parts.
function WheelVisual:getAdditionalMass() end

--- Calls `update` on each part that has one, threading the changed flag and suspension length through them; returns both values.
---@param x any
---@param y any
---@param z any
---@param xDrive any
---@param suspensionLength any
---@param steeringAngle any
---@param changed any
function WheelVisual:update(x, y, z, xDrive, suspensionLength, steeringAngle, changed) end

--- Registers this wheel as an obstacle in `g_currentMission.shallowWaterSimulation` if it exists, sized from width and radius. Skipped in the shop configuration; the simulation class is not in the dump (UNVERIFIED).
function WheelVisual:addShallowWaterObstacle() end

--- Removes the shallow-water obstacle if one was registered.
function WheelVisual:removeShallowWaterObstacle() end

--- Callback returning the X/Z push vector and Y rotation for the water simulation, from vehicle speed plus random jitter when the wheel slips or moves. Note: `math.random() * 2 - 1 * slip` has an operator precedence quirk, so slip only scales the constant 1.
function WheelVisual:getShallowWaterParameters() end

--- Registers the XML schema paths of every visual part type defined in WheelVisual.PARTS under the given key.
---@param schema any
---@param key any
function WheelVisual.registerXMLPaths(schema, key) end
