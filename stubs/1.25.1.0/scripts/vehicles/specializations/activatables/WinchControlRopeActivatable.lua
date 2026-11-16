---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/WinchControlRopeActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable for controlling a tensioned winch rope with a tree already attached: wind/unwind, detach the tree or start attaching another one. One instance per rope, selected when the local player stands near the rope line. Work is delegated to the vehicle's winch methods (UNVERIFIED: defined in Winch.lua, outside this file).
---@class WinchControlRopeActivatable
WinchControlRopeActivatable = {}

--- Creates the activatable for one winch rope; caches the winch texts and rope list from `spec_winch`.
---@param vehicle table
---@param rope any
---@return table
function WinchControlRopeActivatable.new(vehicle, rope) end

--- Registers three action events at very high priority: winch control (`WINCH_CONTROL`, analog capable), tree detach (`WINCH_DETACH`) and attach-another-tree mode (`WINCH_ATTACH_MODE`), each with its text.
---@param inputContext any
function WinchControlRopeActivatable:registerCustomInput(inputContext) end

--- Removes every input action event registered by this object (all events bound to it as target).
---@param inputContext any
function WinchControlRopeActivatable:removeCustomInput(inputContext) end

--- Input callback: forwards the input value to the vehicle with `setWinchControlInput` for this rope index (winds or unwinds the rope).
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onControlWinch(actionName, inputValue, callbackState, isAnalog) end

--- Input callback: calls `detachTreeFromWinch` on the vehicle for this rope index.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onDetachTree(actionName, inputValue, callbackState, isAnalog) end

--- Input callback: enters attach mode for this rope if it can still take more trees; otherwise shows a blinking warning for 2500 ms.
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onAttachMode(actionName, inputValue, callbackState, isAnalog) end

--- Enables the attach-another-tree action only when the local player is within the rope's `maxSubLength` plus `SUB_ATTACH_ADDITIONAL_RANGE` of the first tree's hook (horizontal distance). Note: indexes `attachedTrees[1]` without a nil check.
---@param dt any
function WinchControlRopeActivatable:update(dt) end

--- True when the vehicle is owned by the local farm, no other rope has a player in range or attach mode active, and the local player (controlled, no hand tool) is closer than `Winch.CONTROL_RANGE`.
function WinchControlRopeActivatable:getIsActivatable() end

--- Empty hook; nothing happens when the activatable becomes the selected one.
function WinchControlRopeActivatable:activate() end

--- Empty hook; nothing happens when the activatable stops being the selected one.
function WinchControlRopeActivatable:deactivate() end

--- Returns the horizontal distance from the point to the rope segment between rope node and first tree hook; `math.huge` if another rope is active, no tree is attached or the hook node no longer exists.
---@param x any
---@param y any
---@param z any
function WinchControlRopeActivatable:getDistance(x, y, z) end

--- Empty hook; this activatable draws nothing on screen.
function WinchControlRopeActivatable:draw() end
