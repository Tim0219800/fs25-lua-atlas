# vehicles/specializations/Cylindered.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Cylindered.md)*

Source: `dataS/scripts/vehicles/specializations/Cylindered.lua` — FS25 1.25.1.0

✍ Vehicle specialization that animates articulated parts of a machine: moving tools (player-controlled axes such as loader arms, driven by rotation, translation or an animation) and moving parts (passive nodes that aim at a reference point, such as hydraulic cylinders). Requires VehicleSettings and also talks to AnimatedVehicle, Wheels, AttacherJoints, Dischargeable, Shovel and DynamicMountAttacher. It runs input and limits on the server, interpolates on clients, syncs tool positions over the network and saves them in the savegame. It also provides the optional easy arm control (a two-segment inverse kinematics scheme), control groups, hydraulic and action sounds, and dashboard values. Constants such as MOVING_TOOLS_XML_KEYS, the SOUND_ACTION_* and SOUND_TYPE_* values are not visible in this dump (UNVERIFIED).

- **Cylindered** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Cylindered.prerequisitesPresent(specializations: table) → boolean` | 57 | ✍ Returns true only if the vehicle type includes the VehicleSettings specialization; Cylindered cannot be added without it. |
| `Cylindered.initSpecialization()` | 63 | ✍ Registers the "cylindered" shop configuration type and declares all vehicle XML paths (moving tools, moving parts, easy arm control, control groups, dashboards, object-change extensions, discharge, shovel and dynamic-mount activation) plus the savegame keys for tool translation, rotation and animation time. |
| `Cylindered.registerSoundXMLPaths(schema: any, baseKey: any)` | 153 | ✍ Declares the XML paths of the hydraulic sample and of the action sounds (action names, trigger nodes, pitch drop-off factor and time) under the given base key. |
| `Cylindered.registerEasyArmControlXMLPaths(schema: any, key: any)` | 165 | ✍ Declares the XML attributes of the easy arm control block: root, target and reference nodes, target speed and acceleration, the translation/rotation move ratio settings, and the Z translation and X rotation nodes. |
| `Cylindered.registerMovingToolXMLPaths(schema: any, toolKey: any)` | 186 | ✍ Declares every XML attribute of one moving tool: rotation, translation and animation limits and speeds, controls (axis, icon, group), power use, attach and detach limits, required configurations, dependent parts, wheels, attacher joints, fill and fold limits. Also chains the dependent joint, animation and tool registrations. |
| `Cylindered.registerMovingPartXMLPaths(schema: any, partKey: any)` | 269 | ✍ Declares every XML attribute of one moving part: node, reference frame and points, alignment modes (direction, line, 3D line, rotation, world Y), distance and threshold settings, smoothing, update distance, translating parts and dependent elements. |
| `Cylindered.registerDependentComponentJointXMLPaths(schema: any, basePath: any)` | 343 | ✍ Declares the XML paths for component joints that must follow a moving tool or part: joint index, ignore-warning flag and anchor actor. |
| `Cylindered.registerCopyLocalDirectionXMLPaths(schema: any, basePath: any)` | 351 | ✍ Declares the XML paths of copyLocalDirectionPart entries (node, direction scale, up-vector scale) and their optional component joints. |
| `Cylindered.registerDependentAnimationXMLPaths(schema: any, basePath: any)` | 361 | ✍ Declares the XML paths of dependent animations driven by a part's axis value: animation name, axis, translating part index, value range and inversion. |
| `Cylindered.registerDependentMovingToolXMLPaths(schema: any, basePath: any)` | 373 | ✍ Declares the XML paths of dependent moving tools: node, axis, speed scale, requiresMovement, rotation-based limit keyframes and min/max translation or rotation limit pairs. |
| `Cylindered.registerEvents(vehicleType: any)` | 391 | ✍ Registers the vehicle event onMovingToolChanged, raised with the tool, the speed and dt whenever a moving tool actually moves. |
| `Cylindered.registerFunctions(vehicleType: any)` | 397 | ✍ Registers the specialization's public vehicle functions (loading helpers, dirty updates, node lookups, active-state getters, easy control, dependent updates, sound events, control groups) on the vehicle type. |
| `Cylindered.registerOverwrittenFunctions(vehicleType: any)` | 443 | ✍ Overrides existing vehicle functions: detach permission, object-change loading and applying, discharge-node, shovel and dynamic-mount hooks, component joint frame, schema text, wear multiplier, PTO power use and consuming load. |
| `Cylindered.registerEventListeners(vehicleType: any)` | 462 | ✍ Subscribes the specialization to the vehicle lifecycle, network, update, draw, input, attach, selection, AI, setting and animation-value events it needs. |
| `Cylindered:onLoad(savegame: table)` | 492 | ✍ Builds the whole articulated setup from the vehicle XML (base and configuration keys): moving parts and tools, dependent links, control groups with sub-selections, easy arm control, dashboard value, sounds, dirty flags and the EASY_ARM_CONTROL vehicle setting. Warns on invalid entries and drops dependent tools that are not defined. |
| `Cylindered:onPostLoad(savegame: table)` | 703 | ✍ Applies start positions, loads attacher-joint and wheel dependencies, restores saved tool positions clamped to their limits (unless the savegame resets vehicles), then runs the initial update. Removes event listeners that the vehicle does not need (no tools, no parts, not a client). |
| `Cylindered:onLoadFinished(savegame: table)` | 876 | ✍ Ends the loading phase and flushes the delayed-node history of tools that have pending delayed data. |
| `Cylindered:onRegisterDashboardValueTypes()` | 890 | ✍ Registers the cylindered/movingTool dashboard value (range 0 to 1, idle 0.5) fed by getMovingToolDashboardState. |
| `Cylindered:onDelete()` | 901 | ✍ Releases the hydraulic and action sound samples and deletes the axis icons of the moving tools. |
| `Cylindered:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 919 | ✍ Writes the current translation, rotation and animation time of every saveable moving tool into the savegame, indexed in order of saveable tools only. |
| `Cylindered:onReadStream(streamId: integer, connection: Connection)` | 946 | ✍ Client side, on join: if the server flagged states as loadable, reads each tool's absolute translation, rotation and animation time, resets interpolators, applies them and raises onMovingToolChanged. |
| `Cylindered:onWriteStream(streamId: integer, connection: Connection)` | 989 | ✍ Server side, on join: writes a flag (allowLoadMovingToolStates) and then each networked tool's absolute translation, rotation and animation time for the joining client. |
| `Cylindered:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1018 | ✍ Server reads the 12-bit input value of each controllable tool sent by a client. Client reads the compressed rotation, translation and animation targets (and synced rotation limits) and feeds the network interpolators. |
| `Cylindered:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1091 | ✍ Client sends its current input values (12-bit, only when the input dirty flag is set). Server sends the compressed state of every tool whose dirty flag is set and that is active. |
| `Cylindered:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1149 | ✍ Per-frame update. Server: converts input (or AI target) into accelerated rotation, translation and animation motion, drives dependent tools and limits, raises dirty flags and power-consumption timing. Client: interpolates toward the last network state. Also advances delayed nodes and the power timer. |
| `Cylindered:setDelayedData(tool: any, immediate: any)` | 1375 | ✍ Stores the tool node's current rotation and translation as the newest entry of its delayed-frames history (optionally filling the whole history at once). |
| `Cylindered:updateDelayedTool(tool: any, forceLastPosition: any)` | 1391 | ✍ Shifts the delayed history by one frame and applies the oldest stored pose to the tool's delayedNode, marking a matching moving part or tool dirty. Can first force every entry to the latest pose. |
| `Cylindered:loadEasyArmControlFromXML(xmlFile: any, key: any, easyArmControl: any)` | 1425 | ✍ Reads and validates the easy arm control block: two target tools, optional Z translation nodes and exactly two X rotation nodes, with position checks. Computes the maximum reach if not given. Returns false with an XML warning or error when the setup is invalid. |
| `Cylindered:updateEasyControl(dt: any, updateDelayedNodes: any)` | 1570 | ✍ While easy control is on and the player moves the Y or Z target, moves a reference point within reach and solves the two-segment arm (circle intersection plus law of cosines), driving the Z translation and X rotation tools within their limits. Server only for the movement. |
| `Cylindered:setIsEasyControlActive(state: any)` | 1756 | ✍ Switches easy arm control on or off. On the server, enabling it first snaps the Y and Z target tools to the reference node and syncs. Requests an action-event refresh on all sides. |
| `Cylindered:setEasyControlForcedTransMove(value: any)` | 1802 | ✍ Sets a one-shot forced move factor for the easy control translation nodes, consumed at the next easy control update; ignored without easy arm control. |
| `Cylindered:updateExtraDependentParts(part: any, dt: any)` | 1812 | ✍ Empty extension hook called after a tool or part updates, so other specializations can override it to update extra dependent content. |
| `Cylindered:updateDependentAnimations(part: any, dt: any)` | 1817 | ✍ Maps the part's current translation or rotation on its axis to a normalised 0..1 value (optionally inverted) and sets each dependent animation to that time. |
| `Cylindered:updateDependentToolLimits(tool: any, dependentTool: any)` | 1844 | ✍ Interpolates the min/max translation or rotation limits of a dependent tool from the driving tool's state, then re-clamps the dependent tool and marks it dirty if it moved. |
| `Cylindered:onMovingPartSoundEvent(part: any, action: any, type: any)` | 1879 | ✍ Triggers the action samples registered for a part and action: one-shot, continuous, ending or starting types, using timestamps so ending and starting sounds are debounced. Client-side sound handling. |
| `Cylindered:updateMovingToolSoundEvents(tool: any, direction: any, hitLimit: any, wasAtLimit: any)` | 1940 | ✍ Translates a tool movement (direction, limit reached, left a limit) into the matching start, end, positive and negative sound action events for the tool. |
| `Cylindered:updateControlGroups()` | 1975 | ✍ Rebuilds the sub-selections from control groups that still have an active controllable tool, refreshes the root vehicle's selectable objects and reselects this vehicle if it was selected. |
| `Cylindered:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2009 | ✍ Client side: enables or disables each tool's input action depending on whether the tool is active, resets stuck input, refreshes control groups on state change and times out active, ending and starting action samples. |
| `Cylindered:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2086 | ✍ Forces all always-dirty moving parts to update regardless of camera distance just before the vehicle goes to sleep, then flushes dirty parts. |
| `Cylindered:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2099 | ✍ Marks always-dirty moving parts dirty when the vehicle is within their max update distance, then updates dirty parts and the hydraulic sound. |
| `Cylindered:onPostUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2112 | ✍ Updates parts set dirty during the update tick, without the sound step, so they are not one frame late. |
| `Cylindered:updateDirtyMovingParts(dt: any, updateSound: any)` | 2119 | ✍ Processes dirty tools (wheels, server component joints, extra and animation dependents) and dirty moving parts, then starts or stops the hydraulic sample on clients when updateSound is true. |
| `Cylindered:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2182 | ✍ When the vehicle has several control groups and is active for input, adds an extra HUD text with the current control group name and number. |
| `Cylindered:loadMovingPartsFromXML(xmlFile: any, key: any)` | 2195 | ✍ Loads every moving part found under the key with its dependent parts, joints, copy-direction parts, extras and animations, and registers it by node. Duplicate nodes are skipped with a warning. |
| `Cylindered:loadMovingPartFromXML(xmlFile: any, key: any, entry: any)` | 2230 | ✍ Reads one moving part (reference frame and points, alignment modes, distances, thresholds, smoothing, update distance) into entry. Returns false when the node or frame is missing or when incompatible alignment modes are combined. |
| `Cylindered:loadMovingToolsFromXML(xmlFile: any, key: any)` | 2425 | ✍ Loads every moving tool found under the key with its dependent tools, parts, joints, extras and animations, and registers it by node. Duplicate nodes are skipped with a warning. |
| `Cylindered:loadMovingToolFromXML(xmlFile: any, key: any, entry: any)` | 2457 | ✍ Reads one moving tool into entry: speeds (converted from per-second to per-ms), limits, network bit depth, animation, controls, detach locks, required configurations, delayed node and interpolators. Returns false if a min limit is not below its max. |
| `Cylindered:loadDependentMovingTools(xmlFile: XMLFile, baseName: string, entry: table)` | 2703 | ✍ Reads the dependentMovingTool entries of a tool or part: speed scale, requiresMovement, rotation-based limit curve and min/max limit pairs. Only entries with a node and at least one rule are kept. |
| `Cylindered:loadDependentParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2768 | ✍ Reads the dependentPart nodes (and their max update distance, unlimited by default) of an entry; they are resolved to real parts later by resolveDependentPartData. |
| `Cylindered:resolveDependentPartData(dependentPartData: table, referenceNodes: table)` | 2795 | ✍ Links each dependent node to the moving parts or tools registered for it (adding extra entries when several share a node), flags them as dependent and removes unresolved entries. |
| `Cylindered:loadDependentComponentJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2831 | ✍ Server only: reads the component joints to update with a tool or part and stores the offset and orientation of the second component relative to the joint node. Invalid indices raise a warning unless ignoreWarning is set. |
| `Cylindered:loadDependentAttacherJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2882 | ✍ Resolves the listed attacher joint indices of this vehicle into joint entries and reads whether the input attacher joint must be updated as well. Missing indices warn unless ignored. |
| `Cylindered:loadDependentWheels(xmlFile: XMLFile, baseName: string, entry: table)` | 2916 | ✍ If the vehicle has the Wheels specialization, resolves wheels listed by index or by node name so their shapes follow the part. Unknown wheels produce a warning. |
| `Cylindered:loadDependentTranslatingParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2952 | ✍ Reads the translatingPart entries of a moving part with reference points: start position, reference distance, Z limits and whether the distance is shared among parts (divider counted). |
| `Cylindered:loadExtraDependentParts(xmlFile: any, baseName: any, entry: any)` | 3011 | ✍ Empty extension hook called while loading a tool or part; returns true. Meant to be overridden by other specializations. |
| `Cylindered:loadDependentAnimations(xmlFile: any, baseName: any, entry: any)` | 3017 | ✍ Reads the dependentAnimation entries (name, translation or rotation axis, optional translating part, value range converted to radians for rotation, invert flag) of an entry. |
| `Cylindered:loadCopyLocalDirectionParts(xmlFile: XMLFile, baseName: string, entry: table)` | 3065 | ✍ Reads copyLocalDirectionPart entries whose orientation copies the part's direction and up vector with per-axis scale. Entries missing dirScale or upScale are skipped with a warning. |
| `Cylindered:loadRotationBasedLimits(xmlFile: any, key: any, tool: any)` | 3097 | ✍ Builds one keyframe (rotation, min/max rotation and translation, normalised to the tool's range if it has one) for a rotation-based limit curve. Returns nil if the rotation or all limits are missing. |
| `Cylindered:loadActionSoundsFromXML(xmlFile: any, key: any)` | 3119 | ✍ Loads the actionSound samples and maps each listed node and SOUND_ACTION_* name to the sample list, attaching it to the matching part, translating part or tool. Unknown actions or nodes warn. |
| `Cylindered:checkMovingPartDirtyUpdateNode(node: any, movingPart: any)` | 3189 | ✍ Empty hook used in development builds to check nodes under limited-distance moving parts; the body is empty in this dump. |
| `Cylindered:setMovingToolDirty(node: integer, forceUpdate: boolean, dt: number)` | 3197 | ✍ Call after an outside change (such as an animation) moved a tool node: refreshes cached position, plays sound events, marks the tool dirty, syncs client interpolators and optionally updates parts immediately. |
| `Cylindered:setMovingPartReferenceNode(movingPartNode: integer, referenceNode: integer, isActiveDirty: any)` | 3242 | ✍ Replaces the reference point of a moving part (nil restores the XML one) and optionally changes its always-dirty state, handling smoothed direction transitions. Updates the part right away and propagates to dependents that share the original reference. |
| `Cylindered:updateMovingPartByNode(movingPartNode: any, dt: any)` | 3303 | ✍ Immediately recomputes the moving part registered for the node, including its dependent parts, extras and animations; does nothing if the node is unknown. |
| `Cylindered:updateCylinderedInitial(placeComponents: boolean, keepDirty: any)` | 3316 | ✍ Full initial pass over tools and parts (wheels, server component joints, extras, animations), placing components unless told otherwise. keepDirty leaves the dirty flags set. |
| `Cylindered:allowLoadMovingToolStates(superFunc: any) → boolean` | 3362 | ✍ Always returns true here; an overridable switch that lets saved moving tool states be loaded and sent to joining clients. |
| `Cylindered:getMovingToolByNode(node: any)` | 3368 | ✍ Returns the moving tool registered for the node, or nil. |
| `Cylindered:getMovingPartByNode(node: any)` | 3374 | ✍ Returns the moving part registered for the node, or nil. |
| `Cylindered:getTranslatingPartByNode(node: any)` | 3380 | ✍ Searches all moving parts for a translating part using the node and returns it, or nil. |
| `Cylindered:getIsMovingToolActive(movingTool: any)` | 3398 | ✍ Returns true if the tool is enabled and its required configuration is installed. |
| `Cylindered:getIsMovingPartActive(movingPart: any)` | 3404 | ✍ Returns the part's active flag (changed by object changes). |
| `Cylindered:getMovingToolMoveValue(movingTool: any)` | 3410 | ✍ Returns the tool's total input: player input plus external move (for example from a driving tool). |
| `Cylindered:isDetachAllowed(superFunc: function) → boolean, string?` | 3419 | ✍ Override: returns false when any tool with detach limits sits outside its allowed rotation or translation range; otherwise defers to the parent implementation. |
| `Cylindered:loadObjectChangeValuesFromXML(superFunc: XMLFile, xmlFile: XMLFile, key: string, node: integer, object: table)` | 3452 | ✍ Override: after the parent, reads per-state moving tool limits and start values for the node, and a movingPartUpdate toggle that sets the moving part's active flag. |
| `Cylindered:setObjectChangeValues(superFunc: table, object: table, isActive: boolean)` | 3491 | ✍ Override: after the parent, applies the active or inactive rotation and translation limits and start values to the tool of the object-change node. |
| `Cylindered:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3520 | ✍ Override: after the parent succeeds, reads an optional movingToolActivation block (node, inversion, open factor and offset) on the discharge node. |
| `Cylindered:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 3541 | ✍ Override: scales the discharge speed by how far the linked moving tool is open (state, inversion, offset and open factor); without activation data the parent value is used. |
| `Cylindered:loadShovelNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3565 | ✍ Override: after the parent succeeds, reads an optional movingToolActivation block (node, inversion, open factor) for the shovel node. |
| `Cylindered:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 3585 | ✍ Override: a shovel node counts as active only if the parent says so and the linked moving tool state is above the open factor (after optional inversion). |
| `Cylindered:loadDynamicMountGrabFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 3605 | ✍ Override: after the parent succeeds, reads an optional movingToolActivation block for a dynamic mount grab. |
| `Cylindered:getIsDynamicMountGrabOpened(superFunc: any, grab: any)` | 3625 | ✍ Override: the grab is opened only if the parent says so and the linked moving tool state is above the open factor (after optional inversion). |
| `Cylindered:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 3645 | ✍ Override: after the parent, recomputes the stored component offsets of every tool's component joints. Note: it reads the tools' componentJoints list, which is only created on the server, so it is presumably server-only (UNVERIFIED). |
| `Cylindered:getAdditionalSchemaText(superFunc: any)` | 3669 | ✍ Override: on the client, when active for input and several control groups exist, returns the current group number as schema text. |
| `Cylindered:getWearMultiplier(superFunc: any) → number` | 3686 | ✍ Override: adds the work wear multiplier while the hydraulic sound is playing, so moving the arms wears the vehicle. |
| `Cylindered:getDoConsumePtoPower(superFunc: any) → boolean` | 3700 | ✍ Override: also true while the power-consuming timer of the moving tools is still running. |
| `Cylindered:getConsumingLoad(superFunc: any)` | 3706 | ✍ Override: adds one consumer to the load sum, weighted by the remaining power-consuming timer relative to its delay. |
| `Cylindered:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3716 | ✍ Client side: registers an axis action for each controllable tool of the selected control group, powered or plain, depending on easy arm control and on whether the tool is an easy control target. |
| `Cylindered:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 3749 | ✍ After the vehicle is attached, clamps each tool's translation and rotation to its attach limits if they are set, and marks changed tools dirty. |
| `Cylindered:onSelect(subSelectionIndex: any)` | 3796 | ✍ Sets the current control group from the selected sub-selection index (0 if it has no mapped group). |
| `Cylindered:onUnselect()` | 3808 | ✍ Resets the current control group to 0. |
| `Cylindered:onDeactivate()` | 3815 | ✍ On clients, stops the hydraulic sound and zeroes every tool's input and external move. |
| `Cylindered:onAnimationPartChanged(node: any)` | 3831 | ✍ Reacts to an animation changing a node by calling setMovingToolDirty for it. |
| `Cylindered:onAIImplementStart()` | 3837 | ✍ When the AI starts working, sets each tool that has an aiActivePosition to move toward that position (target and direction). |
| `Cylindered:onVehicleSettingChanged(gameSettingId: any, state: any)` | 3849 | ✍ Reacts to the EASY_ARM_CONTROL setting by calling setIsEasyControlActive with the new state. |
| `Cylindered:onRegisterAnimationValueTypes()` | 3857 | ✍ Registers the animation value type "movingPartReferencePoint", which slides a moving part's reference point between a start and an end node as the animation plays, via a helper transform group. |
| `Cylindered.setToolTranslation(self: table, tool: table, transSpeed: number, dt: number, delta: any) → boolean` | 3919 | ✍ Moves the tool along its translation axis by speed times dt or by a delta, clamped to its limits. Updates sounds, raises onMovingToolChanged and returns true if the move exceeded 0.0001. Called with a plain dot, passing the vehicle first. |
| `Cylindered.setAbsoluteToolTranslation(self: table, tool: table, translation: number)` | 3960 | ✍ Moves the tool to an absolute translation; if it changed, marks it dirty and raises network dirty flags. |
| `Cylindered.setToolRotation(self: table, tool: table, rotSpeed: number, dt: number, delta: number) → boolean` | 3978 | ✍ Rotates the tool on its rotation axis by speed times dt or by a delta, clamped to its limits (wrapped to 0..2 pi when unlimited). Updates sounds, raises onMovingToolChanged and returns true if the change exceeded 0.0001. |
| `Cylindered.setAbsoluteToolRotation(self: table, tool: table, rotation: number, updateDelayedNodes: boolean)` | 4032 | ✍ Rotates the tool to an absolute angle; if it changed, marks it dirty, optionally updates the delayed node and raises network dirty flags. |
| `Cylindered.setToolAnimation(self: table, tool: table, animSpeed: number, dt: number) → boolean` | 4053 | ✍ Advances the tool's animation time by speed times dt within its min/max, detecting external changes for network reset. Updates sounds, raises onMovingToolChanged and returns true on change. |
| `Cylindered.getMovingToolState(self: table, tool: table) → number` | 4091 | ✍ Returns the tool's position as a 0..1 fraction of its rotation or translation range, the raw value if unlimited, or the animation time for animation tools. |
| `Cylindered.setDirty(self: table, part: table)` | 4111 | ✍ Marks a part or tool dirty (once, or always while loading), propagates to dependent parts within their update distance, updates attacher joints and wheels for tools and applies delayed data. |
| `Cylindered.updateWheels(self: table, part: table)` | 4138 | ✍ Refreshes the physics shape position of the wheels linked to a part, and their wheel chocks. |
| `Cylindered.updateMovingPart(self: table, part: table, placeComponents: boolean?, updateDependentParts: boolean?, isActive: boolean?, updateSounds: any)` | 4156 | ✍ Core solver for a moving part: finds the direction (reference point, circle intersections, line alignments, world Y, rotation copy), applies it with thresholds and smoothing, moves translating parts, copies directions, updates joints and wheels on the server and recurses into dependents. |
| `Cylindered.updateComponentJoints(self: table, entry: table, placeComponents: boolean)` | 4675 | ✍ Server only: for each joint of the entry, optionally repositions the second component against the joint node, then refreshes the joint frame through setComponentJointFrame. |
| `Cylindered.updateAttacherJoints(self: table, entry: table)` | 4704 | ✍ Server only: re-applies the joint frames of the listed attacher joints and, if requested, recomputes the input attacher joint frame of the vehicle attached to a parent, using the joint offsets. |
| `Cylindered.limitInterpolator(first: any, second: any, alpha: any)` | 4758 | ✍ Interpolation function for rotation-based limit curves, mixing rotMin, rotMax, transMin and transMax of two keyframes. Note: the transMin branch reads first.minTrans, a field never set (keyframes use transMin), which would raise an arithmetic error on nil if reached. |
| `Cylindered.updateRotationBasedLimits(self: any, tool: any, dependentTool: any)` | 4784 | ✍ Evaluates the rotation-based limit curve from the driving tool's state or node rotation and applies min/max to the dependent tool. Server clamps and syncs; client only updates interpolator limits. |
| `Cylindered.actionEventInput(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 4836 | ✍ Input callback for a tool axis: applies inversion, the arm sensitivity setting and mouse scaling, arbitrates between simultaneous mouse axes (including attached implements) and sets tool.move; flags the input dirty flag so the value is sent to the server. |
| `Cylindered.getMovingToolDashboardState(self: any, dashboard: any)` | 4915 | ✍ Dashboard value callback: finds the vehicle (self or the implement on the configured attacher joints) and returns the smoothed input of the moving tool matching the dashboard axis, mapped to 0..1; 0.5 when idle or not found. |
| `Cylindered.movingToolDashboardAttributes(self: any, xmlFile: any, key: any, dashboard: any, components: any, i3dMappings: any)` | 4971 | ✍ Reads the dashboard XML attributes axis (required), attacherJointIndex, attacherJointNode and attacherJointNodes. Returns false with a warning when the axis is missing. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onMovingToolChanged` | 392 |
| registerFunction | `loadMovingPartsFromXML` | 398 |
| registerFunction | `loadMovingPartFromXML` | 399 |
| registerFunction | `loadMovingToolsFromXML` | 400 |
| registerFunction | `loadMovingToolFromXML` | 401 |
| registerFunction | `loadDependentMovingTools` | 402 |
| registerFunction | `loadEasyArmControlFromXML` | 403 |
| registerFunction | `loadDependentParts` | 404 |
| registerFunction | `resolveDependentPartData` | 405 |
| registerFunction | `loadDependentComponentJoints` | 406 |
| registerFunction | `loadDependentAttacherJoints` | 407 |
| registerFunction | `loadDependentWheels` | 408 |
| registerFunction | `loadDependentTranslatingParts` | 409 |
| registerFunction | `loadExtraDependentParts` | 410 |
| registerFunction | `loadDependentAnimations` | 411 |
| registerFunction | `loadCopyLocalDirectionParts` | 412 |
| registerFunction | `loadRotationBasedLimits` | 413 |
| registerFunction | `loadActionSoundsFromXML` | 414 |
| registerFunction | `checkMovingPartDirtyUpdateNode` | 415 |
| registerFunction | `updateDirtyMovingParts` | 416 |
| registerFunction | `setMovingToolDirty` | 417 |
| registerFunction | `setMovingPartReferenceNode` | 418 |
| registerFunction | `updateMovingPartByNode` | 419 |
| registerFunction | `updateCylinderedInitial` | 420 |
| registerFunction | `allowLoadMovingToolStates` | 421 |
| registerFunction | `getMovingToolByNode` | 422 |
| registerFunction | `getMovingPartByNode` | 423 |
| registerFunction | `getTranslatingPartByNode` | 424 |
| registerFunction | `getIsMovingToolActive` | 425 |
| registerFunction | `getIsMovingPartActive` | 426 |
| registerFunction | `getMovingToolMoveValue` | 427 |
| registerFunction | `setDelayedData` | 428 |
| registerFunction | `updateDelayedTool` | 429 |
| registerFunction | `updateEasyControl` | 430 |
| registerFunction | `setIsEasyControlActive` | 431 |
| registerFunction | `setEasyControlForcedTransMove` | 432 |
| registerFunction | `updateExtraDependentParts` | 433 |
| registerFunction | `updateDependentAnimations` | 434 |
| registerFunction | `updateDependentToolLimits` | 435 |
| registerFunction | `onMovingPartSoundEvent` | 436 |
| registerFunction | `updateMovingToolSoundEvents` | 437 |
| registerFunction | `updateControlGroups` | 438 |
| registerOverwrittenFunction | `isDetachAllowed` | 444 |
| registerOverwrittenFunction | `loadObjectChangeValuesFromXML` | 445 |
| registerOverwrittenFunction | `setObjectChangeValues` | 446 |
| registerOverwrittenFunction | `loadDischargeNode` | 447 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 448 |
| registerOverwrittenFunction | `loadShovelNode` | 449 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 450 |
| registerOverwrittenFunction | `loadDynamicMountGrabFromXML` | 451 |
| registerOverwrittenFunction | `getIsDynamicMountGrabOpened` | 452 |
| registerOverwrittenFunction | `setComponentJointFrame` | 453 |
| registerOverwrittenFunction | `getAdditionalSchemaText` | 454 |
| registerOverwrittenFunction | `getWearMultiplier` | 455 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 456 |
| registerOverwrittenFunction | `getConsumingLoad` | 457 |
| registerEventListener | `onLoad` | 463 |
| registerEventListener | `onPostLoad` | 464 |
| registerEventListener | `onLoadFinished` | 465 |
| registerEventListener | `onRegisterDashboardValueTypes` | 466 |
| registerEventListener | `onDelete` | 467 |
| registerEventListener | `onReadStream` | 468 |
| registerEventListener | `onWriteStream` | 469 |
| registerEventListener | `onReadUpdateStream` | 470 |
| registerEventListener | `onWriteUpdateStream` | 471 |
| registerEventListener | `onUpdate` | 472 |
| registerEventListener | `onUpdateTick` | 473 |
| registerEventListener | `onUpdateEnd` | 474 |
| registerEventListener | `onPostUpdate` | 475 |
| registerEventListener | `onPostUpdateTick` | 476 |
| registerEventListener | `onDraw` | 477 |
| registerEventListener | `onRegisterActionEvents` | 478 |
| registerEventListener | `onPostAttach` | 479 |
| registerEventListener | `onSelect` | 480 |
| registerEventListener | `onUnselect` | 481 |
| registerEventListener | `onDeactivate` | 482 |
| registerEventListener | `onAnimationPartChanged` | 483 |
| registerEventListener | `onAIImplementStart` | 484 |
| registerEventListener | `onVehicleSettingChanged` | 485 |
| registerEventListener | `onRegisterAnimationValueTypes` | 486 |
