---@meta
-- FS25 1.25.1.0 : gui/elements/TimerElement.lua (generated stub, FS25 Lua Atlas)

---@class TimerElement : GuiElement
TimerElement = {}

---@param target any
---@param custom_mt any
function TimerElement.new(target, custom_mt) end

function TimerElement:delete() end

---@param xmlFile any
---@param key any
function TimerElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function TimerElement:loadProfile(profile, applyProfile) end

---@param src any
function TimerElement:copyAttributes(src) end

---@param newValue any
function TimerElement:setValue(newValue) end

---@param overlay any
---@param rotation any
function TimerElement:updateUVs(overlay, rotation) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TimerElement:draw(clipX1, clipY1, clipX2, clipY2) end
