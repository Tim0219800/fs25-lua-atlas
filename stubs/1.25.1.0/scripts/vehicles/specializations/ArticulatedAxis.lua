---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ArticulatedAxis.lua (stub généré, atlas Lua FS25)

---@class ArticulatedAxis
ArticulatedAxis = {}

---@param specializations table
---@return boolean
function ArticulatedAxis.prerequisitesPresent(specializations) end

function ArticulatedAxis.initSpecialization() end

---@param vehicleType any
function ArticulatedAxis.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ArticulatedAxis.registerEventListeners(vehicleType) end

---@param savegame table
function ArticulatedAxis:onLoad(savegame) end

function ArticulatedAxis:onPostLoad() end

function ArticulatedAxis:onDelete() end

function ArticulatedAxis:onDeactivate() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ArticulatedAxis:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param curvature any
function ArticulatedAxis:getSteeringRotTimeByCurvature(superFunc, curvature) end

---@param superFunc any
---@param rotTime any
function ArticulatedAxis:getTurningRadiusByRotTime(superFunc, rotTime) end
