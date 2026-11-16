---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorBlockedByObject.lua (generated stub, FS25 Lua Atlas)

--- AI error message for a helper blocked by an object in its way. Extends `AIMessage` but defines no `getI18NText`, and `AIMessage.lua` does not define one either. Note: calling `getMessage` on it would therefore call a nil method (apparent bug, unless it is supplied elsewhere; UNVERIFIED).
---@class AIMessageErrorBlockedByObject : AIMessage
AIMessageErrorBlockedByObject = {}

--- Constructor of the blocked-by-object error message. Inherits from `AIMessage`, adds no state.
---@param customMt any
function AIMessageErrorBlockedByObject.new(customMt) end
