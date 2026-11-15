---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Rideable.lua (generated stub, FS25 Lua Atlas)

---@class Rideable
Rideable = {}

---@param specializations table
---@return boolean
function Rideable.prerequisitesPresent(specializations) end

function Rideable.initSpecialization() end

---@param vehicleType table
function Rideable.registerFunctions(vehicleType) end

---@param vehicleType table
function Rideable.registerEventListeners(vehicleType) end

---@param vehicleType any
function Rideable.registerOverwrittenFunctions(vehicleType) end

---@param savegame table
function Rideable:onLoad(savegame) end

function Rideable:onLoadFinished() end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param xRot any
---@param yRot any
---@param zRot any
---@param i any
---@param changeInterp any
function Rideable:setWorldPosition(superFunc, x, y, z, xRot, yRot, zRot, i, changeInterp) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param qx any
---@param qy any
---@param qz any
---@param qw any
---@param i any
---@param changeInterp any
function Rideable:setWorldPositionQuaternion(superFunc, x, y, z, qx, qy, qz, qw, i, changeInterp) end

---@param superFunc any
---@param dt any
function Rideable:updateVehicleSpeed(superFunc, dt) end

---@param leftLegNode integer
---@param rightLegNode integer
---@return number
function Rideable:calculateLegsDistance(leftLegNode, rightLegNode) end

function Rideable:onDelete() end

---@param streamId integer
---@param connection Connection
function Rideable:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Rideable:onWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Rideable:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Rideable:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param connection Connection
function Rideable:onReadPositionUpdateStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
---@param dirtyMask any
function Rideable:onWritePositionUpdateStream(streamId, connection, dirtyMask) end

function Rideable:endFade() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Rideable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param cluster any
function Rideable:setCluster(cluster) end

function Rideable:updateDirt() end

function Rideable:getCluster() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Rideable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Rideable:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Rideable:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function Rideable:onSetBroken() end

---@param dt any
function Rideable:testCCTMove(dt) end

---@param allowWhileJump any
function Rideable:getIsRideableJumpAllowed(allowWhileJump) end

function Rideable:jump() end

---@param gait any
function Rideable:setCurrentGait(gait) end

function Rideable:getCurrentGait() end

---@param axisSteer any
function Rideable:setRideableSteer(axisSteer) end

function Rideable:resetInputs() end

---@param dt number
function Rideable:updateKinematic(dt) end

---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@return boolean
function Rideable:groundRaycastCallback(hitObjectId, x, y, z, distance) end

---@param dt number
function Rideable:updateAnimation(dt) end

---@param dt any
function Rideable:updateSound(dt) end

---@param x number
---@param y number
---@param z number
---@param qx number
---@param qy number
---@param qz number
---@param qw number
---@param changeInterp boolean
function Rideable:setWorldPositionQuat(x, y, z, qx, qy, qz, qw, changeInterp) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Rideable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param isControlling boolean
function Rideable:onEnterVehicle(isControlling) end

---@param character any
function Rideable:onVehicleCharacterChanged(character) end

function Rideable:onLeaveVehicle() end

function Rideable:unlinkReins() end

---@param val any
function Rideable:setEquipmentVisibility(val) end

---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventAccelerate(self, actionName, inputValue, callbackState, isAnalog) end

---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventBrake(self, actionName, inputValue, callbackState, isAnalog) end

---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventSteer(self, actionName, inputValue, callbackState, isAnalog) end

---@param self table
---@param actionName string
---@param inputValue number
---@param callbackState string
---@param isAnalog boolean
function Rideable.actionEventJump(self, actionName, inputValue, callbackState, isAnalog) end

---@param dt any
---@param speed any
function Rideable:updateFootsteps(dt, speed) end

---@param dt any
function Rideable:updateRiding(dt) end

---@param x any
---@param y any
---@param z any
---@param hitTerrain any
function Rideable:getHoofSurfaceSound(x, y, z, hitTerrain) end

function Rideable:getPosition() end

function Rideable:getRotation() end

---@param player any
function Rideable:setPlayerToEnter(player) end

---@param superFunc any
function Rideable:getName(superFunc) end

---@param superFunc any
function Rideable:getFullName(superFunc) end

---@param superFunc any
function Rideable:getCanBeReset(superFunc) end

---@param superFunc any
function Rideable:getCanBeSold(superFunc) end

---@param superFunc any
---@param isPlayerHotspot any
function Rideable:getMapHotspotRotation(superFunc, isPlayerHotspot) end

---@param superFunc any
function Rideable:getShowInVehiclesOverview(superFunc) end

---@param superFunc any
function Rideable:periodChanged(superFunc) end

---@param superFunc any
function Rideable:dayChanged(superFunc) end

---@param superFunc any
function Rideable:getImageFilename(superFunc) end

---@param superFunc any
function Rideable:deleteVehicleCharacter(superFunc) end

---@param superFunc any
---@return string
function Rideable:getInteractionHelp(superFunc) end

---@param superFunc any
---@param box any
function Rideable:showInfo(superFunc, box) end

---@param values any
function Rideable:updateDebugValues(values) end

function Rideable:updateInputText() end
