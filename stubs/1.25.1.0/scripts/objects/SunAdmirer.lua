---@meta
-- FS25 1.25.1.0 : objects/SunAdmirer.lua (generated stub, FS25 Lua Atlas)

--- Map object whose node is visible only when the sun is out and it is not raining. It subscribes to the day/night message and optionally switches the collision mask with the visibility (user attribute `switchCollision`).
---@class SunAdmirer
SunAdmirer = {}

--- i3d onCreate callback: creates the object for the node and registers it as a non-updateable in the current mission.
---@param id integer
function SunAdmirer:onCreate(id) end

--- Constructor: reads the `switchCollision` user attribute (default false), stores the original collision mask if enabled, shows the node, and subscribes to `MessageType.DAY_NIGHT_CHANGED`. Note: `setVisibility` is not defined in this file (UNVERIFIED, probably defined elsewhere).
---@param id integer
---@return table
function SunAdmirer.new(id) end

--- Unsubscribes this object from all message center subscriptions.
function SunAdmirer:delete() end

--- Message handler: when the mission environment exists, sets visibility to true only if the sun is on and the weather reports no rain. Weather internals are UNVERIFIED (class absent from the dump).
function SunAdmirer:onWeatherChanged() end
