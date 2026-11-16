---@meta
-- FS25 1.25.1.0 : vehicles/AnimationValueFloat.lua (generated stub, FS25 Lua Atlas)

--- One animated property made of one or several numbers, driven by an animation part of the AnimatedVehicle specialization. It loads start and end values from XML, then each update moves the current values towards the target at a speed derived from the remaining duration, and applies them through a `set` callback with linear, step or spline interpolation. AnimationValueBool inherits from it. Consecutive parts that animate the same property are linked so the next part starts from the previous end value.
---@class AnimationValueFloat
AnimationValueFloat = {}

--- Constructor. Stores the vehicle, animation, part, XML attribute names, and the `get`, `set` and `extraLoad` callbacks, and prepares empty tables for compare parameters and cached values and speeds.
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
function AnimationValueFloat.new(vehicle, animation, part, startName, endName, name, initialUpdate, get, set, extraLoad, customMt) end

--- Reads start and end values from XML (number, boolean, string or table, normalized to a table of numbers), runs `extraLoad`, then resolves the `tangentType` attribute (linear by default, step or spline variants). Returns true on success.
---@param xmlFile any
---@param key any
function AnimationValueFloat:load(xmlFile, key) end

--- Appends field names that `init` compares between two values of different parts: two values are only chained if all these fields are equal.
function AnimationValueFloat:addCompareParameters(...) end

--- Sets the text used to identify this value in XML warning messages.
---@param info any
function AnimationValueFloat:setWarningInformation(info) end

--- Looks at later parts of the same animation with the same direction for a value with the same end attribute and matching compare parameters, then links them as previous and next. Logs an XML warning on overlapping parts and may copy this end value as the next start value.
---@param index any
---@param numParts any
function AnimationValueFloat:init(index, numParts) end

--- If an end value exists but no start value was given in XML, captures the start value from the vehicle through the `get` callback.
function AnimationValueFloat:postInit() end

--- Keeps the last current values and speeds for reuse, then clears the active ones so the next update re-initializes the movement.
function AnimationValueFloat:reset() end

--- Sets the current values, computes per-value speed as remaining distance over the remaining duration (minimum 0.001), and stores spline start values. With a fixed-time update it starts from the part start or end value depending on playback direction. Returns the `initialUpdate` flag.
---@param targetValue any
---@param durationToEnd any
---@param fixedTimeUpdate any
function AnimationValueFloat:initValues(targetValue, durationToEnd, fixedTimeUpdate, ...) end

--- Moves the current values towards the target (end value, or start value when playing backwards) using real dt, then calls `set` with the linear, spline or step result. Returns true if values were applied. Does nothing without a start value or when the part is not active.
---@param durationToEnd any
---@param dtToUse any
---@param realDt any
---@param fixedTimeUpdate any
function AnimationValueFloat:update(durationToEnd, dtToUse, realDt, fixedTimeUpdate) end
