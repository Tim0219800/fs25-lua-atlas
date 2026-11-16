---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelChock.lua (generated stub, FS25 Lua Atlas)

--- A wheel chock (cale de roue) attached to a wheel: loads a shared i3d model, then either parks it on a parking node or places it against the tire, computing position from the wheel radius and chock height. Created per wheel and driven by the vehicle (which decides whether chocks are allowed).
---@class WheelChock
WheelChock = {}

--- Creates a chock for the given wheel; starts not in parking position with a zero wheel radius offset.
---@param wheel any
---@param customMt any
function WheelChock.new(wheel, customMt) end

--- Deletes the chock node and releases the shared i3d load request.
function WheelChock:delete() end

--- Reads filename, parking node, scale, inversion, default parked state, offset and material from XML, calls the vehicle `onLoadWheelChockFromXML` hook and starts the shared i3d load. Returns false on an invalid filename.
---@param xmlObject any
---@param key any
function WheelChock:loadFromXML(xmlObject, key) end

--- Callback after the i3d is loaded: takes the first child as the chock node, reads `posRefNode`, `parkedNode` and `linkedNode` user attributes, applies scale and material, then calls `update`. Warns if `posRefNode` is missing.
---@param i3dNode integer
---@param failedReason table
---@param args table
function WheelChock:onI3DLoaded(i3dNode, failedReason, args) end

--- Places the chock either in its parking node or against the wheel (computed from tire radius, chock height and offsets) and toggles visibility of the parked/linked helper nodes. Forced to parking if the vehicle does not allow chocks. Returns true when a node exists.
---@param isInParkingPosition any
function WheelChock:update(isInParkingPosition) end

--- Registers the XML schema paths of a wheel chock (filename, scale, parking node, inversion, default parked, offset) plus the vehicle material paths.
---@param schema any
---@param key any
function WheelChock.registerXMLPaths(schema, key) end
