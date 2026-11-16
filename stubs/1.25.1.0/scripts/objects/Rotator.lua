---@meta
-- FS25 1.25.1.0 : objects/Rotator.lua (generated stub, FS25 Lua Atlas)

--- Updateable attached to an i3D node (through the onCreate user-attribute) that spins the node continuously around one axis. It reads the user attributes rpm or speed (rad/ms) and axis from the node and rotates it every frame by speed times dt, so the rotation is frame-rate independent.
---@class Rotator
Rotator = {}

--- i3D onCreate hook: creates a Rotator for the node and adds it to the mission's updateables.
---@param id integer
function Rotator:onCreate(id) end

--- Reads the 'rpm' user attribute (converted to rad/ms) or else 'speed' (default 0.0012 rad/ms) and the 'axis' attribute (default 3), which selects the rotated axis. Note: if the attribute is read as a string, indexing the axis table with it is UNVERIFIED.
---@param node integer
---@return table
function Rotator.new(node) end

--- Rotates the node by speed times dt around the configured axis each frame.
---@param dt number
function Rotator:update(dt) end
