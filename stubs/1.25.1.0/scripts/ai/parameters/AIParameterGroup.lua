---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterGroup.lua (generated stub, FS25 Lua Atlas)

--- Plain container that groups several AI parameters under one localized title for the job setup screen. It is not an `AIParameter` itself.
---@class AIParameterGroup
AIParameterGroup = {}

--- Creates a group with the given title and an empty parameter list.
---@param title any
---@param customMt any
function AIParameterGroup.new(title, customMt) end

--- Returns the group title.
function AIParameterGroup:getTitle() end

--- Appends a parameter to the group.
---@param parameter any
function AIParameterGroup:addParameter(parameter) end

--- Returns the list of parameters of the group.
function AIParameterGroup:getParameters() end
