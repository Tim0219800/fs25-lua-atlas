---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SemiTrailerFront.lua (generated stub, FS25 Lua Atlas)

--- Specialization for the detachable front part of a separable semi trailer. It needs AttacherJoints and works on the first input attacher joint of Attachable: when no rear semi trailer is attached, the joint rotation limits are faded down to zero over about one second so the front part can be handled, and they are restored when a rear part is attached. Detaching from the tractor is only allowed while a rear semi trailer is attached. Joint changes happen on the server.
---@class SemiTrailerFront
SemiTrailerFront = {}

--- Returns true only if the vehicle type has AttacherJoints.
---@param specializations table
---@return boolean
function SemiTrailerFront.prerequisitesPresent(specializations) end

--- Overrides `isDetachAllowed`.
---@param vehicleType any
function SemiTrailerFront.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onUpdate, onPostAttachImplement, onPreDetachImplement, onPreDetach and onPostAttach.
---@param vehicleType any
function SemiTrailerFront.registerEventListeners(vehicleType) end

--- Initialises the fade state (value 1, direction 1, duration 1000 ms), grabs the first Attachable input attacher joint and backs up its `lowerRotLimitScale`. It will error if the vehicle has no input attacher joint.
---@param savegame table
function SemiTrailerFront:onLoad(savegame) end

--- On the first update, if no rear trailer is attached, sets the fade direction to closing. On the server, while attached to a tractor and the fade is not finished, moves the fade value with dt, scales the joint rotation limits and applies them on the physics joint with `setJointRotationLimit`.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SemiTrailerFront:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns false (with the parent's warning) if the parent forbids detaching; otherwise returns true only when a rear semi trailer is attached, with no warning.
---@param superFunc any
---@return boolean
function SemiTrailerFront:isDetachAllowed(superFunc) end

--- Remembers the attached rear trailer and sets the fade direction to 1000 so the rotation limits are restored.
---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function SemiTrailerFront:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Forgets the rear trailer and sets the fade direction to -1 so the rotation limits fade out.
---@param implement integer
function SemiTrailerFront:onPreDetachImplement(implement) end

--- Clears the stored tractor implement reference when this front part is detached.
---@param attacherVehicle table
---@param implement table
function SemiTrailerFront:onPreDetach(attacherVehicle, implement) end

--- After being attached to a tractor, stores the matching implement entry from the attacher vehicle.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function SemiTrailerFront:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end
