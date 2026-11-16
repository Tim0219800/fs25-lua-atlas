---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/WinchAttachTreeActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable for the forestry winch: lets the owner player toggle attach mode and attach a tree to one rope of the vehicle `spec_winch`. One instance exists per rope. It registers its own action events while selected and delegates all actual work to winch methods on the vehicle (UNVERIFIED: those methods are defined in Winch.lua, not in this file).
---@class WinchAttachTreeActivatable
WinchAttachTreeActivatable = {}

--- Creates the activatable for one winch rope; caches the winch texts and rope list from `spec_winch` and keeps an empty prompt text.
---@param vehicle table
---@param rope any
---@return table
function WinchAttachTreeActivatable.new(vehicle, rope) end

--- Registers the winch attach-mode toggle (`WINCH_ATTACH_MODE`) and tree attach (`WINCH_ATTACH`) action events with very high text priority, then forces a refresh via `update`.
---@param inputContext any
function WinchAttachTreeActivatable:registerCustomInput(inputContext) end

--- Removes every input action event registered by this object (all events bound to it as target).
---@param inputContext any
function WinchAttachTreeActivatable:removeCustomInput(inputContext) end

--- Input callback: asks the vehicle to switch the attach mode of this rope via `setWinchTreeAttachMode`.
function WinchAttachTreeActivatable:onToggleAttachTreeMode() end

--- Input callback: if `getCanAttachWinchTree` allows it for this rope, calls `onAttachTreeInputEvent` on the vehicle.
function WinchAttachTreeActivatable:onAttachTree() end

--- Per-frame refresh of the prompts: toggle text shows start or stop attach mode, and the attach action is enabled only when a tree can be attached.
---@param dt any
function WinchAttachTreeActivatable:update(dt) end

--- False if the vehicle belongs to another farm, the rope already holds its maximum number of trees, or another rope is in attach mode; true otherwise.
function WinchAttachTreeActivatable:getIsActivatable() end

--- Empty hook; nothing happens when the activatable becomes the selected one.
function WinchAttachTreeActivatable:activate() end

--- Empty hook; nothing happens when the activatable stops being the selected one.
function WinchAttachTreeActivatable:deactivate() end

--- Returns 0 while this rope is in attach mode (so it always wins selection); otherwise the 3D distance from the point to the rope node.
---@param x any
---@param y any
---@param z any
function WinchAttachTreeActivatable:getDistance(x, y, z) end

--- Empty hook; this activatable draws nothing on screen.
function WinchAttachTreeActivatable:draw() end
