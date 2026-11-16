---@meta
-- FS25 1.25.1.0 : objects/ForestryLog.lua (generated stub, FS25 Lua Atlas)

--- A felled tree log as an item the player can handle. It extends MountableObject, loads a random child of an i3d file (log variant) asynchronously, registers itself in the item system and as an AI obstacle while free, and is saved and loaded from the savegame XML with uniqueId, filename, position, rotation and farmId. Mounting hides it from the item system and AI.
---@class ForestryLog : MountableObject
ForestryLog = {}

--- Constructor. Calls the MountableObject constructor, registers the class name ForestryLog and sets uniqueId to nil. Returns the instance.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function ForestryLog.new(isServer, isClient, customMt) end

--- Releases the shared i3d request, removes the AI obstacle, unregisters the class name, removes the log from the item system and calls the parent delete.
function ForestryLog:delete() end

--- On join, reads the i3d filename and loads the log if it has no node yet. The connection is not checked and no parent readStream is called.
---@param streamId integer
---@param connection table
function ForestryLog:readStream(streamId, connection) end

--- Writes the i3d filename in network form. No parent writeStream is called.
---@param streamId integer
---@param connection table
function ForestryLog:writeStream(streamId, connection) end

--- Starts an asynchronous load of the i3d file (after checking the file exists) and keeps position, rotation and an optional callback for onForestryLogLoaded. Returns false if the name is nil or the file is missing, true once loading started.
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

--- Async load callback. On success it clones a random child of the loaded file, links it to the root, applies the given pose if complete, sets it as node, registers the item and AI obstacle and deletes the loaded root. Then calls the optional callback with a success flag.
---@param nodeId any
---@param failedReason any
---@param asyncCallbackArguments any
function ForestryLog:onForestryLogLoaded(nodeId, failedReason, asyncCallbackArguments) end

--- Reads position, rotation, uniqueId and filename from the savegame XML and starts the async load. Calls the callback with false if the pose is missing or loading cannot start.
---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@param asyncCallback any
---@param asyncTarget any
---@param asyncArguments any
---@return boolean
function ForestryLog:loadAsyncFromXMLFile(xmlFile, key, resetVehicles, asyncCallback, asyncTarget, asyncArguments) end

--- Writes uniqueId, HTML-encoded network filename, position, rotation and owner farmId of the log to the savegame XML under the given key.
---@param xmlFile any
---@param key any
function ForestryLog:saveToXMLFile(xmlFile, key) end

--- Calls the parent mount, then removes the log from the item system and disables its AI obstacle.
---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function ForestryLog:mount(object, node, x, y, z, rx, ry, rz) end

--- Calls the parent unmount. If it succeeds, puts the log back in the item system and re-enables the AI obstacle. Returns true on success, otherwise false.
function ForestryLog:unmount() end

--- Calls the parent mountKinematic, then removes the log from the item system and disables the AI obstacle.
---@param object table
---@param node integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function ForestryLog:mountKinematic(object, node, x, y, z, rx, ry, rz) end

--- Calls the parent unmountKinematic. On success restores the item system entry and the AI obstacle and returns true, otherwise false.
function ForestryLog:unmountKinematic() end

--- Calls the parent mountDynamic and disables the AI obstacle. Unlike the other mount variants it does not touch the item system.
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function ForestryLog:mountDynamic(object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Calls the parent unmountDynamic, then re-enables the AI obstacle.
---@param isDelete any
function ForestryLog:unmountDynamic(isDelete) end

--- Adds the log node as an obstacle to aiSystem when enabling (if none yet) or removes it when disabling. Keeps the obstacle node in obstacleNodeId.
---@param isActive any
function ForestryLog:setForestryLogAIObstacle(isActive) end

--- Returns the tensionBeltMeshes table, which is set empty when loading.
function ForestryLog:getMeshNodes() end

--- Returns true: logs can be strapped with tension belts.
function ForestryLog:getSupportsTensionBelts() end

--- Returns false: logs cannot be picked up by hand.
function ForestryLog:getAllowPickup() end

--- Returns RigidBodyType.KINEMATIC as the default body type of a free log.
---@return string
function ForestryLog:getDefaultRigidBodyType() end
