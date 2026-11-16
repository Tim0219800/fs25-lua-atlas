# gui/hud/ingameMap/IngameMap.lua

*[Version française](../../../../fr/scripts/gui/hud/ingameMap/IngameMap.md)*

Source: `dataS/scripts/gui/hud/ingameMap/IngameMap.lua` — FS25 1.25.1.0

✍ HUDElement that displays the map and its hotspots, both in the HUD mini-map and in the in-game menu. It holds several layouts (none, circle, square, large square, fullscreen), a hotspot list with category filters initialised from the INGAME_MAP_FILTER game setting, and converts world coordinates to map space. Client-side only. Layout classes and hotspot rendering are defined elsewhere (UNVERIFIED).

- **IngameMap** inherits from `HUDElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `IngameMap.new(customMt: table?) → table` | 43 | ✍ Creates the map element: background, the five layouts, category filters from the game setting, a default 2048x2048 world size and empty hotspot lists. Starts in the first layout state with toggling allowed. |
| `IngameMap:delete()` | 120 | ✍ Removes input action events bound to this element, deletes the map element and layouts, clears the selected hotspot and deletes the parent. |
| `IngameMap:setFullscreen(isFullscreen: any)` | 139 | ✍ Switches to the fullscreen layout or back to the layout of the current toggle state, without changing that state. No-op if unchanged. |
| `IngameMap:toggleSize(state: any, force: any)` | 177 | ✍ Sets the map size state (clamped to 1..4) or advances to the next one cyclically when state is nil, saves it in the ingameMapState game setting and applies the matching layout. The force argument is unused. |
| `IngameMap:resetSettings()` | 217 | ✍ Ignored if the instance was already deleted; otherwise only clears the selected hotspot (the scale/position reset lines are commented out in the source). |
| `IngameMap:setAllowToggle(isAllowed: any)` | 249 | ✍ Sets whether the user may toggle the map size. |
| `IngameMap:loadMap(filename: any, worldSizeX: any, worldSizeZ: any, fieldColor: any, grassFieldColor: any)` | 270 | ✍ Replaces the map texture with the given file, sets the world size and reapplies the UI scale. The fieldColor and grassFieldColor arguments are not used here. |
| `IngameMap:setWorldSize(worldSizeX: any, worldSizeZ: any)` | 293 | ✍ Stores the world size in X and Z, derives the centre offsets and forwards the size to every layout. |
| `IngameMap:addMapHotspot(mapHotspot: any)` | 313 | ✍ Adds a hotspot to the list, re-sorts and resets the sorting caches, registers the map as render-state listener and returns the hotspot. |
| `IngameMap:removeMapHotspot(mapHotspot: any)` | 327 | ✍ Removes a hotspot (nil is ignored): deselects it, clears the mission map target if it was this one, unregisters the listener and resets sorting. |
| `IngameMap:setSelectedHotspot(hotspot: any)` | 353 | ✍ Deselects the previous hotspot and marks the new one as selected (either may be nil). |
| `IngameMap:drawPlayersCoordinates()` | 737 | ✍ Formats the player heading in degrees and map X/Z world coordinates as text and draws it through the current layout. |
| `IngameMap:drawLatencyToServer()` | 746 | ✍ In multiplayer client sessions, draws the latency to the server in ms, coloured good up to 50, medium below 100, bad otherwise (minimum shown 10 ms). Draws nothing otherwise. |
| `IngameMap:drawHotspot(hotspot: any, smallVersion: any, scale: any, doDebug: any)` | 801 | ✍ Draws one hotspot: converts its world position to map space, asks the layout for the screen position and visibility, applies the optional clip rectangle, stores last screen position/rotation/layout on the hotspot and renders it. The doDebug argument is unused. |
| `IngameMap:setScale(uiScale: number)` | 846 | ✍ Applies the UI scale through the parent implementation, stores it and recomputes the scaled values. |
| `IngameMap:storeScaledValues(uiScale: any)` | 855 | ✍ Asks every layout to store its scaled values for the given scale and stores the scaled help anchor offset. |
| `IngameMap:getBackgroundPosition()` | 882 | ✍ Returns the base position of the element, the safe-frame offsets in X and Y. |
| `IngameMap:createBackground()` | 895 | ✍ Creates the rounded background overlay (black, 75% opaque) at the base position with the configured size. |
| `IngameMap:createComponents()` | 907 | ✍ Creates the display components of the element; currently only the input glyph used to toggle the map size. |
| `IngameMap:createToggleMapSizeGlyph(baseX: any, baseY: any, baseWidth: any, baseHeight: any)` | 916 | ✍ Creates the input glyph bound to InputAction.TOGGLE_MAP_SIZE, positions it relative to the element and adds it as a child. |
