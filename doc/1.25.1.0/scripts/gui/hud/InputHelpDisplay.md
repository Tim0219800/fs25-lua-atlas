# gui/hud/InputHelpDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/InputHelpDisplay.md)*

Source: `dataS/scripts/gui/hud/InputHelpDisplay.lua` — FS25 1.25.1.0

✍ Top-left HUD panel (extends HUDDisplay) that lists the currently active input actions with key or gamepad glyphs, plus a combo-key row and vehicle schema icons. Each frame it queries g_inputDisplayManager and g_inputBinding, sorts registered help and info extensions by priority, draws them and then clears them, so extensions must re-register every frame. Client-side only. Several helpers (drawVehicleSchema, drawInputHelpElement, drawExtraText, updateGamepadComboButtons) are not defined in this file (UNVERIFIED where they live).

- **InputHelpDisplay** inherits from `HUDDisplay` (l.35)

## Functions

| Function | Line | Description |
|---|---|---|
| `InputHelpDisplay.new()` | 39 | ✍ Creates the panel: background and separator overlays, localized combo and control-group labels, button overlays, mouse combo overlays from InputBinding.ORDERED_MOUSE_COMBOS, gamepad combo buttons, and a subscription to INPUT_DEVICES_CHANGED. |
| `InputHelpDisplay:delete()` | 102 | ✍ Deletes all overlays and cached vehicle schema overlays, unsubscribes from INPUT_DEVICES_CHANGED and runs the parent delete. |
| `InputHelpDisplay:storeScaledValues()` | 125 | ✍ Anchors the panel at the HUD left/top anchor and converts the reference-pixel layout (line 330x25, combo box 330x50, margins, text and icon sizes) to screen units; also rescales cached vehicle schema overlays. |
| `InputHelpDisplay:draw(offsetX: any, offsetY: any)` | 175 | ✍ Draws the vehicle schema, then, when visible, the combo row and the help lines for the pressed combo mask, capped by element count (higher cap for high priority). It draws then empties the help extensions, info extensions and extra texts. |

## Messages

- subscribes `MessageType.INPUT_DEVICES_CHANGED` (l.95)
