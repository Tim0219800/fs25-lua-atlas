---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIDrivable.lua (generated stub, FS25 Lua Atlas)

--- Specialization that makes a drivable vehicle usable by AI helpers: it holds the navigation agent (size, brake and centripetal limits, turning radius, attached trailers) and drives it toward a target each frame on the server. It requires AIVehicle, AIJobVehicle and Drivable, loads the optional vehicle.ai.agent XML node (also overridable per configuration) and raises the events onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive and onAIDriveableEnd. The navigation agent is created through engine functions such as createVehicleNavigationAgent, whose behaviour is UNVERIFIED here.
---@class AIDrivable
AIDrivable = {}

--- Returns true only if the vehicle type has AIVehicle, AIJobVehicle and Drivable.
---@param specializations table
---@return boolean
function AIDrivable.prerequisitesPresent(specializations) end

--- Registers the vehicle.ai.agent XML paths in the vehicle schema.
function AIDrivable.initSpecialization() end

--- After all configurations are known, registers the aiAgent XML paths under every vehicle configuration key, using a shared registration so each configuration option can override agent values.
function AIDrivable.postInitSpecialization() end

--- Registers the agent attributes under a base path: width, length, lengthOffset, height, frontOffset, front wheel indices or nodes, maxBrakeAcceleration, maxCentripetalAcceleration and maxTurningRadius.
---@param schema any
---@param basePath any
function AIDrivable.registerAgentXMLPaths(schema, basePath) end

--- Registers the vehicle events onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive and onAIDriveableEnd (note the two spellings, Drivable and Driveable).
---@param vehicleType any
function AIDrivable.registerEvents(vehicleType) end

--- Adds the specialization's functions to the vehicle type: console commands, agent creation and deletion, target handling, AI root node helpers, agent size and attachment data, and debug drawing.
---@param vehicleType any
function AIDrivable.registerFunctions(vehicleType) end

--- Overrides getCanStartAIVehicle, getIsAIJobSupported, getCanHaveAIVehicleObstacle, getIsAIReadyToDrive and getIsAIPreparingToDrive.
---@param vehicleType any
function AIDrivable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, update, enter and leave vehicle, and cruise control speed change callbacks.
---@param vehicleType any
function AIDrivable.registerEventListeners(vehicleType) end

--- Initializes the runtime state (target, speed limits, stuck timer, attachment lists, pose data), loads the agent info from XML and creates the debug box and gizmo objects.
---@param savegame table
function AIDrivable:onLoad(savegame) end

--- Caches attacher joint offsets relative to the AI root node. If the XML defines an agent, fills missing width, height and length from the vehicle size and derives frontOffset from the mean Z position of the listed front wheels. Then sets the validity flag and recomputes the root node bounding box.
function AIDrivable:onPostLoad() end

--- Server only, while a target is set: detects blocking (more than 5 s stuck) and broadcasts AIVehicleIsBlockedEvent on change. Drives either manually to the point or along the navigation agent's curvature, reacting to its state (driving, planning, blocked, target reached, not reachable), then raises onAIDriveableActive.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIDrivable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only: refreshes attachment data, creates the engine navigation agent with the vehicle's size, turning radius and brake limits, registers it with the AI system and marks obstacles dirty. Also sets up debug recorders when AI debugging is on. The helperIndex parameter is not used.
---@param helperIndex any
function AIDrivable:createAgent(helperIndex) end

--- Stops the AI run, turns cruise control off, frees the debug dump and removes and deletes the navigation agent if one exists, then marks obstacles dirty.
function AIDrivable:deleteAgent() end

--- Starts AI driving toward a world position and direction for a task, with an optional speed limit and manual-driving flag. On the server in navigation mode it sets the agent's target; raises onAIDriveableStart.
---@param task any
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
---@param maxSpeed any
---@param useManualDriving any
function AIDrivable:setAITarget(task, x, y, z, dirX, dirY, dirZ, maxSpeed, useManualDriving) end

--- Server only: notifies the current task through its onTargetReached callback.
function AIDrivable:reachedAITarget() end

--- Clears the running state, task and manual-driving flag, stops driving (stopAIDriving is defined outside the visible dump, UNVERIFIED) and raises onAIDriveableEnd.
function AIDrivable:unsetAITarget() end

--- Returns the node used as the AI reference frame: the first component's node.
function AIDrivable:getAIRootNode() end

--- Recomputes the vehicle's size box in the AI root node's local space (min and max on each axis) and stores it; call it when the vehicle size changes.
function AIDrivable:setAIRootNodeDirty() end

--- Returns the smallest Z extent of the bounding box in AI root node space.
function AIDrivable:getAIRootNodeMinZOffset() end

