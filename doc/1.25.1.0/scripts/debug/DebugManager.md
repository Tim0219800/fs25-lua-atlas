# debug/DebugManager.lua

*[Version française](../../fr/scripts/debug/DebugManager.md)*

Source: `dataS/scripts/debug/DebugManager.lua` — FS25 1.25.1.0

✍ DebugManager is the manager that owns and draws debug elements (DebugLine, DebugText, DebugSpline, etc.). It derives from AbstractManager and is reached through the global `g_debugManager`. Elements are stored by id and by group, can be hidden per group, and are drawn in two passes: 3D elements before the UI, and objects with `drawDebug` after it. This dump only contains part of the file (initialisation, the two draw passes and two console commands); the other methods are absent, so the element/group API is UNVERIFIED here.

- **DebugManager** inherits from `AbstractManager` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugManager:initDataStructures()` | 29 | ✍ Resets all element tables, the debug material and the spline/occluder debug flags. On first call it also registers the console commands `gsDebugManagerClearElements`, `gsDebugManagerGroupsList`, `gsDebugManagerGroupVisibilitySet`, `gsDebugManagerGroupRemove`, `gsSplineDebug` and `gsTerrainLayerDebug`. |
| `DebugManager:unloadMapData()` | 75 | ✍ Clears the loaded-map flag and rebuilds the empty data structures, which drops every registered debug element when a map is unloaded. |
| `DebugManager:drawPreUI()` | 266 | ✍ Draws every element of every non-hidden group (if it has `draw` and its `getShouldBeDrawn` allows it), then draws and removes the single-frame elements. Intended for 3D content, rendered before the UI. |
| `DebugManager:drawPostUI()` | 286 | ✍ Calls `drawDebug` on every registered drawable, after the UI has been rendered so they can draw on top of it. |
| `DebugManager:consoleCommandRemoveElements() → string` | 362 | ✍ Console command handler: calls `delete` on each element that has one, empties the id, group and lifetime tables, and returns a confirmation string. Frame elements and drawables are left untouched. |
| `DebugManager:consoleCommandSplineToggleDebug(displayEPsStr: string) → string` | 444 | ✍ Console command handler that toggles spline debugging. When enabled, it walks the whole scene from the root node, recolours each spline with the debug material and adds a DebugSpline (clip distance 500) to group `splineDebug`; when disabled it removes that group. Returns a status string. |
