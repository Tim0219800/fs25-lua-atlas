# gui/hud/ControlBarDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/ControlBarDisplay.md)*

Source: `dataS/scripts/gui/hud/ControlBarDisplay.lua` — FS25 1.25.1.0

✍ HUD control bar with touch/gamepad buttons, derived from HUDDisplayElement. It declares tables of vehicle controls (attach, turn on, AI, leave, unload fork, leave horse), player controls (enter vehicle/horse, ride) and a custom activatable-object control, each naming the vehicle or player methods it calls (availableFunc, actionFunc, ...). It also shows up to two fill-level buttons with progress bars and slides between touch and controller positions on platforms with touch sliders. updateButtons, updateButtonPositions, updateControls-style helpers and the constants (UV, COLOR, POSITION, SIZE) are not defined in this file (UNVERIFIED).

- **ControlBarDisplay** inherits from `HUDDisplayElement` (l.34)

## Functions

| Function | Line | Description |
|---|---|---|
| `ControlBarDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 39 | ✍ Constructor taking the HUD, the HUD atlas path and the control atlas path. Builds an empty background frame, initialises state and fills the vehicleControls, playerControls and customControls tables (with priority, input action, icon UVs and colours), then calls createComponents. |
| `ControlBarDisplay:createComponents()` | 226 | ✍ Creates a HUDButtonElement per control with its icon and input action. Button callbacks ignore input while the sleep manager is sleeping; vehicle buttons check allowedFunc (showing a 2.5 s blinking warning if refused) before calling actionFunc on the vehicle, player buttons call it on the player. Also creates two fill-level controls and stores touch and gamepad positions. |
| `ControlBarDisplay:setVehicle(vehicle: table)` | 320 | ✍ Sets the controlled vehicle, then refreshes the position state, fill-level buffers and buttons. If a toggle-seeds button exists, its glyph is made visible only when the attached sowing machine has more than one seed type. |
| `ControlBarDisplay:setPlayer(player: any)` | 339 | ✍ Stores the current player reference and updates the position state. |
| `ControlBarDisplay:update(dt: any)` | 347 | ✍ Per-frame update: calls the parent update, then updateButtons and updateButtonPositions (both defined elsewhere, UNVERIFIED). |
| `ControlBarDisplay:onInputHelpModeChange(inputHelpMode: any, force: any)` | 499 | ✍ Records the new input help mode (keyboard, gamepad...) and updates the position state, optionally forced. |
| `ControlBarDisplay:onAIVehicleStateChanged(state: any, vehicle: any, force: any)` | 506 | ✍ Records the AI active state and updates the position state; the vehicle argument is unused. |
| `ControlBarDisplay:onGyroscopeSteeringChanged(state: any)` | 513 | ✍ Records whether gyroscope steering is active and updates the position state. |
| `ControlBarDisplay:updatePositionState(force: any)` | 531 | ✍ Chooses touch or controller layout: touch when the platform has touch sliders and the input is not gamepad (or a player is set on foot), controller otherwise or when gyroscope steering is on; then applies it. |
| `ControlBarDisplay:setPositionState(state: any, force: any)` | 550 | ✍ Does nothing without touch sliders. On a state change, starts a tween to the touch or gamepad position (touch moves five times faster, forced changes are near instant). |
| `ControlBarDisplay:addFillLevelControl()` | 583 | ✍ Creates one fill-level control: a toggle-seeds button with an icon, plus a background bar and a fill bar using the atlas UVs. Registers it with a priority and returns the control table. |
| `ControlBarDisplay:addFillLevel(fillType: any, fillLevel: any, capacity: any, precision: any, maxReached: any)` | 620 | ✍ Collector called by vehicle:getFillLevelInformation: adds level and capacity to the entry of the same fill type (and stores precision, maxReached) or appends a new entry, tracking insertion order for sorting. |
| `ControlBarDisplay:updateFillLevelBuffers(vehicle: any)` | 650 | ✍ Hides the fill-level buttons, zeroes the buffer, asks the vehicle for its fill level information, sorts by insertion order if needed and feeds each non-zero-capacity entry to a control (at most as many as controls exist). |
| `ControlBarDisplay.sortFillLevelBuffers(a: any, b: any)` | 691 | ✍ Table.sort comparator ordering fill-level entries by their addIndex. |
| `ControlBarDisplay:updateFillLevelControl(fillLevelControl: any, fillLevelBuffer: any)` | 697 | ✍ Sets the bar fill percentage (UVs and scale), swaps the button icon to the fill type's HUD overlay, links the sowing machine when its seed fill type matches, and sets the button active/visible state (visible if level above zero or tied to the sowing machine). |
| `ControlBarDisplay:setScale(uiScale: any)` | 756 | ✍ Applies a uniform UI scale, recomputes background position and touch/gamepad positions, stores the original position and keeps the current visibility and touch position. |
| `ControlBarDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 784 | ✍ Returns the background screen position from the POSITION.BACKGROUND constant multiplied by the scale; the width argument is unused. |
| `ControlBarDisplay.createBackground()` | 795 | ✍ Creates an image-less overlay with the SIZE.BACKGROUND dimensions, used only as a positioning frame. |
