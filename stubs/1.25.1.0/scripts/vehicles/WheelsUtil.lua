---@meta
-- FS25 1.25.1.0 : vehicles/WheelsUtil.lua (generated stub, FS25 Lua Atlas)

--- Utility table for wheel and drive physics. It registers tire types with friction coefficients per ground type (dry, wet, snow), maps terrain information to a ground type, and `updateWheelsPhysics` turns the driver's acceleration request into accelerator and brake pedals and drives the vehicle motor and brakes. The constants `WheelsUtil.tireTypes`, `NUM_GROUNDS`, `GROUND_*` and `SMOOTHING_SPEED_SCALE` are defined outside the functions shown (UNVERIFIED).
---@class WheelsUtil
WheelsUtil = {}

--- Registers a tire type under an upper-cased name with friction tables for dry, wet and snow. Missing entries are filled from the previous ground type (first one defaults to 1.15 or the first given value). Warns and ignores duplicates.
---@param name string
---@param frictionCoeffs table
---@param frictionCoeffsWet table
---@param frictionCoeffsSnow any
function WheelsUtil.registerTireType(name, frictionCoeffs, frictionCoeffsWet, frictionCoeffsSnow) end

--- Removes the first tire type with this name from the registry, if present.
---@param name any
function WheelsUtil.unregisterTireType(name) end

--- Returns the registry index of a tire type by name (case-insensitive), or nil.
---@param name string
---@return integer
function WheelsUtil.getTireType(name) end

--- Returns the tire type name for an index, or the string `unknown`.
---@param index integer
---@return string
function WheelsUtil.getTireTypeName(index) end

--- Applies ramping to accelerator and brake pedal inputs, storing smoothed values on the vehicle. Pedals rise gradually and fall at a rate that depends on the other pedal; returns the applied accelerator and brake values.
---@param self any
---@param acceleratorPedal any
---@param brakePedal any
---@param dt any
function WheelsUtil.getSmoothedAcceleratorAndBrakePedals(self, acceleratorPedal, brakePedal, dt) end

--- Converts the requested acceleration into pedals using direction logic, gear updates, automatic low-speed braking, handbrake and over-speed limiting. It raises `onVehiclePhysicsUpdate`, then calls `controlVehicle` and `brake` on the vehicle. Speed is signed, in m/ms.
---@param self number
---@param dt number
---@param currentSpeed number
---@param acceleration number
---@param doHandbrake boolean
---@param stopAndGoBraking boolean
function WheelsUtil.updateWheelsPhysics(self, dt, currentSpeed, acceleration, doHandbrake, stopAndGoBraking) end

--- Returns the non-motor differential speed: on the server, the mean of axle speed times radius over wheels in ground contact; otherwise the vehicle's last real speed times 1000.
---@param self any
---@return number
function WheelsUtil.computeDifferentialRotSpeedNonMotor(self) end

--- Returns the tire friction for a tire type and ground type: dry value blended toward the wet and snow values by the wet and snow scales. The snow scale must be given (nil would error).
---@param tireType integer
---@param groundType integer
---@param wetScale number
---@param snowScale any
---@return number
function WheelsUtil.getTireFriction(tireType, groundType, wetScale, snowScale) end

--- Maps terrain info to a ground type: field first, then road (flag or depth under 0.1), then soft terrain above 0.8 depth, else hard terrain.
---@param isField boolean
---@param isRoad boolean
---@param depth number
---@return integer
function WheelsUtil.getGroundType(isField, isRoad, depth) end
