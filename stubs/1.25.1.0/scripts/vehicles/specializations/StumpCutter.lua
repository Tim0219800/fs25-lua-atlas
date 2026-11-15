---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StumpCutter.lua (generated stub, FS25 Lua Atlas)

---@class StumpCutter
StumpCutter = {}

---@param specializations table
---@return boolean
function StumpCutter.prerequisitesPresent(specializations) end

function StumpCutter.initSpecialization() end

---@param vehicleType any
function StumpCutter.registerFunctions(vehicleType) end

---@param vehicleType any
function StumpCutter.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function StumpCutter.registerEventListeners(vehicleType) end

---@param savegame table
function StumpCutter:onLoad(savegame) end

function StumpCutter:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StumpCutter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function StumpCutter:onDeactivate() end

function StumpCutter:onTurnedOn() end

function StumpCutter:onTurnedOff() end

---@param shape integer
function StumpCutter:crushSplitShape(shape) end

---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function StumpCutter:stumpCutterSplitShapeCallback(shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

---@param workArea any
---@param dt any
function StumpCutter:processStumpCutterArea(workArea, dt) end

---@param superFunc any
---@return number
function StumpCutter:getDirtMultiplier(superFunc) end

---@param superFunc any
---@return number
function StumpCutter:getWearMultiplier(superFunc) end

---@param superFunc any
---@return boolean
function StumpCutter:getCultivatorLimitToField(superFunc) end

---@return boolean
function StumpCutter:getPlowLimitToField() end

---@return boolean
function StumpCutter:getPlowForceLimitToField() end

---@param superFunc any
function StumpCutter:getConsumingLoad(superFunc) end
