---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SplineVehicle.lua (generated stub, FS25 Lua Atlas)

---@class SplineVehicle
SplineVehicle = {}

---@param specializations table
---@return boolean
function SplineVehicle.prerequisitesPresent(specializations) end

function SplineVehicle.initSpecialization() end

---@param vehicleType any
function SplineVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function SplineVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function SplineVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function SplineVehicle:onLoad(savegame) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SplineVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param trainSystem any
function SplineVehicle:setTrainSystem(superFunc, trainSystem) end

function SplineVehicle:getCurrentSplinePosition() end

function SplineVehicle:getFrontToBackDistance() end

---@param t any
---@param distance any
---@param stepSize any
function SplineVehicle:getSplineTimeFromDistance(t, distance, stepSize) end

---@param t any
---@param distance any
---@param stepSize any
function SplineVehicle:getSplinePositionAndTimeFromDistance(t, distance, stepSize) end

---@param spline any
---@param yOffset any
---@param tFront any
function SplineVehicle:alignToSplineTime(spline, yOffset, tFront) end

---@param superFunc any
---@param useAttacherVehicleSpeed any
function SplineVehicle:getLastSpeed(superFunc, useAttacherVehicleSpeed) end

function SplineVehicle:getCurrentSurfaceSound() end

---@param superFunc any
function SplineVehicle:getAreSurfaceSoundsActive(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function SplineVehicle:loadDischargeNode(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param dischargeNode any
function SplineVehicle:getIsDischargeNodeActive(superFunc, dischargeNode) end
