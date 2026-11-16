---@meta
-- FS25 1.25.1.0 : objects/VehicleSellingPoint.lua (generated stub, FS25 Lua Atlas)

--- Vehicle dealer or workshop point placed on the map or on a placeable. A player trigger adds an activatable that opens the WorkshopScreen, and a sell-area trigger tracks the vehicle shapes standing in the zone so the workshop screen can list the owned vehicles and their attached implements. Only available in career missions (FSCareerMissionInfo); the map icon is shown according to the owner farm. The activatable class for it is defined at the end of the file.
---@class VehicleSellingPoint
VehicleSellingPoint = {}

--- Vehicle dealer or workshop point placed on the map or on a placeable. A player trigger adds an activatable that opens the WorkshopScreen, and a sell-area trigger tracks the vehicle shapes standing in the zone so the workshop screen can list the owned vehicles and their attached implements. Only available in career missions (FSCareerMissionInfo); the map icon is shown according to the owner farm. The activatable class for it is defined at the end of the file.
---@class VehicleSellingPointActivatable
VehicleSellingPointActivatable = {}

--- Registers the XML paths: player trigger node, icon node, sell trigger node, own workshop flag and mobile workshop flag.
---@param schema any
---@param basePath any
function VehicleSellingPoint.registerXMLPaths(schema, basePath) end

--- Constructor: creates the object with an empty table of vehicle shapes in range, empty activate text and enabled state.
---@return table
function VehicleSellingPoint.new() end

--- Reads the nodes and flags from XML, warns if the player trigger lacks the player collision bit or the sell trigger lacks the vehicle bit, registers both triggers, creates the activatable and subscribes to player farm change and player created messages.
---@param components any
---@param xmlFile any
---@param key any
---@param i3dMappings any
function VehicleSellingPoint:load(components, xmlFile, key, i3dMappings) end

--- Unsubscribes from messages, removes both triggers, removes the activatable from the activatable system and clears the icon reference.
function VehicleSellingPoint:delete() end

--- Collects the current vehicles, configures `g_workshopScreen` with this selling point (dealer or workshop and mobile mode) and shows the `WorkshopScreen`.
function VehicleSellingPoint:openMenu() end

--- Player trigger callback: in career missions and when enabled, adds the activatable when the local player enters and removes it (refreshing the vehicle list) when they leave.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function VehicleSellingPoint:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Sell area trigger callback: records or removes the entering or leaving shape, then pushes the refreshed vehicle list to `g_workshopScreen:updateVehicles`.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId any
function VehicleSellingPoint:sellAreaTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Builds the list of vehicles in the sell area: for each live shape it takes the root vehicle's children that appear in the vehicle overview and belong to the player's farm, sorted by root node. Returns an empty list for spectators; also removes stale shapes.
function VehicleSellingPoint:determineCurrentVehicles() end

--- Shows the sell icon only if the point is enabled, the mission is a career, the local player is not a spectator and the owner is everyone or the player's farm.
function VehicleSellingPoint:updateIconVisibility() end

--- Message handler: refreshes icon visibility when the event concerns the local player.
---@param player any
function VehicleSellingPoint:playerFarmChanged(player) end

--- Stores the owner farm id and refreshes icon visibility.
---@param ownerFarmId any
function VehicleSellingPoint:setOwnerFarmId(ownerFarmId) end

--- Returns the owner farm id (nil if never set).
function VehicleSellingPoint:getOwnerFarmId() end

--- Creates the activatable for a selling point with prompt text for workshop options if it is an own workshop, otherwise dealer options.
---@param sellingPoint any
---@param ownWorkshop any
function VehicleSellingPointActivatable.new(sellingPoint, ownWorkshop) end

--- Returns true only if the point is enabled, the local player is on foot, not a spectator, and the owner is everyone or the player's farm.
function VehicleSellingPointActivatable:getIsActivatable() end

--- Opens the selling point menu, or shows an info dialog instead while the guided tour is running.
function VehicleSellingPointActivatable:run() end

--- Returns the horizontal (x, z) distance between the given point and the player trigger node.
---@param x any
---@param y any
---@param z any
function VehicleSellingPointActivatable:getDistance(x, y, z) end
