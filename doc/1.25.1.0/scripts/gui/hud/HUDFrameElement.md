# gui/hud/HUDFrameElement.lua

*[Version française](../../../fr/scripts/gui/hud/HUDFrameElement.md)*

Source: `dataS/scripts/gui/hud/HUDFrameElement.lua` — FS25 1.25.1.0

✍ HUD background frame built from a transparent base overlay plus four child HUDElements: a top line, left and right lines and a bottom bar. Line thickness is rounded up to whole screen pixels. The bottom bar can be turned into a plain frame line with showBar=false. Extends HUDElement; client-side only.

- **HUDFrameElement** inherits from `HUDElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `HUDFrameElement.new(posX: number, posY: number, width: number, height: number, parent: table?, showBar: any, frameThickness: any, barThickness: any)` | 23 | ✍ Creates the frame at the given position and size, optionally parented, with optional bar visibility and frame/bar thicknesses (defaults from HUDFrameElement.THICKNESS), then builds the line components. |
| `HUDFrameElement:createComponents(baseX: any, baseY: any, width: any, height: any)` | 44 | ✍ Builds the top, left, right and bottom overlays as children, rounding thickness up to at least one screen pixel. With the bar disabled the bottom uses the frame thickness and color. |
| `HUDFrameElement:setDimension(width: any, height: any)` | 100 | ✍ Overrides HUDElement:setDimension to resize the frame and keep the lines in place: top and bottom span the new width, side lines the new height minus two line thicknesses, and top/right are repositioned. |
| `HUDFrameElement:setBottomBarHeight(height: any)` | 120 | ✍ Sets only the height of the bottom bar. |
| `HUDFrameElement:setBottomBarColor(r: any, g: any, b: any, a: any)` | 126 | ✍ Sets the bottom bar color. Note: its doc comment wrongly repeats the bar-height description. |
| `HUDFrameElement:setLeftLineVisible(visible: any)` | 132 | ✍ Shows or hides the left frame line. |
| `HUDFrameElement:setRightLineVisible(visible: any)` | 138 | ✍ Shows or hides the right frame line. |
| `HUDFrameElement:setFrameColor(r: any, g: any, b: any, a: any)` | 144 | ✍ Applies one color to the top, left and right lines and to the bottom bar (this overrides a distinct bar color). |
