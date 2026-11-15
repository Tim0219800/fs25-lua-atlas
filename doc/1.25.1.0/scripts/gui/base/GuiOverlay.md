# gui/base/GuiOverlay.lua

Source : `dataS/scripts/gui/base/GuiOverlay.lua` — FS25 1.25.1.0

- **GuiOverlay** (l.9)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiOverlay.loadOverlay(self: table, overlay: table, overlayName: string, imageSize: table, profile: table?, xmlFile: integer?, key: string?) → table` | 37 |  |
| `GuiOverlay.loadXMLUVs(xmlFile: integer, key: string, overlay: table, overlayName: string, imageSize: table)` | 78 |  |
| `GuiOverlay.loadProfileUVs(profile: table, overlay: table, overlayName: string, imageSize: table)` | 115 |  |
| `GuiOverlay.loadXMLColors(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 158 |  |
| `GuiOverlay.loadProfileColors(profile: table, overlay: table, overlayName: string)` | 183 |  |
| `GuiOverlay.loadXMLFilenames(xmlFile: integer, key: string, overlay: table, overlayName: string)` | 209 |  |
| `GuiOverlay.loadProfileFilenames(profile: table, overlay: table, overlayName: string)` | 240 |  |
| `GuiOverlay.resolveFilename(filename: string) → string` | 270 |  |
| `GuiOverlay.createOverlay(overlay: table, filename: string?) → table` | 291 |  |
| `GuiOverlay.createStateOverlays(overlay: table)` | 331 |  |
| `GuiOverlay.copyOverlay(overlay: table, overlaySrc: table, overrideFilename: string?) → table` | 364 |  |
| `GuiOverlay.deleteOverlay(overlay: table)` | 387 |  |
| `GuiOverlay.getOverlayColor(overlay: table, state: integer) → Color` | 408 |  |
| `GuiOverlay.getOverlayUVs(overlay: Overlay, state: integer) → table` | 438 |  |
| `GuiOverlay.getOverlay(overlay: table, currentState: integer) → table` | 465 |  |
| `GuiOverlay.getMaskOverlay(overlay: table, currentState: integer) → table` | 492 |  |
| `GuiOverlay.renderOverlay(overlay: table, posX: number, posY: number, sizeX: number, sizeY: number, state: integer, clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?, maskPosX: number?, maskPosY: number?, maskSizeX: number?, maskSizeY: number?)` | 530 |  |
| `GuiOverlay.copyColors(overlay: table, source: table)` | 626 |  |
| `GuiOverlay.setRotation(overlay: table, rotation: number, centerX: number, centerY: number)` | 641 |  |
| `GuiOverlay.setColor(overlay: table, r: number, g: number, b: number, a: number)` | 655 |  |
| `GuiOverlay.setSelectedColor(overlay: table, r: number, g: number, b: number, a: number)` | 666 |  |
