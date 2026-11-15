---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTrainSystem.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableTrainSystem
PlaceableTrainSystem = {}

---@param specializations table
---@return boolean
function PlaceableTrainSystem.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableTrainSystem.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableTrainSystem.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableTrainSystem.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableTrainSystem.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableTrainSystem.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableTrainSystem:onLoad(savegame) end

function PlaceableTrainSystem:onDelete() end

function PlaceableTrainSystem:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableTrainSystem:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableTrainSystem:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableTrainSystem:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableTrainSystem:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
function PlaceableTrainSystem:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableTrainSystem:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
function PlaceableTrainSystem:onUpdate(dt) end

---@param dt any
function PlaceableTrainSystem:updateRailroadVehiclePositions(dt) end

function PlaceableTrainSystem:createVehicles() end

---@param vehicles any
---@param vehicleLoadState any
---@param args any
function PlaceableTrainSystem:railroadVehicleLoaded(vehicles, vehicleLoadState, args) end

---@param attachVehicles any
function PlaceableTrainSystem:finalizeTrain(attachVehicles) end

---@param isTabbable any
function PlaceableTrainSystem:setIsTrainTabbable(isTabbable) end

function PlaceableTrainSystem:getIsTrainInDriveableRange() end

function PlaceableTrainSystem:getSplineTime() end

---@param startTime any
---@param endTime any
function PlaceableTrainSystem:setSplineTime(startTime, endTime) end

---@param listener any
function PlaceableTrainSystem:addSplinePositionUpdateListener(listener) end

---@param listener any
function PlaceableTrainSystem:removeSplinePositionUpdateListener(listener) end

---@param dt any
---@param speed any
function PlaceableTrainSystem:updateTrainPositionByLocomotiveSpeed(dt, speed) end

---@param splinePosition any
function PlaceableTrainSystem:updateTrainPositionByLocomotiveSplinePosition(splinePosition) end

---@param splinePosition any
function PlaceableTrainSystem:updateTrainLength(splinePosition) end

---@param farmId any
---@param position any
function PlaceableTrainSystem:toggleRent(farmId, position) end

---@param farmId any
---@param position any
---@param noEventSend any
function PlaceableTrainSystem:rentRailroad(farmId, position, noEventSend) end

---@param noEventSend any
function PlaceableTrainSystem:returnRailroad(noEventSend) end

function PlaceableTrainSystem:onDayChanged() end

function PlaceableTrainSystem:getIsRented() end

---@param farmId any
function PlaceableTrainSystem:getCanBeRented(farmId) end

---@param object any
function PlaceableTrainSystem:onDeleteObject(object) end

function PlaceableTrainSystem:getSplineLength() end

function PlaceableTrainSystem:getElectricitySpline() end

function PlaceableTrainSystem:getElectricitySplineLength() end

---@param superFunc any
function PlaceableTrainSystem:getNeedDayChanged(superFunc) end

function PlaceableTrainSystem:getLengthSplineTime() end

function PlaceableTrainSystem:getSpline() end

---@param newSplineTime any
function PlaceableTrainSystem:updateDriveableState(newSplineTime) end

function PlaceableTrainSystem:gsIsTrainFilled() end

---@param yes any
function PlaceableTrainSystem:onSellGoodsQuestion(yes) end

function PlaceableTrainSystem:sellGoods() end
