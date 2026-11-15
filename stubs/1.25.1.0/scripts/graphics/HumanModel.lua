---@meta
-- FS25 1.25.1.0 : graphics/HumanModel.lua (generated stub, FS25 Lua Atlas)

---@class HumanModel
HumanModel = {}

---@param xmlSchema XMLSchema
---@param baseKey string
function HumanModel.registerXMLPaths(xmlSchema, baseKey) end

---@param customMt any
---@return table
function HumanModel.new(customMt) end

---@param xmlFilename string
---@param isRealPlayer boolean
---@param isOwner boolean
---@param isAnimated boolean
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table
function HumanModel:load(xmlFilename, isRealPlayer, isOwner, isAnimated, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

---@param xmlFile XMLFile
---@param isRealPlayer boolean
---@param isOwner boolean
---@param isAnimated boolean
---@param asyncCallbackFunction function
---@param asyncCallbackObject table
---@param asyncCallbackArguments table
function HumanModel:loadFromXMLFileAsync(xmlFile, isRealPlayer, isOwner, isAnimated, asyncCallbackFunction, asyncCallbackObject, asyncCallbackArguments) end

---@param rootNode any
---@param failedReason any
---@param arguments any
function HumanModel:loadFileFinished(rootNode, failedReason, arguments) end

---@param playerStyle any
function HumanModel:onAllModelPartsLoaded(playerStyle) end

---@return boolean
function HumanModel:getVisibility() end

---@param isVisible boolean
function HumanModel:setVisibility(isVisible) end

---@param x number
---@param y number
---@param textSize number
---@return number
function HumanModel:debugDraw(x, y, textSize) end
