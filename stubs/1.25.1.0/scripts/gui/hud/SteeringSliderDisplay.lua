---@meta
-- FS25 1.25.1.0 : gui/hud/SteeringSliderDisplay.lua (generated stub, FS25 Lua Atlas)

--- Touch/mobile HUD element (HUDDisplayElement subclass) with a horizontal steering slider that auto-centres. It feeds steering to the controlled vehicle or rideable each update unless gyroscope steering is enabled, and hides itself for gamepad input, gyroscope steering, AI driving or an on-foot player. Only meaningful when Platform.hasTouchSliders is true. Client-side only.
---@class SteeringSliderDisplay : HUDDisplayElement
SteeringSliderDisplay = {}

--- Creates the display on an empty positioning overlay, initialises state (rest position 0.5, no vehicle), builds the components and subscribes to changes of the steering-back-speed setting.
---@param hud string
---@param hudAtlasPath string
function SteeringSliderDisplay.new(hud, hudAtlasPath) end

--- Unsubscribes from all message center subscriptions and deletes the element through the parent class.
function SteeringSliderDisplay:delete() end

--- Sets the controlled vehicle, detects whether it is rideable and resets the handle texture.
---@param vehicle table
function SteeringSliderDisplay:setVehicle(vehicle) end

--- Sets the on-foot player reference and refreshes the visibility state.
---@param player any
function SteeringSliderDisplay:setPlayer(player) end

--- Builds the background, the slider handle (with auto-centre speed taken from the steering-back-speed setting) and the steering wheel icon attached to the handle.
function SteeringSliderDisplay:createComponents() end

--- Overrides visibility: the request is forwarded to the parent unless it asks to show while the input help mode is gamepad, in which case nothing happens.
---@param isVisible boolean
---@param animate boolean
function SteeringSliderDisplay:setVisible(isVisible, animate) end

--- Slider callback storing the new position clamped to 0..1.
---@param position any
function SteeringSliderDisplay:onSliderPositionChanged(position) end

--- Maps the slider position to a steering value in -1..1 with a quadratic curve (sign kept), giving finer control near the centre.
function SteeringSliderDisplay:getSteeringValue() end

--- Returns true only when usable: not gamepad help mode, touch sliders supported, gyroscope steering off, no AI active on the vehicle and no on-foot player.
function SteeringSliderDisplay:getIsSliderActive() end

--- Stores the new input help mode and refreshes the visibility state.
---@param inputHelpMode any
function SteeringSliderDisplay:onInputHelpModeChange(inputHelpMode) end

--- AI state callback: refreshes the visibility state (the vehicle argument is not compared here).
---@param state any
---@param vehicle any
function SteeringSliderDisplay:onAIVehicleStateChanged(state, vehicle) end

--- Stores the gyroscope steering state and refreshes the visibility state.
---@param state any
function SteeringSliderDisplay:onGyroscopeSteeringChanged(state) end

--- When the slider activity differs from the stored animation state, shows or hides the display (animated) and enables or disables touch on the handle.
function SteeringSliderDisplay:updateVisibilityState() end

--- Setting callback: re-applies the auto-centre speed factor (setting value divided by 10) to the handle.
function SteeringSliderDisplay:onSteeringBackSpeedSettingChanged() end

--- Per-frame update: unless gyroscope steering is on, sends the slider steering value to the rideable or to the vehicle via setSteeringInput (wheel category). Then updates the slider element.
---@param dt any
function SteeringSliderDisplay:update(dt) end

--- Applies a new UI scale: resizes the element, recomputes position, slider range and original position, preserving the current visibility.
---@param uiScale any
function SteeringSliderDisplay:setScale(uiScale) end

--- Returns the screen position of the display for the given scale (the width argument is unused).
---@param scale scale
---@param width number
---@return number
---@return number
function SteeringSliderDisplay.getBackgroundPosition(scale, width) end

--- Creates the empty overlay used only as the positioning frame of the display.
function SteeringSliderDisplay.createBackground() end
