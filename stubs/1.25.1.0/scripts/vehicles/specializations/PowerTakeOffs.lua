---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PowerTakeOffs.lua (generated stub, FS25 Lua Atlas)

--- Specialization that builds and animates the visible PTO shafts. Output PTOs sit on a vehicle with attacher joints, input PTOs on an attachable, and local PTOs link two nodes of one vehicle. It requires AttacherJoints or Attachable, reads vehicle.powerTakeOffs (optionally per configuration), and loads the shaft model from a PTO XML/i3d file in three flavours: single joint, double joint or basic. It is mostly client-side visuals, linked to attach and detach events. PowerTakeOffs.DEFAULT_MAX_UPDATE_DISTANCE is used but not defined in the dump (UNVERIFIED).
---@class PowerTakeOffs
PowerTakeOffs = {}

--- Returns true if the vehicle type has AttacherJoints or Attachable.
---@param specializations any
function PowerTakeOffs.prerequisitesPresent(specializations) end

--- Registers the vehicle XML keys (output/input/local, ignoreInvalidJointIndices, maxUpdateDistance, sounds, moving part/tool PTO indices, dashboard index) and builds a separate XML schema for PTO shaft files (nodes, size, min length, max angle, materials, joint parts).
function PowerTakeOffs.initSpecialization() end

--- Registers the output, input and local PTO XML paths below a given base path.
---@param schema any
---@param basePath any
function PowerTakeOffs.registerXMLPaths(schema, basePath) end

--- Registers XML attributes of an output PTO: output node, attacher joints (by index or node), ptoName, skip-to-input index, animation nodes, object changes and the dashboard state value.
---@param schema any
---@param basePath any
function PowerTakeOffs.registerOutputXMLPaths(schema, basePath) end

--- Registers XML attributes of an input PTO: input node, input attacher joints, detach node, aboveAttacher, material templates, predefined length, PTO config filename (default Walterscheid file), ptoName, animation nodes and object changes.
---@param schema any
---@param basePath any
function PowerTakeOffs.registerInputXMLPaths(schema, basePath) end

--- Adds the PTO API to the vehicle type: loaders, update, attach/detach, park, collision check, lookup by joint index and name, and the typed (single, double, basic) shaft functions.
---@param vehicleType any
function PowerTakeOffs.registerFunctions(vehicleType) end

--- Overrides loadExtraDependentParts and updateExtraDependentParts so moving parts and tools can drive PTO updates.
---@param vehicleType any
function PowerTakeOffs.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onLoad, onPostLoad, onDelete, onUpdateInterpolation, onUpdateEnd and the pre/post attach and pre detach implement events.
---@param vehicleType any
function PowerTakeOffs.registerEventListeners(vehicleType) end

--- Stores the PTO configuration index returned by getPowerTakeOffConfigIndex.
---@param savegame any
function PowerTakeOffs:onPreLoad(savegame) end

--- Creates the output, input and local PTO tables, reads ignoreInvalidJointIndices and maxUpdateDistance, and on clients loads the turnedOn sounds. On a server without client it removes the interpolation listener.
---@param savegame any
function PowerTakeOffs:onLoad(savegame) end

--- Loads the PTOs from vehicle.powerTakeOffs, then from the selected configuration entry if it exists. Done after load so all attacher joints already exist.
---@param savegame any
function PowerTakeOffs:onPostLoad(savegame) end

--- Releases PTO XML files and shared i3d requests, deletes animation nodes and PTO nodes of outputs, inputs and local PTOs, and deletes the turnedOn sounds.
function PowerTakeOffs:onDelete() end

--- Client only, within maxUpdateDistance: updates input PTO shafts of connected vehicles in the same update loop, and those of attached implements. When the active state changes it starts or stops animations and the turnedOn sound.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PowerTakeOffs:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs onUpdateInterpolation one last time before the physics goes to sleep.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function PowerTakeOffs:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns 1 by default; meant to be overridden by a specialization that selects a PTO configuration.
function PowerTakeOffs:getPowerTakeOffConfigIndex() end

--- Iterates the output (if AttacherJoints), input (if Attachable) and local entries under a key and stores each successfully loaded PTO in its list.
---@param xmlFile any
---@param key any
function PowerTakeOffs:loadPowerTakeOffsFromXML(xmlFile, key) end

