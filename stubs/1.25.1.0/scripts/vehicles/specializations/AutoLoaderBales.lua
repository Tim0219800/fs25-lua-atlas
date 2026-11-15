---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoaderBales.lua (generated stub, FS25 Lua Atlas)

---@class AutoLoaderBales
AutoLoaderBales = {}

---@param specializations table
---@return boolean
function AutoLoaderBales.prerequisitesPresent(specializations) end

function AutoLoaderBales.initSpecialization() end

---@param vehicleType any
function AutoLoaderBales.registerFunctions(vehicleType) end

---@param vehicleType any
function AutoLoaderBales.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AutoLoaderBales.registerEventListeners(vehicleType) end

---@param savegame table
function AutoLoaderBales:onLoad(savegame) end

---@param savegame table
function AutoLoaderBales:onLoadFinished(savegame) end

function AutoLoaderBales:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoaderBales:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AutoLoaderBales:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param self any
---@param object any
function AutoLoaderBales.onDeleteAutoLoaderBalesObject(self, object) end

---@param self any
---@param object any
function AutoLoaderBales.onBaleDeleted(self, object) end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function AutoLoaderBales:autoLoaderBalesTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param bale any
function AutoLoaderBales:getAutoLoadBaleTypeFromBale(bale) end

---@param baleType any
---@param bale any
function AutoLoaderBales:doAutoLoadBale(baleType, bale) end

---@param bale any
function AutoLoaderBales:getIsBaleAutoLoadable(bale) end
