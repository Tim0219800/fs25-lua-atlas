---@meta
-- FS25 1.25.1.0 : gui/InGameMenuStatisticsFrame.lua (generated stub, FS25 Lua Atlas)

--- In-game menu tab frame showing game statistics (extends `TabbedMenuFrameElement`). Only a few functions are described here: menu button lookup per sub-category and a template/cache pool for the attribute list cells.
---@class InGameMenuStatisticsFrame : TabbedMenuFrameElement
InGameMenuStatisticsFrame = {}

--- Returns the menu button info table that matches the sub-category currently selected in `subCategoryPaging`.
---@return table
function InGameMenuStatisticsFrame:getMenuButtonInfo() end

--- Rebuilds the template cache: deletes old templates, then clones every element currently in `attributesLayout` into `detailsTemplates` by element name and creates an empty reuse cache for each name.
function InGameMenuStatisticsFrame:buildCellDatabase() end

--- Returns a cell for the given template name, reusing one from the cache or cloning the template, and adds it to `attributesLayout`. Returns nil if no template has that name.
---@param name string
---@return table
function InGameMenuStatisticsFrame:dequeueDetailsCell(name) end

--- Puts a cell back into the reuse cache for its name, removes it from `attributesLayout` and unlinks it from its parent so it can be handed out again later.
---@param cell table
function InGameMenuStatisticsFrame:queueDetailsCell(cell) end
