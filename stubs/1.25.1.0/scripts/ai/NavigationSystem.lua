---@meta
-- FS25 1.25.1.0 : ai/NavigationSystem.lua (generated stub, FS25 Lua Atlas)

--- Client-side helper that shows a navigation marker (an I3D marker model plus a `NavigationMarker` object) at a target position, optionally with a direction arrow, and draws it every frame through `g_currentMission:addDrawable`. It can persist the current target to a savegame XML file. `NavigationMarker` and `XMLFile` are not in the dump (UNVERIFIED).
---@class NavigationSystem
NavigationSystem = {}

--- Creates the system with a new `NavigationMarker` and empty position/direction nodes.
---@param customMt any
function NavigationSystem.new(customMt) end

--- Starts the asynchronous load of `$data/shared/assets/marker/navigationMarker.i3d` and keeps the request id. Always returns true.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function NavigationSystem:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Load callback: on success takes the first child as position node and its child as direction node, hides both, links the position node to the root node, refreshes the marker and deletes the loaded I3D root.
---@param i3dNode any
---@param failedReason any
---@param args any
function NavigationSystem:onNavigationMarkerLoaded(i3dNode, failedReason, args) end

--- Cancels a pending I3D load, deletes the position node and deletes the `NavigationMarker`.
function NavigationSystem:delete() end

--- Creates an XML file with the `navigationSystem` schema, stores the target position and, if set, direction, then saves and closes it. Writes nothing for the target when none is active.
---@param xmlFilename any
function NavigationSystem:saveToXMLFile(xmlFilename) end

--- Shows or hides the marker and nodes according to whether a target and direction exist, and moves the position node and orients the direction node (up vector 0,1,0) to the target.
function NavigationSystem:updateMarker() end

--- Draw callback that renders the `NavigationMarker`; registered with the mission while navigating.
function NavigationSystem:draw() end

--- Sets the target position (marker drawn 1.4 m above y) and optional direction, shows the marker, registers the system as drawable on `g_currentMission` and refreshes the nodes.
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
function NavigationSystem:navigateTo(x, y, z, dirX, dirY, dirZ) end

--- Clears the target and direction, unregisters the drawable from `g_currentMission` and hides the marker.
function NavigationSystem:stop() end
