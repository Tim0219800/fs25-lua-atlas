---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Locomotive.lua (stub généré, atlas Lua FS25)

---@class Locomotive
Locomotive = {}

---@param specializations table
---@return boolean
function Locomotive.prerequisitesPresent(specializations) end

function Locomotive.initSpecialization() end

---@param vehicleType any
function Locomotive.registerEvents(vehicleType) end

---@param vehicleType any
function Locomotive.registerFunctions(vehicleType) end

---@param vehicleType any
function Locomotive.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Locomotive.registerEventListeners(vehicleType) end

---@param savegame table
function Locomotive:onLoad(savegame) end

function Locomotive:onDelete() end

---@param streamId integer
---@param connection Connection
function Locomotive:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function Locomotive:onWriteStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Locomotive:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param trainSystem any
function Locomotive:setTrainSystem(superFunc, trainSystem) end

---@param superFunc any
function Locomotive:getFullName(superFunc) end

---@param superFunc any
function Locomotive:getAreSurfaceSoundsActive(superFunc) end

---@param superFunc any
function Locomotive:getTraveledDistanceStatsActive(superFunc) end

---@param superFunc any
function Locomotive:getIsEnterable(superFunc) end

---@param superFunc any
function Locomotive:getIsMapHotspotVisible(superFunc) end

---@param superFunc any
function Locomotive:getMapHotspotPosition(superFunc) end

---@param superFunc any
function Locomotive:getMotorRpmReal(superFunc) end

---@param splinePosition any
---@param noEventSend any
function Locomotive:setRequestedSplinePosition(splinePosition, noEventSend) end

function Locomotive:getDistanceToRequestedPosition() end

---@param state any
---@param noEventSend any
function Locomotive:setLocomotiveState(state, noEventSend) end

function Locomotive:startAutomatedTrainTravel() end

function Locomotive:notifyPlayerFarmChanged() end

function Locomotive:onLeaveVehicle() end

function Locomotive:onEnterVehicle() end

---@param superFunc any
function Locomotive:getIsReadyForAutomatedTrainTravel(superFunc) end

---@param superFunc any
function Locomotive:getIsMotorStarted(superFunc) end

function Locomotive:getDownhillForce() end

function Locomotive:getLocomotiveSpeed() end

---@param self any
function Locomotive.getBrakeAcceleration(self) end

---@param superFunc any
---@param axisForward any
---@param axisSide any
---@param doHandbrake any
---@param dt any
function Locomotive:updateVehiclePhysics(superFunc, axisForward, axisSide, doHandbrake, dt) end

---@param superFunc any
---@param spline any
---@param yOffset any
---@param tFront any
function Locomotive:alignToSplineTime(superFunc, spline, yOffset, tFront) end

---@param superFunc any
function Locomotive:getCanBeReset(superFunc) end

---@param superFunc any
function Locomotive:getStopMotorOnLeave(superFunc) end
