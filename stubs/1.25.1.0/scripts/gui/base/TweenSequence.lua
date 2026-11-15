---@meta
-- FS25 1.25.1.0 : gui/base/TweenSequence.lua (stub généré, atlas Lua FS25)

---@class TweenSequence : Tween
TweenSequence = {}

---@param functionTarget any
function TweenSequence.new(functionTarget) end

---@param tween table
---@param instant number
function TweenSequence:insertTween(tween, instant) end

---@param tween table
function TweenSequence:addTween(tween) end

---@param interval number
---@param instant number
function TweenSequence:insertInterval(interval, instant) end

---@param interval any
function TweenSequence:addInterval(interval) end

---@param callback function
---@param callbackState table
---@param instant number
function TweenSequence:insertCallback(callback, callbackState, instant) end

---@param callback function
---@param callbackState table
function TweenSequence:addCallback(callback, callbackState) end

function TweenSequence:getDuration() end

---@param target any
function TweenSequence:setTarget(target) end

---@param isLooping boolean
function TweenSequence:setLooping(isLooping) end

function TweenSequence:start() end

function TweenSequence:stop() end

function TweenSequence:reset() end

---@param dt any
function TweenSequence:update(dt) end

---@param lastInstant number
---@param dt number
function TweenSequence:updateTweens(lastInstant, dt) end

function TweenSequence:updateCallbacks() end
