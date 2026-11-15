# objects/AnimatedObject.lua

Source: `dataS/scripts/objects/AnimatedObject.lua` — FS25 1.25.1.0

- **AnimatedObject** inherits from `Object` (l.12)
- **AnimatedObjectBuilder** (l.807)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AnimatedObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 22 |  |
| `AnimatedObject:load(rootNode: integer\|table, xmlFile: XMLFile, key: string, xmlFilename: string, i3dMappings: table?) → boolean` | 53 |  |
| `AnimatedObject:loadFrameValues(xmlFile: XMLFile, key: string, node: integer) → number, number, number, number, number, number, number, number, number, integer` | 311 |  |
| `AnimatedObject:delete()` | 381 |  |
| `AnimatedObject:readStream(streamId: integer, connection: table)` | 426 |  |
| `AnimatedObject:writeStream(streamId: integer, connection: table)` | 444 |  |
| `AnimatedObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 457 |  |
| `AnimatedObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 475 |  |
| `AnimatedObject:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 490 |  |
| `AnimatedObject:update(dt: number)` | 542 |  |
| `AnimatedObject:setAnimTime(t: number, omitSound: any)` | 632 |  |
| `AnimatedObject:setFrameValues(node: integer, v: table)` | 676 |  |
| `AnimatedObject:hourChanged()` | 685 |  |
| `AnimatedObject:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 730 |  |
| `AnimatedObject.registerXMLPaths(schema: any, basePath: any)` | 749 |  |
| `AnimatedObject.registerSavegameXMLPaths(schema: any, basePath: any)` | 799 |  |
| `AnimatedObjectBuilder.registerXMLPaths(schema: any, basePath: any)` | 811 |  |
| `AnimatedObjectBuilder.new(animatedObject: any, xmlFilename: any, saveId: any)` | 819 |  |
| `AnimatedObjectBuilder:build(rootNodeId: any)` | 844 |  |
| `AnimatedObjectBuilder:setTrigger(node: any)` | 871 |  |
| `AnimatedObjectBuilder:setActions(posAction: any, posText: any, negAction: any, negText: any)` | 877 |  |
| `AnimatedObjectBuilder:addSimplePart(node: any, openRotation: any, openTranslation: any)` | 912 |  |
| `AnimatedObjectBuilder:setDuration(duration: any)` | 953 |  |
| `AnimatedObjectBuilder:setSounds(xmlFile: any, key: any, rootNode: any)` | 959 |  |
| `AnimatedObjectBuilder:setOpeningTimes(startTime: any, endTime: any, disableIfClosed: any, closedText: any)` | 970 |  |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.228)
- subscribes `MessageType.HOUR_CHANGED` (l.851)
