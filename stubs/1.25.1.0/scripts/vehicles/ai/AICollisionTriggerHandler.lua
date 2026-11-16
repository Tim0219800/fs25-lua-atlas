---@meta
-- FS25 1.25.1.0 : vehicles/ai/AICollisionTriggerHandler.lua (generated stub, FS25 Lua Atlas)

--- Helper used by AI strategies to detect obstacles ahead of an AI-driven vehicle chain. On the server it gathers collision triggers from all child vehicles, periodically casts a vehicle-collision query along each trigger path, and tracks dynamic and static hit points. It reports blocked state, static collision and nearest collision distance through callbacks set by the strategy.
---@class AICollisionTriggerHandler
AICollisionTriggerHandler = {}

--- Constructor; sets empty trigger tables, no collision, and infinite hit distances.
---@param customMt any
function AICollisionTriggerHandler.new(customMt) end

--- Server only: collects collision triggers from all child vehicles of the root vehicle via `getAICollisionTriggers` and `getAIImplementCollisionTriggers`, initializes each trigger's state and staggers their update indices.
---@param vehicle any
---@param strategy any
function AICollisionTriggerHandler:init(vehicle, strategy) end

--- Updates hit distances every frame and, on each trigger's staggered turn, rebuilds its path and issues the engine `getVehicleCollisionDistance` query. Calls the distance callback with the minimum distance and draws debug lines in AI debug mode.
---@param dt any
---@param movingDirection any
function AICollisionTriggerHandler:update(dt, movingDirection) end

--- Sets the callback invoked when the presence of a static collision changes.
---@param callback any
function AICollisionTriggerHandler:setStaticCollisionCallback(callback) end

--- Recomputes whether any trigger has a static collision and calls the static callback only when that state changed.
function AICollisionTriggerHandler:updateStaticCollisionCallback() end

--- Sets the callback invoked when the blocked state changes.
---@param callback any
function AICollisionTriggerHandler:setIsBlockedCallback(callback) end

--- Recomputes whether any trigger has a dynamic collision and calls the blocked callback only when that state changed.
function AICollisionTriggerHandler:updateBlockedCallback() end

--- Sets the callback that receives the smallest collision distance each update.
---@param callback any
function AICollisionTriggerHandler:setCollisionDistanceCallback(callback) end

--- Fills the trigger's sampled path points along its length (front or back node depending on moving direction), placing each at terrain height plus half the trigger height.
---@param vehicle any
---@param trigger any
---@param movingDirection any
function AICollisionTriggerHandler:generateTriggerPath(vehicle, trigger, movingDirection) end

--- Classifies a hit node: players and vehicle-group or moving-obstacle objects add to the dynamic counter, non-dynamic bodies to the static one. Own vehicles, triggers and other dynamic objects such as bales are ignored.
---@param objectId integer
---@param trigger table
function AICollisionTriggerHandler:countHitObject(objectId, trigger) end

--- Asynchronous engine callback of the collision query. Counts each hit, and on the last one updates the trigger's collision flags and stored hit points, then notifies the callbacks. Returns false to stop, true to continue, and ignores calls after a vehicle was deleted.
---@param distance any
---@param objectId any
---@param subShapeIndex any
---@param isLast any
---@param trigger any
function AICollisionTriggerHandler:onVehicleCollisionDistanceCallback(distance, objectId, subShapeIndex, isLast, trigger) end
