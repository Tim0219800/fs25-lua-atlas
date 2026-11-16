# gui/hud/SteeringSliderDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/SteeringSliderDisplay.md)*

Source: `dataS/scripts/gui/hud/SteeringSliderDisplay.lua` — FS25 1.25.1.0

✍ Touch/mobile HUD element (HUDDisplayElement subclass) with a horizontal steering slider that auto-centres. It feeds steering to the controlled vehicle or rideable each update unless gyroscope steering is enabled, and hides itself for gamepad input, gyroscope steering, AI driving or an on-foot player. Only meaningful when Platform.hasTouchSliders is true. Client-side only.

- **SteeringSliderDisplay** inherits from `HUDDisplayElement` (l.31)

## Functions

| Function | Line | Description |
|---|---|---|
| `SteeringSliderDisplay.new(hud: string, hudAtlasPath: string)` | 36 | ✍ Creates the display on an empty positioning overlay, initialises state (rest position 0.5, no vehicle), builds the components and subscribes to changes of the steering-back-speed setting. |
| `SteeringSliderDisplay:delete()` | 63 | ✍ Unsubscribes from all message center subscriptions and deletes the element through the parent class. |
| `SteeringSliderDisplay:setVehicle(vehicle: table)` | 72 | ✍ Sets the controlled vehicle, detects whether it is rideable and resets the handle texture. |
| `SteeringSliderDisplay:setPlayer(player: any)` | 83 | ✍ Sets the on-foot player reference and refreshes the visibility state. |
| `SteeringSliderDisplay:createComponents()` | 91 | ✍ Builds the background, the slider handle (with auto-centre speed taken from the steering-back-speed setting) and the steering wheel icon attached to the handle. |
| `SteeringSliderDisplay:setVisible(isVisible: boolean, animate: boolean)` | 140 | ✍ Overrides visibility: the request is forwarded to the parent unless it asks to show while the input help mode is gamepad, in which case nothing happens. |
| `SteeringSliderDisplay:onSliderPositionChanged(position: any)` | 148 | ✍ Slider callback storing the new position clamped to 0..1. |
| `SteeringSliderDisplay:getSteeringValue()` | 154 | ✍ Maps the slider position to a steering value in -1..1 with a quadratic curve (sign kept), giving finer control near the centre. |
| `SteeringSliderDisplay:getIsSliderActive()` | 173 | ✍ Returns true only when usable: not gamepad help mode, touch sliders supported, gyroscope steering off, no AI active on the vehicle and no on-foot player. |
| `SteeringSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 200 | ✍ Stores the new input help mode and refreshes the visibility state. |
| `SteeringSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 208 | ✍ AI state callback: refreshes the visibility state (the vehicle argument is not compared here). |
| `SteeringSliderDisplay:onGyroscopeSteeringChanged(state: any)` | 214 | ✍ Stores the gyroscope steering state and refreshes the visibility state. |
| `SteeringSliderDisplay:updateVisibilityState()` | 222 | ✍ When the slider activity differs from the stored animation state, shows or hides the display (animated) and enables or disables touch on the handle. |
| `SteeringSliderDisplay:onSteeringBackSpeedSettingChanged()` | 232 | ✍ Setting callback: re-applies the auto-centre speed factor (setting value divided by 10) to the handle. |
| `SteeringSliderDisplay:update(dt: any)` | 244 | ✍ Per-frame update: unless gyroscope steering is on, sends the slider steering value to the rideable or to the vehicle via setSteeringInput (wheel category). Then updates the slider element. |
| `SteeringSliderDisplay:setScale(uiScale: any)` | 280 | ✍ Applies a new UI scale: resizes the element, recomputes position, slider range and original position, preserving the current visibility. |
| `SteeringSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 303 | ✍ Returns the screen position of the display for the given scale (the width argument is unused). |
| `SteeringSliderDisplay.createBackground()` | 314 | ✍ Creates the empty overlay used only as the positioning frame of the display. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.56)
