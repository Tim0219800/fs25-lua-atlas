# vehicles/specializations/AIDrivable.lua

Source: `dataS/scripts/vehicles/specializations/AIDrivable.lua` — FS25 1.25.1.0

- **AIDrivable** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIDrivable.prerequisitesPresent(specializations: table) → boolean` | 25 |  |
| `AIDrivable.initSpecialization()` | 33 |  |
| `AIDrivable.postInitSpecialization()` | 42 |  |
| `AIDrivable.registerAgentXMLPaths(schema: any, basePath: any)` | 56 |  |
| `AIDrivable.registerEvents(vehicleType: any)` | 71 |  |
| `AIDrivable.registerFunctions(vehicleType: any)` | 81 |  |
| `AIDrivable.registerOverwrittenFunctions(vehicleType: any)` | 113 |  |
| `AIDrivable.registerEventListeners(vehicleType: any)` | 123 |  |
| `AIDrivable:onLoad(savegame: table)` | 135 |  |
| `AIDrivable:onPostLoad()` | 181 |  |
| `AIDrivable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 255 |  |
| `AIDrivable:createAgent(helperIndex: any)` | 353 |  |
| `AIDrivable:deleteAgent()` | 401 |  |
| `AIDrivable:setAITarget(task: any, x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any, maxSpeed: any, useManualDriving: any)` | 427 |  |
| `AIDrivable:reachedAITarget()` | 484 |  |
| `AIDrivable:unsetAITarget()` | 496 |  |
| `AIDrivable:getAIRootNode()` | 515 |  |
| `AIDrivable:setAIRootNodeDirty()` | 521 |  |
| `AIDrivable:getAIRootNodeMinZOffset()` | 557 |  |
| `AIDrivable:getAIRootNodeMaxZOffset()` | 564 |  |
| `AIDrivable:getAIRootNodeBoundingBox()` | 571 |  |
| `AIDrivable:getAIAllowsBackwards()` | 587 |  |
| `AIDrivable:onEnterVehicle(isControlling: any)` | 593 |  |
| `AIDrivable:onLeaveVehicle(wasEntered: any)` | 603 |  |
| `AIDrivable:onCruiseControlSpeedChanged(speed: any, speedReverse: any)` | 613 |  |
| `AIDrivable:getIsAIReadyToDrive(superFunc: any)` | 620 |  |
| `AIDrivable:getIsAIPreparingToDrive(superFunc: any)` | 636 |  |
| `AIDrivable:drawDebugAIAgent()` | 652 |  |
| `AIDrivable:loadAgentInfoFromXML(xmlFile: any, agent: any)` | 800 |  |
| `AIDrivable:getAIAgentSize()` | 841 |  |
| `AIDrivable:getAIAgentMaxBrakeAcceleration()` | 862 |  |
| `AIDrivable:updateAIAgentAttachments()` | 870 |  |
| `AIDrivable:addAIAgentAttachment(attachmentData: any, level: any)` | 890 |  |
| `AIDrivable:startNewAIAgentAttachmentChain()` | 908 |  |
| `AIDrivable:updateAIAgentAttachmentOffsetData()` | 917 |  |
| `AIDrivable:updateAIAgentPoseData()` | 988 |  |
| `AIDrivable:prepareForAIDriving()` | 1028 |  |
| `AIDrivable:getAITurningRadius(minRadius: any)` | 1034 |  |
| `AIDrivable:getCanStartAIVehicle(superFunc: any)` | 1040 |  |
| `AIDrivable:getIsAIJobSupported(superFunc: any, jobName: any)` | 1051 |  |
| `AIDrivable:consoleCommandSetTurnRadius(turnRadius: any)` | 1081 |  |
| `AIDrivable:consoleCommandMove(distance: any)` | 1100 |  |

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
