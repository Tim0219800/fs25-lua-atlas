---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadForwarder.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function AutoLoadForwarder.prerequisitesPresent(specializations) end

function AutoLoadForwarder.initSpecialization() end

---@param vehicleType any
function AutoLoadForwarder.registerEvents(vehicleType) end

---@param vehicleType any
function AutoLoadForwarder.registerFunctions(vehicleType) end

---@param vehicleType any
function AutoLoadForwarder.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutoLoadForwarder.registerEventListeners(vehicleType) end

---@param savegame any
function AutoLoadForwarder:onLoad(savegame) end

---@param savegame any
function AutoLoadForwarder:onPostLoad(savegame) end

function AutoLoadForwarder:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoadForwarder:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutoLoadForwarder:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param rootVehicle table
function AutoLoadForwarder:onRootVehicleChanged(rootVehicle) end

---@param self any
---@param direction any
function AutoLoadForwarder.actionControllerEvent(self, direction) end

---@param superFunc any
---@return boolean
---@return string
function AutoLoadForwarder:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
---@return boolean
function AutoLoadForwarder:addToPhysics(superFunc) end

---@param treeId any
function AutoLoadForwarder:mountTreeToCrane(treeId) end

---@param treeObject any
function AutoLoadForwarder:addTreeToLoadPlaces(treeObject) end

---@param object integer
---@param isDeleting boolean
function AutoLoadForwarder:removeMountedObject(object, isDeleting) end

function AutoLoadForwarder:sortLoadedTreeObjects() end
