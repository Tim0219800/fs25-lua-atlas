---@meta
-- FS25 1.25.1.0 : gui/hud/SpeedSliderDisplay.lua (generated stub, FS25 Lua Atlas)

--- Touch/mobile HUD element (HUDDisplayElement subclass) with a vertical throttle/brake slider for vehicles, gait slider for rideables (horses), a jump button and a speed readout. It slides in and out depending on input mode (gamepad hides it), AI activity and player/vehicle state, and drives the vehicle through setTargetSpeedAndDirection. Only active when Platform.hasTouchSliders is true. Client-side only.
---@class SpeedSliderDisplay : HUDDisplayElement
SpeedSliderDisplay = {}

--- Creates the display on an empty positioning overlay, initialises state (no vehicle/player, rest position 0.25), builds the components and subscribes to GUI open, dialog, guided tour and insets-changed messages.
---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function SpeedSliderDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

--- Unsubscribes from all message center subscriptions and then deletes the element through the parent class.
function SpeedSliderDisplay:delete() end

--- Builds the child elements: slider background, positive (acceleration) and negative (brake) bars, the slider handle with its callback, player and horse jump buttons and the gamepad background. Also stores the visible/hidden positions used for animation.
function SpeedSliderDisplay:createComponents() end

--- Shows or hides the slider (animated) when the requested state differs from the current one.
---@param state any
function SpeedSliderDisplay:setSliderState(state) end

--- Starts a tween moving the display to its hidden position, marks the slider state false, disables touch on the slider and refreshes element visibility.
function SpeedSliderDisplay:hideSlider() end

--- Starts a tween moving the display to its visible position, resets the slider, enables touch and refreshes visibility once the animation finishes.
function SpeedSliderDisplay:showSlider() end

--- Shows the gamepad background only when the slider is off and neither a player nor a rideable is controlled, and the slider background only while the slider is active.
function SpeedSliderDisplay:updateElementsVisibility() end

--- Animation-finished callback: refreshes element visibility when the slider has become visible.
---@param visibility any
function SpeedSliderDisplay:onSliderVisibilityChangeFinished(visibility) end

--- Sets the controlled vehicle, detects whether it is rideable, clears any player, resets the slider and adds gait snap positions for rideables. Switches background art and size between vehicle and horse variants.
---@param vehicle table
function SpeedSliderDisplay:setVehicle(vehicle) end

--- Sets the on-foot player; a non-nil player clears the current vehicle. Then updates the slider visibility state and element visibility.
---@param player any
function SpeedSliderDisplay:setPlayer(player) end

--- Creates a plain-colour bar HUDElement at the given pixel position, size and colour, relative to the display position.
---@param position any
---@param size any
---@param color any
function SpeedSliderDisplay:createBar(position, size, color) end

--- Slider callback: clamps the position to 0..1, rescales the acceleration bar and repositions/rescales the brake bar, colours the bar for cruise control if active, and for rideables sets the matching gait when the handle reaches a snap position.
---@param position any
function SpeedSliderDisplay:onSliderPositionChanged(position) end

--- Converts the slider position into two values in 0..1: acceleration above the rest position and brake below it.
function SpeedSliderDisplay:getAccelerateAndBrakeValue() end

--- Jump button handler: ignored while sleeping; makes a rideable jump if allowed, or triggers the player jump input when on foot.
function SpeedSliderDisplay:onJumpEventCallback() end

--- Per-frame update: refreshes the slider element and, for a vehicle with acceleration input, sends target speed and direction (forward, reverse or neutral) from the slider. For rideables it moves the handle to follow gait changes made elsewhere.
---@param dt any
function SpeedSliderDisplay:update(dt) end

--- Returns true only when the slider should be usable: not in gamepad help mode, touch sliders supported, no AI driving the vehicle and no on-foot player.
function SpeedSliderDisplay:getIsSliderActive() end

--- Stores the new input help mode; in gamepad mode it puts the handle back at rest position. Then refreshes the visibility state.
---@param inputHelpMode any
function SpeedSliderDisplay:onInputHelpModeChange(inputHelpMode) end

--- AI state callback: refreshes the visibility state when the event concerns the currently controlled vehicle.
---@param state any
---@param vehicle any
function SpeedSliderDisplay:onAIVehicleStateChanged(state, vehicle) end

--- Recomputes whether the slider should be shown and applies it through setSliderState if it changed.
function SpeedSliderDisplay:updateVisibilityState() end

--- Draws the children, then for a non-rideable vehicle renders the speed (rounded, in the user speed unit) as a short number, or with the unit when AI, gamepad or no touch slider is in use.
function SpeedSliderDisplay:draw() end

--- Message handler: resets the slider handle when a dialog opens that does not overlap another dialog.
---@param guiName any
---@param overlappingDialog any
function SpeedSliderDisplay:onDialogOpened(guiName, overlappingDialog) end

--- Message handler: resets the slider handle when a GUI screen is about to open.
function SpeedSliderDisplay:onGuiOpen() end

--- Applies a new UI scale: resizes the element, recomputes visible/hidden positions (clamped to the right safe-area inset), slider range and stored original position, and keeps the display hidden if the slider is inactive.
---@param uiScale any
function SpeedSliderDisplay:setScale(uiScale) end

--- Returns the screen position of the display for a given scale and width, anchored to the right edge and limited by the right safe-frame inset.
---@param scale scale
---@param width number
---@return number
---@return number
function SpeedSliderDisplay.getBackgroundPosition(scale, width) end

--- Creates the empty overlay (no texture) used only as the positioning frame of the display.
function SpeedSliderDisplay.createBackground() end
