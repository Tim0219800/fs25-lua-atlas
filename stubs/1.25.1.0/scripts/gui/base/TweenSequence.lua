---@meta
-- FS25 1.25.1.0 : gui/base/TweenSequence.lua (generated stub, FS25 Lua Atlas)

--- Tween subclass that chains child tweens, pauses and callbacks on one timeline, and can itself be nested in another sequence. It must be started with start() before update() has any effect, also after a reset. Child tweens may overlap through the insert variants; the sequence can loop.
---@class TweenSequence : Tween
TweenSequence = {}

--- Creates an empty, stopped sequence. The optional functionTarget is given as first argument to all child setters and callbacks.
---@param functionTarget any
function TweenSequence.new(functionTarget) end

--- Registers a tween to start at the given millisecond instant, extends the total duration if needed and applies the sequence target to the tween.
---@param tween table
---@param instant number
function TweenSequence:insertTween(tween, instant) end

--- Appends a tween at the current end of the sequence.
---@param tween table
function TweenSequence:addTween(tween) end

--- Inserts a pause at an instant by shifting every tween and callback at or after it by the interval, and grows the total duration.
---@param interval number
---@param instant number
function TweenSequence:insertInterval(interval, instant) end

--- Appends a pause at the end of the sequence.
---@param interval any
function TweenSequence:addInterval(interval) end

--- Registers a callback fired once at the given instant with callbackState (after the target if one is set). Callbacks are keyed by function, so the same function can be registered only once.
---@param callback function
---@param callbackState table
---@param instant number
function TweenSequence:insertCallback(callback, callbackState, instant) end

--- Adds a callback after everything already queued.
---@param callback function
---@param callbackState table
function TweenSequence:addCallback(callback, callbackState) end

--- Returns the total duration of the sequence in milliseconds.
function TweenSequence:getDuration() end

--- Sets the target table given to setters and callbacks. Note: it does not propagate to tweens already added.
---@param target any
function TweenSequence:setTarget(target) end

--- Enables or disables looping; on completion a looping sequence resets and restarts, callbacks included.
---@param isLooping boolean
function TweenSequence:setLooping(isLooping) end

--- Marks the sequence as running so update() advances it.
function TweenSequence:start() end

--- Marks the sequence as finished so it stops updating; elapsed time is kept.
function TweenSequence:stop() end

--- Resets elapsed time, every child tween and the called flags of callbacks, and leaves the sequence stopped; call start() to play again.
function TweenSequence:reset() end

--- If running, advances by dt milliseconds, updates the tweens and callbacks, and finishes or loops when time and all tweens are done.
---@param dt any
function TweenSequence:update(dt) end

--- Updates every unfinished child tween whose start instant has passed, limiting its dt to the time since its start. Returns true if all are finished. Iteration uses pairs, so order is not guaranteed.
---@param lastInstant number
---@param dt number
function TweenSequence:updateTweens(lastInstant, dt) end

--- Fires each not-yet-called callback whose instant is reached, once, with its state (and the target first if set).
function TweenSequence:updateCallbacks() end
