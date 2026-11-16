---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BigBag.lua (generated stub, FS25 Lua Atlas)

--- Specialization for big bags (bulk sacks): it scales a size animation with the fill level and adjusts the limits of a component joint so the bag stretches when lifted and full. Configured under vehicle.bigBag (fillUnitIndex, sizeAnimation, componentJoint). Joint limits are changed on the server only; the animation runs on every machine. It also overrides the info box title with the big bag shop text.
---@class BigBag
BigBag = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function BigBag.prerequisitesPresent(specializations) end

--- Registers the vehicle.bigBag XML keys: fill unit index, size animation name with min/max/lift-shrink times, and component joint index, rotation and translation limits plus angular damping.
function BigBag.initSpecialization() end

--- Empty hook, registers no new vehicle functions.
---@param vehicleType any
function BigBag.registerFunctions(vehicleType) end

--- Overrides getInfoBoxTitle on the vehicle type.
---@param vehicleType any
function BigBag.registerOverwrittenFunctions(vehicleType) end

--- Registers onLoad, onUpdate and onFillUnitFillLevelChanged.
---@param vehicleType any
function BigBag.registerEventListeners(vehicleType) end

--- Reads the bigBag XML values. If the referenced component joint exists, creates a reference transform group on the second component, stores the joint limits and sets angular damping on both components; initialises animation state.
---@param savegame table
function BigBag:onLoad(savegame) end

--- Measures how far the joint has moved from its reference to derive a lift alpha and a shrink time for the size animation. On the server it re-interpolates the joint rotation limits when alpha changes by more than 0.05.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BigBag:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When the tracked fill unit changes, recomputes the size animation time from the fill percentage and sets the animation. On the server it also interpolates the joint translation limits between the empty and full values.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function BigBag:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Returns the localized text shopItem_bigBag as the info box title, ignoring the parent implementation.
---@param superFunc any
function BigBag:getInfoBoxTitle(superFunc) end
