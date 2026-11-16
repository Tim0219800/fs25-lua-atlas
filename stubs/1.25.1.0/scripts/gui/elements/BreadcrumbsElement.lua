---@meta
-- FS25 1.25.1.0 : gui/elements/BreadcrumbsElement.lua (generated stub, FS25 Lua Atlas)

--- Breadcrumb trail layout used in deeper menus (shop, ModHub), derived from BoxLayoutElement. At setup it detaches the first TextBackdropElement and the first BitmapElement child as templates for crumb text and separator arrow. Only template handling is in this file; adding crumbs is UNVERIFIED here.
---@class BreadcrumbsElement : BoxLayoutElement
BreadcrumbsElement = {}

--- Constructor; creates the box layout and an empty `crumbs` table.
---@param target any
---@param custom_mt any
function BreadcrumbsElement.new(target, custom_mt) end

--- Copies the text and arrow templates from the source element by reference and marks this copy as not owning them, so it will not delete them.
---@param src any
function BreadcrumbsElement:copyAttributes(src) end

--- When no templates were inherited, takes the first TextBackdropElement and first BitmapElement descendants as templates, unlinks them from the layout and takes ownership of them.
function BreadcrumbsElement:onGuiSetupFinished() end

--- Deletes the text and arrow templates when this element owns them, then runs the parent delete.
function BreadcrumbsElement:delete() end
