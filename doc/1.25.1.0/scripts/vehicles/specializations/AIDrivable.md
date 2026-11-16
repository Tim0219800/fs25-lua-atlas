# vehicles/specializations/AIDrivable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIDrivable.md)*

Source: `dataS/scripts/vehicles/specializations/AIDrivable.lua` — FS25 1.25.1.0

✍ Specialization that makes a drivable vehicle usable by AI helpers: it holds the navigation agent (size, brake and centripetal limits, turning radius, attached trailers) and drives it toward a target each frame on the server. It requires AIVehicle, AIJobVehicle and Drivable, loads the optional vehicle.ai.agent XML node (also overridable per configuration) and raises the events onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive and onAIDriveableEnd. The navigation agent is created through engine functions such as createVehicleNavigationAgent, whose behaviour is UNVERIFIED here.

- **AIDrivable** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIDrivable.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Returns true only if the vehicle type has AIVehicle, AIJobVehicle and Drivable. |
| `AIDrivable.initSpecialization()` | 33 | ✍ Registers the vehicle.ai.agent XML paths in the vehicle schema. |
| `AIDrivable.postInitSpecialization()` | 42 | ✍ After all configurations are known, registers the aiAgent XML paths under every vehicle configuration key, using a shared registration so each configuration option can override agent values. |
| `AIDrivable.registerAgentXMLPaths(schema: any, basePath: any)` | 56 | ✍ Registers the agent attributes under a base path: width, length, lengthOffset, height, frontOffset, front wheel indices or nodes, maxBrakeAcceleration, maxCentripetalAcceleration and maxTurningRadius. |
| `AIDrivable.registerEvents(vehicleType: any)` | 71 | ✍ Registers the vehicle events onAIDrivablePrepare, onAIDriveableStart, onAIDriveableActive and onAIDriveableEnd (note the two spellings, Drivable and Driveable). |
| `AIDrivable.registerFunctions(vehicleType: any)` | 81 | ✍ Adds the specialization's functions to the vehicle type: console commands, agent creation and deletion, target handling, AI root node helpers, agent size and attachment data, and debug drawing. |
| `AIDrivable.registerOverwrittenFunctions(vehicleType: any)` | 113 | ✍ Overrides getCanStartAIVehicle, getIsAIJobSupported, getCanHaveAIVehicleObstacle, getIsAIReadyToDrive and getIsAIPreparingToDrive. |
| `AIDrivable.registerEventListeners(vehicleType: any)` | 123 | ✍ Subscribes to load, post-load, update, enter and leave vehicle, and cruise control speed change callbacks. |
| `AIDrivable:onLoad(savegame: table)` | 135 | ✍ Initializes the runtime state (target, speed limits, stuck timer, attachment lists, pose data), loads the agent info from XML and creates the debug box and gizmo objects. |
| `AIDrivable:onPostLoad()` | 181 | ✍ Caches attacher joint offsets relative to the AI root node. If the XML defines an agent, fills missing width, height and length from the vehicle size and derives frontOffset from the mean Z position of the listed front wheels. Then sets the validity flag and recomputes the root node bounding box. |
| `AIDrivable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 255 | ✍ Server only, while a target is set: detects blocking (more than 5 s stuck) and broadcasts AIVehicleIsBlockedEvent on change. Drives either manually to the point or along the navigation agent's curvature, reacting to its state (driving, planning, blocked, target reached, not reachable), then raises onAIDriveableActive. |
| `AIDrivable:createAgent(helperIndex: any)` | 353 | ✍ Server only: refreshes attachment data, creates the engine navigation agent with the vehicle's size, turning radius and brake limits, registers it with the AI system and marks obstacles dirty. Also sets up debug recorders when AI debugging is on. The helperIndex parameter is not used. |
| `AIDrivable:deleteAgent()` | 401 | ✍ Stops the AI run, turns cruise control off, frees the debug dump and removes and deletes the navigation agent if one exists, then marks obstacles dirty. |
| `AIDrivable:setAITarget(task: any, x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, maxSpeed: any, useManualDriving: any)` | 427 | ✍ Starts AI driving toward a world position and direction for a task, with an optional speed limit and manual-driving flag. On the server in navigation mode it sets the agent's target; raises onAIDriveableStart. |
| `AIDrivable:reachedAITarget()` | 484 | ✍ Server only: notifies the current task through its onTargetReached callback. |
| `AIDrivable:unsetAITarget()` | 496 | ✍ Clears the running state, task and manual-driving flag, stops driving (stopAIDriving is defined outside the visible dump, UNVERIFIED) and raises onAIDriveableEnd. |
| `AIDrivable:getAIRootNode()` | 515 | ✍ Returns the node used as the AI reference frame: the first component's node. |
| `AIDrivable:setAIRootNodeDirty()` | 521 | ✍ Recomputes the vehicle's size box in the AI root node's local space (min and max on each axis) and stores it; call it when the vehicle size changes. |
| `AIDrivable:getAIRootNodeMinZOffset()` | 557 | ✍ Returns the smallest Z extent of the bounding box in AI root node space. |
| `AIDrivable:getAIRootNodeMaxZOffset()` | 564 | ✍ Returns the largest Z extent of the bounding box in AI root node space. |
| `AIDrivable:getAIRootNodeBoundingBox()` | 571 | ✍ Returns the box as world centre (x, y, z), world quaternion (x, y, z, w) and half extents (x, y, z) in 10 values. |
| `AIDrivable:getAIAllowsBackwards()` | 587 | ✍ Returns false by default: the navigation agent is created without reverse driving. |
| `AIDrivable:onEnterVehicle(isControlling: any)` | 593 | ✍ On the server, when the player takes control, registers the console commands gsAISetTurnRadius, gsAIMoveVehicle and gsAIClearPath (the last one points to a function not present in the dump, UNVERIFIED). |
| `AIDrivable:onLeaveVehicle(wasEntered: any)` | 603 | ✍ Removes the three console commands when the player who was controlling the vehicle leaves. |
| `AIDrivable:onCruiseControlSpeedChanged(speed: any, speedReverse: any)` | 613 | ✍ Stores the new cruise control speed as the AI speed cap (the reverse speed is ignored). |
| `AIDrivable:getIsAIReadyToDrive(superFunc: any)` | 620 | ✍ Override: returns false plus the offending vehicle if any other vehicle in the attached tree is not ready to drive; otherwise defers to the parent. |
| `AIDrivable:getIsAIPreparingToDrive(superFunc: any)` | 636 | ✍ Override: returns true if any other vehicle in the attached tree is still preparing to drive; otherwise defers to the parent. |
| `AIDrivable:drawDebugAIAgent()` | 652 | ✍ Debug rendering: draws the agent size box, front marker, state or distance text, turning-radius lines for the vehicle and its wheels, and reference radius information. Not meant for production use. |
| `AIDrivable:loadAgentInfoFromXML(xmlFile: any, agent: any)` | 800 | ✍ Reads the vehicle.ai.agent attributes into the given table (defaults: lengthOffset 0, frontOffset 3, max brake 5, max centripetal 1), then applies overrides from each selected configuration's aiAgent node. Sets isDefined when any such node exists. |
| `AIDrivable:getAIAgentSize()` | 841 | ✍ Returns width, length, lengthOffset, frontOffset and height of the agent, enlarged by the attached implements; returns five nils when the agent info is invalid. |
| `AIDrivable:getAIAgentMaxBrakeAcceleration()` | 862 | ✍ Returns the agent's configured maximum braking acceleration. |
| `AIDrivable:updateAIAgentAttachments()` | 870 | ✍ Resets and rebuilds the attachment data by collecting attached vehicles (collectAIAgentAttachments is defined outside the visible dump, UNVERIFIED), then updates trailer offsets and pose data. |
| `AIDrivable:addAIAgentAttachment(attachmentData: any, level: any)` | 890 | ✍ Records an attached object in the current chain at a given level and widens the agent's maximum attachment width and height. |
| `AIDrivable:startNewAIAgentAttachmentChain()` | 908 | ✍ Moves on to a new attachment chain, but only if the current one already contains entries. |
| `AIDrivable:updateAIAgentAttachmentOffsetData()` | 917 | ✍ Builds the flat list of trailer data sent to the agent (hitch offsets, centre offset, collision flag) for articulated trailer chains, up to the trailer limit. Rigid attachments instead extend the agent length forward or backward. |
| `AIDrivable:updateAIAgentPoseData()` | 988 | ✍ Fills the pose array passed to the navigation agent: world position and direction of the AI root node, then of each trailer rotation centre, up to the limit. Trims leftover entries. |
| `AIDrivable:prepareForAIDriving()` | 1028 | ✍ Raises onAIDrivablePrepare and onAIImplementPrepareForTransport through raiseAIEvent so implements get ready for transport (raiseAIEvent is not in the dump, UNVERIFIED). |
| `AIDrivable:getAITurningRadius(minRadius: any)` | 1034 | ✍ Returns the given minimum radius unchanged; a hook that other specializations can override to adjust the AI turning radius. |
| `AIDrivable:getCanStartAIVehicle(superFunc: any)` | 1040 | ✍ Override: returns false when the agent info is invalid (no size known), otherwise defers to the parent. |
| `AIDrivable:getIsAIJobSupported(superFunc: any, jobName: any)` | 1051 | ✍ Override: returns false for any job when the agent info is invalid, otherwise defers to the parent with the job name. |
| `AIDrivable:consoleCommandSetTurnRadius(turnRadius: any)` | 1081 | ✍ Debug console command: sets the steering input to produce the given turn radius (default 10) by writing the Drivable side axis. |
| `AIDrivable:consoleCommandMove(distance: any)` | 1100 | ✍ Debug console command: temporarily removes the vehicle and its attached vehicles from physics, shifts all components sideways by a distance, adjusts steering to match, and re-adds them. Note: distance is used without converting from the console string. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAIDrivablePrepare` | 72 |
| registerEvent | `onAIDriveableStart` | 73 |
| registerEvent | `onAIDriveableActive` | 74 |
| registerEvent | `onAIDriveableEnd` | 75 |
| registerFunction | `consoleCommandSetTurnRadius` | 82 |
| registerFunction | `consoleCommandMove` | 83 |
| registerFunction | `consoleCommandClearPath` | 84 |
| registerFunction | `createAgent` | 85 |
| registerFunction | `deleteAgent` | 86 |
| registerFunction | `setAITarget` | 87 |
| registerFunction | `unsetAITarget` | 88 |
| registerFunction | `stopAIDriving` | 89 |
| registerFunction | `reachedAITarget` | 90 |
| registerFunction | `getAIRootNode` | 91 |
| registerFunction | `setAIRootNodeDirty` | 92 |
| registerFunction | `getAIRootNodeMinZOffset` | 93 |
| registerFunction | `getAIRootNodeMaxZOffset` | 94 |
| registerFunction | `getAIRootNodeBoundingBox` | 95 |
| registerFunction | `getAIAllowsBackwards` | 96 |
| registerFunction | `drawDebugAIAgent` | 97 |
| registerFunction | `debugGetAgentHasSpaceAt` | 98 |
| registerFunction | `loadAgentInfoFromXML` | 99 |
| registerFunction | `getAIAgentSize` | 100 |
| registerFunction | `getAIAgentMaxBrakeAcceleration` | 101 |
| registerFunction | `updateAIAgentAttachments` | 102 |
| registerFunction | `addAIAgentAttachment` | 103 |
| registerFunction | `startNewAIAgentAttachmentChain` | 104 |
| registerFunction | `updateAIAgentAttachmentOffsetData` | 105 |
| registerFunction | `updateAIAgentPoseData` | 106 |
| registerFunction | `prepareForAIDriving` | 107 |
| registerFunction | `getAITurningRadius` | 108 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 114 |
| registerOverwrittenFunction | `getIsAIJobSupported` | 115 |
| registerOverwrittenFunction | `getCanHaveAIVehicleObstacle` | 116 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 117 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 118 |
| registerEventListener | `onLoad` | 124 |
| registerEventListener | `onPostLoad` | 125 |
| registerEventListener | `onUpdate` | 126 |
| registerEventListener | `onEnterVehicle` | 127 |
| registerEventListener | `onLeaveVehicle` | 128 |
| registerEventListener | `onCruiseControlSpeedChanged` | 129 |
