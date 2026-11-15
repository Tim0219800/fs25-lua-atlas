---@meta
-- FS25 1.25.1.0 : vehicles/ai/AICollisionTriggerHandler.lua (stub généré, atlas Lua FS25)

---@class AICollisionTriggerHandler
AICollisionTriggerHandler = {}

---@param customMt any
function AICollisionTriggerHandler.new(customMt) end

---@param vehicle any
---@param strategy any
function AICollisionTriggerHandler:init(vehicle, strategy) end

---@param dt any
---@param movingDirection any
function AICollisionTriggerHandler:update(dt, movingDirection) end

---@param callback any
function AICollisionTriggerHandler:setStaticCollisionCallback(callback) end

function AICollisionTriggerHandler:updateStaticCollisionCallback() end

---@param callback any
function AICollisionTriggerHandler:setIsBlockedCallback(callback) end

function AICollisionTriggerHandler:updateBlockedCallback() end

---@param callback any
function AICollisionTriggerHandler:setCollisionDistanceCallback(callback) end

---@param vehicle any
---@param trigger any
---@param movingDirection any
function AICollisionTriggerHandler:generateTriggerPath(vehicle, trigger, movingDirection) end

---@param objectId integer
---@param trigger table
function AICollisionTriggerHandler:countHitObject(objectId, trigger) end

---@param distance any
---@param objectId any
---@param subShapeIndex any
---@param isLast any
---@param trigger any
function AICollisionTriggerHandler:onVehicleCollisionDistanceCallback(distance, objectId, subShapeIndex, isLast, trigger) end
