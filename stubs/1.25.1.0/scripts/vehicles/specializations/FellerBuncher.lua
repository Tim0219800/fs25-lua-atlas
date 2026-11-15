---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FellerBuncher.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function FellerBuncher.prerequisitesPresent(specializations) end

function FellerBuncher.initSpecialization() end

---@param vehicleType any
function FellerBuncher.registerFunctions(vehicleType) end

---@param vehicleType any
function FellerBuncher.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FellerBuncher.registerEventListeners(vehicleType) end

---@param savegame any
function FellerBuncher:onLoad(savegame) end

function FellerBuncher:onDelete() end

---@param streamId integer
---@param connection Connection
function FellerBuncher:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FellerBuncher:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function FellerBuncher:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function FellerBuncher:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FellerBuncher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function FellerBuncher:onTurnedOn() end

function FellerBuncher:onTurnedOff() end

---@param name any
function FellerBuncher:onFinishAnimation(name) end

---@param state any
function FellerBuncher:setFellerBuncherGrabState(state) end

function FellerBuncher:getIsFellerBuncherReadyForCut() end

---@param splitShapeId any
---@param cx any
---@param cy any
---@param cz any
---@param nx any
---@param ny any
---@param nz any
---@param yx any
---@param yy any
---@param yz any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function FellerBuncher:getFellerBuncherCanCutSplitShape(splitShapeId, cx, cy, cz, nx, ny, nz, yx, yy, yz, minY, maxY, minZ, maxZ) end

---@param noEventSend any
function FellerBuncher:cutTree(noEventSend) end

---@param shape any
---@param isBelow any
---@param isAbove any
---@param minY any
---@param maxY any
---@param minZ any
---@param maxZ any
function FellerBuncher:fellerBuncherSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param shape any
---@param noEventSend any
function FellerBuncher:doMountProcess(shape, noEventSend) end

function FellerBuncher:mountTreeInRange() end

---@param noEventSend any
function FellerBuncher:releaseMountedTrees(noEventSend) end

function FellerBuncher:releaseMainArmTree() end

function FellerBuncher:releaseNextTreeSlot() end

function FellerBuncher:onFellerBuncherTreesChanged() end

function FellerBuncher:getNumLoadedTrees() end

---@param oldShape any
---@param shape any
function FellerBuncher:onFellerBuncherTreeShapeCut(oldShape, shape) end

---@param shape any
---@param mountVehicle any
function FellerBuncher:onFellerBuncherTreeShapeMounted(shape, mountVehicle) end

---@param superFunc any
function FellerBuncher:getCanToggleTurnedOn(superFunc) end

---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
---@param ignoreCollisions any
function FellerBuncher:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

---@param superFunc any
function FellerBuncher:getSupportsAutoTreeAlignment(superFunc) end

---@param superFunc any
---@param radius any
function FellerBuncher:getAutoAlignHasValidTree(superFunc, radius) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function FellerBuncher:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FellerBuncher.actionEventReleaseTrees(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function FellerBuncher.actionEventCutTree(self, actionName, inputValue, callbackState, isAnalog) end

---@param self any
function FellerBuncher.updateActionEvents(self) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function FellerBuncher.loadSpecValueMaxTreeSize(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function FellerBuncher.getSpecValueMaxTreeSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
