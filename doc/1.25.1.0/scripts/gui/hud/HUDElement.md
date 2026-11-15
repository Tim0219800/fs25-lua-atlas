# gui/hud/HUDElement.lua

Source: `dataS/scripts/gui/hud/HUDElement.lua` — FS25 1.25.1.0

- **HUDElement** (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HUDElement.new(overlay: table, parentHudElement: table?, customMt: table?) → table` | 22 |  |
| `HUDElement:delete()` | 47 |  |
| `HUDElement:addChild(childHudElement: table)` | 69 |  |
| `HUDElement:removeChild(childHudElement: table)` | 91 |  |
| `HUDElement:setPosition(x: any, y: any)` | 106 |  |
| `HUDElement:setRotation(rotation: number, centerX: number?, centerY: number?)` | 132 |  |
| `HUDElement:setRotationPivot(pivotX: number, pivotY: number)` | 140 |  |
| `HUDElement:getRotationPivot() → number, number` | 149 |  |
| `HUDElement:getPosition() → number, number` | 157 |  |
| `HUDElement:setScale(scaleWidth: number, scaleHeight: number)` | 166 |  |
| `HUDElement:getScale() → Width, Height` | 197 |  |
| `HUDElement:setAlignment(vertical: integer, horizontal: integer)` | 206 |  |
| `HUDElement:setVisible(isVisible: any)` | 212 |  |
| `HUDElement:getVisible()` | 220 |  |
| `HUDElement:getColor() → number, number, number, number` | 230 |  |
| `HUDElement:getAlpha() → number` | 237 |  |
| `HUDElement:getWidth()` | 243 |  |
| `HUDElement:getHeight()` | 249 |  |
| `HUDElement:setDimension(width: any, height: any)` | 256 |  |
| `HUDElement:getDimension() → number, number` | 264 |  |
| `HUDElement:resetDimensions()` | 271 |  |
| `HUDElement:setColor(r: any, g: any, b: any, a: any)` | 280 |  |
| `HUDElement:setAlpha(alpha: any)` | 286 |  |
| `HUDElement:setImage(imageFilename: any)` | 292 |  |
| `HUDElement:setUVs(uvs: any)` | 298 |  |
| `HUDElement:setSliceId(sliceId: any)` | 304 |  |
| `HUDElement:update(dt: any)` | 310 |  |
| `HUDElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 318 |  |
| `HUDElement:scalePixelToScreenVector(vector2D: table)` | 335 |  |
| `HUDElement:scalePixelToScreenHeight(height: number)` | 349 |  |
| `HUDElement:scalePixelToScreenWidth(width: number)` | 356 |  |
| `HUDElement:normalizeUVPivot(uvPivot: table, size: table, uvs: table)` | 364 |  |
