---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHands.lua (generated stub, FS25 Lua Atlas)

---@class HandToolHands
HandToolHands = {}

---@param xmlSchema any
function HandToolHands.registerXMLPaths(xmlSchema) end

---@param handToolType any
function HandToolHands.registerFunctions(handToolType) end

---@param vehicleType any
function HandToolHands.registerOverwrittenFunctions(vehicleType) end

---@param handToolType any
function HandToolHands.registerEventListeners(handToolType) end

---@param specializations any
function HandToolHands.prerequisitesPresent(specializations) end

---@param xmlFile any
---@param baseDirectory any
function HandToolHands:onLoad(xmlFile, baseDirectory) end

---@param kinematicNode any
---@param failedReason any
function HandToolHands:onKinematicHelperLoaded(kinematicNode, failedReason) end

function HandToolHands:onDelete() end

---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolHands:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param timestamp any
---@param connection any
function HandToolHands:onReadUpdateStream(streamId, timestamp, connection) end

---@param dt any
function HandToolHands:onUpdate(dt) end

function HandToolHands:onDraw() end

function HandToolHands:onRegisterActionEvents() end

function HandToolHands:onHeldStart() end

function HandToolHands:onHeldEnd() end

---@param player any
---@param lastPlayer any
function HandToolHands:onCarryingPlayerChanged(player, lastPlayer) end

---@param superFunc any
function HandToolHands:getCanBeDropped(superFunc) end

function HandToolHands:updateKinematicNode() end

---@return integer?
---@return integer?
function HandToolHands:getKinematicNode() end

---@return boolean
function HandToolHands:getIsHoldingItem() end

---@return boolean
function HandToolHands:getIsThrowingItem() end

---@return boolean
function HandToolHands:getIsAwaitingJointCreation() end

---@return boolean
function HandToolHands:getHasJoint() end

---@param node integer
---@return boolean
function HandToolHands:getCanPickUpNode(node) end

---@param _ any
---@param inputValue any
function HandToolHands:onPickUpAction(_, inputValue) end

---@param _ any
---@param inputValue any
function HandToolHands:onThrowAction(_, inputValue) end

---@param _ any
---@param inputDelta any
function HandToolHands:onPitchAction(_, inputDelta) end

---@param _ any
---@param inputDelta any
function HandToolHands:onYawAction(_, inputDelta) end

---@param _ any
---@param inputValue any
function HandToolHands:onLevelAction(_, inputValue) end

---@param inputDelta number
---@param directionX number
---@param directionY number
---@param directionZ number
function HandToolHands:rotateHeldItem(inputDelta, directionX, directionY, directionZ) end

function HandToolHands:levelHeldItem() end

---@param noEventSend boolean?
function HandToolHands:dropHeldItem(noEventSend) end

---@param throwForceScalar number
---@param noEventSend boolean
function HandToolHands:throwHeldItemWithForceScalar(throwForceScalar, noEventSend) end

---@param target table
---@param noEventSend boolean
---@return boolean
function HandToolHands:pickUpTarget(target, noEventSend) end

function HandToolHands:pickupFailed() end

---@param targetItemNode any
function HandToolHands:orientRotationNodeToItem(targetItemNode) end

function HandToolHands:createItemJoint() end

---@param jointIndex integer?
---@param breakingImpulse number?
---@param noEventSend boolean?
function HandToolHands:onHeldItemJointBroken(jointIndex, breakingImpulse, noEventSend) end

---@param transformId any
function HandToolHands:findFootballCallback(transformId) end

---@param football any
---@param dirX any
---@param dirZ any
---@param angleDeg any
---@param velocity any
---@param shotType any
function HandToolHands:shootBall(football, dirX, dirZ, angleDeg, velocity, shotType) end

---@param itemNode integer
---@return number?
function HandToolHands.calculateItemMass(itemNode) end

---@param itemNode integer
---@return number
function HandToolHands.calculateItemJointBreakForceFactor(itemNode) end

function HandToolHands:onDebugDraw() end

function HandToolHands:consoleCommandToggleSuperStrength() end
