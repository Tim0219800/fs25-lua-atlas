---@meta
-- FS25 1.25.1.0 : vehicles/VehicleStateRecorder.lua (generated stub, FS25 Lua Atlas)

--- Developer tool that records the transforms and visibility of a vehicle's i3d-mapped nodes over time and writes them to an XML file in a `giantsTools` folder next to the vehicle config. It can run for a fixed duration or follow a named animation by temporarily replacing `SpecializationUtil.raiseEvent`. Console commands start and stop it, and a second simultaneous animation recording is refused.
---@class VehicleStateRecorder
VehicleStateRecorder = {}

--- Creates a recorder for a vehicle with an optional name and duration in seconds. With an animation name it hooks `SpecializationUtil.raiseEvent` and starts on `onPlayAnimation`; otherwise it starts at once via `addUpdateable`.
---@param vehicle any
---@param name any
---@param duration any
---@param animationName any
function VehicleStateRecorder.new(vehicle, name, duration, animationName) end

--- Per-frame update: stops when the duration has elapsed, otherwise records the current vehicle state and draws an on-screen recording label.
---@param dt any
function VehicleStateRecorder:update(dt) end

--- Writes all recorded node states to an XML file (translation, rotation in degrees, visibility, only when changed), then removes the updateable and restores the original `raiseEvent` hook.
function VehicleStateRecorder:finish() end

--- Records the state of every vehicle component node and its child hierarchy.
function VehicleStateRecorder:recordVehicle() end

--- Recursively records a node if it is listed in the vehicle's `i3dMappings`; a new sample is stored only when translation, rotation or visibility changed. The first sample also stores node name and class id name.
---@param node any
---@param indexPath any
---@param separator any
function VehicleStateRecorder:recordNode(node, indexPath, separator) end

--- Console handler that toggles a timed recording on the currently selected vehicle of the local player; a second call finishes the running recording.
---@param unusedSelf any
---@param name any
---@param duration any
function VehicleStateRecorder.consoleCommand(unusedSelf, name, duration) end

--- Console handler that toggles a recording tied to a named animation on the selected vehicle; a second call finishes the running recording.
---@param unusedSelf any
---@param animationName any
function VehicleStateRecorder.consoleCommandAnimation(unusedSelf, animationName) end
