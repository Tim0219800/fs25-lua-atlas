---@meta
-- FS25 1.25.1.0 : gui/base/GuiTopDownCursor.lua (generated stub, FS25 Lua Atlas)

--- Cursor helper for top-down (construction-style) views: shows a 3D cursor node, listens to input mode changes and tracks a mouse or screen-centre position. In this dump most method bodies are blank, so only the listed lifecycle, input and mouse handlers are visible.
---@class GuiTopDownCursor
GuiTopDownCursor = {}

--- Deactivates the cursor if active, deletes the cursor overlay and the root node, and cancels a pending I3D stream request. Call it when the owning screen is destroyed.
function GuiTopDownCursor:delete() end

--- Marks the cursor active, applies the current input mode, loads its shapes on first use, shows the root node according to its visibility flag, registers action events and subscribes to INPUT_MODE_CHANGED.
function GuiTopDownCursor:activate() end

--- Hides the root node, unsubscribes from all message center subscriptions, removes the registered action events and clears the active flag.
function GuiTopDownCursor:deactivate() end

--- Registers the AXIS_CONSTRUCTION_CURSOR_ROTATE action to the `onRotate` handler, sets it active only if rotation is enabled and gives its help text normal priority. `onRotate` itself is not visible in this dump (UNVERIFIED).
function GuiTopDownCursor:registerActionEvents() end

--- Forgets the rotate event id and removes every action event registered with this cursor as target.
function GuiTopDownCursor:removeActionEvents() end

--- Raw mouse handler ignored when the mouse is disabled or an action fired this frame. If the cursor was captured it restores the locked position and the system cursor, otherwise it stores the mouse position in mouse mode.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
function GuiTopDownCursor:mouseEvent(posX, posY, isDown, isUp, button) end

--- Callback for input mode changes: mouse mode is true when the first entry equals the keyboard help mode. Outside mouse mode the stored cursor position is reset to the screen centre (0.5, 0.5).
---@param inputMode any
function GuiTopDownCursor:onInputModeChanged(inputMode) end
