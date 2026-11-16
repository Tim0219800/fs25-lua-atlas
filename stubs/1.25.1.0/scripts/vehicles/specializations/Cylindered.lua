---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cylindered.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that animates articulated parts of a machine: moving tools (player-controlled axes such as loader arms, driven by rotation, translation or an animation) and moving parts (passive nodes that aim at a reference point, such as hydraulic cylinders). Requires VehicleSettings and also talks to AnimatedVehicle, Wheels, AttacherJoints, Dischargeable, Shovel and DynamicMountAttacher. It runs input and limits on the server, interpolates on clients, syncs tool positions over the network and saves them in the savegame. It also provides the optional easy arm control (a two-segment inverse kinematics scheme), control groups, hydraulic and action sounds, and dashboard values. Constants such as MOVING_TOOLS_XML_KEYS, the SOUND_ACTION_* and SOUND_TYPE_* values are not visible in this dump (UNVERIFIED).
---@class Cylindered
Cylindered = {}

--- Returns true only if the vehicle type includes the VehicleSettings specialization; Cylindered cannot be added without it.
---@param specializations table
---@return boolean
function Cylindered.prerequisitesPresent(specializations) end

--- Registers the "cylindered" shop configuration type and declares all vehicle XML paths (moving tools, moving parts, easy arm control, control groups, dashboards, object-change extensions, discharge, shovel and dynamic-mount activation) plus the savegame keys for tool translation, rotation and animation time.
function Cylindered.initSpecialization() end

--- Declares the XML paths of the hydraulic sample and of the action sounds (action names, trigger nodes, pitch drop-off factor and time) under the given base key.
---@param schema any
---@param baseKey any
function Cylindered.registerSoundXMLPaths(schema, baseKey) end

--- Declares the XML attributes of the easy arm control block: root, target and reference nodes, target speed and acceleration, the translation/rotation move ratio settings, and the Z translation and X rotation nodes.
---@param schema any
---@param key any
function Cylindered.registerEasyArmControlXMLPaths(schema, key) end

--- Declares every XML attribute of one moving tool: rotation, translation and animation limits and speeds, controls (axis, icon, group), power use, attach and detach limits, required configurations, dependent parts, wheels, attacher joints, fill and fold limits. Also chains the dependent joint, animation and tool registrations.
---@param schema any
---@param toolKey any
function Cylindered.registerMovingToolXMLPaths(schema, toolKey) end

--- Declares every XML attribute of one moving part: node, reference frame and points, alignment modes (direction, line, 3D line, rotation, world Y), distance and threshold settings, smoothing, update distance, translating parts and dependent elements.
---@param schema any
---@param partKey any
function Cylindered.registerMovingPartXMLPaths(schema, partKey) end

--- Declares the XML paths for component joints that must follow a moving tool or part: joint index, ignore-warning flag and anchor actor.
---@param schema any
---@param basePath any
function Cylindered.registerDependentComponentJointXMLPaths(schema, basePath) end

--- Declares the XML paths of copyLocalDirectionPart entries (node, direction scale, up-vector scale) and their optional component joints.
---@param schema any
---@param basePath any
function Cylindered.registerCopyLocalDirectionXMLPaths(schema, basePath) end

--- Declares the XML paths of dependent animations driven by a part's axis value: animation name, axis, translating part index, value range and inversion.
---@param schema any
---@param basePath any
function Cylindered.registerDependentAnimationXMLPaths(schema, basePath) end

--- Declares the XML paths of dependent moving tools: node, axis, speed scale, requiresMovement, rotation-based limit keyframes and min/max translation or rotation limit pairs.
---@param schema any
---@param basePath any
function Cylindered.registerDependentMovingToolXMLPaths(schema, basePath) end

--- Registers the vehicle event onMovingToolChanged, raised with the tool, the speed and dt whenever a moving tool actually moves.
---@param vehicleType any
function Cylindered.registerEvents(vehicleType) end

--- Registers the specialization's public vehicle functions (loading helpers, dirty updates, node lookups, active-state getters, easy control, dependent updates, sound events, control groups) on the vehicle type.
---@param vehicleType any
function Cylindered.registerFunctions(vehicleType) end

--- Overrides existing vehicle functions: detach permission, object-change loading and applying, discharge-node, shovel and dynamic-mount hooks, component joint frame, schema text, wear multiplier, PTO power use and consuming load.
---@param vehicleType any
function Cylindered.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the vehicle lifecycle, network, update, draw, input, attach, selection, AI, setting and animation-value events it needs.
---@param vehicleType any
function Cylindered.registerEventListeners(vehicleType) end

