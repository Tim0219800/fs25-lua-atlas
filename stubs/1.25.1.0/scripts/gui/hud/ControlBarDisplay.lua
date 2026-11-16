---@meta
-- FS25 1.25.1.0 : gui/hud/ControlBarDisplay.lua (generated stub, FS25 Lua Atlas)

--- HUD control bar with touch/gamepad buttons, derived from HUDDisplayElement. It declares tables of vehicle controls (attach, turn on, AI, leave, unload fork, leave horse), player controls (enter vehicle/horse, ride) and a custom activatable-object control, each naming the vehicle or player methods it calls (availableFunc, actionFunc, ...). It also shows up to two fill-level buttons with progress bars and slides between touch and controller positions on platforms with touch sliders. updateButtons, updateButtonPositions, updateControls-style helpers and the constants (UV, COLOR, POSITION, SIZE) are not defined in this file (UNVERIFIED).
---@class ControlBarDisplay : HUDDisplayElement
ControlBarDisplay = {}

--- Constructor taking the HUD, the HUD atlas path and the control atlas path. Builds an empty background frame, initialises state and fills the vehicleControls, playerControls and customControls tables (with priority, input action, icon UVs and colours), then calls createComponents.
---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function ControlBarDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

--- Creates a HUDButtonElement per control with its icon and input action. Button callbacks ignore input while the sleep manager is sleeping; vehicle buttons check allowedFunc (showing a 2.5 s blinking warning if refused) before calling actionFunc on the vehicle, player buttons call it on the player. Also creates two fill-level controls and stores touch and gamepad positions.
function ControlBarDisplay:createComponents() end

--- Sets the controlled vehicle, then refreshes the position state, fill-level buffers and buttons. If a toggle-seeds button exists, its glyph is made visible only when the attached sowing machine has more than one seed type.
---@param vehicle table
function ControlBarDisplay:setVehicle(vehicle) end

--- Stores the current player reference and updates the position state.
---@param player any
function ControlBarDisplay:setPlayer(player) end

--- Per-frame update: calls the parent update, then updateButtons and updateButtonPositions (both defined elsewhere, UNVERIFIED).
---@param dt any
function ControlBarDisplay:update(dt) end

--- Records the new input help mode (keyboard, gamepad...) and updates the position state, optionally forced.
---@param inputHelpMode any
---@param force any
function ControlBarDisplay:onInputHelpModeChange(inputHelpMode, force) end

--- Records the AI active state and updates the position state; the vehicle argument is unused.
---@param state any
---@param vehicle any
---@param force any
function ControlBarDisplay:onAIVehicleStateChanged(state, vehicle, force) end

--- Records whether gyroscope steering is active and updates the position state.
---@param state any
function ControlBarDisplay:onGyroscopeSteeringChanged(state) end

--- Chooses touch or controller layout: touch when the platform has touch sliders and the input is not gamepad (or a player is set on foot), controller otherwise or when gyroscope steering is on; then applies it.
---@param force any
function ControlBarDisplay:updatePositionState(force) end

--- Does nothing without touch sliders. On a state change, starts a tween to the touch or gamepad position (touch moves five times faster, forced changes are near instant).
---@param state any
---@param force any
function ControlBarDisplay:setPositionState(state, force) end

--- Creates one fill-level control: a toggle-seeds button with an icon, plus a background bar and a fill bar using the atlas UVs. Registers it with a priority and returns the control table.
function ControlBarDisplay:addFillLevelControl() end

--- Collector called by vehicle:getFillLevelInformation: adds level and capacity to the entry of the same fill type (and stores precision, maxReached) or appends a new entry, tracking insertion order for sorting.
---@param fillType any
---@param fillLevel any
---@param capacity any
---@param precision any
---@param maxReached any
function ControlBarDisplay:addFillLevel(fillType, fillLevel, capacity, precision, maxReached) end

--- Hides the fill-level buttons, zeroes the buffer, asks the vehicle for its fill level information, sorts by insertion order if needed and feeds each non-zero-capacity entry to a control (at most as many as controls exist).
---@param vehicle any
function ControlBarDisplay:updateFillLevelBuffers(vehicle) end

--- Table.sort comparator ordering fill-level entries by their addIndex.
---@param a any
---@param b any
function ControlBarDisplay.sortFillLevelBuffers(a, b) end

--- Sets the bar fill percentage (UVs and scale), swaps the button icon to the fill type's HUD overlay, links the sowing machine when its seed fill type matches, and sets the button active/visible state (visible if level above zero or tied to the sowing machine).
---@param fillLevelControl any
---@param fillLevelBuffer any
function ControlBarDisplay:updateFillLevelControl(fillLevelControl, fillLevelBuffer) end

--- Applies a uniform UI scale, recomputes background position and touch/gamepad positions, stores the original position and keeps the current visibility and touch position.
---@param uiScale any
function ControlBarDisplay:setScale(uiScale) end

--- Returns the background screen position from the POSITION.BACKGROUND constant multiplied by the scale; the width argument is unused.
---@param scale scale
---@param width number
---@return number
---@return number
function ControlBarDisplay.getBackgroundPosition(scale, width) end

--- Creates an image-less overlay with the SIZE.BACKGROUND dimensions, used only as a positioning frame.
function ControlBarDisplay.createBackground() end
