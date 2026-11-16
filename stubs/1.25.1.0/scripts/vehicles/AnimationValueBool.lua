---@meta
-- FS25 1.25.1.0 : vehicles/AnimationValueBool.lua (generated stub, FS25 Lua Atlas)

--- Boolean variant of the animated-vehicle value classes. It inherits from AnimationValueFloat but replaces loading and updating: instead of interpolating over time, it switches a property to a fixed boolean as soon as the animation touches the part. Used by the AnimatedVehicle specialization, which owns the animation parts.
---@class AnimationValueBool : AnimationValueFloat
AnimationValueBool = {}

--- Constructor. Simply delegates to `AnimationValueFloat.new` with the same arguments, using this class metatable unless a custom one is given. No boolean-specific state is created here.
---@param vehicle any
---@param animation any
---@param part any
---@param startName any
---@param endName any
---@param name any
---@param initialUpdate any
---@param get any
---@param set any
---@param extraLoad any
---@param customMt any
function AnimationValueBool.new(vehicle, animation, part, startName, endName, name, initialUpdate, get, set, extraLoad, customMt) end

--- Reads the target boolean from the XML attribute named by `startName` on the given key and keeps the XML file and key for warnings. Returns true only if the value exists and the `extraLoad` callback succeeds.
---@param xmlFile any
---@param key any
function AnimationValueBool:load(xmlFile, key) end

--- Intentionally empty override. The part-chaining logic of the float parent class does not apply to booleans.
---@param index any
---@param numParts any
function AnimationValueBool:init(index, numParts) end

--- Intentionally empty override. No start value is captured from the vehicle, unlike the float parent.
function AnimationValueBool:postInit() end

--- Clears the cached current value so the next update re-reads it through the `get` callback.
function AnimationValueBool:reset() end

--- Reads the current value via `get` on first call, then if it differs from the target calls `set` with the target. Returns true when a change was applied, false otherwise. The time arguments are ignored.
---@param durationToEnd any
---@param dtToUse any
---@param realDt any
function AnimationValueBool:update(durationToEnd, dtToUse, realDt) end
