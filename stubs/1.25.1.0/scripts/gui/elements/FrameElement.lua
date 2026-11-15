---@meta
-- FS25 1.25.1.0 : gui/elements/FrameElement.lua (generated stub, FS25 Lua Atlas)

---@class FrameElement : GuiElement
FrameElement = {}

---@param target any
---@param customMt any
function FrameElement.new(target, customMt) end

---@param parent any
---@param includeId any
---@param suppressOnCreate any
---@param blockFocusHandlingReload any
function FrameElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

---@param src any
function FrameElement:copyAttributes(src) end

function FrameElement:delete() end

function FrameElement:getRootElement() end

---@param viewName viewName
function FrameElement:exposeControlsAsFields(viewName) end

---@param duration number
function FrameElement:disableInputForDuration(duration) end

function FrameElement:isInputDisabled() end

---@param dt any
function FrameElement:update(dt) end

---@param callback function
function FrameElement:setChangeScreenCallback(callback) end

---@param callback function
function FrameElement:setInputContextCallback(callback) end

---@param callback function
function FrameElement:setPlaySampleCallback(callback) end

---@param targetScreenClass table
---@param returnScreenClass any
function FrameElement:changeScreen(targetScreenClass, returnScreenClass) end

---@param isContextActive string
---@param contextName string
function FrameElement:toggleCustomInputContext(isContextActive, contextName) end

---@param sampleName string
function FrameElement:playSample(sampleName) end
