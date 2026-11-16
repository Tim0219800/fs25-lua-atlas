---@meta
-- FS25 1.25.1.0 : gui/elements/TableHeaderElement.lua (generated stub, FS25 Lua Atlas)

--- Button element (derived from ButtonElement) used as a column header of a table, with sorting state off, ascending or descending. Children named iconAscending or iconDescending in the screen XML serve as sort icons, and the header must sit outside the table. It loads targetTableId, columnName, allowSortingAsc and allowSortingDesc from XML or profile.
---@class TableHeaderElement : ButtonElement
TableHeaderElement = {}

--- Constructor. Allows only the off state, empties the icon slots, sets the order to off and clears target table id and column name.
---@param target any
---@param custom_mt any
function TableHeaderElement.new(target, custom_mt) end

--- Loads targetTableId, columnName, allowSortingAsc and allowSortingDesc from the XML node after the parent class, keeping current values when an attribute is missing.
---@param xmlFile any
---@param key any
function TableHeaderElement:loadFromXML(xmlFile, key) end

--- Reads columnName, allowSortingAsc and allowSortingDesc from the GUI profile, keeping current values as defaults. targetTableId is not read from profiles.
---@param profile any
---@param applyProfile any
function TableHeaderElement:loadProfile(profile, applyProfile) end

--- Copies target table id, column name and allowed sorting states from a source header. Note: unpack is used on the states table, whose false entries and index keys may not be copied faithfully.
---@param src any
function TableHeaderElement:copyAttributes(src) end

--- After the parent setup, scans child elements and registers those named for ascending or descending as the sort icons.
function TableHeaderElement:onGuiSetupFinished() end

--- Advances to the next allowed sorting state, wrapping around and ending on off at the latest, refreshes the icons if the state changed and returns the new order index.
---@return The
function TableHeaderElement:toggleSorting() end

--- Forces the state back to off and refreshes the icon display.
function TableHeaderElement:disableSorting() end

--- Shows only the icon for the current state and hides the others. Note: it calls setVisible on every entry in sortingIcons without a nil check, though the off state has no icon.
function TableHeaderElement:updateSortingDisplay() end
