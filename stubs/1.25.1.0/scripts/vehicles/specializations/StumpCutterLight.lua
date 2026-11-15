---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StumpCutterLight.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function StumpCutterLight.prerequisitesPresent(specializations) end

function StumpCutterLight.initSpecialization() end

---@param vehicleType any
function StumpCutterLight.registerFunctions(vehicleType) end

---@param vehicleType any
function StumpCutterLight.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function StumpCutterLight.registerEventListeners(vehicleType) end

---@param savegame table
function StumpCutterLight:onLoad(savegame) end

function StumpCutterLight:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StumpCutterLight:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function StumpCutterLight:onDeactivate() end

function StumpCutterLight:onTurnedOn() end

function StumpCutterLight:onTurnedOff() end

---@param shapeId integer
function StumpCutterLight:removeTreeStump(shapeId) end

---@param objectId any
function StumpCutterLight:stumpCutterLightOverlapCallback(objectId, ...) end

---@param superFunc any
function StumpCutterLight:getAreControlledActionsAllowed(superFunc) end

---@param superFunc any
---@return number
function StumpCutterLight:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function StumpCutterLight:getWearMultiplier(superFunc) end

---@param superFunc any
function StumpCutterLight:getConsumingLoad(superFunc) end
