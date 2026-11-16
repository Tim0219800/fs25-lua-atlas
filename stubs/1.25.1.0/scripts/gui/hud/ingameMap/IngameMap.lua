---@meta
-- FS25 1.25.1.0 : gui/hud/ingameMap/IngameMap.lua (generated stub, FS25 Lua Atlas)

--- HUDElement that displays the map and its hotspots, both in the HUD mini-map and in the in-game menu. It holds several layouts (none, circle, square, large square, fullscreen), a hotspot list with category filters initialised from the INGAME_MAP_FILTER game setting, and converts world coordinates to map space. Client-side only. Layout classes and hotspot rendering are defined elsewhere (UNVERIFIED).
---@class IngameMap : HUDElement
IngameMap = {}

--- Creates the map element: background, the five layouts, category filters from the game setting, a default 2048x2048 world size and empty hotspot lists. Starts in the first layout state with toggling allowed.
---@param customMt table?
---@return table
function IngameMap.new(customMt) end

--- Removes input action events bound to this element, deletes the map element and layouts, clears the selected hotspot and deletes the parent.
function IngameMap:delete() end

--- Switches to the fullscreen layout or back to the layout of the current toggle state, without changing that state. No-op if unchanged.
---@param isFullscreen any
function IngameMap:setFullscreen(isFullscreen) end

--- Sets the map size state (clamped to 1..4) or advances to the next one cyclically when state is nil, saves it in the ingameMapState game setting and applies the matching layout. The force argument is unused.
---@param state any
---@param force any
function IngameMap:toggleSize(state, force) end

--- Ignored if the instance was already deleted; otherwise only clears the selected hotspot (the scale/position reset lines are commented out in the source).
function IngameMap:resetSettings() end

--- Sets whether the user may toggle the map size.
---@param isAllowed any
function IngameMap:setAllowToggle(isAllowed) end

--- Replaces the map texture with the given file, sets the world size and reapplies the UI scale. The fieldColor and grassFieldColor arguments are not used here.
---@param filename any
---@param worldSizeX any
---@param worldSizeZ any
---@param fieldColor any
---@param grassFieldColor any
function IngameMap:loadMap(filename, worldSizeX, worldSizeZ, fieldColor, grassFieldColor) end

--- Stores the world size in X and Z, derives the centre offsets and forwards the size to every layout.
---@param worldSizeX any
---@param worldSizeZ any
function IngameMap:setWorldSize(worldSizeX, worldSizeZ) end

--- Adds a hotspot to the list, re-sorts and resets the sorting caches, registers the map as render-state listener and returns the hotspot.
---@param mapHotspot any
function IngameMap:addMapHotspot(mapHotspot) end

--- Removes a hotspot (nil is ignored): deselects it, clears the mission map target if it was this one, unregisters the listener and resets sorting.
---@param mapHotspot any
function IngameMap:removeMapHotspot(mapHotspot) end

--- Deselects the previous hotspot and marks the new one as selected (either may be nil).
---@param hotspot any
function IngameMap:setSelectedHotspot(hotspot) end

--- Formats the player heading in degrees and map X/Z world coordinates as text and draws it through the current layout.
function IngameMap:drawPlayersCoordinates() end

--- In multiplayer client sessions, draws the latency to the server in ms, coloured good up to 50, medium below 100, bad otherwise (minimum shown 10 ms). Draws nothing otherwise.
function IngameMap:drawLatencyToServer() end

--- Draws one hotspot: converts its world position to map space, asks the layout for the screen position and visibility, applies the optional clip rectangle, stores last screen position/rotation/layout on the hotspot and renders it. The doDebug argument is unused.
---@param hotspot any
---@param smallVersion any
---@param scale any
---@param doDebug any
function IngameMap:drawHotspot(hotspot, smallVersion, scale, doDebug) end

--- Applies the UI scale through the parent implementation, stores it and recomputes the scaled values.
---@param uiScale number
function IngameMap:setScale(uiScale) end

--- Asks every layout to store its scaled values for the given scale and stores the scaled help anchor offset.
---@param uiScale any
function IngameMap:storeScaledValues(uiScale) end

--- Returns the base position of the element, the safe-frame offsets in X and Y.
function IngameMap:getBackgroundPosition() end

--- Creates the rounded background overlay (black, 75% opaque) at the base position with the configured size.
function IngameMap:createBackground() end

--- Creates the display components of the element; currently only the input glyph used to toggle the map size.
function IngameMap:createComponents() end

--- Creates the input glyph bound to InputAction.TOGGLE_MAP_SIZE, positions it relative to the element and adds it as a child.
---@param baseX any
---@param baseY any
---@param baseWidth any
---@param baseHeight any
function IngameMap:createToggleMapSizeGlyph(baseX, baseY, baseWidth, baseHeight) end
