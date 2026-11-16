---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StrawBlower.lua (generated stub, FS25 Lua Atlas)

--- Specialization for straw blowers that shred a bale by treating it as a temporary fill level. It requires FillUnit and Trailer. A server-side trigger detects bales; the fill unit capacity is resized to the bale content and the bale is deleted once emptied. Client side it plays start/work/stop sounds and animation nodes depending on the discharge state.
---@class StrawBlower
StrawBlower = {}

--- Returns true only if the vehicle type also has the FillUnit and Trailer specializations.
---@param specializations table
---@return boolean
function StrawBlower.prerequisitesPresent(specializations) end

--- Registers the XML schema paths: bale trigger node, fill unit index (default 1), animation nodes and the start, stop and work sound samples under vehicle.strawBlower.
function StrawBlower.initSpecialization() end

--- Registers the vehicle functions strawBlowerBaleTriggerCallback and onDeleteStrawBlowerObject.
---@param vehicleType any
function StrawBlower.registerFunctions(vehicleType) end

--- Overrides getDrawFirstFillText, getAllowDynamicMountFillLevelInfo and addFillUnitFillLevel on the vehicle type.
---@param vehicleType any
function StrawBlower.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdateTick, onFillUnitFillLevelChanged and onDischargeStateChanged.
---@param vehicleType any
function StrawBlower.registerEventListeners(vehicleType) end

--- Server: creates the bale trigger from XML. Client: loads animations and sounds. Marks the fill unit as fully synchronized and unsaved, resets its level on savegame load, and drops the update listener on clients.
---@param savegame table
function StrawBlower:onLoad(savegame) end

--- Removes the trigger, releases every tracked bale (wakes its physics, allows pickup again, removes the delete listener), clears the table and deletes sounds and animations.
function StrawBlower:onDelete() end

--- Server only. If no bale is current and the fill unit accepts the BALE tool type, takes the first triggered bale, sets the capacity to its fill level and fills the unit with its content.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StrawBlower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Override that grows the capacity of the straw fill unit when needed so the requested change fits, then calls the parent implementation.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function StrawBlower:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

--- Trigger callback. On enter, accepts a Bale the active farm can access, pickable and of a supported fill type: counts it and blocks pickup. On leave, decrements the count and, at zero, releases the bale and empties the fill unit if it was current.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function StrawBlower:strawBlowerBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Delete listener for a tracked bale: forgets it and, if it was the current bale, clears the current bale and empties the fill unit.
---@param object any
function StrawBlower:onDeleteStrawBlowerObject(object) end

--- Override: also returns true when the straw fill unit is empty, in addition to the parent result.
---@param superFunc any
function StrawBlower:getDrawFirstFillText(superFunc) end

--- Override that always returns false.
---@param superFunc any
function StrawBlower:getAllowDynamicMountFillLevelInfo(superFunc) end

--- Server: when the unit reaches about zero, unmounts and deletes the current bale and resets capacity to 1; otherwise shrinks the bale fill level to follow the unit. Client: resets capacity to 1 when emptied.
---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType boolean
---@param fillPositionData table
---@param appliedDelta any
function StrawBlower:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Client only. When discharge starts it plays the start then work sounds and starts the animations; when it stops it stops them and plays the stop sound.
---@param state any
function StrawBlower:onDischargeStateChanged(state) end
