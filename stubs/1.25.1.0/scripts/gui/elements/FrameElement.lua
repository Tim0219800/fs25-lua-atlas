---@meta
-- FS25 1.25.1.0 : gui/elements/FrameElement.lua (generated stub, FS25 Lua Atlas)

--- FrameElement extends GuiElement and is the base of all GUI views, both partial frames and full screens. It keeps a list of registered control IDs that are exposed as fields on the view after loading, and holds callbacks for changing screen, toggling a custom input context and playing sounds. It also provides a short input-disable timer.
---@class FrameElement : GuiElement
FrameElement = {}

--- Constructor. Creates empty controlIDs, no-op callbacks, the custom-input-context flag off, time counters at 0 and playHoverSoundOnFocus false.
---@param target any
---@param customMt any
function FrameElement.new(target, customMt) end

--- Clones the frame via GuiElement, exposes the registered controls as fields on the clone and copies the three callbacks and the input-context flag.
---@param parent any
---@param includeId any
---@param suppressOnCreate any
---@param blockFocusHandlingReload any
function FrameElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

--- Copies attributes through the parent, then marks every control ID of the source as unresolved so it can be exposed again.
---@param src any
function FrameElement:copyAttributes(src) end

--- Deletes via the parent, then clears all registered control IDs and the fields exposed under those names.
function FrameElement:delete() end

--- Returns the first child element, the frame root. If there is no child, creates an empty GuiElement, adds it and returns it.
function FrameElement:getRootElement() end

--- For every descendant with an id, assigns it as a field of this frame; ids with an index become entries of a list field. Marks the ids resolved and warns about unresolved ones only when debug is enabled.
---@param viewName viewName
function FrameElement:exposeControlsAsFields(viewName) end

--- Blocks input for the given number of milliseconds, clamped between 0 and 10000.
---@param duration number
function FrameElement:disableInputForDuration(duration) end

--- Returns true while the input-disable timer is still above zero.
function FrameElement:isInputDisabled() end

--- Per-frame update: calls the parent, adds dt to the frame time and counts down the input-disable timer.
---@param dt any
function FrameElement:update(dt) end

--- Registers the function called by changeScreen; nil resets it to a no-op.
---@param callback function
function FrameElement:setChangeScreenCallback(callback) end

--- Registers the function called to toggle a custom input context; nil resets it to a no-op.
---@param callback function
function FrameElement:setInputContextCallback(callback) end

--- Registers the function used to play a named sound sample; nil resets it to a no-op.
---@param callback function
function FrameElement:setPlaySampleCallback(callback) end

--- Requests a screen change by calling the registered callback with this frame, the target screen class and the return screen class.
---@param targetScreenClass table
---@param returnScreenClass any
function FrameElement:changeScreen(targetScreenClass, returnScreenClass) end

--- Calls the input-context callback with the state and context name, but only when the requested state differs from the stored flag, then updates the flag.
---@param isContextActive string
---@param contextName string
function FrameElement:toggleCustomInputContext(isContextActive, contextName) end

--- Plays a sound sample by name through the registered callback unless sounds are suppressed for this element.
---@param sampleName string
function FrameElement:playSample(sampleName) end
