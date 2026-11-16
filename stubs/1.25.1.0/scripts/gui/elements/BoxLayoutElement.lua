---@meta
-- FS25 1.25.1.0 : gui/elements/BoxLayoutElement.lua (generated stub, FS25 Lua Atlas)

--- Layout container that arranges its children in rows or columns (flows), derived from BitmapElement and able to draw a background image. Children whose `ignoreLayout` is set are skipped. XML/profile keys include alignmentX/Y, fillDirectionX/Y, flowDirection, focusDirection, numFlows, elementSpacing, lateralFlowSize, fitFlowToElements, autoValidateLayout, useFullVisibility, wrapAround and rememberLastFocus. It also links its children for gamepad focus navigation. `invalidateLayout` (which triggers the layout) is defined outside this file. Client-side GUI.
---@class BoxLayoutElement : BitmapElement
BoxLayoutElement = {}

--- Constructor with defaults: horizontal flow, left/top alignment, left-to-right and top-to-bottom filling, one flow, flows fitted to elements, no spacing, no auto validation, full visibility checks, empty cell tables.
---@param target any
---@param custom_mt any
function BoxLayoutElement.new(target, custom_mt) end

--- Reads alignment, fill directions, flow and focus direction, flow count, spacing, lateral flow size and the boolean options listed in the module description from the XML node. fitFlowToElements defaults to true when lateralFlowSize is 0.
---@param xmlFile any
---@param key any
function BoxLayoutElement:loadFromXML(xmlFile, key) end

--- Same settings as the XML loader but read from a GUI profile.
---@param profile any
---@param applyProfile any
function BoxLayoutElement:loadProfile(profile, applyProfile) end

--- Copies alignment, fill directions, flow/focus direction, flow count, sizes, spacing, tolerances and boolean options from a source layout.
---@param src any
function BoxLayoutElement:copyAttributes(src) end

--- Computes the layout tolerance in screen units from the pixel size constant, then invalidates the layout so it gets built.
function BoxLayoutElement:onGuiSetupFinished() end

--- Adds a child, resets its anchor and pivot to (0,0) so they do not interfere with layouting, and invalidates the layout when auto-validation is on.
---@param element any
function BoxLayoutElement:addElement(element) end

--- Removes a child and invalidates the layout when auto-validation is on.
---@param element any
function BoxLayoutElement:removeElement(element) end

--- Decides whether a child takes part in the layout, based on `ignoreLayout`, the ignoreVisibility argument and visibility mode (full or own visible flag). Note: operator precedence of the `and`/`or` chain means `ignoreLayout` only guards the first branch.
---@param element any
---@param ignoreVisibility any
function BoxLayoutElement:getIsElementIncluded(element, ignoreVisibility) end

--- Rebuilds the cell table from the included children: places them in order, starts a new flow when the size would overflow (while the flow count allows), and records flow sizes, lateral sizes and totals. Sizes include margins and spacing.
---@param ignoreVisibility boolean
function BoxLayoutElement:updateLayoutCells(ignoreVisibility) end

--- Positions every cell element according to alignment, fill directions, flow sizes, margins and spacing, with optional x/y offsets (used by scrolling layouts). Also resets each cell's anchor and pivot.
---@param offsetX integer
---@param offsetY integer
function BoxLayoutElement:applyCellPositions(offsetX, offsetY) end

--- Finds the first and last focusable element among the cells, stores the first as default focus target, clears the incoming focus targets and links each focusable cell to its neighbors through `focusLinkChildElement` (defined elsewhere).
function BoxLayoutElement:focusLinkCells() end

--- Returns true only if the layout handles focus and at least one child can receive focus.
function BoxLayoutElement:canReceiveFocus() end

--- Runs the parent handler; when `rememberLastFocus` is set and the currently focused element is a descendant, stores it as `lastFocusElement`.
function BoxLayoutElement:onFocusLeave() end

--- Updates the absolute position through the parent, then reapplies the cell positions so children follow.
function BoxLayoutElement:updateAbsolutePosition() end
