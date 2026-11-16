---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SeedTreater.lua (generated stub, FS25 Lua Atlas)

--- Specialization for seed treatment machines. It requires Dischargeable and FillUnit: a dedicated fill unit holds the treatment liquid (LIQUIDSEEDTREATMENT), which is consumed in proportion to the seed discharged through one chosen discharge node, and the discharge speed is slowed while treatment is active. On the server it also starts filling from nearby triggers when the liquid tank has room.
---@class SeedTreater
SeedTreater = {}

--- Returns true only if the vehicle type has Dischargeable and FillUnit.
---@param specializations table
---@return boolean
function SeedTreater.prerequisitesPresent(specializations) end

--- Declares the `vehicle.seedTreater` XML attributes: liquid fill unit index, discharge node index, usage per liter (default 0.1), fill-from-trigger threshold (default 5) and treatment speed factor (default 0.1).
function SeedTreater.initSpecialization() end

--- Registers no new function (empty body).
---@param vehicleType any
function SeedTreater.registerFunctions(vehicleType) end

--- Overrides `discharge`, `getDischargeFillType` and `getDischargeNodeEmptyFactor`.
---@param vehicleType any
function SeedTreater.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onUpdate.
---@param vehicleType any
function SeedTreater.registerEventListeners(vehicleType) end

--- Reads the seedTreater XML values into the spec: fill unit index, discharge node index, usage per liter, trigger threshold and treatment speed factor.
---@param savegame any
function SeedTreater:onLoad(savegame) end

--- Server only: if the liquid fill unit has more than 5 liters of free capacity and a nearby fill trigger offers LIQUIDSEEDTREATMENT and is activatable, starts filling; stops filling once it is nearly full while discharging. Note: the 5 is hardcoded, `fillFromTriggerThreshold` is read but not used here.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SeedTreater:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Calls the parent discharge, then, for the configured discharge node and only if its fillTypeConverter converts the current fill type, removes treatment liquid (discharged liters times usagePerLiter) from the liquid fill unit. Returns the parent's three values unchanged.
---@param superFunc any
---@param dischargeNode any
---@param emptyLiters any
function SeedTreater:discharge(superFunc, dischargeNode, emptyLiters) end

--- When the liquid fill unit is empty, returns the discharge node's own fill unit type and a second value of 1, bypassing the parent; otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function SeedTreater:getDischargeFillType(superFunc, dischargeNode) end

--- Returns the parent's empty factor multiplied by `treatmentSpeedFactor` when treatment liquid is available and the current fill type is convertible; otherwise returns the parent's value unchanged.
---@param superFunc any
---@param dischargeNode any
function SeedTreater:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end
