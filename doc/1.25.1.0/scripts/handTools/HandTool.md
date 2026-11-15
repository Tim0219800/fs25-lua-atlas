# handTools/HandTool.lua

Source: `dataS/scripts/handTools/HandTool.lua` — FS25 1.25.1.0

- **HandTool** inherits from `Object` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandTool.init()` | 26 |  |
| `HandTool.postInit()` | 41 |  |
| `HandTool.registerXMLPaths()` | 46 |  |
| `HandTool.registerSavegameXMLPaths(savegameXMLSchema: XMLSchema)` | 103 |  |
| `HandTool.registerEvents(handToolType: table)` | 155 |  |
| `HandTool.new(isServer: boolean, isClient: boolean, customMt: table?) → HandTool` | 195 |  |
| `HandTool:setFilename(filename: any)` | 230 |  |
| `HandTool:setType(typeDef: any)` | 239 |  |
| `HandTool:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 245 |  |
| `HandTool:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 327 |  |
| `HandTool:loadFinished()` | 343 |  |
| `HandTool:onFinishedLoading()` | 468 |  |
| `HandTool:createLoadingTask(target: any) → table` | 525 |  |
| `HandTool:finishLoadingTask(task: table)` | 532 |  |
| `HandTool:setLoadingState(loadingState: any)` | 538 |  |
| `HandTool:setLoadingStep(loadingStep: SpecializationLoadStep)` | 550 |  |
| `HandTool:delete()` | 556 |  |
| `HandTool:writeStream(streamId: integer, connection: Connection)` | 601 |  |
| `HandTool:readStream(streamId: integer, connection: Connection, objectId: integer)` | 613 |  |
| `HandTool:postWriteStream(streamId: integer, connection: table)` | 645 |  |
| `HandTool:postReadStream(streamId: integer, connection: table)` | 659 |  |
| `HandTool:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 676 |  |
| `HandTool:readUpdateStream(streamId: integer, timestamp: table, connection: table)` | 684 |  |
| `HandTool:getNeedsSaving()` | 690 |  |
| `HandTool:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 703 |  |
| `HandTool:getUniqueId() → string` | 724 |  |
| `HandTool:setUniqueId(uniqueId: string)` | 731 |  |
| `HandTool:register(alreadySent: any)` | 739 |  |
| `HandTool:getIsSynchronized() → boolean` | 748 |  |
| `HandTool:update(dt: number)` | 790 |  |
| `HandTool:updateTick(dt: any)` | 838 |  |
| `HandTool:startHolding()` | 848 |  |
| `HandTool:stopHolding()` | 888 |  |
| `HandTool:getIsCarried() → boolean` | 923 |  |
| `HandTool:setCarryingPlayer(player: Player)` | 930 |  |
| `HandTool:getCarryingPlayer() → Player` | 946 |  |
| `HandTool:periodChanged()` | 952 |  |
| `HandTool:getPrice()` | 959 |  |
| `HandTool:getSellPrice() → number` | 966 |  |
| `HandTool.calculateSellPrice(storeItem: any, age: any, price: any)` | 977 |  |
| `HandTool:getIsHeld() → boolean` | 1000 |  |
| `HandTool:setCarryingPlayerStyleChanged()` | 1040 |  |
| `HandTool:attachTool()` | 1082 |  |
| `HandTool:detachTool()` | 1104 |  |
| `HandTool:attachToolToHand()` | 1118 |  |
| `HandTool:attachToolToCamera()` | 1156 |  |
| `HandTool:clearActionEvents(clearCarriedActionEvents: boolean?)` | 1190 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 156 |
| registerEvent | `onLoad` | 157 |
| registerEvent | `onPostLoad` | 158 |
| registerEvent | `onLoadFinished` | 159 |
| registerEvent | `onDelete` | 160 |
| registerEvent | `onSave` | 161 |
| registerEvent | `onRegistered` | 162 |
| registerEvent | `onWriteStream` | 163 |
| registerEvent | `onReadStream` | 164 |
| registerEvent | `onWriteUpdateStream` | 165 |
| registerEvent | `onReadUpdateStream` | 166 |
| registerEvent | `onPreUpdate` | 167 |
| registerEvent | `onUpdate` | 168 |
| registerEvent | `onPostUpdate` | 169 |
| registerEvent | `onUpdateTick` | 170 |
| registerEvent | `onDraw` | 171 |
| registerEvent | `onRegisterActionEvents` | 173 |
| registerEvent | `onHandToolHolderChanged` | 174 |
| registerEvent | `onHeldStart` | 175 |
| registerEvent | `onHeldEnd` | 176 |
| registerEvent | `onCarryingPlayerStyleChanged` | 178 |
| registerEvent | `onCarryingPlayerShown` | 179 |
| registerEvent | `onCarryingPlayerHidden` | 180 |
| registerEvent | `onCarryingPlayerEnteredVehicle` | 181 |
| registerEvent | `onCarryingPlayerExitedVehicle` | 182 |
| registerEvent | `onCarryingPlayerChanged` | 183 |
| registerEvent | `onCarryingPlayerPerspectiveSwitched` | 184 |
| registerEvent | `onDebugDraw` | 186 |

## Messages

- subscribes `MessageType.PERIOD_CHANGED` (l.455)
