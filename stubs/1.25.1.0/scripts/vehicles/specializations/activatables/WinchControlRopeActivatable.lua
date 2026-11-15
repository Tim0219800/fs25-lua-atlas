---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/WinchControlRopeActivatable.lua (generated stub, FS25 Lua Atlas)

---@class WinchControlRopeActivatable
WinchControlRopeActivatable = {}

---@param vehicle table
---@param rope any
---@return table
function WinchControlRopeActivatable.new(vehicle, rope) end

---@param inputContext any
function WinchControlRopeActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function WinchControlRopeActivatable:removeCustomInput(inputContext) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onControlWinch(actionName, inputValue, callbackState, isAnalog) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onDetachTree(actionName, inputValue, callbackState, isAnalog) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WinchControlRopeActivatable:onAttachMode(actionName, inputValue, callbackState, isAnalog) end

---@param dt any
function WinchControlRopeActivatable:update(dt) end

function WinchControlRopeActivatable:getIsActivatable() end

function WinchControlRopeActivatable:activate() end

function WinchControlRopeActivatable:deactivate() end

---@param x any
---@param y any
---@param z any
function WinchControlRopeActivatable:getDistance(x, y, z) end

function WinchControlRopeActivatable:draw() end
