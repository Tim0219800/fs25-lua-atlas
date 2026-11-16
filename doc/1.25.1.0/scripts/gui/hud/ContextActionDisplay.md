# gui/hud/ContextActionDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/ContextActionDisplay.md)*

Source: `dataS/scripts/gui/hud/ContextActionDisplay.lua` — FS25 1.25.1.0

✍ HUD display for the context action prompt (attach, fuel, tip, fill animal food) shown near the bottom centre with a key or gamepad glyph, an icon, an action title and a description. A context must be set again every frame; the highest priority wins and it stays visible for ContextActionDisplay.MIN_DISPLAY_DURATION after the last call. Derived from HUDDisplay; hidden while the in-game message is visible. updateControls is called but not defined here (UNVERIFIED, probably in HUDDisplay).

- **ContextActionDisplay** inherits from `HUDDisplay` (l.33)

## Functions

| Function | Line | Description |
|---|---|---|
| `ContextActionDisplay.new(customMt: any?) → any` | 39 | ✍ Constructor. Maps the CONTEXT_ICON values (ATTACH, FUEL, TIP, FILL_BOWL) to GUI slice ids and creates the glyph/key button overlays and the tinted icon overlay. No context is set initially. |
| `ContextActionDisplay:storeScaledValues()` | 75 | ✍ Computes the scaled position (bottom centre), icon size, text sizes, offsets, max text width, button height and minimum button widths. |
| `ContextActionDisplay:update(dt: any)` | 108 | ✍ Counts the display time down by dt (ms) while visible; at zero it hides the display and resets the context. |
| `ContextActionDisplay:draw()` | 124 | ✍ Draws the prompt: key or gamepad buttons, the icon, a bold coloured title and the wrapped description, centred as a group. Skipped when the in-game message (g_currentMission.hud.ingameMessage) is visible or no controls are set. |
| `ContextActionDisplay:setContext(contextAction: string, contextIconName: string, text: string, priority: integer?, actionText: string?)` | 206 | ✍ Registers the context for this frame: action name, icon id, text, optional priority (default 0) and optional action title. Accepted if its priority is at least the current one and the icon is known (texts uppercased); otherwise only refreshes the timer if it is the same action. Must be called each frame. |
| `ContextActionDisplay:resetContext()` | 235 | ✍ Clears the controls, text and priority so the next frame can set a new context. |
