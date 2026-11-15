# vehicles/specializations/AutomaticArmControlForwarder.lua

Source : `dataS/scripts/vehicles/specializations/AutomaticArmControlForwarder.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutomaticArmControlForwarder.prerequisitesPresent(specializations: table) → boolean` | 32 |  |
| `AutomaticArmControlForwarder.initSpecialization()` | 38 |  |
| `AutomaticArmControlForwarder.registerXMLPaths(schema: any, basePath: any)` | 52 |  |
| `AutomaticArmControlForwarder.registerFunctions(vehicleType: any)` | 90 |  |
| `AutomaticArmControlForwarder.registerOverwrittenFunctions(vehicleType: any)` | 106 |  |
| `AutomaticArmControlForwarder.registerEventListeners(vehicleType: any)` | 111 |  |
| `AutomaticArmControlForwarder:onLoad(savegame: any)` | 125 |  |
| `AutomaticArmControlForwarder:onPostLoad(savegame: any)` | 217 |  |
| `AutomaticArmControlForwarder:onDelete()` | 239 |  |
| `AutomaticArmControlForwarder:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 255 |  |
| `AutomaticArmControlForwarder:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 273 |  |
| `AutomaticArmControlForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 290 |  |
| `AutomaticArmControlForwarder:onAutoLoadForwaderMountedTree(treeNodeId: any)` | 367 |  |
| `AutomaticArmControlForwarder:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 374 |  |
| `AutomaticArmControlForwarder.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 389 |  |
| `AutomaticArmControlForwarder.updateActionEvents(self: any, state: any)` | 395 |  |
| `AutomaticArmControlForwarder:getIsAutoTreeAlignmentAllowed()` | 405 |  |
| `AutomaticArmControlForwarder:setTreeArmAlignmentInput(inputValue: any)` | 427 |  |
| `AutomaticArmControlForwarder:doTreeArmAlignment(tx: any, ty: any, tz: any, dx: any, dy: any, dz: any, direction: any, forceMoveUp: any)` | 447 |  |
| `AutomaticArmControlForwarder.movingToolXAlignment(self: any, movingTool: any, tx: any, ty: any, tz: any, referenceNode: any, threshold: any, speedScale: any, offset: any, allowInversion: any)` | 533 |  |
| `AutomaticArmControlForwarder.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 563 |  |
| `AutomaticArmControlForwarder:resetAutomaticAlignment()` | 619 |  |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentActive()` | 625 |  |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentFinished()` | 632 |  |
| `AutomaticArmControlForwarder:getAutomaticAlignmentTargetTree()` | 638 |  |
| `AutomaticArmControlForwarder:getAutomaticAlignmentAvailableTargetTree()` | 644 |  |
| `AutomaticArmControlForwarder:getAutomaticAlignmentCurrentTarget()` | 651 |  |
| `AutomaticArmControlForwarder:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 662 |  |
| `AutomaticArmControlForwarder:onTreeAutoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 690 |  |
| `AutomaticArmControlForwarder.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 703 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 91 |
| registerFunction | `setTreeArmAlignmentInput` | 92 |
| registerFunction | `doTreeArmAlignment` | 93 |
| registerFunction | `resetAutomaticAlignment` | 94 |
| registerFunction | `getIsAutomaticAlignmentActive` | 95 |
| registerFunction | `getIsAutomaticAlignmentFinished` | 96 |
| registerFunction | `getAutomaticAlignmentTargetTree` | 97 |
| registerFunction | `getAutomaticAlignmentAvailableTargetTree` | 98 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 99 |
| registerFunction | `getBestTreeToAutoAlign` | 100 |
| registerFunction | `onTreeAutoTriggerCallback` | 101 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onPostLoad` | 113 |
| registerEventListener | `onDelete` | 114 |
| registerEventListener | `onReadUpdateStream` | 115 |
| registerEventListener | `onWriteUpdateStream` | 116 |
| registerEventListener | `onUpdate` | 117 |
| registerEventListener | `onAutoLoadForwaderMountedTree` | 118 |
| registerEventListener | `onRegisterActionEvents` | 119 |
