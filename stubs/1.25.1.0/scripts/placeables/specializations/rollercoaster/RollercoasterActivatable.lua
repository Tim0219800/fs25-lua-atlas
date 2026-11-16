---@meta
-- FS25 1.25.1.0 : placeables/specializations/rollercoaster/RollercoasterActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object that lets the local player ride a rollercoaster placeable: it shows the localized ride action text and, when triggered, sends a request event to the server. It has no base class and relies on `getCanEnter` and `getFreeSeatIndex` of the rollercoaster.
---@class RollercoasterActivatable
RollercoasterActivatable = {}

--- Creates the activatable for a rollercoaster and loads the `action_rideRollercoaster` text as activate text.
---@param rollercoaster table
function RollercoasterActivatable.new(rollercoaster) end

--- Returns whether the rollercoaster currently accepts a new passenger, via its `getCanEnter`.
function RollercoasterActivatable:getIsActivatable() end

--- If entry is allowed and a free seat exists, sends a RollercoasterPassengerEnterRequestEvent for `g_localPlayer` to the server connection. The seat index is only checked locally; the server picks the final seat.
function RollercoasterActivatable:run() end
