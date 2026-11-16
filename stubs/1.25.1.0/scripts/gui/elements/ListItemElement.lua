---@meta
-- FS25 1.25.1.0 : gui/elements/ListItemElement.lua (generated stub, FS25 Lua Atlas)

--- ListItemElement is a BitmapElement used as a row or cell by SmoothListElement, with a background image layer. It supports selection rules, optional focusing of children and alternating row colors, and raises onFocus, onLeave and onClick callbacks from mouse and touch input. XML or profile keys: allowSelected, autoSelectChildren, alternateChildren, hideSelection, alternateBackgroundColor.
---@class ListItemElement : BitmapElement
ListItemElement = {}

--- Constructor. Sets selection allowed, handleFocus off, children auto-selection off, no alternate background and an empty attributes table.
---@param target any
---@param custom_mt any
function ListItemElement.new(target, custom_mt) end

--- Reads allowSelected, autoSelectChildren, alternateChildren and hideSelection, and registers the onFocus, onLeave and onClick callbacks from the XML node.
---@param xmlFile any
---@param key any
function ListItemElement:loadFromXML(xmlFile, key) end

--- Reads the four boolean options from the profile. On first load only, stores the normal overlay color as backgroundColor and reads alternateBackgroundColor.
---@param profile any
---@param applyProfile any
function ListItemElement:loadProfile(profile, applyProfile) end

--- Copies selection options, background colors, the section-header flag and the three callbacks from a source element.
---@param src any
function ListItemElement:copyAttributes(src) end

--- Calls the parent onClose, then resets the element.
function ListItemElement:onClose() end

--- Applies selection only if the item allows it and does not hide the selection.
---@param selected any
function ListItemElement:setSelected(selected) end

--- Handles mouse input when visible: highlights and raises onFocus on first hover, raises onClick on left button down, raises onLeave and clears highlight on exit. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ListItemElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Touch equivalent of mouseEvent: highlight and onFocus on entry, onClick on touch down, onLeave and unhighlight on exit. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function ListItemElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Delegates to the parent focus target only when autoSelectChildren is true; otherwise the item itself is the focus target.
---@param incomingDirection incomingDirection
---@param moveDirection moveDirection
---@return GuiElement
function ListItemElement:getFocusTarget(incomingDirection, moveDirection) end
