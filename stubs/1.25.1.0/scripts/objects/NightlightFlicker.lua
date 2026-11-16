---@meta
-- FS25 1.25.1.0 : objects/NightlightFlicker.lua (generated stub, FS25 Lua Atlas)

--- Updateable attached to an i3D node (through the onCreate user-attribute) that makes a light flicker with random short blackouts. It is visible only when the sun is off or it is raining, based on the environment state (Environment/Weather classes are not in the dump, UNVERIFIED). It is registered with the mission's updateables.
---@class NightlightFlicker
NightlightFlicker = {}

--- i3D onCreate hook: creates a NightlightFlicker for the node and adds it to the mission's updateables.
---@param id integer
function NightlightFlicker:onCreate(id) end

--- Creates the flicker for a node, hides it initially and subscribes to DAY_NIGHT_CHANGED. Note: it subscribes the misspelled method name oNWeatherChanged instead of onWeatherChanged, so the callback is probably never reached.
---@param id integer
---@return table
function NightlightFlicker.new(id) end

--- While visible, hides the light at random intervals (up to about 1.5 s apart) and shows it again after a short random duration (under 200 ms). Does nothing when the light is not visible.
---@param dt number
function NightlightFlicker:update(dt) end

--- Sets the node visible when the sun is not on or it is raining, hidden otherwise. Skipped if the mission or environment does not exist yet.
function NightlightFlicker:onWeatherChanged() end
