---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoader.lua (stub généré, atlas Lua FS25)

---@class AutoLoader
AutoLoader = {}

---@param specializations any
function AutoLoader.prerequisitesPresent(specializations) end

function AutoLoader.initSpecialization() end

---@param vehicleType any
function AutoLoader.registerFunctions(vehicleType) end

---@param vehicleType any
function AutoLoader.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutoLoader.registerEventListeners(vehicleType) end

---@param savegame any
function AutoLoader:onLoad(savegame) end

function AutoLoader:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoader:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutoLoader:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function AutoLoader:onDraw() end

---@param superFunc any
function AutoLoader:addToPhysics(superFunc) end

---@param superFunc any
function AutoLoader:removeFromPhysics(superFunc) end

---@param object any
function AutoLoader:getIsValidAutoLoaderObject(object) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutoLoader:autoLoaderPickupTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param transformId any
function AutoLoader:autoLoaderOverlapCallback(transformId) end

function AutoLoader:getIsAutoLoadingAllowed() end

---@param superFunc any
function AutoLoader:getDynamicMountTimeToMount(superFunc) end

---@param rootVehicle table
function AutoLoader:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function AutoLoader.actionControllerEvent(self, direction) end

---@param self any
---@param object any
function AutoLoader.onDeletePendingObject(self, object) end
