---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AdditionalToolConnections.lua (generated stub, FS25 Lua Atlas)

--- Returns true if the vehicle type has either AttacherJoints or Attachable.
---@param specializations table
---@return boolean
function AdditionalToolConnections.prerequisitesPresent(specializations) end

--- Registers the XML keys for the tool-side connections (id, movingPartNode, object changes) and, through a delayed registration, the additionalToolConnection id/node keys on each attacher joint.
function AdditionalToolConnections.initSpecialization() end

--- Empty: registers no new vehicle function.
---@param vehicleType any
function AdditionalToolConnections.registerFunctions(vehicleType) end

--- Overrides loadAttacherJointFromXML so that attacher joints also read their additional connections.
---@param vehicleType any
function AdditionalToolConnections.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPostLoad, onPostAttach and onPreDetach.
---@param vehicleType any
function AdditionalToolConnections.registerEventListeners(vehicleType) end

--- Reads each connection, looks up its moving part and stores id, node and object changes (initially disabled). Logs an XML warning when the id, node or moving part is missing.
---@param savegame any
function AdditionalToolConnections:onPostLoad(savegame) end

--- Override: calls the parent loader and, if it succeeds, fills attacherJoint.additionalToolConnections with id to node pairs. Returns false when the parent fails.
---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function AdditionalToolConnections:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index, ...) end

--- For each tool connection whose id exists on the used attacher joint, points the moving part's reference node at the joint's node and enables the object changes.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame boolean
function AdditionalToolConnections:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Before detaching, clears the reference node of every connection's moving part and disables the object changes.
---@param attacherVehicle table
---@param implement table
function AdditionalToolConnections:onPreDetach(attacherVehicle, implement) end
