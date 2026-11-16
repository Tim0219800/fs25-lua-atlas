---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJointsCompControl.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type includes the AttacherJoints specialization.
---@param specializations table
---@return boolean
function AttacherJointsCompControl.prerequisitesPresent(specializations) end

--- Registers the XML schema entries for the `dependentComponentJoint` block of an attacher joint: joint index, spring and damping factors, reference mass and attach/detach interpolation times.
function AttacherJointsCompControl.initSpecialization() end

--- Registers the three vehicle functions of this specialization: setDependentComponentJointBaseFactors, addDependentComponentJointData and updateDependentComponentJointValues.
---@param vehicleType any
function AttacherJointsCompControl.registerFunctions(vehicleType) end

--- Overrides `addToPhysics` and `loadAttacherJointFromXML` on the vehicle type so the joint factors are initialised and read from XML.
---@param vehicleType any
function AttacherJointsCompControl.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the vehicle to the `onPreLoad` and `onStateChange` events.
---@param vehicleType any
function AttacherJointsCompControl.registerEventListeners(vehicleType) end

--- Creates the empty table of dependent joint data. On a non-server instance it removes the `onStateChange` listener, since the logic is server only.
---@param savegame table
function AttacherJointsCompControl:onPreLoad(savegame) end

--- On an ATTACH or DETACH vehicle state change, recomputes the dependent joint spring and damping factors.
---@param state any
---@param data any
function AttacherJointsCompControl:onStateChange(state, data) end

--- Server only. Sets the base spring and damping factors of a component joint, either replacing them or multiplying the current ones, so other code can scale the joint independently of attached tools.
---@param componentJointIndex any
---@param transSpringFactor any
---@param transDampingFactor any
---@param overwrite any
function AttacherJointsCompControl:setDependentComponentJointBaseFactors(componentJointIndex, transSpringFactor, transDampingFactor, overwrite) end

--- Gets or creates the data record for a component joint index, with getter and setter callbacks that apply spring and damping factors to the three translation limits. Returns nil and logs an XML warning if the index is unknown.
---@param componentJointIndex any
function AttacherJointsCompControl:addDependentComponentJointData(componentJointIndex) end

--- Recomputes target factors from the mass of each attached implement (capped at the reference mass) and starts a ValueInterpolator, or applies them at once if `skipInterpolation` is set. Note: the detach test compares the damping target with itself, so its damping half is always true.
---@param forceUpdate any
---@param skipInterpolation any
function AttacherJointsCompControl:updateDependentComponentJointValues(forceUpdate, skipInterpolation) end

--- Calls the parent function and, on the server, immediately applies the joint factors without interpolation. Returns false if the parent failed.
---@param superFunc any
---@return boolean
function AttacherJointsCompControl:addToPhysics(superFunc) end

--- After the parent load, on the server only, reads the `dependentComponentJoint` block of the attacher joint and stores its factors, reference mass and interpolation times. Returns false if the parent failed.
---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function AttacherJointsCompControl:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index) end

--- Adds debug display rows: implement mass against reference mass, spring and damping factors per attacher joint, and base and current factors per component joint.
---@param values any
function AttacherJointsCompControl:updateDebugValues(values) end
