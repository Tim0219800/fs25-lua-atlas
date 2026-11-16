---@meta
-- FS25 1.25.1.0 : gui/elements/TabbedMenuFrameElement.lua (generated stub, FS25 Lua Atlas)

--- Base class (derived from FrameElement) for the frames shown inside the tabbed in-game menu. It stores custom menu-button info with a dirty flag so the container menu can refresh its buttons, the page number, a title, and a close-request hook for frames that must finish work first. The container is not in this file, so how it consumes these values is UNVERIFIED.
---@class TabbedMenuFrameElement : FrameElement
TabbedMenuFrameElement = {}

--- Constructor. Initialises empty menu-button info, the dirty flags, current page 1 (one page) and a no-op close callback.
---@param target any
---@param customMt any
function TabbedMenuFrameElement.new(target, customMt) end

--- Empty hook for late initialisation of a frame; subclasses override it. Accepts any arguments and does nothing here.
function TabbedMenuFrameElement:initialize(...) end

--- Returns whether this frame supplies its own menu buttons.
function TabbedMenuFrameElement:getHasCustomMenuButtons() end

--- Returns the stored array of custom button descriptions (input action, optional text, optional callback).
---@return table
function TabbedMenuFrameElement:getMenuButtonInfo() end

--- Stores the custom button info and flags custom buttons as present unless nil is passed, which resets it. It does not mark the info dirty.
---@param menuButtonInfo table?
function TabbedMenuFrameElement:setMenuButtonInfo(menuButtonInfo) end

--- Raises the dirty flag so the container menu rebuilds its buttons from this frame's info.
function TabbedMenuFrameElement:setMenuButtonInfoDirty() end

--- Returns whether the button info has changed since the flag was last cleared.
function TabbedMenuFrameElement:isMenuButtonInfoDirty() end

--- Clears the button-info dirty flag.
function TabbedMenuFrameElement:clearMenuButtonInfoDirty() end

--- Returns the default main-content size {1, 1} (full screen in normalised units). Subclasses override it.
function TabbedMenuFrameElement:getMainElementSize() end

--- Returns the default main-content position {0, 0}. Subclasses override it.
function TabbedMenuFrameElement:getMainElementPosition() end

--- Stores the given callback (or a no-op) and returns true, meaning closing is allowed at once. Subclasses override it to delay closing, e.g. to save changes, and call the callback later.
---@param callback any
function TabbedMenuFrameElement:requestClose(callback) end

--- Called by the container when the frame opens. Runs the superclass onOpen, then calls updatePagingButtons, which is not defined in this file (UNVERIFIED, presumably from FrameElement).
function TabbedMenuFrameElement:onFrameOpen() end

--- Called by the container when the frame closes. Only forwards to the superclass onClose.
function TabbedMenuFrameElement:onFrameClose() end

--- Stores the frame title and, if a pagingTitle element exists on the frame, updates its text too.
---@param title any
function TabbedMenuFrameElement:setTitle(title) end
