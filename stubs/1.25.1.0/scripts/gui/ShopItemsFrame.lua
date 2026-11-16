---@meta
-- FS25 1.25.1.0 : gui/ShopItemsFrame.lua (generated stub, FS25 Lua Atlas)

--- Shop frame of the in-game menu listing purchasable items (extends `TabbedMenuFrameElement`). Only the pooled detail cells of the attributes layout are described here.
---@class ShopItemsFrame : TabbedMenuFrameElement
ShopItemsFrame = {}

--- Rebuilds the template cache: deletes old templates, then clones every element currently in `attributesLayout` into `detailsTemplates` by element name and creates an empty reuse cache for each name.
function ShopItemsFrame:buildCellDatabase() end

--- Returns a cell for the given template name, reusing one from the cache or cloning the template, and adds it to `attributesLayout`. Returns nil if no template has that name.
---@param name string
---@return table
function ShopItemsFrame:dequeueDetailsCell(name) end

--- Puts a cell back into the reuse cache for its name, removes it from `attributesLayout` and unlinks it from its parent so it can be handed out again later.
---@param cell table
function ShopItemsFrame:queueDetailsCell(cell) end
