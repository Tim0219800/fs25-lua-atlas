# objects/VehicleSellingPoint.lua

*[Version française](../../fr/scripts/objects/VehicleSellingPoint.md)*

Source: `dataS/scripts/objects/VehicleSellingPoint.lua` — FS25 1.25.1.0

✍ Vehicle dealer or workshop point placed on the map or on a placeable. A player trigger adds an activatable that opens the WorkshopScreen, and a sell-area trigger tracks the vehicle shapes standing in the zone so the workshop screen can list the owned vehicles and their attached implements. Only available in career missions (FSCareerMissionInfo); the map icon is shown according to the owner farm. The activatable class for it is defined at the end of the file.

- **VehicleSellingPoint** (l.9)
- **VehicleSellingPointActivatable** (l.211)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSellingPoint.registerXMLPaths(schema: any, basePath: any)` | 14 | ✍ Registers the XML paths: player trigger node, icon node, sell trigger node, own workshop flag and mobile workshop flag. |
| `VehicleSellingPoint.new() → table` | 26 | ✍ Constructor: creates the object with an empty table of vehicle shapes in range, empty activate text and enabled state. |
| `VehicleSellingPoint:load(components: any, xmlFile: any, key: any, i3dMappings: any)` | 40 | ✍ Reads the nodes and flags from XML, warns if the player trigger lacks the player collision bit or the sell trigger lacks the vehicle bit, registers both triggers, creates the activatable and subscribes to player farm change and player created messages. |
| `VehicleSellingPoint:delete()` | 67 | ✍ Unsubscribes from messages, removes both triggers, removes the activatable from the activatable system and clears the icon reference. |
| `VehicleSellingPoint:openMenu()` | 86 | ✍ Collects the current vehicles, configures `g_workshopScreen` with this selling point (dealer or workshop and mobile mode) and shows the `WorkshopScreen`. |
| `VehicleSellingPoint:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 101 | ✍ Player trigger callback: in career missions and when enabled, adds the activatable when the local player enters and removes it (refreshing the vehicle list) when they leave. |
| `VehicleSellingPoint:sellAreaTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: any)` | 123 | ✍ Sell area trigger callback: records or removes the entering or leaving shape, then pushes the refreshed vehicle list to `g_workshopScreen:updateVehicles`. |
| `VehicleSellingPoint:determineCurrentVehicles()` | 137 | ✍ Builds the list of vehicles in the sell area: for each live shape it takes the root vehicle's children that appear in the vehicle overview and belong to the player's farm, sorted by root node. Returns an empty list for spectators; also removes stale shapes. |
| `VehicleSellingPoint:updateIconVisibility()` | 175 | ✍ Shows the sell icon only if the point is enabled, the mission is a career, the local player is not a spectator and the owner is everyone or the player's farm. |
| `VehicleSellingPoint:playerFarmChanged(player: any)` | 187 | ✍ Message handler: refreshes icon visibility when the event concerns the local player. |
| `VehicleSellingPoint:setOwnerFarmId(ownerFarmId: any)` | 195 | ✍ Stores the owner farm id and refreshes icon visibility. |
| `VehicleSellingPoint:getOwnerFarmId()` | 202 | ✍ Returns the owner farm id (nil if never set). |
| `VehicleSellingPointActivatable.new(sellingPoint: any, ownWorkshop: any)` | 215 | ✍ Creates the activatable for a selling point with prompt text for workshop options if it is an own workshop, otherwise dealer options. |
| `VehicleSellingPointActivatable:getIsActivatable()` | 231 | ✍ Returns true only if the point is enabled, the local player is on foot, not a spectator, and the owner is everyone or the player's farm. |
| `VehicleSellingPointActivatable:run()` | 252 | ✍ Opens the selling point menu, or shows an info dialog instead while the guided tour is running. |
| `VehicleSellingPointActivatable:getDistance(x: any, y: any, z: any)` | 263 | ✍ Returns the horizontal (x, z) distance between the given point and the player trigger node. |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.59)
- subscribes `MessageType.PLAYER_CREATED` (l.60)
