---@meta
-- FS25 1.25.1.0 : gui/hud/SwitchVehicleDisplay.lua (generated stub, FS25 Lua Atlas)

--- Touch/mobile HUD element (HUDDisplayElement subclass) with left/right arrows and input glyphs to cycle through the player vehicles via g_localPlayer. It slides between a controller position and a touch position depending on input mode, gyroscope steering and platform touch support. Client-side only. createBackgroundElements is called here but not defined in this file (UNVERIFIED).
---@class SwitchVehicleDisplay : HUDDisplayElement
SwitchVehicleDisplay = {}

--- Creates the display on an empty positioning overlay, initialises state (no vehicle/player, empty touch button and control lists) and builds the components.
---@param hud string
---@param hudAtlasPath string
---@param controlHudAtlasPath any
function SwitchVehicleDisplay.new(hud, hudAtlasPath, controlHudAtlasPath) end

--- Stores the controlled vehicle and updates the position state.
---@param vehicle table
function SwitchVehicleDisplay:setVehicle(vehicle) end

--- Stores the on-foot player and updates the position state.
---@param player any
function SwitchVehicleDisplay:setPlayer(player) end

--- Builds the background, icon, the two input glyphs (switch vehicle and switch back), the left and right arrow overlays and registers three touch handlers per arrow (release, press, cancel) with the HUD. Stores the touch and gamepad target positions.
function SwitchVehicleDisplay:createComponents() end

--- Left arrow handler: unless sleeping, inactive or cancelled, makes the local player cycle to the previous vehicle (-1).
---@param x any
---@param y any
---@param isCancel any
function SwitchVehicleDisplay:onSwitchLeft(x, y, isCancel) end

--- Right arrow handler: unless sleeping, inactive or cancelled, makes the local player cycle to the next vehicle (+1).
---@param x any
---@param y any
---@param isCancel any
function SwitchVehicleDisplay:onSwitchRight(x, y, isCancel) end

--- Chooses the controller state for gamepad input, no touch sliders, or gyroscope steering while in a vehicle; otherwise the touch state. Applies it through setPositionState.
---@param force any
function SwitchVehicleDisplay:updatePositionState(force) end

--- Stores the new input help mode and updates the position state, optionally forced.
---@param inputHelpMode any
---@param force any
function SwitchVehicleDisplay:onInputHelpModeChange(inputHelpMode, force) end

--- Stores the gyroscope steering state and updates the position state.
---@param state any
function SwitchVehicleDisplay:onGyroscopeSteeringChanged(state) end

--- Tweens the display to the gamepad or touch position when the state changes (faster towards touch, near-instant when forced). Does nothing on platforms without touch sliders.
---@param state any
---@param force any
function SwitchVehicleDisplay:setPositionState(state, force) end

--- Applies a new UI scale: resizes the element, recomputes touch and gamepad positions and the stored original position, and keeps the touch position when that state is active.
---@param uiScale any
function SwitchVehicleDisplay:setScale(uiScale) end

--- Returns the screen position of the display for the given scale (the width argument is unused).
---@param scale scale
---@param width number
---@return number
---@return number
function SwitchVehicleDisplay.getBackgroundPosition(scale, width) end

--- Creates the empty overlay used only as the positioning frame of the display.
function SwitchVehicleDisplay.createBackground() end
