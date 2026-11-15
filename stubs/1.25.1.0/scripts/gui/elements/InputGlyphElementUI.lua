---@meta
-- FS25 1.25.1.0 : gui/elements/InputGlyphElementUI.lua (generated stub, FS25 Lua Atlas)

---@class InputGlyphElementUI : GuiElement
InputGlyphElementUI = {}

---@param target any
---@param custom_mt any
function InputGlyphElementUI.new(target, custom_mt) end

function InputGlyphElementUI:delete() end

---@param xmlFile any
---@param key any
function InputGlyphElementUI:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function InputGlyphElementUI:loadProfile(profile, applyProfile) end

---@param src any
function InputGlyphElementUI:copyAttributes(src) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElementUI:draw(clipX1, clipY1, clipX2, clipY2) end

---@param actions any
---@param actionText any
---@param actionTextSize any
---@param noModifiers any
---@param customBinding any
function InputGlyphElementUI:setActions(actions, actionText, actionTextSize, noModifiers, customBinding) end
