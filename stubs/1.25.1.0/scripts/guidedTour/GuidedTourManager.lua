---@meta
-- FS25 1.25.1.0 : guidedTour/GuidedTourManager.lua (generated stub, FS25 Lua Atlas)

---@class GuidedTourManager : AbstractManager
GuidedTourManager = {}

---@param customMt any
---@return table
function GuidedTourManager.new(customMt) end

function GuidedTourManager:initDataStructures() end

---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function GuidedTourManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

---@param xmlFileHandle any
---@param missionInfo any
---@param baseDirectory any
---@param isBaseType any
---@return boolean
function GuidedTourManager:loadGuidedTours(xmlFileHandle, missionInfo, baseDirectory, isBaseType) end

---@param xmlFilename string
---@return boolean
function GuidedTourManager:saveToXMLFile(xmlFilename) end

---@param xmlFilename string
---@return boolean
function GuidedTourManager:loadFromXMLFile(xmlFilename) end
