---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HeadlandAnimation.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that plays configured animations when the vehicle turns on the headland, detected from the steering amount with activation and deactivation delays and thresholds. Optionally the vehicle must be above specific field ground types. It is configured under vehicle.headlandAnimation and relies on the animation system of the vehicle (playAnimation, getAnimationTime). It has no prerequisite and no network code of its own.
---@class HeadlandAnimation
HeadlandAnimation = {}

--- Always returns true: no prerequisite on other specializations.
---@param specializations table
---@return boolean
function HeadlandAnimation.prerequisitesPresent(specializations) end

--- Registers the XML schema under vehicle.headlandAnimation: activation and deactivation delays (time), steering thresholds (0 to 1), required ground types and the list of animations with name and speed.
function HeadlandAnimation.initSpecialization() end

--- Empty: the specialization adds no vehicle functions.
---@param vehicleType any
function HeadlandAnimation.registerFunctions(vehicleType) end

--- Empty: nothing is overridden.
---@param vehicleType any
function HeadlandAnimation.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onLoad and onUpdate.
---@param vehicleType any
function HeadlandAnimation.registerEventListeners(vehicleType) end

--- If a headlandAnimation node exists, loads delays, angles, the required FieldGroundType names (warning on unknown names) and the animation list. Otherwise removes the onUpdate listener. Note: the ground type attribute is split without a nil check, so omitting it would raise an error.
---@param savegame table
function HeadlandAnimation:onLoad(savegame) end

--- Each frame, runs a timer from the steering amount (rotatedTime) and the ground type below the vehicle to decide the headland state, then plays all animations forward or in reverse when that state changes. Note: it tests spec.headlandRequiredDensityBits, which is never assigned in this file.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function HeadlandAnimation:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
