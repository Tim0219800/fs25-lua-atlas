---@meta
-- FS25 1.25.1.0 : gui/hud/ContextActionDisplay.lua (stub généré, atlas Lua FS25)

---@class ContextActionDisplay : HUDDisplay
ContextActionDisplay = {}

---@param customMt any?
---@return any
function ContextActionDisplay.new(customMt) end

function ContextActionDisplay:storeScaledValues() end

---@param dt any
function ContextActionDisplay:update(dt) end

function ContextActionDisplay:draw() end

---@param contextAction string
---@param contextIconName string
---@param text string
---@param priority integer?
---@param actionText string?
function ContextActionDisplay:setContext(contextAction, contextIconName, text, priority, actionText) end

function ContextActionDisplay:resetContext() end
