---@meta
-- FS25 1.25.1.0 : vehicles/specializations/EnterablePassenger.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function EnterablePassenger.prerequisitesPresent(specializations) end

function EnterablePassenger.initSpecialization() end

---@param basePath any
---@param schema any
function EnterablePassenger.registerXMLPaths(basePath, schema) end

---@param vehicleType any
function EnterablePassenger.registerFunctions(vehicleType) end

---@param vehicleType any
function EnterablePassenger.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function EnterablePassenger.registerEventListeners(vehicleType) end

---@param savegame any
function EnterablePassenger:onLoad(savegame) end

function EnterablePassenger:onDelete() end

---@param streamId integer
---@param connection Connection
function EnterablePassenger:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function EnterablePassenger:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function EnterablePassenger:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function EnterablePassenger:onDrawUIInfo() end

function EnterablePassenger:onSetBroken() end

function EnterablePassenger:onEnterVehicle() end

function EnterablePassenger:onLeaveVehicle() end

---@param superFunc any
---@return string
function EnterablePassenger:getInteractionHelp(superFunc) end

---@param superFunc any
---@param player any
function EnterablePassenger:interact(superFunc, player) end

---@param superFunc any
function EnterablePassenger:getIsEnteredForInput(superFunc) end

---@param superFunc any
function EnterablePassenger:getRequiresPower(superFunc) end

---@param superFunc integer
---@param node any
---@return number
function EnterablePassenger:getDistanceToNode(superFunc, node) end

---@param superFunc any
function EnterablePassenger:getIsEnterable(superFunc) end

---@param superFunc any
---@param player any
function EnterablePassenger:getExitNode(superFunc, player) end

---@param superFunc any
---@param connection any
function EnterablePassenger:getIsInUse(superFunc, connection) end

---@param superFunc any
---@param connection any
function EnterablePassenger:getDeactivateOnLeave(superFunc, connection) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function EnterablePassenger:onPreRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function EnterablePassenger:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventLeave(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventCameraSwitch(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventSwitchSeat(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param self any
function EnterablePassenger.updateActionEvents(self) end

---@param playerNode any
function EnterablePassenger:getClosestSeatIndex(playerNode) end

---@param passengerSeat any
function EnterablePassenger:getIsPassengerSeatAvailable(passengerSeat) end

---@param seatIndex any
function EnterablePassenger:getIsPassengerSeatIndexAvailable(seatIndex) end

---@param startIndex any
function EnterablePassenger:getFirstAvailablePassengerSeat(startIndex) end

---@param seatIndex any
function EnterablePassenger:getPlayerNameBySeatIndex(seatIndex) end

function EnterablePassenger:getCanUsePassengerSeats() end

---@param isOwner any
---@param seatIndex any
---@param playerStyle any
---@param userId any
function EnterablePassenger:enterVehiclePassengerSeat(isOwner, seatIndex, playerStyle, userId) end

---@param noEventSend any
function EnterablePassenger:leaveLocalPassengerSeat(noEventSend) end

---@param isOwner any
---@param seatIndex any
function EnterablePassenger:leavePassengerSeat(isOwner, seatIndex) end

---@param userId any
function EnterablePassenger:getPassengerSeatIndexByPlayer(userId) end

---@param seatIndex any
function EnterablePassenger:copyEnterableActiveCameraIndex(seatIndex) end

---@param cameraIndex any
---@param seatIndex any
function EnterablePassenger:setPassengerActiveCameraIndex(cameraIndex, seatIndex) end

function EnterablePassenger:enablePassengerActiveCamera() end

---@param seatIndex any
---@param playerStyle any
function EnterablePassenger:setPassengerSeatCharacter(seatIndex, playerStyle) end

---@param dt any
function EnterablePassenger:updatePassengerSeatCharacter(dt) end

---@param style any
---@param userId any
function EnterablePassenger:onPassengerPlayerStyleChanged(style, userId) end

---@param self any
---@param loadingState any
---@param arguments any
function EnterablePassenger.vehiclePassengerCharacterLoaded(self, loadingState, arguments) end

function EnterablePassenger.consoleCommandDebugPassengerSeat() end
