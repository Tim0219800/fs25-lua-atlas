# ai/NavigationSystem.lua

*[Version française](../../fr/scripts/ai/NavigationSystem.md)*

Source: `dataS/scripts/ai/NavigationSystem.lua` — FS25 1.25.1.0

✍ Client-side helper that shows a navigation marker (an I3D marker model plus a `NavigationMarker` object) at a target position, optionally with a direction arrow, and draws it every frame through `g_currentMission:addDrawable`. It can persist the current target to a savegame XML file. `NavigationMarker` and `XMLFile` are not in the dump (UNVERIFIED).

- **NavigationSystem** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `NavigationSystem.new(customMt: any)` | 25 | ✍ Creates the system with a new `NavigationMarker` and empty position/direction nodes. |
| `NavigationSystem:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 39 | ✍ Starts the asynchronous load of `$data/shared/assets/marker/navigationMarker.i3d` and keeps the request id. Always returns true. |
| `NavigationSystem:onNavigationMarkerLoaded(i3dNode: any, failedReason: any, args: any)` | 49 | ✍ Load callback: on success takes the first child as position node and its child as direction node, hides both, links the position node to the root node, refreshes the marker and deletes the loaded I3D root. |
| `NavigationSystem:delete()` | 67 | ✍ Cancels a pending I3D load, deletes the position node and deletes the `NavigationMarker`. |
| `NavigationSystem:saveToXMLFile(xmlFilename: any)` | 86 | ✍ Creates an XML file with the `navigationSystem` schema, stores the target position and, if set, direction, then saves and closes it. Writes nothing for the target when none is active. |
| `NavigationSystem:updateMarker()` | 103 | ✍ Shows or hides the marker and nodes according to whether a target and direction exist, and moves the position node and orients the direction node (up vector 0,1,0) to the target. |
| `NavigationSystem:draw()` | 126 | ✍ Draw callback that renders the `NavigationMarker`; registered with the mission while navigating. |
| `NavigationSystem:navigateTo(x: any, y: any, z: any, dirX: any, dirY: any, dirZ: any)` | 132 | ✍ Sets the target position (marker drawn 1.4 m above y) and optional direction, shows the marker, registers the system as drawable on `g_currentMission` and refreshes the nodes. |
| `NavigationSystem:stop()` | 151 | ✍ Clears the target and direction, unregisters the drawable from `g_currentMission` and hides the marker. |
