# gui/elements/VideoElement.lua

Source : `dataS/scripts/gui/elements/VideoElement.lua` — FS25 1.25.1.0

- **VideoElement** hérite de `GuiElement` (l.20)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VideoElement.new(target: any, custom_mt: any)` | 26 |  |
| `VideoElement:loadFromXML(xmlFile: any, key: any)` | 51 |  |
| `VideoElement:loadProfile(profile: any, applyProfile: any)` | 69 |  |
| `VideoElement:copyAttributes(src: any)` | 83 |  |
| `VideoElement:delete()` | 130 |  |
| `VideoElement:loadSubtitles(filename: any)` | 137 |  |
| `VideoElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 165 |  |
| `VideoElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 190 |  |
| `VideoElement:update(dt: any)` | 209 |  |
| `VideoElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 273 |  |
| `VideoElement:onEndVideo()` | 294 |  |
| `VideoElement:disposeVideo()` | 306 |  |
| `VideoElement:getIsActive()` | 319 |  |
| `VideoElement:playVideo()` | 325 |  |
| `VideoElement:stopVideo()` | 334 |  |
| `VideoElement:changeVideo(newVideoFilename: any, volume: any, duration: any)` | 343 |  |