--- Loads one output PTO: output node (or skip-to-input index), attacher joints by index or node, name, animations and object changes, and registers a dashboard 'powerTakeOffs.state' value. Returns false if nothing valid is configured.
---@param xmlFile any
---@param baseName any
---@param powerTakeOffOutput any
function PowerTakeOffs:loadOutputPowerTakeOff(xmlFile, baseName, powerTakeOffOutput) end

--- Loads one input PTO: input node, input attacher joints, optional detach node (when Platform.gameplay.hasDetachedPowerTakeOffs), materials, name, animations, object changes and the shaft config file. Returns false without valid node or joints.
---@param xmlFile any
---@param baseName any
---@param powerTakeOffInput any
function PowerTakeOffs:loadInputPowerTakeOff(xmlFile, baseName, powerTakeOffInput) end

--- Loads a local PTO between startNode and endNode of the same vehicle, with optional materials and predefined length, then loads its shaft config file. Returns false if a node is missing.
---@param xmlFile any
---@param baseName any
---@param powerTakeOffLocal any
function PowerTakeOffs:loadLocalPowerTakeOff(xmlFile, baseName, powerTakeOffLocal) end

--- Once the i3d is loaded, links the shaft to the end node the first time, computes its length, then updates its pose.
---@param powerTakeOff any
function PowerTakeOffs:placeLocalPowerTakeOff(powerTakeOff) end

--- Calls the shaft's own update function (single or double joint) if its i3d is loaded and it is linked or placed.
---@param input any
---@param dt any
function PowerTakeOffs:updatePowerTakeOff(input, dt) end

--- Updates the input PTO shafts of this implement that are connected to the given attacher vehicle, when both share the same update loop index.
---@param dt any
---@param attacherVehicle any
function PowerTakeOffs:updateAttachedPowerTakeOffs(dt, attacherVehicle) end

--- Recomputes the shaft length through its distance function when the i3d is loaded.
---@param input any
function PowerTakeOffs:updatePowerTakeOffLength(input) end

--- Returns the output PTOs linked to an attacher joint index. If one is a skip-to-input entry, the lookup is redirected to the attacher vehicle of this vehicle.
---@param jointDescIndex any
function PowerTakeOffs:getOutputPowerTakeOffsByJointDescIndex(jointDescIndex) end

--- Returns the table of output PTOs.
function PowerTakeOffs:getOutputPowerTakeOffs() end

--- Returns input PTOs matching an input joint index and a PTO name. If none, follows skip-to-input outputs to the next implement in the chain.
---@param jointDescIndex any
---@param ptoName any
function PowerTakeOffs:getInputPowerTakeOffsByJointDescIndexAndName(jointDescIndex, ptoName) end

--- Returns the table of input PTOs.
function PowerTakeOffs:getInputPowerTakeOffs() end

--- Returns false by default; specializations override it to say when the shaft should animate and play sound.
function PowerTakeOffs:getIsPowerTakeOffActive() end

--- Pairs each output PTO of the joint with the matching input PTO (same ptoName) of the attached object and queues the mounting. Always returns true.
---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
function PowerTakeOffs:attachPowerTakeOff(attachableObject, inputJointDescIndex, jointDescIndex) end

--- Clears queued mountings, calls each connected input's detach function, stops output animations, resets the connections and turns off object changes. Always returns true.
---@param detachingVehicle any
---@param implement any
---@param jointDescIndex any
function PowerTakeOffs:detachPowerTakeOff(detachingVehicle, implement, jointDescIndex) end

--- For trailer-type joints only, detaches the PTO if its output lies on the wrong side (below or above) of the attacher joint compared with the input's aboveAttacher setting.
---@param attacherJointNode any
---@param jointDescIndex any
---@param isTrailerAttacher any
function PowerTakeOffs:checkPowerTakeOffCollision(attacherJointNode, jointDescIndex, isTrailerAttacher) end

--- Stores the shaft when unattached: hangs it on the detach node if there is one, otherwise hides both ends inside the vehicle. Resets the end offsets.
---@param input any
function PowerTakeOffs:parkPowerTakeOff(input) end

