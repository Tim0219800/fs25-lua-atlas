---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaleGrab.lua (stub généré, atlas Lua FS25)

---@class BaleGrab
BaleGrab = {}

---@param specializations any
function BaleGrab.prerequisitesPresent(specializations) end

function BaleGrab.initSpecialization() end

---@param vehicleType any
function BaleGrab.registerFunctions(vehicleType) end

---@param vehicleType any
function BaleGrab.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BaleGrab.registerEventListeners(vehicleType) end

---@param savegame table
function BaleGrab:onLoad(savegame) end

---@param savegame any
function BaleGrab:onPostLoad(savegame) end

function BaleGrab:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BaleGrab:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param movingTool any
function BaleGrab:getMovingToolMoveValue(superFunc, movingTool) end

---@param object table
function BaleGrab:addDynamicMountedObject(object) end

---@param object table
---@param isDeleting boolean
function BaleGrab:removeDynamicMountedObject(object, isDeleting) end

---@param self any
---@param object any
function BaleGrab.onPendingObjectDelete(self, object) end

---@param self any
---@param object any
---@param mountState any
---@param mountObject any
function BaleGrab.onPendingObjectMountStateChanged(self, object, mountState, mountObject) end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BaleGrab:baleGrabTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param grab any
function BaleGrab:getIsBaleGrabClosed(grab) end

---@param object table
---@return boolean
function BaleGrab:mountBaleGrabObject(object) end

---@param object table
---@return boolean
function BaleGrab:unmountBaleGrabObject(object) end

---@param values any
function BaleGrab:updateDebugValues(values) end

---@param xmlFile any
---@param minKey any
---@param maxKey any
function BaleGrab.loadSpecValueMaxSize(xmlFile, minKey, maxKey) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleGrab.loadSpecValueMaxSizeRound(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function BaleGrab.loadSpecValueMaxSizeSquare(xmlFile, customEnvironment, baseDir) end

---@param specName any
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSize(specName, storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function BaleGrab.getSpecValueMaxSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
