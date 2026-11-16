# gui/elements/TerrainLayerElement.lua

*[Version française](../../../fr/scripts/gui/elements/TerrainLayerElement.md)*

Source: `dataS/scripts/gui/elements/TerrainLayerElement.lua` — FS25 1.25.1.0

✍ GUI element (derived from GuiElement) that draws a texture of a terrain layer as an overlay, for example in a layer picker. The overlay is created lazily and drawn with UV clipping when a parent clip rectangle is given. It uses the engine functions getTerrainLayerSubLayer, setOverlayLayer, setOverlayUVs and renderOverlay, whose behaviour is UNVERIFIED here. createOverlay and destroyOverlay are not defined in this file.

- **TerrainLayerElement** inherits from `GuiElement` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `TerrainLayerElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructor. Starts with no terrain layer overlay. |
| `TerrainLayerElement:delete()` | 30 | ✍ Destroys the overlay through destroyOverlay (not defined here, UNVERIFIED), then deletes the element via the parent class. Note: it passes self.terrainRootNode, which setTerrainLayer never stores. |
| `TerrainLayerElement:copyAttributes(src: any)` | 38 | ✍ Copies parent attributes then applies the source's terrain root node and layer through setTerrainLayer. |
| `TerrainLayerElement:setTerrainLayer(terrainRootNode: any, layer: any)` | 46 | ✍ Sets which terrain layer to show: creates the overlay on first use, binds it to sub-layer 0 of the layer and remembers the layer index. Does nothing if layer is nil. Note: the root node is not stored. |
| `TerrainLayerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 80 | ✍ Renders the layer overlay in the element's rectangle. When a clip rectangle is given, it shrinks the rectangle and adjusts the UVs to match, skipping drawing if the visible area is empty, then draws children via the parent class. |
| `TerrainLayerElement:canReceiveFocus()` | 133 | ✍ Returns true only if the element is visible, has at least one child and every child can itself receive focus. |
| `TerrainLayerElement:getFocusTarget()` | 148 | ✍ Returns the first child element when there is one, otherwise the element itself. |
