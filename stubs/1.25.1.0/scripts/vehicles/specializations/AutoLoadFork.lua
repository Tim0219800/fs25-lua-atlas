---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadFork.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function AutoLoadFork.prerequisitesPresent(specializations) end

function AutoLoadFork.initSpecialization() end

---@param vehicleType any
function AutoLoadFork.registerFunctions(vehicleType) end

---@param vehicleType any
function AutoLoadFork.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutoLoadFork.registerEventListeners(vehicleType) end

---@param savegame any
function AutoLoadFork:onLoad(savegame) end

---@param savegame any
function AutoLoadFork:onPostLoad(savegame) end

function AutoLoadFork:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoadFork:saveToXMLFile(xmlFile, key, usedModNames) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutoLoadFork:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param rootVehicle table
function AutoLoadFork:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function AutoLoadFork.actionControllerEvent(self, direction) end

---@param self any
---@param object any
function AutoLoadFork.onDeleteMountedObject(self, object) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutoLoadFork:onAutoLoadForkTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutoLoadFork.actionEventUnloadFork(self, actionName, inputValue, callbackState, isAnalog) end

---@param superFunc any
function AutoLoadFork:addToPhysics(superFunc) end

---@param superFunc any
function AutoLoadFork:removeFromPhysics(superFunc) end
