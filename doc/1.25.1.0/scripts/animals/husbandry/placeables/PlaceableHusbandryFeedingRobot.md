# animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua

*[Version française](../../../../fr/scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.md)*

Source: `dataS/scripts/animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua` — FS25 1.25.1.0

✍ Placeable specialization that adds an automatic feeding robot to a husbandry. It requires `PlaceableHusbandryFood`, instantiates the class named in `placeable.husbandry.feedingRobot#class` from a config file, moves it along splines defined in the XML, and ties its driving state to optional animated objects. It also forwards network streams and savegame data to the robot object and makes the robot mix food in proportion to the husbandry's consumption (the robot class itself is not in this file).

- **PlaceableHusbandryFeedingRobot** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableHusbandryFeedingRobot.prerequisitesPresent(specializations: table) → boolean` | 29 | ✍ Returns true only if the `PlaceableHusbandryFood` specialization is present. |
| `PlaceableHusbandryFeedingRobot.registerFunctions(placeableType: any)` | 35 | ✍ Registers the method `onFeedingRobotLoaded` on the placeable type. |
| `PlaceableHusbandryFeedingRobot.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Registers overrides of `setOwnerFarmId`, `updateFeeding`, `collectPickObjects` and `updateInfo`. |
| `PlaceableHusbandryFeedingRobot.registerEventListeners(placeableType: any)` | 50 | ✍ Subscribes to `onLoad`, `onPostLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` and `onWriteStream`. |
| `PlaceableHusbandryFeedingRobot.registerXMLPaths(schema: any, basePath: any)` | 61 | ✍ Registers the XML keys under `husbandry.feedingRobot`: link node, class, config file, spline entries (node, direction, feeding flag, fake length, stop at end) and dependent animated objects. |
| `PlaceableHusbandryFeedingRobot.registerSavegameXMLPaths(schema: any, basePath: any)` | 79 | ✍ Registers the savegame XML paths by delegating to `FeedingRobot.registerSavegameXMLPaths`. |
| `PlaceableHusbandryFeedingRobot:onLoad(savegame: any)` | 87 | ✍ Does nothing without a `feedingRobot` XML node. Otherwise requires filename, class and link node (error state if missing), creates and registers the robot with an async load, adds the splines or fake waiting points, and records the dependent animated objects. |
| `PlaceableHusbandryFeedingRobot:onPostLoad(savegame: any)` | 159 | ✍ For each dependent animated object, blocks its trigger while the robot is driving and makes it switch to the configured direction whenever the robot starts driving. Requires the animated objects specialization. |
| `PlaceableHusbandryFeedingRobot:onFeedingRobotLoaded(robot: any, args: any)` | 189 | ✍ Callback when the robot finishes loading: completes the placeable's loading task. |
| `PlaceableHusbandryFeedingRobot:onDelete()` | 195 | ✍ Deletes the feeding robot object if one exists. |
| `PlaceableHusbandryFeedingRobot:onFinalizePlacement()` | 205 | ✍ Forwards the placement finalization to the feeding robot. |
| `PlaceableHusbandryFeedingRobot:onReadStream(streamId: any, connection: any)` | 214 | ✍ Network read: reads the robot's object id, its stream data, then completes its client-side registration. |
| `PlaceableHusbandryFeedingRobot:onWriteStream(streamId: any, connection: any)` | 225 | ✍ Network write: writes the robot's object id and stream data, and registers it in the connection's stream. |
| `PlaceableHusbandryFeedingRobot:loadFromXMLFile(xmlFile: any, key: any)` | 236 | ✍ Delegates savegame loading to the feeding robot. |
| `PlaceableHusbandryFeedingRobot:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 245 | ✍ Delegates savegame saving to the feeding robot. |
| `PlaceableHusbandryFeedingRobot:setOwnerFarmId(superFunc: any, farmId: any)` | 254 | ✍ Override: calls the parent, then gives the same owner farm id to the feeding robot. |
| `PlaceableHusbandryFeedingRobot:updateFeeding(superFunc: any)` | 265 | ✍ Override: on the server asks the robot to create a food mixture of 1.5 times the hourly food consumption scaled by the environment's time adjustment, then calls the parent. |
| `PlaceableHusbandryFeedingRobot:collectPickObjects(superFunc: any, node: any)` | 279 | ✍ Override: skips nodes that belong to the feeding robot so they are not collected as pick objects; otherwise defers to the parent. |
| `PlaceableHusbandryFeedingRobot:updateInfo(superFunc: any, infoTable: any)` | 292 | ✍ Override: calls the parent then lets the robot append its own info entries. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onFeedingRobotLoaded` | 36 |
| registerOverwrittenFunction | `setOwnerFarmId` | 42 |
| registerOverwrittenFunction | `updateFeeding` | 43 |
| registerOverwrittenFunction | `collectPickObjects` | 44 |
| registerOverwrittenFunction | `updateInfo` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onPostLoad` | 52 |
| registerEventListener | `onDelete` | 53 |
| registerEventListener | `onFinalizePlacement` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteStream` | 56 |
