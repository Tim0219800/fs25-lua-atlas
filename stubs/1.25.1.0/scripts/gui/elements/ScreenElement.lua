---@meta
-- FS25 1.25.1.0 : gui/elements/ScreenElement.lua (generated stub, FS25 Lua Atlas)

--- Base class of full-screen GUI views, extending FrameElement. It tracks open state, shows the mouse cursor while open and restores it on close, and centralizes shared input handling: page prev/next for a page selector, list scrolling actions forwarded to the focused element, and dispatch to button actions. A few helpers it references (such as callButtonsWithAction, onPagePrevious, onPageNext) are not in this dump (UNVERIFIED).
---@class ScreenElement : FrameElement
ScreenElement = {}

--- Constructor. Builds a FrameElement and sets defaults: back allowed, cursor handling on, no return screen class, closed, not initialized, click sound not muted.
---@param target any
---@param custom_mt any
function ScreenElement.new(target, custom_mt) end

--- Called when the screen opens: runs initializeScreen once, remembers the current mouse cursor visibility, forces the cursor visible through g_inputBinding and sets the open flag.
function ScreenElement:onOpen() end

--- One-time setup marking the screen as initialized; if a pageSelector exists, disables the click sounds of its buttons since paging sounds are handled elsewhere.
function ScreenElement:initializeScreen() end

--- Called when the screen closes: restores the previous mouse cursor state if handleCursorVisibility is set and clears the open flag.
function ScreenElement:onClose() end

--- Empty hook for subclasses to refresh their content; does nothing here.
function ScreenElement:invalidateScreen() end

--- Handles input after the parent: page prev/next actions call onPagePrevious/onPageNext when a pageSelector exists (always consumed), list start/end/page actions call the matching scroll method on the focused element if present, and remaining actions are tried on child buttons. Does nothing while inputDisableTime is positive.
---@param action any
---@param value any
---@param eventUsed any
function ScreenElement:inputEvent(action, value, eventUsed) end

--- Stores which screen class gets opened when the user goes back from this screen.
---@param returnScreenClass any
function ScreenElement:setReturnScreenClass(returnScreenClass) end

--- Returns whether the screen is currently open.
function ScreenElement:getIsOpen() end

--- Returns true only when the screen is visible and every child element can itself receive focus.
function ScreenElement:canReceiveFocus() end

--- Sets the flag that mutes the next click sound, used to override sounds for activate and cancel actions. Called without argument it sets true.
---@param value any
function ScreenElement:setNextScreenClickSoundMuted(value) end
