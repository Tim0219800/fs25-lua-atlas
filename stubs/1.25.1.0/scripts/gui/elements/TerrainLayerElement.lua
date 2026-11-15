---@meta
-- FS25 1.25.1.0 : gui/elements/TerrainLayerElement.lua (generated stub, FS25 Lua Atlas)

---@class TerrainLayerElement : GuiElement
TerrainLayerElement = {}

---@param target any
---@param custom_mt any
function TerrainLayerElement.new(target, custom_mt) end

function TerrainLayerElement:delete() end

---@param src any
function TerrainLayerElement:copyAttributes(src) end

---@param terrainRootNode any
---@param layer any
function TerrainLayerElement:setTerrainLayer(terrainRootNode, layer) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TerrainLayerElement:draw(clipX1, clipY1, clipX2, clipY2) end

function TerrainLayerElement:canReceiveFocus() end

function TerrainLayerElement:getFocusTarget() end
