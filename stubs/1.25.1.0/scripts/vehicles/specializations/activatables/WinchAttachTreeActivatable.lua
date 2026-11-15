---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/WinchAttachTreeActivatable.lua (generated stub, FS25 Lua Atlas)

---@class WinchAttachTreeActivatable
WinchAttachTreeActivatable = {}

---@param vehicle table
---@param rope any
---@return table
function WinchAttachTreeActivatable.new(vehicle, rope) end

---@param inputContext any
function WinchAttachTreeActivatable:registerCustomInput(inputContext) end

---@param inputContext any
function WinchAttachTreeActivatable:removeCustomInput(inputContext) end

function WinchAttachTreeActivatable:onToggleAttachTreeMode() end

function WinchAttachTreeActivatable:onAttachTree() end

---@param dt any
function WinchAttachTreeActivatable:update(dt) end

function WinchAttachTreeActivatable:getIsActivatable() end

function WinchAttachTreeActivatable:activate() end

function WinchAttachTreeActivatable:deactivate() end

---@param x any
---@param y any
---@param z any
function WinchAttachTreeActivatable:getDistance(x, y, z) end

function WinchAttachTreeActivatable:draw() end
