# gui/hud/PlayerControlPadDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/PlayerControlPadDisplay.md)*

Source: `dataS/scripts/gui/hud/PlayerControlPadDisplay.lua` — FS25 1.25.1.0

✍ Touch joystick pad for on-foot movement in the mobile UI (extends HUDDisplayElement). It combines a background, a joystick knob and two HUDSliderElements (X and Y axes); the normalized stick position is sent every update to the player with onInputMoveSide and onInputMoveForward. Visibility follows the input help mode and whether the player can move. Client-side only.

- **PlayerControlPadDisplay** inherits from `HUDDisplayElement` (l.26)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerControlPadDisplay.new(hud: string, hudAtlasPath: string)` | 31 | ✍ Creates the pad with its HUD reference and atlas path, a centered stick position and the keyboard help mode as initial state, then builds its components. |
| `PlayerControlPadDisplay:setPlayer(player: any)` | 53 | ✍ Assigns the player that receives the movement input and refreshes visibility. |
| `PlayerControlPadDisplay:createComponents()` | 61 | ✍ Builds the background and knob elements and two HUDSliderElements (one per axis) with callbacks to onSliderPositionChangedX/Y, then centers both sliders. |
| `PlayerControlPadDisplay:setVisible(isVisible: boolean, animate: boolean)` | 128 | ✍ Hides always works; showing is ignored while the input help mode is gamepad. Otherwise delegates to the parent setVisible. |
| `PlayerControlPadDisplay:onSliderPositionChangedX(position: any)` | 136 | ✍ Slider callback for the X axis: maps the 0..1 position to -1..1, clamps the stick to the unit circle and moves the knob horizontally. Returns the corrected position if clamped (nil otherwise). |
| `PlayerControlPadDisplay:onSliderPositionChangedY(position: any)` | 148 | ✍ Slider callback for the Y axis: maps the 0..1 position to -1..1 and clamps the stick to the unit circle, returning the corrected Y when clamped. |
| `PlayerControlPadDisplay:updateJoystickPosition()` | 158 | ✍ When the stick vector exceeds length 1, normalizes it and moves both sliders to the clamped position, returning the new X and Y translations; otherwise returns nil. |
| `PlayerControlPadDisplay:onInputHelpModeChange(inputHelpMode: any)` | 178 | ✍ Stores the new input help mode and refreshes visibility. |
| `PlayerControlPadDisplay:updateVisibilityState()` | 186 | ✍ Shows or hides the pad with animation when the desired state differs from the current one, and enables or disables the sliders' touch handling. Uses getIsPlayerMoveActive and animationState, defined elsewhere (UNVERIFIED). |
| `PlayerControlPadDisplay:update(dt: any)` | 202 | ✍ Updates the animation, syncs the knob to the sliders and, when a player is set, updates the sliders and sends the stick values to onInputMoveSide and onInputMoveForward (Y inverted). Note: canControl is hard-coded true, so the disabled UVs are never used. |
| `PlayerControlPadDisplay:onAnimateVisibilityFinished(isVisible: any)` | 233 | ✍ Runs the parent handler and, when the pad has become visible, resets both sliders. |
| `PlayerControlPadDisplay:setScale(uiScale: any)` | 264 | ✍ Applies the UI scale, repositions the pad at its scaled background position, keeps the current visibility, refreshes the visibility state and recomputes slider translations. |
| `PlayerControlPadDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 286 | ✍ Returns the configured background offset multiplied by the scale; the width argument is unused. |
| `PlayerControlPadDisplay.createBackground()` | 297 | ✍ Creates an image-less overlay at the base position with the configured background size, used only as a positioning frame. |
