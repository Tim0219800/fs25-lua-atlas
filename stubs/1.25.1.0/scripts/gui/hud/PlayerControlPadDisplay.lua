---@meta
-- FS25 1.25.1.0 : gui/hud/PlayerControlPadDisplay.lua (generated stub, FS25 Lua Atlas)

--- Touch joystick pad for on-foot movement in the mobile UI (extends HUDDisplayElement). It combines a background, a joystick knob and two HUDSliderElements (X and Y axes); the normalized stick position is sent every update to the player with onInputMoveSide and onInputMoveForward. Visibility follows the input help mode and whether the player can move. Client-side only.
---@class PlayerControlPadDisplay : HUDDisplayElement
PlayerControlPadDisplay = {}

--- Creates the pad with its HUD reference and atlas path, a centered stick position and the keyboard help mode as initial state, then builds its components.
---@param hud string
---@param hudAtlasPath string
function PlayerControlPadDisplay.new(hud, hudAtlasPath) end

--- Assigns the player that receives the movement input and refreshes visibility.
---@param player any
function PlayerControlPadDisplay:setPlayer(player) end

--- Builds the background and knob elements and two HUDSliderElements (one per axis) with callbacks to onSliderPositionChangedX/Y, then centers both sliders.
function PlayerControlPadDisplay:createComponents() end

--- Hides always works; showing is ignored while the input help mode is gamepad. Otherwise delegates to the parent setVisible.
---@param isVisible boolean
---@param animate boolean
function PlayerControlPadDisplay:setVisible(isVisible, animate) end

--- Slider callback for the X axis: maps the 0..1 position to -1..1, clamps the stick to the unit circle and moves the knob horizontally. Returns the corrected position if clamped (nil otherwise).
---@param position any
function PlayerControlPadDisplay:onSliderPositionChangedX(position) end

--- Slider callback for the Y axis: maps the 0..1 position to -1..1 and clamps the stick to the unit circle, returning the corrected Y when clamped.
---@param position any
function PlayerControlPadDisplay:onSliderPositionChangedY(position) end

--- When the stick vector exceeds length 1, normalizes it and moves both sliders to the clamped position, returning the new X and Y translations; otherwise returns nil.
function PlayerControlPadDisplay:updateJoystickPosition() end

--- Stores the new input help mode and refreshes visibility.
---@param inputHelpMode any
function PlayerControlPadDisplay:onInputHelpModeChange(inputHelpMode) end

--- Shows or hides the pad with animation when the desired state differs from the current one, and enables or disables the sliders' touch handling. Uses getIsPlayerMoveActive and animationState, defined elsewhere (UNVERIFIED).
function PlayerControlPadDisplay:updateVisibilityState() end

--- Updates the animation, syncs the knob to the sliders and, when a player is set, updates the sliders and sends the stick values to onInputMoveSide and onInputMoveForward (Y inverted). Note: canControl is hard-coded true, so the disabled UVs are never used.
---@param dt any
function PlayerControlPadDisplay:update(dt) end

--- Runs the parent handler and, when the pad has become visible, resets both sliders.
---@param isVisible any
function PlayerControlPadDisplay:onAnimateVisibilityFinished(isVisible) end

--- Applies the UI scale, repositions the pad at its scaled background position, keeps the current visibility, refreshes the visibility state and recomputes slider translations.
---@param uiScale any
function PlayerControlPadDisplay:setScale(uiScale) end

--- Returns the configured background offset multiplied by the scale; the width argument is unused.
---@param scale scale
---@param width number
---@return number
---@return number
function PlayerControlPadDisplay.getBackgroundPosition(scale, width) end

--- Creates an image-less overlay at the base position with the configured background size, used only as a positioning frame.
function PlayerControlPadDisplay.createBackground() end
