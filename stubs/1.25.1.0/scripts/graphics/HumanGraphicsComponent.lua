---@meta
-- FS25 1.25.1.0 : graphics/HumanGraphicsComponent.lua (generated stub, FS25 Lua Atlas)

---@class HumanGraphicsComponent
HumanGraphicsComponent = {}

---@return HumanGraphicsComponent
function HumanGraphicsComponent.new() end

function HumanGraphicsComponent:initialize() end

function HumanGraphicsComponent:show() end

function HumanGraphicsComponent:hide() end

function HumanGraphicsComponent:delete() end

---@param model HumanModel
function HumanGraphicsComponent:setModel(model) end

---@param visibility boolean
---@param overrideFoliageBending any
function HumanGraphicsComponent:setModelVisibility(visibility, overrideFoliageBending) end

---@param presetName string
---@param isOwner any
function HumanGraphicsComponent:applyCustomWorkStyle(presetName, isOwner) end

---@param currentStyle boolean?
---@return PlayerStyle
function HumanGraphicsComponent:getStyle(currentStyle) end

---@param style PlayerStyle
---@return boolean
function HumanGraphicsComponent:getRequiresModelReload(style) end

---@param style PlayerStyle
---@param callback function?
---@param callbackObject table?
---@param callbackArgs table?
---@param isTempStyle boolean?
---@param xmlFile XMLFile?
---@param isOwner boolean?
function HumanGraphicsComponent:setStyleAsync(style, callback, callbackObject, callbackArgs, isTempStyle, xmlFile, isOwner) end

---@param dt number
function HumanGraphicsComponent:update(dt) end

---@param x number
---@param y number
---@param textSize number
---@param debugDrawModel boolean?
---@return number
function HumanGraphicsComponent:debugDraw(x, y, textSize, debugDrawModel) end

---@param x number
---@param y number
---@param textSize number
---@return number
function HumanGraphicsComponent:debugDrawAnimator(x, y, textSize) end
