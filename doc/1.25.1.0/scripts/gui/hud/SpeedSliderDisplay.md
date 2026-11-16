# gui/hud/SpeedSliderDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/SpeedSliderDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeedSliderDisplay.lua` — FS25 1.25.1.0

✍ Touch/mobile HUD element (HUDDisplayElement subclass) with a vertical throttle/brake slider for vehicles, gait slider for rideables (horses), a jump button and a speed readout. It slides in and out depending on input mode (gamepad hides it), AI activity and player/vehicle state, and drives the vehicle through setTargetSpeedAndDirection. Only active when Platform.hasTouchSliders is true. Client-side only.

- **SpeedSliderDisplay** inherits from `HUDDisplayElement` (l.30)

## Functions

| Function | Line | Description |
|---|---|---|
| `SpeedSliderDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 47 | ✍ Creates the display on an empty positioning overlay, initialises state (no vehicle/player, rest position 0.25), builds the components and subscribes to GUI open, dialog, guided tour and insets-changed messages. |
| `SpeedSliderDisplay:delete()` | 79 | ✍ Unsubscribes from all message center subscriptions and then deletes the element through the parent class. |
| `SpeedSliderDisplay:createComponents()` | 88 | ✍ Builds the child elements: slider background, positive (acceleration) and negative (brake) bars, the slider handle with its callback, player and horse jump buttons and the gamepad background. Also stores the visible/hidden positions used for animation. |
| `SpeedSliderDisplay:setSliderState(state: any)` | 181 | ✍ Shows or hides the slider (animated) when the requested state differs from the current one. |
| `SpeedSliderDisplay:hideSlider()` | 193 | ✍ Starts a tween moving the display to its hidden position, marks the slider state false, disables touch on the slider and refreshes element visibility. |
| `SpeedSliderDisplay:showSlider()` | 210 | ✍ Starts a tween moving the display to its visible position, resets the slider, enables touch and refreshes visibility once the animation finishes. |
| `SpeedSliderDisplay:updateElementsVisibility()` | 228 | ✍ Shows the gamepad background only when the slider is off and neither a player nor a rideable is controlled, and the slider background only while the slider is active. |
| `SpeedSliderDisplay:onSliderVisibilityChangeFinished(visibility: any)` | 236 | ✍ Animation-finished callback: refreshes element visibility when the slider has become visible. |
| `SpeedSliderDisplay:setVehicle(vehicle: table)` | 245 | ✍ Sets the controlled vehicle, detects whether it is rideable, clears any player, resets the slider and adds gait snap positions for rideables. Switches background art and size between vehicle and horse variants. |
| `SpeedSliderDisplay:setPlayer(player: any)` | 279 | ✍ Sets the on-foot player; a non-nil player clears the current vehicle. Then updates the slider visibility state and element visibility. |
| `SpeedSliderDisplay:createBar(position: any, size: any, color: any)` | 319 | ✍ Creates a plain-colour bar HUDElement at the given pixel position, size and colour, relative to the display position. |
| `SpeedSliderDisplay:onSliderPositionChanged(position: any)` | 331 | ✍ Slider callback: clamps the position to 0..1, rescales the acceleration bar and repositions/rescales the brake bar, colours the bar for cruise control if active, and for rideables sets the matching gait when the handle reaches a snap position. |
| `SpeedSliderDisplay:getAccelerateAndBrakeValue()` | 362 | ✍ Converts the slider position into two values in 0..1: acceleration above the rest position and brake below it. |
| `SpeedSliderDisplay:onJumpEventCallback()` | 368 | ✍ Jump button handler: ignored while sleeping; makes a rideable jump if allowed, or triggers the player jump input when on foot. |
| `SpeedSliderDisplay:update(dt: any)` | 392 | ✍ Per-frame update: refreshes the slider element and, for a vehicle with acceleration input, sends target speed and direction (forward, reverse or neutral) from the slider. For rideables it moves the handle to follow gait changes made elsewhere. |
| `SpeedSliderDisplay:getIsSliderActive()` | 426 | ✍ Returns true only when the slider should be usable: not in gamepad help mode, touch sliders supported, no AI driving the vehicle and no on-foot player. |
| `SpeedSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 448 | ✍ Stores the new input help mode; in gamepad mode it puts the handle back at rest position. Then refreshes the visibility state. |
| `SpeedSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 461 | ✍ AI state callback: refreshes the visibility state when the event concerns the currently controlled vehicle. |
| `SpeedSliderDisplay:updateVisibilityState()` | 469 | ✍ Recomputes whether the slider should be shown and applies it through setSliderState if it changed. |
| `SpeedSliderDisplay:draw()` | 478 | ✍ Draws the children, then for a non-rideable vehicle renders the speed (rounded, in the user speed unit) as a short number, or with the unit when AI, gamepad or no touch slider is in use. |
| `SpeedSliderDisplay:onDialogOpened(guiName: any, overlappingDialog: any)` | 522 | ✍ Message handler: resets the slider handle when a dialog opens that does not overlap another dialog. |
| `SpeedSliderDisplay:onGuiOpen()` | 531 | ✍ Message handler: resets the slider handle when a GUI screen is about to open. |
| `SpeedSliderDisplay:setScale(uiScale: any)` | 545 | ✍ Applies a new UI scale: resizes the element, recomputes visible/hidden positions (clamped to the right safe-area inset), slider range and stored original position, and keeps the display hidden if the slider is inactive. |
| `SpeedSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 580 | ✍ Returns the screen position of the display for a given scale and width, anchored to the right edge and limited by the right safe-frame inset. |
| `SpeedSliderDisplay.createBackground()` | 599 | ✍ Creates the empty overlay (no texture) used only as the positioning frame of the display. |

## Messages

- subscribes `MessageType.GUI_BEFORE_OPEN` (l.69)
- subscribes `MessageType.GUI_DIALOG_OPENED` (l.70)
- subscribes `MessageType.GUIDED_TOUR_DIALOG` (l.71)
- subscribes `MessageType.INSETS_CHANGED` (l.72)
