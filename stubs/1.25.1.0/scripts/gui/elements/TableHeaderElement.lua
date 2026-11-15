---@meta
-- FS25 1.25.1.0 : gui/elements/TableHeaderElement.lua (stub généré, atlas Lua FS25)

---@class TableHeaderElement : ButtonElement
TableHeaderElement = {}

---@param target any
---@param custom_mt any
function TableHeaderElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function TableHeaderElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function TableHeaderElement:loadProfile(profile, applyProfile) end

---@param src any
function TableHeaderElement:copyAttributes(src) end

function TableHeaderElement:onGuiSetupFinished() end

---@return The
function TableHeaderElement:toggleSorting() end

function TableHeaderElement:disableSorting() end

function TableHeaderElement:updateSortingDisplay() end
