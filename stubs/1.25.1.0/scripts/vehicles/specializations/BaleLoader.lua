---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleLoader.lua (generated stub, FS25 Lua Atlas)

---@class BaleLoader
BaleLoader = {}

---@param specializations table
---@return boolean
function BaleLoader.prerequisitesPresent(specializations) end

function BaleLoader.initSpecialization() end

---@param schema any
---@param basePath any
function BaleLoader.registerAnimationXMLPaths(schema, basePath) end

---@param vehicleType any
function BaleLoader.registerFunctions(vehicleType) end

---@param vehicleType any
function BaleLoader.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BaleLoader.registerEventListeners(vehicleType) end

---@param savegame table
function BaleLoader:onLoad(savegame) end

---@param savegame table
function BaleLoader:onPostLoad(savegame) end

---@param savegame table
function BaleLoader:onLoadFinished(savegame) end

function BaleLoader:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function BaleLoader:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function BaleLoader:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleLoader:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function BaleLoader:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function BaleLoader:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param self any
function BaleLoader.updateBalePlacesAnimations(self) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleLoader:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param self integer
---@param refNode integer
---@param balesInTrigger any
---@return table
---@return integer
function BaleLoader.getBaleInRange(self, refNode, balesInTrigger) end

function BaleLoader:onActivate() end

function BaleLoader:onDeactivate() end

---@param rootVehicle table
function BaleLoader:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function BaleLoader.actionControllerEvent(self, direction) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function BaleLoader:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param direction any
function BaleLoader:onFoldStateChanged(direction) end

---@param balesToUnload any
function BaleLoader:onBalerUnloadingStarted(balesToUnload) end

function BaleLoader:onRegisterAnimationValueTypes() end

---@param xmlFile any
---@param key any
---@param baleType any
function BaleLoader:loadBaleTypeFromXML(xmlFile, key, baleType) end

---@param xmlFile any
---@param key any
---@param target any
---@param defaultTarget any
function BaleLoader:loadBaleLoaderAnimationsFromXML(xmlFile, key, target, defaultTarget) end

---@param xmlFile any
---@param key any
---@param target any
function BaleLoader:loadBalePlacesFromXML(xmlFile, key, target) end

---@param baleLines any
function BaleLoader:createBaleToBaleJoints(baleLines) end

---@param bale1 any
---@param bale2 any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
---@param balePlaceIndex any
function BaleLoader:createBaleToBaleJoint(bale1, bale2, x, y, z, rx, ry, rz, balePlaceIndex) end

---@param id integer
---@param nearestBaleServerId integer
function BaleLoader:doStateChange(id, nearestBaleServerId) end

---@param self any
---@return boolean
function BaleLoader.getAllowsStartUnloading(self) end

---@param self any
function BaleLoader.rotatePlatform(self) end

---@param self boolean
---@param onLoad boolean
function BaleLoader.moveToWorkPosition(self, onLoad) end

---@param self any
function BaleLoader.moveToTransportPosition(self) end

---@return string
function BaleLoader:getBaleGrabberDropBaleAnimName() end

---@return string
function BaleLoader:getIsBaleGrabbingAllowed() end

---@param nearestBale table
---@param nearestBaleType table
function BaleLoader:pickupBale(nearestBale, nearestBaleType) end

---@param baleTypeIndex integer
---@param forceUpdate boolean
function BaleLoader:setBaleLoaderBaleType(baleTypeIndex, forceUpdate) end

---@param bale any
function BaleLoader:getBaleTypeByBale(bale) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleLoader:baleGrabberTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleLoader:baleLoaderMoveTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param bale any
---@param node any
function BaleLoader:mountDynamicBale(bale, node) end

---@param bale any
function BaleLoader:unmountDynamicBale(bale) end

---@param bale any
---@param object any
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
---@param noKinematicMounting any
function BaleLoader:mountBale(bale, object, node, x, y, z, rx, ry, rz, noKinematicMounting) end

---@param bale any
function BaleLoader:unmountBale(bale) end

---@param bale any
---@param state any
function BaleLoader:setBalePairCollision(bale, state) end

function BaleLoader:getLoadedBales() end

function BaleLoader:startAutomaticBaleUnloading() end

function BaleLoader:getIsAutomaticBaleUnloadingInProgress() end

function BaleLoader:getIsAutomaticBaleUnloadingAllowed() end

---@param speed any
function BaleLoader:playBaleLoaderFoldingAnimation(speed) end

function BaleLoader:getIsBaleLoaderFoldingPlaying() end

function BaleLoader:getCurrentFoldingAnimation() end

function BaleLoader:updateFoldingAnimation() end

---@param bale any
function BaleLoader:onBaleMoverBaleRemoved(bale) end

---@param self any
---@param unloadTrigger any
function BaleLoader.onBaleUnloadTriggerDeleted(self, unloadTrigger) end

---@param unloadTrigger any
function BaleLoader:addBaleUnloadTrigger(unloadTrigger) end

---@param unloadTrigger any
function BaleLoader:removeBaleUnloadTrigger(unloadTrigger) end

---@param superFunc any
function BaleLoader:getCanBeSelected(superFunc) end

---@param superFunc any
function BaleLoader:getAllowDynamicMountFillLevelInfo(superFunc) end

---@param superFunc any
---@return boolean
---@return string
function BaleLoader:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
function BaleLoader:getIsAIReadyToDrive(superFunc) end

---@param superFunc any
function BaleLoader:getIsAIPreparingToDrive(superFunc) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function BaleLoader:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
---@return boolean
function BaleLoader:getDoConsumePtoPower(superFunc) end

---@param superFunc any
function BaleLoader:getConsumingLoad(superFunc) end

---@param superFunc any
function BaleLoader:getIsPowerTakeOffActive(superFunc) end

---@param superFunc any
---@return boolean
function BaleLoader:addToPhysics(superFunc) end

---@param superFunc any
---@return boolean
function BaleLoader:removeFromPhysics(superFunc) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function BaleLoader:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventEmpty(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventAbortEmpty(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function BaleLoader.actionEventWorkTransport(self, actionName, inputValue, callbackState, isAnalog) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleLoader any
function BaleLoader.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleLoader) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleLoader any
function BaleLoader.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleLoader) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleLoader.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleLoader.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleLoader.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleLoader.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
