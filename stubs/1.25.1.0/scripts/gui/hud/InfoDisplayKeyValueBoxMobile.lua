---@meta
-- FS25 1.25.1.0 : gui/hud/InfoDisplayKeyValueBoxMobile.lua (generated stub, FS25 Lua Atlas)

---@class InfoDisplayKeyValueBoxMobile : InfoDisplayBox
InfoDisplayKeyValueBoxMobile = {}

---@param infoDisplay any
---@param uiScale any
function InfoDisplayKeyValueBoxMobile.new(infoDisplay, uiScale) end

function InfoDisplayKeyValueBoxMobile:canDraw() end

---@return number
function InfoDisplayKeyValueBoxMobile:getDisplayHeight() end

---@param posX any
---@param posY any
function InfoDisplayKeyValueBoxMobile:draw(posX, posY) end

function InfoDisplayKeyValueBoxMobile:clear() end

---@param title any
function InfoDisplayKeyValueBoxMobile:setTitle(title) end

---@param baseSize any
---@param text any
---@param maxWidth any
---@param minSize any
function InfoDisplayKeyValueBoxMobile:textSizeToFit(baseSize, text, maxWidth, minSize) end

---@param key any
---@param value any
---@param accentuate any
---@param accentuateColor any
function InfoDisplayKeyValueBoxMobile:addLine(key, value, accentuate, accentuateColor) end

function InfoDisplayKeyValueBoxMobile:showNextFrame() end

---@param uiScale any
function InfoDisplayKeyValueBoxMobile:setScale(uiScale) end

function InfoDisplayKeyValueBoxMobile:storeScaledValues() end
