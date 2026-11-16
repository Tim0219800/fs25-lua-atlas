---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that adds an automatic feeding robot to a husbandry. It requires `PlaceableHusbandryFood`, instantiates the class named in `placeable.husbandry.feedingRobot#class` from a config file, moves it along splines defined in the XML, and ties its driving state to optional animated objects. It also forwards network streams and savegame data to the robot object and makes the robot mix food in proportion to the husbandry's consumption (the robot class itself is not in this file).
---@class PlaceableHusbandryFeedingRobot
PlaceableHusbandryFeedingRobot = {}

--- Returns true only if the `PlaceableHusbandryFood` specialization is present.
---@param specializations table
---@return boolean
function PlaceableHusbandryFeedingRobot.prerequisitesPresent(specializations) end

--- Registers the method `onFeedingRobotLoaded` on the placeable type.
---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerFunctions(placeableType) end

--- Registers overrides of `setOwnerFarmId`, `updateFeeding`, `collectPickObjects` and `updateInfo`.
---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onPostLoad`, `onDelete`, `onFinalizePlacement`, `onReadStream` and `onWriteStream`.
---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerEventListeners(placeableType) end

--- Registers the XML keys under `husbandry.feedingRobot`: link node, class, config file, spline entries (node, direction, feeding flag, fake length, stop at end) and dependent animated objects.
---@param schema any
---@param basePath any
function PlaceableHusbandryFeedingRobot.registerXMLPaths(schema, basePath) end

--- Registers the savegame XML paths by delegating to `FeedingRobot.registerSavegameXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableHusbandryFeedingRobot.registerSavegameXMLPaths(schema, basePath) end

--- Does nothing without a `feedingRobot` XML node. Otherwise requires filename, class and link node (error state if missing), creates and registers the robot with an async load, adds the splines or fake waiting points, and records the dependent animated objects.
---@param savegame any
function PlaceableHusbandryFeedingRobot:onLoad(savegame) end

--- For each dependent animated object, blocks its trigger while the robot is driving and makes it switch to the configured direction whenever the robot starts driving. Requires the animated objects specialization.
---@param savegame any
function PlaceableHusbandryFeedingRobot:onPostLoad(savegame) end

--- Callback when the robot finishes loading: completes the placeable's loading task.
---@param robot any
---@param args any
function PlaceableHusbandryFeedingRobot:onFeedingRobotLoaded(robot, args) end

--- Deletes the feeding robot object if one exists.
function PlaceableHusbandryFeedingRobot:onDelete() end

--- Forwards the placement finalization to the feeding robot.
function PlaceableHusbandryFeedingRobot:onFinalizePlacement() end

--- Network read: reads the robot's object id, its stream data, then completes its client-side registration.
---@param streamId any
---@param connection any
function PlaceableHusbandryFeedingRobot:onReadStream(streamId, connection) end

--- Network write: writes the robot's object id and stream data, and registers it in the connection's stream.
---@param streamId any
---@param connection any
function PlaceableHusbandryFeedingRobot:onWriteStream(streamId, connection) end

--- Delegates savegame loading to the feeding robot.
---@param xmlFile any
---@param key any
function PlaceableHusbandryFeedingRobot:loadFromXMLFile(xmlFile, key) end

--- Delegates savegame saving to the feeding robot.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryFeedingRobot:saveToXMLFile(xmlFile, key, usedModNames) end

--- Override: calls the parent, then gives the same owner farm id to the feeding robot.
---@param superFunc any
---@param farmId any
function PlaceableHusbandryFeedingRobot:setOwnerFarmId(superFunc, farmId) end

--- Override: on the server asks the robot to create a food mixture of 1.5 times the hourly food consumption scaled by the environment's time adjustment, then calls the parent.
---@param superFunc any
function PlaceableHusbandryFeedingRobot:updateFeeding(superFunc) end

--- Override: skips nodes that belong to the feeding robot so they are not collected as pick objects; otherwise defers to the parent.
---@param superFunc any
---@param node any
function PlaceableHusbandryFeedingRobot:collectPickObjects(superFunc, node) end

--- Override: calls the parent then lets the robot append its own info entries.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryFeedingRobot:updateInfo(superFunc, infoTable) end
