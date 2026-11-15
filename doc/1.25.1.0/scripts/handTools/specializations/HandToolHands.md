# handTools/specializations/HandToolHands.lua

Source: `dataS/scripts/handTools/specializations/HandToolHands.lua` — FS25 1.25.1.0

- **HandToolHands** (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolHands.registerXMLPaths(xmlSchema: any)` | 49 |  |
| `HandToolHands.registerFunctions(handToolType: any)` | 56 |  |
| `HandToolHands.registerOverwrittenFunctions(vehicleType: any)` | 89 |  |
| `HandToolHands.registerEventListeners(handToolType: any)` | 95 |  |
| `HandToolHands.prerequisitesPresent(specializations: any)` | 111 |  |
| `HandToolHands:onLoad(xmlFile: any, baseDirectory: any)` | 117 |  |
| `HandToolHands:onKinematicHelperLoaded(kinematicNode: any, failedReason: any)` | 178 |  |
| `HandToolHands:onDelete()` | 202 |  |
| `HandToolHands:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 241 |  |
| `HandToolHands:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 271 |  |
| `HandToolHands:onUpdate(dt: any)` | 304 |  |
| `HandToolHands:onDraw()` | 398 |  |
| `HandToolHands:onRegisterActionEvents()` | 424 |  |
| `HandToolHands:onHeldStart()` | 459 |  |
| `HandToolHands:onHeldEnd()` | 473 |  |
| `HandToolHands:onCarryingPlayerChanged(player: any, lastPlayer: any)` | 488 |  |
| `HandToolHands:getCanBeDropped(superFunc: any)` | 500 |  |
| `HandToolHands:updateKinematicNode()` | 506 |  |
| `HandToolHands:getKinematicNode() → integer?, integer?` | 545 |  |
| `HandToolHands:getIsHoldingItem() → boolean` | 552 |  |
| `HandToolHands:getIsThrowingItem() → boolean` | 559 |  |
| `HandToolHands:getIsAwaitingJointCreation() → boolean` | 566 |  |
| `HandToolHands:getHasJoint() → boolean` | 573 |  |
| `HandToolHands:getCanPickUpNode(node: integer) → boolean` | 587 |  |
| `HandToolHands:onPickUpAction(_: any, inputValue: any)` | 633 |  |
| `HandToolHands:onThrowAction(_: any, inputValue: any)` | 663 |  |
| `HandToolHands:onPitchAction(_: any, inputDelta: any)` | 698 |  |
| `HandToolHands:onYawAction(_: any, inputDelta: any)` | 710 |  |
| `HandToolHands:onLevelAction(_: any, inputValue: any)` | 721 |  |
| `HandToolHands:rotateHeldItem(inputDelta: number, directionX: number, directionY: number, directionZ: number)` | 731 |  |
| `HandToolHands:levelHeldItem()` | 749 |  |
| `HandToolHands:dropHeldItem(noEventSend: boolean?)` | 774 |  |
| `HandToolHands:throwHeldItemWithForceScalar(throwForceScalar: number, noEventSend: boolean)` | 788 |  |
| `HandToolHands:pickUpTarget(target: table, noEventSend: boolean) → boolean` | 881 |  |
| `HandToolHands:pickupFailed()` | 952 |  |
| `HandToolHands:orientRotationNodeToItem(targetItemNode: any)` | 991 |  |
| `HandToolHands:createItemJoint()` | 1005 |  |
| `HandToolHands:onHeldItemJointBroken(jointIndex: integer?, breakingImpulse: number?, noEventSend: boolean?)` | 1106 |  |
| `HandToolHands:findFootballCallback(transformId: any)` | 1167 |  |
| `HandToolHands:shootBall(football: any, dirX: any, dirZ: any, angleDeg: any, velocity: any, shotType: any)` | 1184 |  |
| `HandToolHands.calculateItemMass(itemNode: integer) → number?` | 1195 |  |
| `HandToolHands.calculateItemJointBreakForceFactor(itemNode: integer) → number` | 1219 |  |
| `HandToolHands:onDebugDraw()` | 1231 |  |
| `HandToolHands:consoleCommandToggleSuperStrength()` | 1254 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateKinematicNode` | 57 |
| registerFunction | `getKinematicNode` | 59 |
| registerFunction | `getIsHoldingItem` | 60 |
| registerFunction | `getIsThrowingItem` | 61 |
| registerFunction | `getIsAwaitingJointCreation` | 62 |
| registerFunction | `getHasJoint` | 63 |
| registerFunction | `getHeldItem` | 64 |
| registerFunction | `getCanPickUpNode` | 65 |
| registerFunction | `orientRotationNodeToItem` | 67 |
| registerFunction | `createItemJoint` | 68 |
| registerFunction | `pickUpTarget` | 70 |
| registerFunction | `pickupFailed` | 71 |
| registerFunction | `dropHeldItem` | 72 |
| registerFunction | `throwHeldItemWithForceScalar` | 73 |
| registerFunction | `throwHeldItemWithForceVector` | 74 |
| registerFunction | `rotateHeldItem` | 76 |
| registerFunction | `levelHeldItem` | 77 |
| registerFunction | `onHeldItemJointBroken` | 79 |
| registerFunction | `findFootballCallback` | 81 |
| registerFunction | `shootBall` | 82 |
| registerFunction | `consoleCommandToggleSuperStrength` | 84 |
| registerOverwrittenFunction | `getCanBeDropped` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onDelete` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onDraw` | 99 |
| registerEventListener | `onWriteUpdateStream` | 100 |
| registerEventListener | `onReadUpdateStream` | 101 |
| registerEventListener | `onRegisterActionEvents` | 102 |
| registerEventListener | `onCarryingPlayerChanged` | 103 |
| registerEventListener | `onHeldStart` | 104 |
| registerEventListener | `onHeldEnd` | 105 |
| registerEventListener | `onDebugDraw` | 106 |
