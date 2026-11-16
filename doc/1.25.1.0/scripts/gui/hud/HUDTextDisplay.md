# gui/hud/HUDTextDisplay.lua

*[Version française](../../../fr/scripts/gui/hud/HUDTextDisplay.md)*

Source: `dataS/scripts/gui/hud/HUDTextDisplay.lua` — FS25 1.25.1.0

✍ Single-line HUD text element (extends HUDDisplayElement) with optional shadow and tween animation. The element size is recomputed from the text width and height each time setText is called, then placed at the initial position. Rendering uses RenderText functions with the overlay alpha multiplied into the text alpha. Client-side only.

- **HUDTextDisplay** inherits from `HUDDisplayElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDTextDisplay.new(posX: number, posY: number, textSize: number, textAlignment: integer?, textColor: table?, textBold: boolean?) → table` | 28 | ✍ Creates an empty text display with a text size in reference pixels, alignment (default left), color (default white) and bold flag. The text must be set later with setText, which sets bounds and position. |
| `HUDTextDisplay:setText(text: string, textSize: number, textAlignment: integer, textColor: table, textBold: boolean)` | 55 | ✍ Updates the text and any provided style fields (others keep their value), recomputes the screen text size, resizes the element to the text and puts it at the initial position. Note: textBold uses 'or', so bold cannot be switched off by passing false. |
| `HUDTextDisplay:setScale(uiScale: number)` | 75 | ✍ Applies the UI scale through the parent class and recomputes the on-screen text size. |
| `HUDTextDisplay:setVisible(isVisible: boolean, animate: boolean)` | 85 | ✍ Sets visibility without the parent's repositioning; with animate true it resets the animation when hiding or still running, and starts it when showing. |
| `HUDTextDisplay:setAlpha(alpha: number)` | 104 | ✍ Sets the overlay alpha, which is multiplied with the text color alpha at draw time. |
| `HUDTextDisplay:setTextColorChannels(r: number, g: number, b: number, a: number)` | 115 | ✍ Writes the four text color channels in place, intended for per-frame changes such as animation. |
| `HUDTextDisplay:setTextShadow(isShadowEnabled: boolean, shadowColor: table)` | 126 | ✍ Enables the drop shadow and/or sets its color. Note: 'isShadowEnabled or self.hasShadow' means passing false never disables a shadow already enabled. |
| `HUDTextDisplay:setAnimation(animationTween: table)` | 135 | ✍ Stores the element's original position and assigns a tween sequence (or the empty NO_SEQUENCE). It is played by setVisible with animate true. |
| `HUDTextDisplay:update(dt: number)` | 143 | ✍ Steps the animation through the parent update, but only while the element is visible. |
| `HUDTextDisplay:draw()` | 151 | ✍ Renders the text with the stored alignment, bold flag and baseline alignment, preceded by a shadow copy offset by a size factor when enabled. Skipped when empty or hidden. Resets text state afterwards. |
