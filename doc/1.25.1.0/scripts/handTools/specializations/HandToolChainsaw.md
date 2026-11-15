# handTools/specializations/HandToolChainsaw.lua

Source : `dataS/scripts/handTools/specializations/HandToolChainsaw.lua` — FS25 1.25.1.0

- **HandToolChainsaw** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolChainsaw.registerXMLPaths(xmlSchema: any)` | 52 |  |
| `HandToolChainsaw.registerFunctions(handToolType: any)` | 70 |  |
| `HandToolChainsaw.registerEventListeners(handToolType: any)` | 88 |  |
| `HandToolChainsaw.prerequisitesPresent(specializations: any)` | 103 |  |
| `HandToolChainsaw:onLoad(xmlFile: any, baseDirectory: any)` | 109 |  |
| `HandToolChainsaw:onPostLoad(savegame: any)` | 231 |  |
| `HandToolChainsaw:onRingLoadFinished(ringNode: any, failedReason: any)` | 243 |  |
| `HandToolChainsaw:onDelete()` | 263 |  |
| `HandToolChainsaw:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 307 |  |
| `HandToolChainsaw:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 337 |  |
| `HandToolChainsaw:onUpdate(dt: any)` | 377 |  |
| `HandToolChainsaw:onDraw()` | 524 |  |
| `HandToolChainsaw:onHeldStart()` | 534 |  |
| `HandToolChainsaw:onHeldEnd()` | 560 |  |
| `HandToolChainsaw:onRegisterActionEvents()` | 593 |  |
| `HandToolChainsaw:onRollAction(_: any, inputDelta: any)` | 612 |  |
| `HandToolChainsaw:onCutAction(_: any, inputValue: any)` | 619 |  |
| `HandToolChainsaw:setCurrentCutState(cutState: any, isVerticalCut: any)` | 656 |  |
| `HandToolChainsaw:testIfCutAllowed(treeNode: any, cutX: any, cutZ: any)` | 676 |  |
| `HandToolChainsaw:testIfCutValid(treeNode: any, cutX: any, cutZ: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 696 |  |
| `HandToolChainsaw:testIfTooLow(treeNode: integer, minY: number, maxY: number, minZ: number, maxZ: number) → boolean` | 719 |  |
| `HandToolChainsaw:getChainSpeedFactor()` | 797 |  |
| `HandToolChainsaw:beginDelimbing()` | 804 |  |
| `HandToolChainsaw:stopDelimbing()` | 823 |  |
| `HandToolChainsaw:beginCutting()` | 837 |  |
| `HandToolChainsaw:stopCutting(sliceTree: any)` | 900 |  |
| `HandToolChainsaw:updateCutting(dt: any)` | 945 |  |
| `HandToolChainsaw:updateCuttingAnimation(dt: any)` | 976 |  |
| `HandToolChainsaw:updateSplitPlane()` | 1024 |  |
| `HandToolChainsaw:updateRingSelector(targetedTree: any, isCutPossible: any, cutMinimumY: any, cutMaximumY: any, cutMinimumZ: any, cutMaximumZ: any)` | 1076 |  |
| `HandToolChainsaw:calculateCutPlane()` | 1113 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `calculateCutPlane` | 71 |
| registerFunction | `getChainSpeedFactor` | 72 |
| registerFunction | `testIfTooLow` | 73 |
| registerFunction | `testIfCutAllowed` | 74 |
| registerFunction | `testIfCutValid` | 75 |
| registerFunction | `beginCutting` | 76 |
| registerFunction | `stopCutting` | 77 |
| registerFunction | `beginDelimbing` | 78 |
| registerFunction | `stopDelimbing` | 79 |
| registerFunction | `setCurrentCutState` | 80 |
| registerFunction | `updateCutting` | 81 |
| registerFunction | `updateCuttingAnimation` | 82 |
| registerFunction | `updateSplitPlane` | 83 |
| registerFunction | `updateRingSelector` | 84 |
| registerEventListener | `onDelete` | 89 |
| registerEventListener | `onLoad` | 90 |
| registerEventListener | `onPostLoad` | 91 |
| registerEventListener | `onUpdate` | 92 |
| registerEventListener | `onDraw` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onReadUpdateStream` | 95 |
| registerEventListener | `onHeldStart` | 96 |
| registerEventListener | `onHeldEnd` | 97 |
| registerEventListener | `onRegisterActionEvents` | 98 |