--- Returns the largest Z extent of the bounding box in AI root node space.
function AIDrivable:getAIRootNodeMaxZOffset() end

--- Returns the box as world centre (x, y, z), world quaternion (x, y, z, w) and half extents (x, y, z) in 10 values.
function AIDrivable:getAIRootNodeBoundingBox() end

--- Returns false by default: the navigation agent is created without reverse driving.
function AIDrivable:getAIAllowsBackwards() end

--- On the server, when the player takes control, registers the console commands gsAISetTurnRadius, gsAIMoveVehicle and gsAIClearPath (the last one points to a function not present in the dump, UNVERIFIED).
---@param isControlling any
function AIDrivable:onEnterVehicle(isControlling) end

--- Removes the three console commands when the player who was controlling the vehicle leaves.
---@param wasEntered any
function AIDrivable:onLeaveVehicle(wasEntered) end

--- Stores the new cruise control speed as the AI speed cap (the reverse speed is ignored).
---@param speed any
---@param speedReverse any
function AIDrivable:onCruiseControlSpeedChanged(speed, speedReverse) end

--- Override: returns false plus the offending vehicle if any other vehicle in the attached tree is not ready to drive; otherwise defers to the parent.
---@param superFunc any
function AIDrivable:getIsAIReadyToDrive(superFunc) end

--- Override: returns true if any other vehicle in the attached tree is still preparing to drive; otherwise defers to the parent.
---@param superFunc any
function AIDrivable:getIsAIPreparingToDrive(superFunc) end

--- Debug rendering: draws the agent size box, front marker, state or distance text, turning-radius lines for the vehicle and its wheels, and reference radius information. Not meant for production use.
function AIDrivable:drawDebugAIAgent() end

--- Reads the vehicle.ai.agent attributes into the given table (defaults: lengthOffset 0, frontOffset 3, max brake 5, max centripetal 1), then applies overrides from each selected configuration's aiAgent node. Sets isDefined when any such node exists.
---@param xmlFile any
---@param agent any
function AIDrivable:loadAgentInfoFromXML(xmlFile, agent) end

--- Returns width, length, lengthOffset, frontOffset and height of the agent, enlarged by the attached implements; returns five nils when the agent info is invalid.
function AIDrivable:getAIAgentSize() end

--- Returns the agent's configured maximum braking acceleration.
function AIDrivable:getAIAgentMaxBrakeAcceleration() end

--- Resets and rebuilds the attachment data by collecting attached vehicles (collectAIAgentAttachments is defined outside the visible dump, UNVERIFIED), then updates trailer offsets and pose data.
function AIDrivable:updateAIAgentAttachments() end

--- Records an attached object in the current chain at a given level and widens the agent's maximum attachment width and height.
---@param attachmentData any
---@param level any
function AIDrivable:addAIAgentAttachment(attachmentData, level) end

--- Moves on to a new attachment chain, but only if the current one already contains entries.
function AIDrivable:startNewAIAgentAttachmentChain() end

--- Builds the flat list of trailer data sent to the agent (hitch offsets, centre offset, collision flag) for articulated trailer chains, up to the trailer limit. Rigid attachments instead extend the agent length forward or backward.
function AIDrivable:updateAIAgentAttachmentOffsetData() end

--- Fills the pose array passed to the navigation agent: world position and direction of the AI root node, then of each trailer rotation centre, up to the limit. Trims leftover entries.
function AIDrivable:updateAIAgentPoseData() end

--- Raises onAIDrivablePrepare and onAIImplementPrepareForTransport through raiseAIEvent so implements get ready for transport (raiseAIEvent is not in the dump, UNVERIFIED).
function AIDrivable:prepareForAIDriving() end

--- Returns the given minimum radius unchanged; a hook that other specializations can override to adjust the AI turning radius.
---@param minRadius any
function AIDrivable:getAITurningRadius(minRadius) end

--- Override: returns false when the agent info is invalid (no size known), otherwise defers to the parent.
---@param superFunc any
function AIDrivable:getCanStartAIVehicle(superFunc) end

--- Override: returns false for any job when the agent info is invalid, otherwise defers to the parent with the job name.
---@param superFunc any
---@param jobName any
function AIDrivable:getIsAIJobSupported(superFunc, jobName) end

--- Debug console command: sets the steering input to produce the given turn radius (default 10) by writing the Drivable side axis.
---@param turnRadius any
function AIDrivable:consoleCommandSetTurnRadius(turnRadius) end

--- Debug console command: temporarily removes the vehicle and its attached vehicles from physics, shifts all components sideways by a distance, adjusts steering to match, and re-adds them. Note: distance is used without converting from the console string.
---@param distance any
function AIDrivable:consoleCommandMove(distance) end
