---@meta
-- FS25 1.25.1.0 : misc/BaleManager.lua (generated stub, FS25 Lua Atlas)

---@class BaleManager : AbstractManager
BaleManager = {}

---@param customMt any
---@return table
function BaleManager.new(customMt) end

function BaleManager:initDataStructures() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function BaleManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param i3dNode integer
---@param failedReason integer
---@param bale Bale
function BaleManager:baleLoaded(i3dNode, failedReason, bale) end

function BaleManager:unloadMapData() end

function BaleManager:unloadBaleData() end

---@param xmlFile any
---@param baseDirectory any
function BaleManager:loadBales(xmlFile, baseDirectory) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function BaleManager:loadBaleFromXML(xmlFile, key, baseDirectory) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
function BaleManager:loadModBaleFromXML(xmlFile, key, baseDirectory, customEnvironment) end

---@param bale XMLFile
---@param xmlFile XMLFile
---@param baseDirectory any
---@return table
function BaleManager:loadBaleDataFromXML(bale, xmlFile, baseDirectory) end

---@param dt number
function BaleManager:update(dt) end

---@param bale table
---@param currentTime number
---@param maxTime number
function BaleManager:registerFermentation(bale, currentTime, maxTime) end

---@param bale table
---@return number
function BaleManager:getFermentationTime(bale) end

---@param bale table
function BaleManager:removeFermentation(bale) end

---@param fillTypeIndex integer
---@param isRoundbale boolean
---@param width number
---@param height number
---@param length number
---@param diameter number
---@param customEnvironment string
---@return integer
function BaleManager:getBaleIndex(fillTypeIndex, isRoundbale, width, height, length, diameter, customEnvironment) end

---@param xmlFilename any
---@param useVisualInfomation any
function BaleManager:getBaleInfoByXMLFilename(xmlFilename, useVisualInfomation) end

---@param bale any
---@param fillTypeIndex any
---@param isRoundbale any
---@param width any
---@param height any
---@param length any
---@param diameter any
function BaleManager:getIsBaleMatching(bale, fillTypeIndex, isRoundbale, width, height, length, diameter) end

---@param fillTypeIndex integer
---@param isRoundbale boolean
---@param width number
---@param height number
---@param length number
---@param diameter number
---@param customEnvironment any
---@return integer
function BaleManager:getBaleXMLFilename(fillTypeIndex, isRoundbale, width, height, length, diameter, customEnvironment) end

---@param xmlFilename any
function BaleManager:getBaleTypeIndexByXMLFilename(xmlFilename) end

---@param baleIndex any
function BaleManager:getBaleXMLFilenameByIndex(baleIndex) end

---@param baleIndex any
function BaleManager:getIsRoundBale(baleIndex) end

---@param baleIndex integer
---@param fillTypeIndex integer
---@return number
function BaleManager:getBaleCapacityByBaleIndex(baleIndex, fillTypeIndex) end

---@param fillTypeIndex any
function BaleManager:getPossibleCapacitiesForFillType(fillTypeIndex) end

---@param fillTypeName any
---@param isRoundbale any
---@param width any
---@param height any
---@param length any
---@param wrapState any
---@param modName any
function BaleManager:consoleCommandAddBale(fillTypeName, isRoundbale, width, height, length, wrapState, modName) end

---@param drawSizeBox any
function BaleManager:consoleCommandAddBaleAll(drawSizeBox) end

function BaleManager:consoleCommandListBales() end

---@param schema any
function BaleManager.registerBaleXMLPaths(schema) end

---@param schema any
---@param basePath any
function BaleManager.registerBaleTextureXMLPaths(schema, basePath) end

---@param schema any
function BaleManager.registerMapBalesXMLPaths(schema) end
