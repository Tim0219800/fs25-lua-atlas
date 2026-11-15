# vehicles/specializations/FellerBuncher.lua

Source : `dataS/scripts/vehicles/specializations/FellerBuncher.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FellerBuncher.prerequisitesPresent(specializations: table) → boolean` | 21 |  |
| `FellerBuncher.initSpecialization()` | 27 |  |
| `FellerBuncher.registerFunctions(vehicleType: any)` | 83 |  |
| `FellerBuncher.registerOverwrittenFunctions(vehicleType: any)` | 102 |  |
| `FellerBuncher.registerEventListeners(vehicleType: any)` | 111 |  |
| `FellerBuncher:onLoad(savegame: any)` | 127 |  |
| `FellerBuncher:onDelete()` | 226 |  |
| `FellerBuncher:onReadStream(streamId: integer, connection: Connection)` | 244 |  |
| `FellerBuncher:onWriteStream(streamId: integer, connection: Connection)` | 257 |  |
| `FellerBuncher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 268 |  |
| `FellerBuncher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 285 |  |
| `FellerBuncher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 300 |  |
| `FellerBuncher:onTurnedOn()` | 488 |  |
| `FellerBuncher:onTurnedOff()` | 503 |  |
| `FellerBuncher:onFinishAnimation(name: any)` | 519 |  |
| `FellerBuncher:setFellerBuncherGrabState(state: any)` | 580 |  |
| `FellerBuncher:getIsFellerBuncherReadyForCut()` | 601 |  |
| `FellerBuncher:getFellerBuncherCanCutSplitShape(splitShapeId: any, cx: any, cy: any, cz: any, nx: any, ny: any, nz: any, yx: any, yy: any, yz: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 629 |  |
| `FellerBuncher:cutTree(noEventSend: any)` | 664 |  |
| `FellerBuncher:fellerBuncherSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 704 |  |
| `FellerBuncher:doMountProcess(shape: any, noEventSend: any)` | 717 |  |
| `FellerBuncher:mountTreeInRange()` | 730 |  |
| `FellerBuncher:releaseMountedTrees(noEventSend: any)` | 768 |  |
| `FellerBuncher:releaseMainArmTree()` | 786 |  |
| `FellerBuncher:releaseNextTreeSlot()` | 828 |  |
| `FellerBuncher:onFellerBuncherTreesChanged()` | 859 |  |
| `FellerBuncher:getNumLoadedTrees()` | 873 |  |
| `FellerBuncher:onFellerBuncherTreeShapeCut(oldShape: any, shape: any)` | 891 |  |
| `FellerBuncher:onFellerBuncherTreeShapeMounted(shape: any, mountVehicle: any)` | 910 |  |
| `FellerBuncher:getCanToggleTurnedOn(superFunc: any)` | 929 |  |
| `FellerBuncher:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 949 |  |
| `FellerBuncher:getSupportsAutoTreeAlignment(superFunc: any)` | 954 |  |
| `FellerBuncher:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 960 |  |
| `FellerBuncher:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 967 |  |
| `FellerBuncher.actionEventReleaseTrees(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 990 |  |
| `FellerBuncher.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 996 |  |
| `FellerBuncher.updateActionEvents(self: any)` | 1002 |  |
| `FellerBuncher.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1029 |  |
| `FellerBuncher.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1035 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setFellerBuncherGrabState` | 84 |
| registerFunction | `getIsFellerBuncherReadyForCut` | 85 |
| registerFunction | `getFellerBuncherCanCutSplitShape` | 86 |
| registerFunction | `cutTree` | 87 |
| registerFunction | `fellerBuncherSplitShapeCallback` | 88 |
| registerFunction | `doMountProcess` | 89 |
| registerFunction | `mountTreeInRange` | 90 |
| registerFunction | `releaseMountedTrees` | 91 |
| registerFunction | `releaseMainArmTree` | 92 |
| registerFunction | `releaseNextTreeSlot` | 93 |
| registerFunction | `onFellerBuncherTreesChanged` | 94 |
| registerFunction | `getNumLoadedTrees` | 95 |
| registerFunction | `onFellerBuncherTreeShapeCut` | 96 |
| registerFunction | `onFellerBuncherTreeShapeMounted` | 97 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 103 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 104 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 105 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 106 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onUpdateTick` | 118 |
| registerEventListener | `onTurnedOn` | 119 |
| registerEventListener | `onTurnedOff` | 120 |
| registerEventListener | `onFinishAnimation` | 121 |
| registerEventListener | `onRegisterActionEvents` | 122 |

## Messages

- écoute `MessageType.TREE_SHAPE_CUT` (l.218)
- écoute `MessageType.TREE_SHAPE_MOUNTED` (l.219)
- publie `MessageType.TREE_SHAPE_MOUNTED` (l.757)
