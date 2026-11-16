---@meta
-- FS25 1.25.1.0 : gui/elements/IngameMapElement.lua (generated stub, FS25 Lua Atlas)

--- IngameMapElement is the GuiElement that shows the full-screen in-game map inside menu pages. It delegates drawing to an IngameMap object (set with setIngameMap) and handles panning, zooming, a gamepad cursor, mouse and touch input, and picking of map hotspots. Platform.ingameMap settings drive zoom behaviour. XML keys: cursorId, mapAlpha, limitMapWidth, limitCursorMovement and callbacks onDrawPreIngameMap, onDrawPostIngameMap, onDrawPostIngameMapHotspots, onClickHotspot, onClickMap. Client-side UI only.
---@class IngameMapElement : GuiElement
IngameMapElement = {}

--- Constructor. Initialises zoom limits (1 to 8, default from Platform), map center 0.5/0.5, accumulated input counters, drag thresholds, cursor and pinch state, and hotspot selection enabled.
---@param target any
---@param custom_mt any
function IngameMapElement.new(target, custom_mt) end

--- Deletes the overlay, drops the ingameMap reference and calls the parent delete. The IngameMap object itself is not deleted here.
function IngameMapElement:delete() end

--- Reads cursorId, mapAlpha, limitMapWidth and limitCursorMovement and registers the five draw and click callbacks.
---@param xmlFile any
---@param key any
function IngameMapElement:loadFromXML(xmlFile, key) end

--- Reads mapAlpha, limitMapWidth and limitCursorMovement from the profile.
---@param profile any
---@param applyProfile any
function IngameMapElement:loadProfile(profile, applyProfile) end

--- Copies zoom, alpha, cursor id, the two limit flags and the five callbacks from a source element.
---@param src any
function IngameMapElement:copyAttributes(src) end

--- Looks up the cursor element by cursorId on the target view and stores it; prints a warning if the target has no such field.
function IngameMapElement:onGuiSetupFinished() end

--- Registers a screen rectangle (x, y, width, height) where map input such as dragging and zooming is ignored.
---@param screenX any
---@param screenY any
---@param width any
---@param height any
function IngameMapElement:addCursorDeadzone(screenX, screenY, width, height) end

--- Removes all registered cursor deadzones.
function IngameMapElement:clearCursorDeadzones() end

--- Returns true if the given screen point lies inside any registered deadzone.
---@param inputScreenX any
---@param inputScreenY any
function IngameMapElement:isInputInDeadzones(inputScreenX, inputScreenY) end

--- Handles mouse input when active: switches to mouse mode and hides the cursor, drags the map when the pointer moves past the drag threshold, and on left button release without dragging triggers onClickMap and hotspot selection. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function IngameMapElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Touch version of mouseEvent, tracking positions per touch id and supporting a rotation-picking mode that clicks the map continuously outside the AI confirm button. Note: it calls the parent mouseEvent (not touchEvent) and passes touchId as the button argument.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function IngameMapElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Shifts the map center by x, y, clamped to the map extent (a different rule on mobile or with limitCursorMovement), and pushes the new center to the full-screen map layout.
---@param x any
---@param y any
function IngameMapElement:moveCenter(x, y) end

--- Centers the map on a hotspot's world position (desktop path) or computes a cursor offset on mobile. Does nothing for nil. The mobile path calls worldToScreenPos, which is not defined in this file: UNVERIFIED.
---@param hotspot hotspot
---@param extraOffsetX any
function IngameMapElement:panToHotspot(hotspot, extraOffsetX) end

--- Changes the zoom by a signed step scaled by map width, or sets it to zoomTarget, clamped to zoomMin and zoomMax. Keeps the point under the pointer stable by recentring. Returns early if the platform cannot zoom.
---@param direction zoomTarget
---@param zoomTarget any
function IngameMapElement:zoom(direction, zoomTarget) end

--- Per-frame update: reads the last input mode, and unless a dialog is shown applies accumulated zoom input, shows the cursor for gamepad mode and moves it, then clears the per-frame input accumulators.
---@param dt any
function IngameMapElement:update(dt) end

--- Zeroes the accumulated zoom and cursor inputs, clears the pending mouse reset, and on mobile ends a pinch by repositioning the cursor.
function IngameMapElement:resetFrameInputState() end