--- Builds the whole articulated setup from the vehicle XML (base and configuration keys): moving parts and tools, dependent links, control groups with sub-selections, easy arm control, dashboard value, sounds, dirty flags and the EASY_ARM_CONTROL vehicle setting. Warns on invalid entries and drops dependent tools that are not defined.
---@param savegame table
function Cylindered:onLoad(savegame) end

--- Applies start positions, loads attacher-joint and wheel dependencies, restores saved tool positions clamped to their limits (unless the savegame resets vehicles), then runs the initial update. Removes event listeners that the vehicle does not need (no tools, no parts, not a client).
---@param savegame table
function Cylindered:onPostLoad(savegame) end

--- Ends the loading phase and flushes the delayed-node history of tools that have pending delayed data.
---@param savegame table
function Cylindered:onLoadFinished(savegame) end

--- Registers the cylindered/movingTool dashboard value (range 0 to 1, idle 0.5) fed by getMovingToolDashboardState.
function Cylindered:onRegisterDashboardValueTypes() end

--- Releases the hydraulic and action sound samples and deletes the axis icons of the moving tools.
function Cylindered:onDelete() end

--- Writes the current translation, rotation and animation time of every saveable moving tool into the savegame, indexed in order of saveable tools only.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Cylindered:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side, on join: if the server flagged states as loadable, reads each tool's absolute translation, rotation and animation time, resets interpolators, applies them and raises onMovingToolChanged.
---@param streamId integer
---@param connection Connection
function Cylindered:onReadStream(streamId, connection) end

--- Server side, on join: writes a flag (allowLoadMovingToolStates) and then each networked tool's absolute translation, rotation and animation time for the joining client.
---@param streamId integer
---@param connection Connection
function Cylindered:onWriteStream(streamId, connection) end

--- Server reads the 12-bit input value of each controllable tool sent by a client. Client reads the compressed rotation, translation and animation targets (and synced rotation limits) and feeds the network interpolators.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Cylindered:onReadUpdateStream(streamId, timestamp, connection) end

--- Client sends its current input values (12-bit, only when the input dirty flag is set). Server sends the compressed state of every tool whose dirty flag is set and that is active.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Cylindered:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Per-frame update. Server: converts input (or AI target) into accelerated rotation, translation and animation motion, drives dependent tools and limits, raises dirty flags and power-consumption timing. Client: interpolates toward the last network state. Also advances delayed nodes and the power timer.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Cylindered:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stores the tool node's current rotation and translation as the newest entry of its delayed-frames history (optionally filling the whole history at once).
---@param tool any
---@param immediate any
function Cylindered:setDelayedData(tool, immediate) end

--- Shifts the delayed history by one frame and applies the oldest stored pose to the tool's delayedNode, marking a matching moving part or tool dirty. Can first force every entry to the latest pose.
---@param tool any
---@param forceLastPosition any
function Cylindered:updateDelayedTool(tool, forceLastPosition) end

--- Reads and validates the easy arm control block: two target tools, optional Z translation nodes and exactly two X rotation nodes, with position checks. Computes the maximum reach if not given. Returns false with an XML warning or error when the setup is invalid.
---@param xmlFile any
---@param key any
---@param easyArmControl any
function Cylindered:loadEasyArmControlFromXML(xmlFile, key, easyArmControl) end

--- While easy control is on and the player moves the Y or Z target, moves a reference point within reach and solves the two-segment arm (circle intersection plus law of cosines), driving the Z translation and X rotation tools within their limits. Server only for the movement.
---@param dt any
---@param updateDelayedNodes any
function Cylindered:updateEasyControl(dt, updateDelayedNodes) end

--- Switches easy arm control on or off. On the server, enabling it first snaps the Y and Z target tools to the reference node and syncs. Requests an action-event refresh on all sides.
---@param state any
function Cylindered:setIsEasyControlActive(state) end

--- Sets a one-shot forced move factor for the easy control translation nodes, consumed at the next easy control update; ignored without easy arm control.
---@param value any
function Cylindered:setEasyControlForcedTransMove(value) end

--- Empty extension hook called after a tool or part updates, so other specializations can override it to update extra dependent content.
---@param part any
---@param dt any
function Cylindered:updateExtraDependentParts(part, dt) end

--- Maps the part's current translation or rotation on its axis to a normalised 0..1 value (optionally inverted) and sets each dependent animation to that time.
---@param part any
---@param dt any
function Cylindered:updateDependentAnimations(part, dt) end

