# gui/base/Overlay.lua

Source : `dataS/scripts/gui/base/Overlay.lua` — FS25 1.25.1.0

- **Overlay** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Overlay.new(overlayFilename: string?, x: number, y: number, width: number, height: number, customMt: table?) → Overlay` | 39 |  |
| `Overlay:delete()` | 87 |  |
| `Overlay:setColor(r: number?, g: number?, b: number?, a: number?)` | 101 |  |
| `Overlay:setUVs(uvs: array)` | 117 |  |
| `Overlay:setSliceId(sliceId: string)` | 127 |  |
| `Overlay:setPosition(x: number?, y: number?)` | 142 |  |
| `Overlay:getPosition() → number, number` | 151 |  |
| `Overlay:setDimension(width: number?, height: number?)` | 160 |  |
| `Overlay:resetDimensions()` | 168 |  |
| `Overlay:setInvertX(invertX: boolean)` | 177 |  |
| `Overlay:setRotation(rotation: number, centerX: number, centerY: number)` | 195 |  |
| `Overlay:setScale(scaleWidth: number, scaleHeight: number)` | 211 |  |
| `Overlay:getScale() → number, number` | 224 |  |
| `Overlay:render(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 234 |  |
| `Overlay:setAlignment(vertical: integer?, horizontal: integer?)` | 335 |  |
| `Overlay:setIsVisible(visible: boolean?)` | 358 |  |
| `Overlay:getIsVisible() → boolean` | 366 |  |
| `Overlay:setImage(overlayFilename: string)` | 375 |  |
