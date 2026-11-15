---@meta
-- FS25 1.25.1.0 : gui/elements/ListItemElement.lua (stub généré, atlas Lua FS25)

---@class ListItemElement : BitmapElement
ListItemElement = {}

---@param target any
---@param custom_mt any
function ListItemElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function ListItemElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function ListItemElement:loadProfile(profile, applyProfile) end

---@param src any
function ListItemElement:copyAttributes(src) end

function ListItemElement:onClose() end

---@param selected any
function ListItemElement:setSelected(selected) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ListItemElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function ListItemElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

---@param incomingDirection incomingDirection
---@param moveDirection moveDirection
---@return GuiElement
function ListItemElement:getFocusTarget(incomingDirection, moveDirection) end