--- Raises the pre-map callback, draws the map, raises the post-map callback, draws the hotspots, raises the post-hotspot callback, then draws the element children via the parent.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function IngameMapElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Hides the cursor, remembers the initial size, switches the IngameMap to fullscreen and resets the zoom if the platform asks for it.
function IngameMapElement:onOpen() end

--- Removes the registered input action events and takes the IngameMap out of fullscreen.
function IngameMapElement:onClose() end

--- Resets the map center to 0.5/0.5 and the zoom to its default value.
function IngameMapElement:reset() end

--- Moves the gamepad cursor or the map from analog input, scaled by dt and aspect ratio. On mobile or with locked map movement, the cursor moves within offset limits; otherwise the map center moves.
---@param deltaX any
---@param deltaY any
---@param dt any
function IngameMapElement:updateCursor(deltaX, deltaY, dt) end

--- If hotspot selection is active, picks the hotspot under a screen point, trying player-priority lists first via the IngameMap sorted hotspots. Uses getPlayerHotspot, not defined in this file: UNVERIFIED.
---@param posX any
---@param posY any
function IngameMapElement:selectHotspotAt(posX, posY) end

--- Scans a hotspot list from the end for visible, filter-enabled hotspots under the pointer, keeps the best by sorting value and distance, raises onClickHotspot and returns true if one was found.
---@param hotspots any
---@param posX any
---@param posY any
function IngameMapElement:selectHotspotFrom(hotspots, posX, posY) end

--- Converts a screen position to local map coordinates using the full-screen layout's map size and position (different scaling on mobile).
---@param posX any
---@param posY any
function IngameMapElement:getLocalPosition(posX, posY) end

--- Returns the local map position of the active pointer: last mouse or touch position in mouse mode, the cursor center otherwise, or 0, 0 without cursor.
function IngameMapElement:getLocalPointerTarget() end

--- Converts a local map position to world x, z and raises the onClickMap callback with them.
---@param localPosX any
---@param localPosY any
function IngameMapElement:onClickMap(localPosX, localPosY) end

--- Converts local map coordinates (0 to 1 scale) to world x, z using the terrain size, with z inverted and the origin at the terrain center.
---@param localPosX any
---@param localPosY any
function IngameMapElement:localToWorldPos(localPosX, localPosY) end

--- Empty stub in this file: takes x, z and does nothing, returns nil.
---@param x any
---@param z any
function IngameMapElement:isPointVisible(x, z) end

--- Assigns the IngameMap object and, if limitMapWidth is set, limits the full-screen map width to this element's width.
---@param ingameMap any
function IngameMapElement:setIngameMap(ingameMap) end

--- Stores the terrain size used to convert map positions to world coordinates.
---@param terrainSize any
function IngameMapElement:setTerrainSize(terrainSize) end

--- Registers input actions for horizontal and vertical map scrolling, accept, zoom in and zoom out with g_inputBinding, and a pinch gesture listener if a touch handler exists.
function IngameMapElement:registerActionEvents() end

--- Removes all action events registered for this element and the pinch gesture listener.
function IngameMapElement:removeActionEvents() end

--- Action callback: accumulates horizontal cursor input unless the mouse is in use or the map is fixed horizontally, and records the input time on the map overview page for values above 0.05.
---@param _ any
---@param inputValue any
function IngameMapElement:onHorizontalCursorInput(_, inputValue) end

--- Action callback: accumulates vertical cursor input unless the mouse is in use, and records the input time on the map overview page for values above 0.05.
---@param _ any
---@param inputValue any
function IngameMapElement:onVerticalCursorInput(_, inputValue) end

--- Action callback for the accept button: clicks the map at the cursor position and selects the hotspot there if selection is active. Needs a cursor element.
function IngameMapElement:onAccept() end

--- Action callback: adds signed zoom input (direction times value) unless the mouse is in use over a deadzone.
---@param _ inputValue
---@param inputValue direction
---@param direction any
function IngameMapElement:onZoomInput(_, inputValue, direction) end

--- Pinch gesture callback: moves the cursor to the pinch center, adds the pinch offset (times 100) to the zoom input and flags pinching.
---@param offset number
---@param pinchCenterX pinchCenterX
---@param pinchCenterY pinchCenterY
---@param distance number
function IngameMapElement:onPinchEvent(offset, pinchCenterX, pinchCenterY, distance) end

--- Returns whether mouse mode is active and, if so, schedules the mouse flag to be cleared next frame.
function IngameMapElement:checkAndResetMouse() end
