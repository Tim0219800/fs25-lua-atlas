# objects/InlineBale.lua

Source: `dataS/scripts/objects/InlineBale.lua` — FS25 1.25.1.0

- **InlineBale** inherits from `Object` (l.21)
- **InlineBaleActivatable** (l.942)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `InlineBale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 66 |  |
| `InlineBale:delete()` | 111 |  |
| `InlineBale:loadFromConfigXML(configFileName: configFileName) → table` | 123 |  |
| `InlineBale:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 199 |  |
| `InlineBale:saveToXMLFile(xmlFile: any, key: any)` | 243 |  |
| `InlineBale:readStream(streamId: integer, connection: table)` | 262 |  |
| `InlineBale:writeStream(streamId: integer, connection: table)` | 276 |  |
| `InlineBale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 289 |  |
| `InlineBale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 305 |  |
| `InlineBale:readBales(streamId: any, timestamp: any, connection: any)` | 318 |  |
| `InlineBale:writeBales(streamId: any, connection: any, dirtyMask: any)` | 345 |  |
| `InlineBale:update(dt: number)` | 363 |  |
| `InlineBale:updateTick(dt: number)` | 369 |  |
| `InlineBale:addBale(bale: any, baleType: any)` | 488 |  |
| `InlineBale:getIsBaleAllowed(bale: any, baleType: any)` | 532 |  |
| `InlineBale:replacePendingBale(spawnNode: any, color: any)` | 550 |  |
| `InlineBale:getPendingBale()` | 590 |  |
| `InlineBale:connectPendingBale()` | 596 |  |
| `InlineBale:connectBale(bale: any)` | 613 |  |
| `InlineBale:createBaleJoint(bale1: any, bale2: any)` | 623 |  |
| `InlineBale:updateBaleJoints(dt: any)` | 648 |  |
| `InlineBale:setBaleJointLimits(jointIndex: any, alpha: any)` | 661 |  |
| `InlineBale:loadBaleConnector(bale1: any, bale2: any, filename: any)` | 675 |  |
| `InlineBale:removeBaleConnector(bale: any)` | 691 |  |
| `InlineBale:setCurrentWrapperInfo(wrapper: any, wrappingNode: any)` | 699 |  |
| `InlineBale:getNumberOfBales()` | 711 |  |
| `InlineBale:getBales()` | 717 |  |
| `InlineBale:setWrappingState(state: any)` | 733 |  |
| `InlineBale:wakeUp(delay: any)` | 743 |  |
| `InlineBale:getCanInteract()` | 756 |  |
| `InlineBale:getInteractionPosition()` | 789 |  |
| `InlineBale:getCanBeOpened()` | 803 |  |
| `InlineBale:openBaleAtPosition(x: any, y: any, z: any)` | 815 |  |
| `InlineBale:openBale(bale: any, isFirst: any, replaceBale: any)` | 838 |  |
| `InlineBale:onBaleDeleted(bale: any)` | 902 |  |
| `InlineBaleActivatable.new(inlineBale: any)` | 946 |  |
| `InlineBaleActivatable:getIsActivatable()` | 957 |  |
| `InlineBaleActivatable:run()` | 969 |  |
