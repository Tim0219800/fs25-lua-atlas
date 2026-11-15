---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PushHandTool.lua (generated stub, FS25 Lua Atlas)

function PushHandTool.initSpecialization() end

---@param specializations table
---@return boolean
function PushHandTool.prerequisitesPresent(specializations) end

---@param vehicleType any
function PushHandTool.registerFunctions(vehicleType) end

---@param vehicleType any
function PushHandTool.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function PushHandTool.registerEventListeners(vehicleType) end

---@param savegame any
function PushHandTool:onLoad(savegame) end

---@param savegame any
function PushHandTool:onPostLoad(savegame) end

function PushHandTool:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PushHandTool:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function PushHandTool:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PushHandTool:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function PushHandTool:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function PushHandTool:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PushHandTool:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function PushHandTool:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function PushHandTool.actionEventToggleDriveMode(self, actionName, inputValue, callbackState, isAnalog) end

---@param superFunc any
---@param playerStyle any
function PushHandTool:setVehicleCharacter(superFunc, playerStyle) end

---@param superFunc any
function PushHandTool:deleteVehicleCharacter(superFunc) end

---@param loadingState any
---@param arguments any
function PushHandTool:customVehicleCharacterLoaded(loadingState, arguments) end

---@param self any
---@param loadingState any
---@param arguments any
function PushHandTool.driveModeVehicleCharacterLoaded(self, loadingState, arguments) end

---@param driveModeState any
---@param noEventSend any
function PushHandTool:setPushHandToolDriveMode(driveModeState, noEventSend) end

---@param superFunc any
function PushHandTool:getAllowCharacterVisibilityUpdate(superFunc) end

---@param superFunc any
---@param index any
function PushHandTool:setActiveCameraIndex(superFunc, index) end

---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function PushHandTool:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

---@param isControlling any
function PushHandTool:onEnterVehicle(isControlling) end

---@param activeCamera any
---@param camIndex any
function PushHandTool:onCameraChanged(activeCamera, camIndex) end

---@param character any
function PushHandTool:onVehicleCharacterChanged(character) end

---@param dt any
function PushHandTool:postAnimationUpdate(dt) end

---@param node any
function PushHandTool:getRaycastPosition(node) end

---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
function PushHandTool:playerRaycastCallback(hitObjectId, x, y, z, distance) end
