---@meta
-- FS25 1.25.1.0 : ship/ferry/FerryActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable (action prompt) that lets a player start a ferry from a trigger. It reads the ferry's `getCanActivateDriving`, uses the localized text `action_startFerry`, and calls `ferry:start()` on activation. The `Ferry` class and the `trigger` assignment are not in this file (UNVERIFIED).
---@class FerryActivatable
FerryActivatable = {}

--- Creates the activatable for a ferry. The `trigger` node starts nil and must be set by the owner; the prompt text comes from `action_startFerry`.
---@param ferry any
function FerryActivatable.new(ferry) end

--- Returns true when the ferry reports it can currently be started by driving, otherwise false.
function FerryActivatable:getIsActivatable() end

--- Returns the horizontal (XZ) distance from the given position to the trigger node. Would fail if `trigger` is still nil.
---@param posX any
---@param posY any
---@param posZ any
function FerryActivatable:getDistance(posX, posY, posZ) end

--- Starts the ferry by calling `ferry:start()` with no connection argument.
function FerryActivatable:run() end
