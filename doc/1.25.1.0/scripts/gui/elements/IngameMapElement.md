# gui/elements/IngameMapElement.lua

*[Version française](../../../fr/scripts/gui/elements/IngameMapElement.md)*

Source: `dataS/scripts/gui/elements/IngameMapElement.lua` — FS25 1.25.1.0

✍ IngameMapElement is the GuiElement that shows the full-screen in-game map inside menu pages. It delegates drawing to an IngameMap object (set with setIngameMap) and handles panning, zooming, a gamepad cursor, mouse and touch input, and picking of map hotspots. Platform.ingameMap settings drive zoom behaviour. XML keys: cursorId, mapAlpha, limitMapWidth, limitCursorMovement and callbacks onDrawPreIngameMap, onDrawPostIngameMap, onDrawPostIngameMapHotspots, onClickHotspot, onClickMap. Client-side UI only.

- **IngameMapElement** inherits from `GuiElement` (l.24)

## Functions

| Function | Line | Description |
|---|---|---|
| `IngameMapElement.new(target: any, custom_mt: any)` | 35 | ✍ Constructor. Initialises zoom limits (1 to 8, default from Platform), map center 0.5/0.5, accumulated input counters, drag thresholds, cursor and pinch state, and hotspot selection enabled. |
| `IngameMapElement:delete()` | 106 | ✍ Deletes the overlay, drops the ingameMap reference and calls the parent delete. The IngameMap object itself is not deleted here. |
| `IngameMapElement:loadFromXML(xmlFile: any, key: any)` | 115 | ✍ Reads cursorId, mapAlpha, limitMapWidth and limitCursorMovement and registers the five draw and click callbacks. |
| `IngameMapElement:loadProfile(profile: any, applyProfile: any)` | 132 | ✍ Reads mapAlpha, limitMapWidth and limitCursorMovement from the profile. |
| `IngameMapElement:copyAttributes(src: any)` | 142 | ✍ Copies zoom, alpha, cursor id, the two limit flags and the five callbacks from a source element. |
| `IngameMapElement:onGuiSetupFinished()` | 159 | ✍ Looks up the cursor element by cursorId on the target view and stores it; prints a warning if the target has no such field. |
| `IngameMapElement:addCursorDeadzone(screenX: any, screenY: any, width: any, height: any)` | 180 | ✍ Registers a screen rectangle (x, y, width, height) where map input such as dragging and zooming is ignored. |
| `IngameMapElement:clearCursorDeadzones()` | 186 | ✍ Removes all registered cursor deadzones. |
| `IngameMapElement:isInputInDeadzones(inputScreenX: any, inputScreenY: any)` | 192 | ✍ Returns true if the given screen point lies inside any registered deadzone. |
| `IngameMapElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 206 | ✍ Handles mouse input when active: switches to mouse mode and hides the cursor, drags the map when the pointer moves past the drag threshold, and on left button release without dragging triggers onClickMap and hotspot selection. Returns whether the event was used. |
| `IngameMapElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 289 | ✍ Touch version of mouseEvent, tracking positions per touch id and supporting a rotation-picking mode that clicks the map continuously outside the AI confirm button. Note: it calls the parent mouseEvent (not touchEvent) and passes touchId as the button argument. |
| `IngameMapElement:moveCenter(x: any, y: any)` | 393 | ✍ Shifts the map center by x, y, clamped to the map extent (a different rule on mobile or with limitCursorMovement), and pushes the new center to the full-screen map layout. |
| `IngameMapElement:panToHotspot(hotspot: hotspot, extraOffsetX: any)` | 420 | ✍ Centers the map on a hotspot's world position (desktop path) or computes a cursor offset on mobile. Does nothing for nil. The mobile path calls worldToScreenPos, which is not defined in this file: UNVERIFIED. |
| `IngameMapElement:zoom(direction: zoomTarget, zoomTarget: any)` | 456 | ✍ Changes the zoom by a signed step scaled by map width, or sets it to zoomTarget, clamped to zoomMin and zoomMax. Keeps the point under the pointer stable by recentring. Returns early if the platform cannot zoom. |
| `IngameMapElement:update(dt: any)` | 519 | ✍ Per-frame update: reads the last input mode, and unless a dialog is shown applies accumulated zoom input, shows the cursor for gamepad mode and moves it, then clears the per-frame input accumulators. |
| `IngameMapElement:resetFrameInputState()` | 549 | ✍ Zeroes the accumulated zoom and cursor inputs, clears the pending mouse reset, and on mobile ends a pinch by repositioning the cursor. |
| `IngameMapElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 568 | ✍ Raises the pre-map callback, draws the map, raises the post-map callback, draws the hotspots, raises the post-hotspot callback, then draws the element children via the parent. |
| `IngameMapElement:onOpen()` | 581 | ✍ Hides the cursor, remembers the initial size, switches the IngameMap to fullscreen and resets the zoom if the platform asks for it. |
| `IngameMapElement:onClose()` | 602 | ✍ Removes the registered input action events and takes the IngameMap out of fullscreen. |
| `IngameMapElement:reset()` | 612 | ✍ Resets the map center to 0.5/0.5 and the zoom to its default value. |
| `IngameMapElement:updateCursor(deltaX: any, deltaY: any, dt: any)` | 625 | ✍ Moves the gamepad cursor or the map from analog input, scaled by dt and aspect ratio. On mobile or with locked map movement, the cursor moves within offset limits; otherwise the map center moves. |
| `IngameMapElement:selectHotspotAt(posX: any, posY: any)` | 672 | ✍ If hotspot selection is active, picks the hotspot under a screen point, trying player-priority lists first via the IngameMap sorted hotspots. Uses getPlayerHotspot, not defined in this file: UNVERIFIED. |
| `IngameMapElement:selectHotspotFrom(hotspots: any, posX: any, posY: any)` | 696 | ✍ Scans a hotspot list from the end for visible, filter-enabled hotspots under the pointer, keeps the best by sorting value and distance, raises onClickHotspot and returns true if one was found. |
| `IngameMapElement:getLocalPosition(posX: any, posY: any)` | 733 | ✍ Converts a screen position to local map coordinates using the full-screen layout's map size and position (different scaling on mobile). |
| `IngameMapElement:getLocalPointerTarget()` | 754 | ✍ Returns the local map position of the active pointer: last mouse or touch position in mouse mode, the cursor center otherwise, or 0, 0 without cursor. |
| `IngameMapElement:onClickMap(localPosX: any, localPosY: any)` | 787 | ✍ Converts a local map position to world x, z and raises the onClickMap callback with them. |
| `IngameMapElement:localToWorldPos(localPosX: any, localPosY: any)` | 795 | ✍ Converts local map coordinates (0 to 1 scale) to world x, z using the terrain size, with z inverted and the origin at the terrain center. |
| `IngameMapElement:isPointVisible(x: any, z: any)` | 831 | ✍ Empty stub in this file: takes x, z and does nothing, returns nil. |
| `IngameMapElement:setIngameMap(ingameMap: any)` | 836 | ✍ Assigns the IngameMap object and, if limitMapWidth is set, limits the full-screen map width to this element's width. |
| `IngameMapElement:setTerrainSize(terrainSize: any)` | 845 | ✍ Stores the terrain size used to convert map positions to world coordinates. |
| `IngameMapElement:registerActionEvents()` | 876 | ✍ Registers input actions for horizontal and vertical map scrolling, accept, zoom in and zoom out with g_inputBinding, and a pinch gesture listener if a touch handler exists. |
| `IngameMapElement:removeActionEvents()` | 890 | ✍ Removes all action events registered for this element and the pinch gesture listener. |
| `IngameMapElement:onHorizontalCursorInput(_: any, inputValue: any)` | 900 | ✍ Action callback: accumulates horizontal cursor input unless the mouse is in use or the map is fixed horizontally, and records the input time on the map overview page for values above 0.05. |
| `IngameMapElement:onVerticalCursorInput(_: any, inputValue: any)` | 912 | ✍ Action callback: accumulates vertical cursor input unless the mouse is in use, and records the input time on the map overview page for values above 0.05. |
| `IngameMapElement:onAccept()` | 924 | ✍ Action callback for the accept button: clicks the map at the cursor position and selects the hotspot there if selection is active. Needs a cursor element. |
| `IngameMapElement:onZoomInput(_: inputValue, inputValue: direction, direction: any)` | 946 | ✍ Action callback: adds signed zoom input (direction times value) unless the mouse is in use over a deadzone. |
| `IngameMapElement:onPinchEvent(offset: number, pinchCenterX: pinchCenterX, pinchCenterY: pinchCenterY, distance: number)` | 958 | ✍ Pinch gesture callback: moves the cursor to the pinch center, adds the pinch offset (times 100) to the zoom input and flags pinching. |
| `IngameMapElement:checkAndResetMouse()` | 976 | ✍ Returns whether mouse mode is active and, if so, schedules the mouse flag to be cleared next frame. |
