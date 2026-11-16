---@meta
-- FS25 1.25.1.0 : gui/elements/SmoothListElement.lua (generated stub, FS25 Lua Atlas)

--- Virtualised, smooth-scrolling list element (derived from GuiElement, with IndexChangeSubjectMixin and PlaySampleMixin). A data source supplies sections, item counts, cell type names and cell population, while a delegate receives events. Child ListItemElement cells are moved into a cell database, cloned on demand, recycled through a cache and positioned from computed offsets, so only visible rows exist. It supports vertical or horizontal lists, several items per row, section headers, empty filler cells, mouse, touch and gamepad input. Many members used here (scrollTo, setSelectedItem, setHighlightedItem, updateCellPosition, updateScrollClippers, raiseSliderUpdateEvent, update) are not in the parts of this file described below, so their behaviour is UNVERIFIED.
---@class SmoothListElement : GuiElement
SmoothListElement = {}

--- Constructor. Mixes in index-change and sound mixins and sets defaults: vertical, one lateral item, no spacing, selection at 1/1, mouse scrolling on, double-click interval 400 ms, touch scrolling only on touch platforms, empty cache and no sections.
---@param target table?
---@param custom_mt table?
---@return table
function SmoothListElement.new(target, custom_mt) end

--- Loads list settings from XML: callbacks (onScroll, onDoubleClick, onClick, onPressed), orientation, spacing, alignment, selection and scroll options, empty indicator id, delegate, data source, section header cell and clipper element names. Note: the listDataSource branch tests delegateName instead of dataSourceName, apparently a typo.
---@param xmlFile integer
---@param key string
function SmoothListElement:loadFromXML(xmlFile, key) end

--- Loads the same list settings from a GUI profile (orientation, spacing, alignment, scrolling, selection, focus and empty-row options, empty indicator id). Delegate, data source, callbacks and clipper names are not read from profiles.
---@param profile table
---@param applyProfile any
function SmoothListElement:loadProfile(profile, applyProfile) end

--- Clones the list through the parent class, then clones every cell of the cell database for the copy and creates empty caches with the same names. Returns the new list.
---@param parent table
---@param includeId boolean?
---@param suppressOnCreate boolean?
---@param blockFocusHandlingReload any
---@return table
function SmoothListElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

--- Copies data source, delegate, cell and clipper names, layout, spacing, selection and scroll options, axes, callbacks and loaded flag from a source list, and clones the sound mixin.
---@param src table
function SmoothListElement:copyAttributes(src) end

--- Called once the screen is built. Resolves the clipper elements and the empty indicator (made visible), and on first call builds the cell database from the child cells.
function SmoothListElement:onGuiSetupFinished() end

--- Moves each ListItemElement child into the cell database by name (auto-naming unnamed ones), unlinks it and removes it from the focus manager. Warns and drops an unknown section header name, and records a single cell type when only one exists.
function SmoothListElement:buildCellDatabase() end

--- Calls the given function on every template cell in the database and every recycled cell in the cache. Does not visit cells currently shown in the list.
---@param lambda function
function SmoothListElement:iterateOverDatabase(lambda) end

--- Deletes all cached cells and database cells, then deletes the list through the parent class (which handles the visible children).
function SmoothListElement:delete() end

--- When the screen opens, applies a selection stored earlier while the list was hidden (with sound suppressed) and clears the stored indices.
function SmoothListElement:onOpen() end

--- When the screen closes, if a smooth scroll is in progress, jumps immediately to its target offset via scrollTo (not defined in the visible code, UNVERIFIED).
function SmoothListElement:onClose() end

--- Sets the object that supplies sections, counts, cell types and cell contents. Also becomes the delegate if none is set yet.
---@param dataSource table
function SmoothListElement:setDataSource(dataSource) end

--- Sets the object that receives list events such as selection changes. Also becomes the data source if none is set yet.
---@param delegate table
function SmoothListElement:setDelegate(delegate) end

--- Returns a cell of the given type, taking one from the cache and re-adding it as a child, or cloning the template. Returns nil for an unknown type. Registers the cell with the focus manager.
---@param name string
---@return table
function SmoothListElement:dequeueReusableCell(name) end

--- Returns a cell to the cache: clears its slot in its section, resets its section indices, unlinks it and removes it from the focus manager.
---@param cell table
function SmoothListElement:queueReusableCell(cell) end

--- Sets the target through the parent class, replaces the delegate and data source when they equal the original target, and propagates the new target to all template and cached cells.
---@param target table
---@param originalTarget table?
---@param callOnCreate boolean?
function SmoothListElement:setTarget(target, originalTarget, callOnCreate) end

--- Rebuilds section info and refreshes the view with repopulation; call it whenever the data changes. With forceCellTypeUpdate, shown cells are recycled first so their types are re-queried. Does nothing without a data source; sound is suppressed meanwhile.
---@param forceCellTypeUpdate boolean
function SmoothListElement:reloadData(forceCellTypeUpdate) end

--- Meant to reload one section but currently just calls reloadData for the whole list (marked TODO in the source). The section argument is unused.
---@param section integer?
function SmoothListElement:reloadSection(section) end

