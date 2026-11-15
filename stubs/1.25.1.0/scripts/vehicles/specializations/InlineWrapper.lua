---@meta
-- FS25 1.25.1.0 : vehicles/specializations/InlineWrapper.lua (stub généré, atlas Lua FS25)

---@class InlineWrapper
InlineWrapper = {}

---@class InlineWrapperActivatable
InlineWrapperActivatable = {}

---@param specializations table
---@return boolean
function InlineWrapper.prerequisitesPresent(specializations) end

function InlineWrapper.initSpecialization() end

---@param vehicleType any
function InlineWrapper.registerFunctions(vehicleType) end

---@param vehicleType any
function InlineWrapper.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function InlineWrapper.registerEventListeners(vehicleType) end

---@param savegame table
function InlineWrapper:onLoad(savegame) end

---@param savegame table
function InlineWrapper:onPostLoad(savegame) end

function InlineWrapper:onDelete() end

---@param streamId any
---@param connection any
function InlineWrapper:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function InlineWrapper:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function InlineWrapper:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function InlineWrapper:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param name any
---@param streamId any
---@param connection any
function InlineWrapper:readInlineBales(name, streamId, connection) end

---@param name any
---@param streamId any
---@param connection any
function InlineWrapper:writeInlineBales(name, streamId, connection) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function InlineWrapper:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function InlineWrapper:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function InlineWrapper:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function InlineWrapper:updateWrappingNodes() end

---@param bale any
---@param wrappingNode any
---@param x any
---@param y any
---@param z any
function InlineWrapper:updateRoundBaleWrappingNode(bale, wrappingNode, x, y, z) end

---@param bale any
---@param wrappingNode any
---@param x any
---@param y any
---@param z any
function InlineWrapper:updateSquareBaleWrappingNode(bale, wrappingNode, x, y, z) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function InlineWrapper:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function InlineWrapper:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param superFunc any
function InlineWrapper:getIsActive(superFunc) end

---@param superFunc any
function InlineWrapper:getBrakeForce(superFunc) end

---@param superFunc any
---@param typeName any
function InlineWrapper:getShowConsumableEmptyWarning(superFunc, typeName) end

function InlineWrapper:getIsInlineBalingAllowed() end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function InlineWrapper:inlineBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function InlineWrapper:inlineWrapTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param bale any
function InlineWrapper:getWrapperBaleType(bale) end

---@param bale any
function InlineWrapper:getAllowBalePushing(bale) end

---@param targetPosition any
---@param dt any
function InlineWrapper:updateWrapperRailings(targetPosition, dt) end

---@param dirX any
---@param dirZ any
function InlineWrapper:updateInlineSteeringWheels(dirX, dirZ) end

function InlineWrapper:onLeaveVehicle() end

function InlineWrapper:onEnterVehicle() end

---@param variationIndex any
---@param metaData any
function InlineWrapper:onConsumableVariationChanged(variationIndex, metaData) end

function InlineWrapper:getCanInteract() end

function InlineWrapper:getCanPushOff() end

---@param inlineBale any
---@param isClient any
function InlineWrapper:setCurrentInlineBale(inlineBale, isClient) end

function InlineWrapper:getCurrentInlineBale() end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function InlineWrapper.pushOffInlineBaleEvent(self, actionName, inputValue, callbackState, isAnalog) end

function InlineWrapper:pushOffInlineBale() end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param roundBaleWrapper any
function InlineWrapper.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir, roundBaleWrapper) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBaleWrapper any
function InlineWrapper.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBaleWrapper) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function InlineWrapper.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function InlineWrapper.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function InlineWrapper.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function InlineWrapper.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param inlineWrapper any
function InlineWrapperActivatable.new(inlineWrapper) end

function InlineWrapperActivatable:getIsActivatable() end

function InlineWrapperActivatable:run() end
