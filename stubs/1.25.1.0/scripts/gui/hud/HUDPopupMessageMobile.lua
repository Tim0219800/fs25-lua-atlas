---@meta
-- FS25 1.25.1.0 : gui/hud/HUDPopupMessageMobile.lua (generated stub, FS25 Lua Atlas)

---@class HUDPopupMessageMobile : HUDDisplayElement
HUDPopupMessageMobile = {}

---@param hudAtlasPath string
---@param ingameMap ingameMap
---@return table
function HUDPopupMessageMobile.new(hudAtlasPath, ingameMap) end

---@param title table?
---@param text function?
---@param duration table?
---@param controls table?
---@param callback function?
---@param target table?
function HUDPopupMessageMobile:showMessage(title, text, duration, controls, callback, target) end

function HUDPopupMessageMobile:getVisible() end

---@return number
---@return number
function HUDPopupMessageMobile:getHidingTranslation() end

---@param message any
function HUDPopupMessageMobile:assignCurrentMessage(message) end

function HUDPopupMessageMobile:setCurrentMessageHeight() end

function HUDPopupMessageMobile:getTitleHeight() end

function HUDPopupMessageMobile:getTextHeight() end

function HUDPopupMessageMobile:getInputRowsHeight() end

function HUDPopupMessageMobile:animateHide() end

function HUDPopupMessageMobile:startMessage() end

function HUDPopupMessageMobile:finishMessage() end

---@param dt any
function HUDPopupMessageMobile:update(dt) end

function HUDPopupMessageMobile:updateCurrentMessage() end

function HUDPopupMessageMobile:updateButtonGlyphs() end

---@param isActive any
function HUDPopupMessageMobile:setInputActive(isActive) end

---@param actionName any
---@param inputValue any
function HUDPopupMessageMobile:onConfirmMessage(actionName, inputValue) end

function HUDPopupMessageMobile:draw() end

---@param uiScale number
function HUDPopupMessageMobile.getBackgroundPosition(uiScale) end

---@param uiScale any
function HUDPopupMessageMobile:setScale(uiScale) end

---@param width any
---@param height any
function HUDPopupMessageMobile:setDimension(width, height) end

function HUDPopupMessageMobile:storeScaledValues() end

---@param hudAtlasPath any
function HUDPopupMessageMobile.createBackground(hudAtlasPath) end

---@param hudAtlasPath any
function HUDPopupMessageMobile:createComponents(hudAtlasPath) end

---@param hudAtlasPath any
---@param posX any
---@param posY any
function HUDPopupMessageMobile:createInputRow(hudAtlasPath, posX, posY) end
