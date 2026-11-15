---@meta
-- FS25 1.25.1.0 : objects/ForestryLog.lua (stub généré, atlas Lua FS25)

---@class ForestryLog : MountableObject
ForestryLog = {}

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function ForestryLog.new(isServer, isClient, customMt) end

function ForestryLog:delete() end

---@param streamId integer
---@param connection table
function ForestryLog:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function ForestryLog:writeStream(streamId, connection) end

---@param i3dFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param asyncCallback any
---@param asyncTarget any
---@param asyncArguments any
function ForestryLog:loadFromFilename(i3dFilename, x, y, z, rx, ry, rz, asyncCallback, asyncTarget, asyncArguments) end

---@param nodeId any
---@param failedReason any
---@param asyncCallbackArguments any
function ForestryLog:onForestryLogLoaded(nodeId, failedReason, asyncCallbackArguments) end

---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@param asyncCallback any
---@param asyncTarget any
---@param asyncArguments any
---@return boolean
function ForestryLog:loadAsyncFromXMLFile(xmlFile, key, resetVehicles, asyncCallback, asyncTarget, asyncArguments) end

---@param xmlFile any
---@param key any
function ForestryLog:saveToXMLFile(xmlFile, key) end

---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function ForestryLog:mount(object, node, x, y, z, rx, ry, rz) end

function ForestryLog:unmount() end

---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function ForestryLog:mountKinematic(object, node, x, y, z, rx, ry, rz) end

function ForestryLog:unmountKinematic() end

---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function ForestryLog:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

---@param isDelete any
function ForestryLog:unmountDynamic(isDelete) end

---@param isActive any
function ForestryLog:setForestryLogAIObstacle(isActive) end

function ForestryLog:getMeshNodes() end

function ForestryLog:getSupportsTensionBelts() end

function ForestryLog:getAllowPickup() end

---@return string
function ForestryLog:getDefaultRigidBodyType() end
