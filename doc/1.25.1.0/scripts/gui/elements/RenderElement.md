# gui/elements/RenderElement.lua

Source : `dataS/scripts/gui/elements/RenderElement.lua` — FS25 1.25.1.0

- **RenderElement** hérite de `GuiElement` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RenderElement.new(target: table, custom_mt: table?) → RenderElement` | 26 |  |
| `RenderElement:delete()` | 50 |  |
| `RenderElement:loadFromXML(xmlFile: integer, key: string)` | 60 |  |
| `RenderElement:loadProfile(profile: table, applyProfile: boolean)` | 91 |  |
| `RenderElement:copyAttributes(src: table)` | 117 |  |
| `RenderElement:createScene()` | 130 |  |
| `RenderElement:destroyScene()` | 136 |  |
| `RenderElement:setScene(i3dFilename: string)` | 156 |  |
| `RenderElement:onSceneLoaded(node: integer, failedReason: integer, args: table?)` | 173 |  |
| `RenderElement:createOverlay()` | 195 |  |
| `RenderElement:update(dt: number)` | 237 |  |
| `RenderElement:draw(clipX1: number?, clipY1: number?, clipX2: number?, clipY2: number?)` | 252 |  |
| `RenderElement:canReceiveFocus() → boolean` | 305 |  |
| `RenderElement:getSceneRoot() → integer` | 312 |  |
| `RenderElement:setRenderDirty()` | 318 |  |