--- Interpolates the min/max translation or rotation limits of a dependent tool from the driving tool's state, then re-clamps the dependent tool and marks it dirty if it moved.
---@param tool any
---@param dependentTool any
function Cylindered:updateDependentToolLimits(tool, dependentTool) end

--- Triggers the action samples registered for a part and action: one-shot, continuous, ending or starting types, using timestamps so ending and starting sounds are debounced. Client-side sound handling.
---@param part any
---@param action any
---@param type any
function Cylindered:onMovingPartSoundEvent(part, action, type) end

--- Translates a tool movement (direction, limit reached, left a limit) into the matching start, end, positive and negative sound action events for the tool.
---@param tool any
---@param direction any
---@param hitLimit any
---@param wasAtLimit any
function Cylindered:updateMovingToolSoundEvents(tool, direction, hitLimit, wasAtLimit) end

--- Rebuilds the sub-selections from control groups that still have an active controllable tool, refreshes the root vehicle's selectable objects and reselects this vehicle if it was selected.
function Cylindered:updateControlGroups() end

--- Client side: enables or disables each tool's input action depending on whether the tool is active, resets stuck input, refreshes control groups on state change and times out active, ending and starting action samples.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Forces all always-dirty moving parts to update regardless of camera distance just before the vehicle goes to sleep, then flushes dirty parts.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Marks always-dirty moving parts dirty when the vehicle is within their max update distance, then updates dirty parts and the hydraulic sound.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Updates parts set dirty during the update tick, without the sound step, so they are not one frame late.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onPostUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Processes dirty tools (wheels, server component joints, extra and animation dependents) and dirty moving parts, then starts or stops the hydraulic sample on clients when updateSound is true.
---@param dt any
---@param updateSound any
function Cylindered:updateDirtyMovingParts(dt, updateSound) end

--- When the vehicle has several control groups and is active for input, adds an extra HUD text with the current control group name and number.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cylindered:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads every moving part found under the key with its dependent parts, joints, copy-direction parts, extras and animations, and registers it by node. Duplicate nodes are skipped with a warning.
---@param xmlFile any
---@param key any
function Cylindered:loadMovingPartsFromXML(xmlFile, key) end

--- Reads one moving part (reference frame and points, alignment modes, distances, thresholds, smoothing, update distance) into entry. Returns false when the node or frame is missing or when incompatible alignment modes are combined.
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadMovingPartFromXML(xmlFile, key, entry) end

--- Loads every moving tool found under the key with its dependent tools, parts, joints, extras and animations, and registers it by node. Duplicate nodes are skipped with a warning.
---@param xmlFile any
---@param key any
function Cylindered:loadMovingToolsFromXML(xmlFile, key) end

--- Reads one moving tool into entry: speeds (converted from per-second to per-ms), limits, network bit depth, animation, controls, detach locks, required configurations, delayed node and interpolators. Returns false if a min limit is not below its max.
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadMovingToolFromXML(xmlFile, key, entry) end

--- Reads the dependentMovingTool entries of a tool or part: speed scale, requiresMovement, rotation-based limit curve and min/max limit pairs. Only entries with a node and at least one rule are kept.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentMovingTools(xmlFile, baseName, entry) end

--- Reads the dependentPart nodes (and their max update distance, unlimited by default) of an entry; they are resolved to real parts later by resolveDependentPartData.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentParts(xmlFile, baseName, entry) end

--- Links each dependent node to the moving parts or tools registered for it (adding extra entries when several share a node), flags them as dependent and removes unresolved entries.
---@param dependentPartData table
---@param referenceNodes table
function Cylindered:resolveDependentPartData(dependentPartData, referenceNodes) end

--- Server only: reads the component joints to update with a tool or part and stores the offset and orientation of the second component relative to the joint node. Invalid indices raise a warning unless ignoreWarning is set.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentComponentJoints(xmlFile, baseName, entry) end

--- Resolves the listed attacher joint indices of this vehicle into joint entries and reads whether the input attacher joint must be updated as well. Missing indices warn unless ignored.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentAttacherJoints(xmlFile, baseName, entry) end

--- If the vehicle has the Wheels specialization, resolves wheels listed by index or by node name so their shapes follow the part. Unknown wheels produce a warning.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentWheels(xmlFile, baseName, entry) end

