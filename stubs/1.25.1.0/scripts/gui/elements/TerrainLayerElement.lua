---@meta
-- FS25 1.25.1.0 : gui/elements/TerrainLayerElement.lua (generated stub, FS25 Lua Atlas)

--- GUI element (derived from GuiElement) that draws a texture of a terrain layer as an overlay, for example in a layer picker. The overlay is created lazily and drawn with UV clipping when a parent clip rectangle is given. It uses the engine functions getTerrainLayerSubLayer, setOverlayLayer, setOverlayUVs and renderOverlay, whose behaviour is UNVERIFIED here. createOverlay and destroyOverlay are not defined in this file.
---@class TerrainLayerElement : GuiElement
TerrainLayerElement = {}

--- Constructor. Starts with no terrain layer overlay.
---@param target any
---@param custom_mt any
function TerrainLayerElement.new(target, custom_mt) end

--- Destroys the overlay through destroyOverlay (not defined here, UNVERIFIED), then deletes the element via the parent class. Note: it passes self.terrainRootNode, which setTerrainLayer never stores.
function TerrainLayerElement:delete() end

--- Copies parent attributes then applies the source's terrain root node and layer through setTerrainLayer.
---@param src any
function TerrainLayerElement:copyAttributes(src) end

--- Sets which terrain layer to show: creates the overlay on first use, binds it to sub-layer 0 of the layer and remembers the layer index. Does nothing if layer is nil. Note: the root node is not stored.
---@param terrainRootNode any
---@param layer any
function TerrainLayerElement:setTerrainLayer(terrainRootNode, layer) end

--- Renders the layer overlay in the element's rectangle. When a clip rectangle is given, it shrinks the rectangle and adjusts the UVs to match, skipping drawing if the visible area is empty, then draws children via the parent class.
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TerrainLayerElement:draw(clipX1, clipY1, clipX2, clipY2) end

--- Returns true only if the element is visible, has at least one child and every child can itself receive focus.
function TerrainLayerElement:canReceiveFocus() end

--- Returns the first child element when there is one, otherwise the element itself.
function TerrainLayerElement:getFocusTarget() end