--- Asks the data source for section and item counts, computes per-item length and lateral offsets, row layout, section bounds, content size, scroll step and alignment offset, clamps the selection and view offset, toggles the empty indicator and updates the clippers.
function SmoothListElement:buildSectionInfo() end

--- Returns the cell template length along the list's length axis for the item, using the single cell type if there is one, else the data source's cell type for that item.
---@param section integer
---@param index integer
---@return number
function SmoothListElement:getLengthOfItemFast(section, index) end

--- Returns the cell template size along the list's width axis for the item, using the single cell type if there is one, else the data source's cell type.
---@param section integer
---@param index integer
---@return number
function SmoothListElement:getWidthOfItemFast(section, index) end

--- Works out the first and last visible items from the view offset, recycles cells outside the range, creates and populates missing cells (headers, items, empty fillers), repopulates existing ones if asked, repositions all cells, then raises the slider update unless updateSlider is false.
---@param updateSlider boolean
---@param repopulate any
function SmoothListElement:updateView(updateSlider, repopulate) end

--- Called each frame while the gamepad jump-to-start input is held: starts a hold timer and, once the delay has passed, calls scrollToStart a single time.
function SmoothListElement:scrollToStartGamepad() end

--- Called each frame while the gamepad jump-to-end input is held: starts a hold timer and, once the delay has passed, calls scrollToEnd a single time.
function SmoothListElement:scrollToEndGamepad() end

--- Selects the first item: of the whole list with a single section, left Ctrl held or a non-keyboard input mode, otherwise the first item of the current section.
function SmoothListElement:scrollToStart() end

--- Selects the last item: of the whole list with a single section, left Ctrl held or a non-keyboard input mode, otherwise the last item of the current section. Errors if the list has no sections.
function SmoothListElement:scrollToEnd() end

--- Page up. With one section or Ctrl held, selects the item that starts the previous page of the content; otherwise selects the first item of the previous section. Note: targetOffset can stay nil if no matching cell is found.
function SmoothListElement:scrollToPrevPage() end

--- Page down. With one section or Ctrl held, selects the first item beyond the visible area and smooth-scrolls to it (or selects the last item if at the end); otherwise selects the first item of the next section and scrolls it to the top.
function SmoothListElement:scrollToNextPage() end

--- Sets a target view offset (clamped to the content) that the list moves toward over time. Note: with listSmoothingDisabled it calls scrollTo but does not return, so the smooth target is still set afterwards.
---@param offset any
function SmoothListElement:smoothScrollTo(offset) end

--- Marks the visible cell matching the selected section and index as selected and others as not, unless selection is hidden when the list lacks focus.
function SmoothListElement:applyElementSelection() end

--- Sets every child cell that supports it to not selected, for example when the list loses focus.
function SmoothListElement:clearElementSelection() end

--- Returns the total number of items from the last section scan (headers are not counted in the sum computed in buildSectionInfo).
---@return Number
function SmoothListElement:getItemCount() end

--- Returns the selected index inside its section.
function SmoothListElement:getSelectedIndexInSection() end

--- Returns the selected section index and the selected index within that section.
function SmoothListElement:getSelectedPath() end

--- Returns the currently shown cell for a section and index, or nil if the section does not exist or the cell is not displayed.
---@param section any
---@param index any
function SmoothListElement:getElementAtSectionIndex(section, index) end

--- Handles a click or tap on the hovered cell: detects double clicks within the interval, selects the cell (unless the press was a scroll gesture) and raises click or double-click notifications. Resets the click timer if nothing is hovered.
function SmoothListElement:activateInput() end

--- Marks the input as pressed, resets its timer and gives focus to this list.
function SmoothListElement:onInputDown() end

--- Marks the input as released and resets the accumulated touch movement distance.
function SmoothListElement:onInputUp() end

--- Raises onDoubleClickCallback with the list, section, index, cell and a true flag.
---@param section any
---@param index any
---@param element any
function SmoothListElement:notifyDoubleClick(section, index, element) end

--- Raises onClickCallback with the list, section, index, cell and whether the item was already selected.
---@param section any
---@param index any
---@param element any
---@param wasAlreadySelected any
function SmoothListElement:notifyClick(section, index, element, wasAlreadySelected) end

--- Handles mouse input when active and not ignoring the mouse: updates the hovered cell (headers and fillers excluded), starts and activates on left press, scrolls or moves the selection with the wheel, and ends the press on release. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function SmoothListElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

--- Handles touch input: tracks the hovered cell, accumulates drag distance and delta for touch scrolling when supported, keeps the touch id, and activates the cell on release if the gesture was not a scroll. Returns whether the event was used.
---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
---@return any
function SmoothListElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

--- Returns true if the list is visible, handles focus, is enabled and either has items or canReceiveFocusWhileEmpty is set.
function SmoothListElement:canReceiveFocus() end

--- Called when the focused list is activated (confirm). Does nothing if empty or ignoring activation; otherwise raises the click callback for the selected item, or else the double-click callback, if one is set.
function SmoothListElement:onFocusActivate() end

--- On gaining focus, applies the selection display and tells the delegate through onListSelectionChanged (if defined) with the selected section and index.
function SmoothListElement:onFocusEnter() end

--- On losing focus, clears the cell selection display if selection is not shown without focus, then runs the parent handler.
function SmoothListElement:onFocusLeave() end