--- Reads the translatingPart entries of a moving part with reference points: start position, reference distance, Z limits and whether the distance is shared among parts (divider counted).
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadDependentTranslatingParts(xmlFile, baseName, entry) end

--- Empty extension hook called while loading a tool or part; returns true. Meant to be overridden by other specializations.
---@param xmlFile any
---@param baseName any
---@param entry any
function Cylindered:loadExtraDependentParts(xmlFile, baseName, entry) end

--- Reads the dependentAnimation entries (name, translation or rotation axis, optional translating part, value range converted to radians for rotation, invert flag) of an entry.
---@param xmlFile any
---@param baseName any
---@param entry any
function Cylindered:loadDependentAnimations(xmlFile, baseName, entry) end

--- Reads copyLocalDirectionPart entries whose orientation copies the part's direction and up vector with per-axis scale. Entries missing dirScale or upScale are skipped with a warning.
---@param xmlFile XMLFile
---@param baseName string
---@param entry table
function Cylindered:loadCopyLocalDirectionParts(xmlFile, baseName, entry) end

--- Builds one keyframe (rotation, min/max rotation and translation, normalised to the tool's range if it has one) for a rotation-based limit curve. Returns nil if the rotation or all limits are missing.
---@param xmlFile any
---@param key any
---@param tool any
function Cylindered:loadRotationBasedLimits(xmlFile, key, tool) end

--- Loads the actionSound samples and maps each listed node and SOUND_ACTION_* name to the sample list, attaching it to the matching part, translating part or tool. Unknown actions or nodes warn.
---@param xmlFile any
---@param key any
function Cylindered:loadActionSoundsFromXML(xmlFile, key) end

--- Empty hook used in development builds to check nodes under limited-distance moving parts; the body is empty in this dump.
---@param node any
---@param movingPart any
function Cylindered:checkMovingPartDirtyUpdateNode(node, movingPart) end

--- Call after an outside change (such as an animation) moved a tool node: refreshes cached position, plays sound events, marks the tool dirty, syncs client interpolators and optionally updates parts immediately.
---@param node integer
---@param forceUpdate boolean
---@param dt number
function Cylindered:setMovingToolDirty(node, forceUpdate, dt) end

--- Replaces the reference point of a moving part (nil restores the XML one) and optionally changes its always-dirty state, handling smoothed direction transitions. Updates the part right away and propagates to dependents that share the original reference.
---@param movingPartNode integer
---@param referenceNode integer
---@param isActiveDirty any
function Cylindered:setMovingPartReferenceNode(movingPartNode, referenceNode, isActiveDirty) end

--- Immediately recomputes the moving part registered for the node, including its dependent parts, extras and animations; does nothing if the node is unknown.
---@param movingPartNode any
---@param dt any
function Cylindered:updateMovingPartByNode(movingPartNode, dt) end

--- Full initial pass over tools and parts (wheels, server component joints, extras, animations), placing components unless told otherwise. keepDirty leaves the dirty flags set.
---@param placeComponents boolean
---@param keepDirty any
function Cylindered:updateCylinderedInitial(placeComponents, keepDirty) end

--- Always returns true here; an overridable switch that lets saved moving tool states be loaded and sent to joining clients.
---@param superFunc any
---@return boolean
function Cylindered:allowLoadMovingToolStates(superFunc) end

--- Returns the moving tool registered for the node, or nil.
---@param node any
function Cylindered:getMovingToolByNode(node) end

--- Returns the moving part registered for the node, or nil.
---@param node any
function Cylindered:getMovingPartByNode(node) end

--- Searches all moving parts for a translating part using the node and returns it, or nil.
---@param node any
function Cylindered:getTranslatingPartByNode(node) end

--- Returns true if the tool is enabled and its required configuration is installed.
---@param movingTool any
function Cylindered:getIsMovingToolActive(movingTool) end

--- Returns the part's active flag (changed by object changes).
---@param movingPart any
function Cylindered:getIsMovingPartActive(movingPart) end

--- Returns the tool's total input: player input plus external move (for example from a driving tool).
---@param movingTool any
function Cylindered:getMovingToolMoveValue(movingTool) end

--- Override: returns false when any tool with detach limits sits outside its allowed rotation or translation range; otherwise defers to the parent implementation.
---@param superFunc function
---@return boolean
---@return string?
function Cylindered:isDetachAllowed(superFunc) end

--- Override: after the parent, reads per-state moving tool limits and start values for the node, and a movingPartUpdate toggle that sets the moving part's active flag.
---@param superFunc XMLFile
---@param xmlFile XMLFile
---@param key string
---@param node integer
---@param object table
function Cylindered:loadObjectChangeValuesFromXML(superFunc, xmlFile, key, node, object) end

--- Override: after the parent, applies the active or inactive rotation and translation limits and start values to the tool of the object-change node.
---@param superFunc table
---@param object table
---@param isActive boolean
function Cylindered:setObjectChangeValues(superFunc, object, isActive) end

--- Override: after the parent succeeds, reads an optional movingToolActivation block (node, inversion, open factor and offset) on the discharge node.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadDischargeNode(superFunc, xmlFile, key, entry) end

--- Override: scales the discharge speed by how far the linked moving tool is open (state, inversion, offset and open factor); without activation data the parent value is used.
---@param superFunc any
---@param dischargeNode any
function Cylindered:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

--- Override: after the parent succeeds, reads an optional movingToolActivation block (node, inversion, open factor) for the shovel node.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadShovelNode(superFunc, xmlFile, key, entry) end

--- Override: a shovel node counts as active only if the parent says so and the linked moving tool state is above the open factor (after optional inversion).
---@param superFunc any
---@param shovelNode any
function Cylindered:getShovelNodeIsActive(superFunc, shovelNode) end

--- Override: after the parent succeeds, reads an optional movingToolActivation block for a dynamic mount grab.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function Cylindered:loadDynamicMountGrabFromXML(superFunc, xmlFile, key, entry) end

--- Override: the grab is opened only if the parent says so and the linked moving tool state is above the open factor (after optional inversion).
---@param superFunc any
---@param grab any
function Cylindered:getIsDynamicMountGrabOpened(superFunc, grab) end

--- Override: after the parent, recomputes the stored component offsets of every tool's component joints. Note: it reads the tools' componentJoints list, which is only created on the server, so it is presumably server-only (UNVERIFIED).
---@param superFunc any
---@param jointDesc any
---@param anchorActor any
function Cylindered:setComponentJointFrame(superFunc, jointDesc, anchorActor) end

--- Override: on the client, when active for input and several control groups exist, returns the current group number as schema text.
---@param superFunc any
function Cylindered:getAdditionalSchemaText(superFunc) end

--- Override: adds the work wear multiplier while the hydraulic sound is playing, so moving the arms wears the vehicle.
---@param superFunc any
---@return number
function Cylindered:getWearMultiplier(superFunc) end

--- Override: also true while the power-consuming timer of the moving tools is still running.
---@param superFunc any
---@return boolean
function Cylindered:getDoConsumePtoPower(superFunc) end

--- Override: adds one consumer to the load sum, weighted by the remaining power-consuming timer relative to its delay.
---@param superFunc any
function Cylindered:getConsumingLoad(superFunc) end

--- Client side: registers an axis action for each controllable tool of the selected control group, powered or plain, depending on easy arm control and on whether the tool is an easy control target.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Cylindered:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- After the vehicle is attached, clamps each tool's translation and rotation to its attach limits if they are set, and marks changed tools dirty.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Cylindered:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Sets the current control group from the selected sub-selection index (0 if it has no mapped group).
---@param subSelectionIndex any
function Cylindered:onSelect(subSelectionIndex) end

--- Resets the current control group to 0.
function Cylindered:onUnselect() end

--- On clients, stops the hydraulic sound and zeroes every tool's input and external move.
function Cylindered:onDeactivate() end

--- Reacts to an animation changing a node by calling setMovingToolDirty for it.
---@param node any
function Cylindered:onAnimationPartChanged(node) end

--- When the AI starts working, sets each tool that has an aiActivePosition to move toward that position (target and direction).
function Cylindered:onAIImplementStart() end

--- Reacts to the EASY_ARM_CONTROL setting by calling setIsEasyControlActive with the new state.
---@param gameSettingId any
---@param state any
function Cylindered:onVehicleSettingChanged(gameSettingId, state) end

--- Registers the animation value type "movingPartReferencePoint", which slides a moving part's reference point between a start and an end node as the animation plays, via a helper transform group.
function Cylindered:onRegisterAnimationValueTypes() end

--- Moves the tool along its translation axis by speed times dt or by a delta, clamped to its limits. Updates sounds, raises onMovingToolChanged and returns true if the move exceeded 0.0001. Called with a plain dot, passing the vehicle first.
---@param self table
---@param tool table
---@param transSpeed number
---@param dt number
---@param delta any
---@return boolean
function Cylindered.setToolTranslation(self, tool, transSpeed, dt, delta) end

--- Moves the tool to an absolute translation; if it changed, marks it dirty and raises network dirty flags.
---@param self table
---@param tool table
---@param translation number
function Cylindered.setAbsoluteToolTranslation(self, tool, translation) end

--- Rotates the tool on its rotation axis by speed times dt or by a delta, clamped to its limits (wrapped to 0..2 pi when unlimited). Updates sounds, raises onMovingToolChanged and returns true if the change exceeded 0.0001.
---@param self table
---@param tool table
---@param rotSpeed number
---@param dt number
---@param delta number
---@return boolean
function Cylindered.setToolRotation(self, tool, rotSpeed, dt, delta) end

--- Rotates the tool to an absolute angle; if it changed, marks it dirty, optionally updates the delayed node and raises network dirty flags.
---@param self table
---@param tool table
---@param rotation number
---@param updateDelayedNodes boolean
function Cylindered.setAbsoluteToolRotation(self, tool, rotation, updateDelayedNodes) end

--- Advances the tool's animation time by speed times dt within its min/max, detecting external changes for network reset. Updates sounds, raises onMovingToolChanged and returns true on change.
---@param self table
---@param tool table
---@param animSpeed number
---@param dt number
---@return boolean
function Cylindered.setToolAnimation(self, tool, animSpeed, dt) end

--- Returns the tool's position as a 0..1 fraction of its rotation or translation range, the raw value if unlimited, or the animation time for animation tools.
---@param self table
---@param tool table
---@return number
function Cylindered.getMovingToolState(self, tool) end

--- Marks a part or tool dirty (once, or always while loading), propagates to dependent parts within their update distance, updates attacher joints and wheels for tools and applies delayed data.
---@param self table
---@param part table
function Cylindered.setDirty(self, part) end

--- Refreshes the physics shape position of the wheels linked to a part, and their wheel chocks.
---@param self table
---@param part table
function Cylindered.updateWheels(self, part) end

--- Core solver for a moving part: finds the direction (reference point, circle intersections, line alignments, world Y, rotation copy), applies it with thresholds and smoothing, moves translating parts, copies directions, updates joints and wheels on the server and recurses into dependents.
---@param self table
---@param part table
---@param placeComponents boolean?
---@param updateDependentParts boolean?
---@param isActive boolean?
---@param updateSounds any
function Cylindered.updateMovingPart(self, part, placeComponents, updateDependentParts, isActive, updateSounds) end

--- Server only: for each joint of the entry, optionally repositions the second component against the joint node, then refreshes the joint frame through setComponentJointFrame.
---@param self table
---@param entry table
---@param placeComponents boolean
function Cylindered.updateComponentJoints(self, entry, placeComponents) end

--- Server only: re-applies the joint frames of the listed attacher joints and, if requested, recomputes the input attacher joint frame of the vehicle attached to a parent, using the joint offsets.
---@param self table
---@param entry table
function Cylindered.updateAttacherJoints(self, entry) end

--- Interpolation function for rotation-based limit curves, mixing rotMin, rotMax, transMin and transMax of two keyframes. Note: the transMin branch reads first.minTrans, a field never set (keyframes use transMin), which would raise an arithmetic error on nil if reached.
---@param first any
---@param second any
---@param alpha any
function Cylindered.limitInterpolator(first, second, alpha) end

--- Evaluates the rotation-based limit curve from the driving tool's state or node rotation and applies min/max to the dependent tool. Server clamps and syncs; client only updates interpolator limits.
---@param self any
---@param tool any
---@param dependentTool any
function Cylindered.updateRotationBasedLimits(self, tool, dependentTool) end

--- Input callback for a tool axis: applies inversion, the arm sensitivity setting and mouse scaling, arbitrates between simultaneous mouse axes (including attached implements) and sets tool.move; flags the input dirty flag so the value is sent to the server.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function Cylindered.actionEventInput(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Dashboard value callback: finds the vehicle (self or the implement on the configured attacher joints) and returns the smoothed input of the moving tool matching the dashboard axis, mapped to 0..1; 0.5 when idle or not found.
---@param self any
---@param dashboard any
function Cylindered.getMovingToolDashboardState(self, dashboard) end

--- Reads the dashboard XML attributes axis (required), attacherJointIndex, attacherJointNode and attacherJointNodes. Returns false with a warning when the axis is missing.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param components any
---@param i3dMappings any
function Cylindered.movingToolDashboardAttributes(self, xmlFile, key, dashboard, components, i3dMappings) end
