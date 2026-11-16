---@meta
-- FS25 1.25.1.0 : input/InputBinding.lua (generated stub, FS25 Lua Atlas)

--- Input binding manager (`InputBinding`, category Input): it stores the action bindings and the registered action events, grouped by input context, and exposes them to the rest of the scripts. In this SDK dump the file is about 4140 lines long but almost all of it is blank; only the class declaration and one method body remain, so everything else about the class is UNVERIFIED here. Events are looked up through the `contexts` and `nameActions` tables.
---@class InputBinding
InputBinding = {}

--- Activates or deactivates every event registered in the named context for the named action, by calling `setEventActive` on each. No guard: an unknown context or action with no events raises a Lua error. Note: the source comment describes a getter, which does not match.
---@param contextName any
---@param actionName any
---@param isActive any
function InputBinding:setContextEventsActive(contextName, actionName, isActive) end
