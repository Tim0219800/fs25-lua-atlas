---@meta
-- FS25 1.25.1.0 : gui/ConstructionScreen.lua (generated stub, FS25 Lua Atlas)

--- Client-side construction (build mode) screen, derived from ScreenElement. It owns a top-down camera, a cursor, construction sounds, the active brush, and caches of menu cells for the item list and attribute details. It gets brush classes from g_constructionBrushTypeManager and handles input contexts and action events. Much of the file is outside the described entries.
---@class ConstructionScreen : ScreenElement
ConstructionScreen = {}

--- Creates the screen with a GuiTopDownCamera, GuiTopDownCursor and ConstructionSound, no brush, and empty tables for items, events, marquee boxes, cloned elements and cell caches. Mouse mode is on by default.
---@param target table
---@param custom_mt table
---@return ConstructionScreen
function ConstructionScreen.new(target, custom_mt) end

--- Activates the construction input context, camera and cursor, shifts the safe frame by the menu width, and creates the select and destruct brushes on first use. It then selects the selector brush, rebuilds data, shows the input help and subscribes to messages. In first person on foot, it shows the player model.
function ConstructionScreen:onOpen() end

--- Reverses onOpen: hides the player model again if shown, unsubscribes from messages, restores input help and safe frame, and clears the open time. It removes the brush, deactivates cursor and camera, removes menu action events and reverts the input context.
---@param element table
function ConstructionScreen:onClose(element) end

--- Registers input action events for the current brush (primary, secondary, tertiary, and others) according to the brush flags such as dragging support. Stores event ids in brushEvents and sets high text priority on the main buttons. Does nothing without a brush.
function ConstructionScreen:registerBrushActionEvents() end

--- Removes every action event listed in brushEvents and clears the stored references to the primary, secondary, tertiary, fourth, axis, snapping and show-configs events.
function ConstructionScreen:removeBrushActionEvents() end

--- Builds the template table for the attribute layout: clones each element of attributesLayout by name and creates an empty cache for it. Prepares the reuse done by dequeueDetailsCell and queueDetailsCell.
function ConstructionScreen:buildCellDatabase() end

--- Returns a details cell of the given name, taken from the cache or cloned from its template, and adds it to the attributes layout. Returns nil if no template exists for that name.
---@param name string
---@return table
function ConstructionScreen:dequeueDetailsCell(name) end

--- Returns a cell to the cache of its name, removes it from the attributes layout and unlinks it. Note: no reset of the cell happens here, despite what one would expect from a cache release.
---@param cell table
function ConstructionScreen:queueDetailsCell(cell) end
