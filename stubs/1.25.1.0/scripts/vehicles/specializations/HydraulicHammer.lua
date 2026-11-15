---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HydraulicHammer.lua (generated stub, FS25 Lua Atlas)

---@class HydraulicHammer
HydraulicHammer = {}

---@param specializations table
---@return boolean
function HydraulicHammer.prerequisitesPresent(specializations) end

function HydraulicHammer.initSpecialization() end

---@param vehicleType any
function HydraulicHammer.registerFunctions(vehicleType) end

---@param vehicleType any
function HydraulicHammer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function HydraulicHammer.registerEventListeners(vehicleType) end

---@param savegame table
function HydraulicHammer:onLoad(savegame) end

function HydraulicHammer:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function HydraulicHammer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param actorId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function HydraulicHammer:hydraulicHammerRaycastCallback(actorId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

function HydraulicHammer:onDeactivate() end

function HydraulicHammer:onTurnedOn() end

function HydraulicHammer:onTurnedOff() end

---@param superFunc any
---@return number
function HydraulicHammer:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function HydraulicHammer:getWearMultiplier(superFunc) end

---@param superFunc any
function HydraulicHammer:getConsumingLoad(superFunc) end
