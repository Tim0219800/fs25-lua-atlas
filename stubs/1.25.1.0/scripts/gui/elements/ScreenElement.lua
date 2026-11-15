---@meta
-- FS25 1.25.1.0 : gui/elements/ScreenElement.lua (stub généré, atlas Lua FS25)

---@class ScreenElement : FrameElement
ScreenElement = {}

---@param target any
---@param custom_mt any
function ScreenElement.new(target, custom_mt) end

function ScreenElement:onOpen() end

function ScreenElement:initializeScreen() end

function ScreenElement:onClose() end

function ScreenElement:invalidateScreen() end

---@param action any
---@param value any
---@param eventUsed any
function ScreenElement:inputEvent(action, value, eventUsed) end

---@param returnScreenClass any
function ScreenElement:setReturnScreenClass(returnScreenClass) end

function ScreenElement:getIsOpen() end

function ScreenElement:canReceiveFocus() end

---@param value any
function ScreenElement:setNextScreenClickSoundMuted(value) end
