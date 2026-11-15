---@meta
-- FS25 1.25.1.0 : vehicles/WheelsUtil.lua (stub généré, atlas Lua FS25)

---@class WheelsUtil
WheelsUtil = {}

---@param name string
---@param frictionCoeffs table
---@param frictionCoeffsWet table
---@param frictionCoeffsSnow any
function WheelsUtil.registerTireType(name, frictionCoeffs, frictionCoeffsWet, frictionCoeffsSnow) end

---@param name any
function WheelsUtil.unregisterTireType(name) end

---@param name string
---@return integer
function WheelsUtil.getTireType(name) end

---@param index integer
---@return string
function WheelsUtil.getTireTypeName(index) end

---@param self any
---@param acceleratorPedal any
---@param brakePedal any
---@param dt any
function WheelsUtil.getSmoothedAcceleratorAndBrakePedals(self, acceleratorPedal, brakePedal, dt) end

---@param self number
---@param dt number
---@param currentSpeed number
---@param acceleration number
---@param doHandbrake boolean
---@param stopAndGoBraking boolean
function WheelsUtil.updateWheelsPhysics(self, dt, currentSpeed, acceleration, doHandbrake, stopAndGoBraking) end

---@param self any
---@return number
function WheelsUtil.computeDifferentialRotSpeedNonMotor(self) end

---@param tireType integer
---@param groundType integer
---@param wetScale number
---@param snowScale any
---@return number
function WheelsUtil.getTireFriction(tireType, groundType, wetScale, snowScale) end

---@param isField boolean
---@param isRoad boolean
---@param depth number
---@return integer
function WheelsUtil.getGroundType(isField, isRoad, depth) end
