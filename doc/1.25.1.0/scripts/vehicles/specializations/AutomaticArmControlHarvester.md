# vehicles/specializations/AutomaticArmControlHarvester.lua

Source : `dataS/scripts/vehicles/specializations/AutomaticArmControlHarvester.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AutomaticArmControlHarvester.prerequisitesPresent(specializations: table) → boolean` | 43 |  |
| `AutomaticArmControlHarvester.initSpecialization()` | 49 |  |
| `AutomaticArmControlHarvester.registerXMLPaths(schema: any, basePath: any)` | 63 |  |
| `AutomaticArmControlHarvester.registerFunctions(vehicleType: any)` | 106 |  |
| `AutomaticArmControlHarvester.registerOverwrittenFunctions(vehicleType: any)` | 123 |  |
| `AutomaticArmControlHarvester.registerEventListeners(vehicleType: any)` | 128 |  |
| `AutomaticArmControlHarvester:onLoad(savegame: any)` | 141 |  |
| `AutomaticArmControlHarvester:onPostLoad(savegame: any)` | 243 |  |
| `AutomaticArmControlHarvester:onDelete()` | 269 |  |
| `AutomaticArmControlHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 278 |  |
| `AutomaticArmControlHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 296 |  |
| `AutomaticArmControlHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 313 |  |
| `AutomaticArmControlHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 439 |  |
| `AutomaticArmControlHarvester.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 454 |  |
| `AutomaticArmControlHarvester.updateActionEvents(self: any, state: any)` | 460 |  |
| `AutomaticArmControlHarvester:onRootVehicleChanged(rootVehicle: table)` | 471 |  |
| `AutomaticArmControlHarvester.actionControllerEvent(self: any, direction: any)` | 496 |  |
| `AutomaticArmControlHarvester:getSupportsAutoTreeAlignment()` | 508 |  |
| `AutomaticArmControlHarvester:getIsAutoTreeAlignmentAllowed()` | 514 |  |
| `AutomaticArmControlHarvester:getAutoAlignHasValidTree(radius: any)` | 551 |  |
| `AutomaticArmControlHarvester:getAutoAlignTreeMarkerState(foundRadius: any, checkChildren: any)` | 557 |  |
| `AutomaticArmControlHarvester:setTreeArmAlignmentInput(inputValue: any)` | 582 |  |
| `AutomaticArmControlHarvester:doTreeArmAlignment(tx: any, ty: any, tz: any, direction: any)` | 602 |  |
| `AutomaticArmControlHarvester.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 721 |  |
| `AutomaticArmControlHarvester.prepareAlignment(self: any, direction: any)` | 776 |  |
| `AutomaticArmControlHarvester:getIsAutomaticAlignmentActive()` | 812 |  |
| `AutomaticArmControlHarvester:getAutomaticAlignmentCurrentTarget()` | 819 |  |
| `AutomaticArmControlHarvester:getAutomaticAlignmentInvalidTreeReason()` | 830 |  |
| `AutomaticArmControlHarvester:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 836 |  |
| `AutomaticArmControlHarvester:onTreeAutoOverlapCallback(objectId: any, ...: any)` | 875 |  |
| `AutomaticArmControlHarvester:getTreeAutomaticOverwrites()` | 894 |  |
| `AutomaticArmControlHarvester.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 901 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getSupportsAutoTreeAlignment` | 107 |
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 108 |
| registerFunction | `getAutoAlignHasValidTree` | 109 |
| registerFunction | `getAutoAlignTreeMarkerState` | 110 |
| registerFunction | `setTreeArmAlignmentInput` | 111 |
| registerFunction | `doTreeArmAlignment` | 112 |
| registerFunction | `getIsAutomaticAlignmentActive` | 113 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 114 |
| registerFunction | `getAutomaticAlignmentInvalidTreeReason` | 115 |
| registerFunction | `getBestTreeToAutoAlign` | 116 |
| registerFunction | `onTreeAutoOverlapCallback` | 117 |
| registerFunction | `getTreeAutomaticOverwrites` | 118 |
| registerEventListener | `onLoad` | 129 |
| registerEventListener | `onPostLoad` | 130 |
| registerEventListener | `onDelete` | 131 |
| registerEventListener | `onReadUpdateStream` | 132 |
| registerEventListener | `onWriteUpdateStream` | 133 |
| registerEventListener | `onUpdate` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onRootVehicleChanged` | 136 |
