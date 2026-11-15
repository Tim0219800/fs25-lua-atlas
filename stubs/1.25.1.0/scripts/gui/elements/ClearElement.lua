---@meta
-- FS25 1.25.1.0 : gui/elements/ClearElement.lua (generated stub, FS25 Lua Atlas)

---@class ClearElement : GuiElement
ClearElement = {}

---@param target any
---@param custom_mt any
function ClearElement.new(target, custom_mt) end

function ClearElement:delete() end

---@param xmlFile any
---@param key any
function ClearElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function ClearElement:loadProfile(profile, applyProfile) end

---@param src any
function ClearElement:copyAttributes(src) end

function ClearElement:getOffset() end

---@param rotation number
function ClearElement:setImageRotation(rotation) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ClearElement:draw(clipX1, clipY1, clipX2, clipY2) end

function ClearElement:canReceiveFocus() end

function ClearElement:getFocusTarget() end