--- Calls attachPowerTakeOff just before an implement is attached.
---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function PowerTakeOffs:onPreAttachImplement(attachableObject, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- After attach, runs the queued mountings for that joint: calls the input's attach function and enables the object changes of input and output.
---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function PowerTakeOffs:onPostAttachImplement(attachableObject, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Calls detachPowerTakeOff before an implement is detached and stops the turnedOn sound on clients.
---@param implement any
function PowerTakeOffs:onPreDetachImplement(implement) end

--- Opens a PTO shaft XML file and requests its i3d asynchronously as a shared i3d, with onPowerTakeOffI3DLoaded as callback. Warns if the file or i3d name is missing.
---@param powerTakeOff any
---@param xmlFilename any
function PowerTakeOffs:loadPowerTakeOffFromConfigFile(powerTakeOff, xmlFilename) end

--- Async callback: reads size, min length, max angle and offset, loads animations, applies materials, picks the single, double or basic loader, links the start node, parks or places the shaft, then deletes the temporary i3d node and XML file.
---@param i3dNode any
---@param failedReason any
---@param args any
function PowerTakeOffs:onPowerTakeOffI3DLoaded(i3dNode, failedReason, args) end

--- Loads the nodes of a single-joint shaft (joints, scale and translation parts, decal, link node), computes base lengths and sets the single-joint update, distance, attach and detach functions.
---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadSingleJointPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

--- Orients the start joint toward the link node, sets the end joint distance, and scales the scale part to match the span.
---@param powerTakeOff any
---@param dt any
function PowerTakeOffs:updateSingleJointPowerTakeOff(powerTakeOff, dt) end

--- Loads the nodes of a double-joint shaft (two start and two end joints, scale and translation parts, decal, link node) and sets its update, distance, attach and detach functions.
---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadDoubleJointPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

--- Orients the four joints so both universal joints share the bend, sets the end joint distance and scales the scale part.
---@param powerTakeOff any
---@param dt any
function PowerTakeOffs:updateDoubleJointPowerTakeOff(powerTakeOff, dt) end

--- Loads a basic shaft: only start and link nodes, with the typed attach and detach functions and no update function.
---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadBasicPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

--- Scales the telescopic translation part to the current start-to-link distance (or predefined length) and fits or hides the decal depending on the available length.
---@param powerTakeOff any
function PowerTakeOffs:updateDistanceOfTypedPowerTakeOff(powerTakeOff) end

--- If the attachment is valid, links the shaft between the output node and the input node, sets offsets, updates pose and length, shows it and marks it linked.
---@param powerTakeOff any
---@param output any
function PowerTakeOffs:attachTypedPowerTakeOff(powerTakeOff, output) end

--- Parks the shaft via parkPowerTakeOff when it is detached.
---@param powerTakeOff any
---@param output any
function PowerTakeOffs:detachTypedPowerTakeOff(powerTakeOff, output) end

--- Returns false if a node is missing, the output-to-input distance is below minLength, or the vertical angle exceeds maxAngle; otherwise true.
---@param powerTakeOff any
---@param output any
function PowerTakeOffs:validatePowerTakeOffAttachment(powerTakeOff, output) end

--- After the parent loader, reads the powerTakeOffs#indices and #localIndices lists on a moving part or tool. Returns false if the parent failed.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function PowerTakeOffs:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- After the parent update, refreshes the listed input and local PTOs of the part; an unknown index is dropped with a warning once loading has finished.
---@param superFunc any
---@param part any
---@param dt any
function PowerTakeOffs:updateExtraDependentParts(superFunc, part, dt) end

--- Debug console handler: for one attacher joint index, shows a magenta test shaft, object changes, a debug line and a label on matching outputs, and clears them on the others.
---@param vehicle any
---@param attacherJointIndex any
function PowerTakeOffs.consoleCommandTestConnection(vehicle, attacherJointIndex) end

--- Debug console handler: lays out every PTO shaft XML found under data/shared/assets/powerTakeOffs in front of the player in three variants (plain, colored, animated and moving), using dummy vehicle objects. Replaces any previous debug set.
---@param _ any
function PowerTakeOffs.consoleCommandDebug(_) end
