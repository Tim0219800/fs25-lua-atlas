---@meta
-- FS25 1.25.1.0 : vehicles/LicensePlateManager.lua (stub généré, atlas Lua FS25)

---@class LicensePlateManager : AbstractManager
LicensePlateManager = {}

---@param customMt table?
---@return table
function LicensePlateManager.new(customMt) end

function LicensePlateManager:initDataStructures() end

---@param xmlFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function LicensePlateManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

function LicensePlateManager:unloadMapData() end

---@param xmlFile table
---@param baseDirectory string
function LicensePlateManager:loadLicensePlatesFromXML(xmlFile, baseDirectory) end

---@param i3dNode integer
---@param failedReason integer
---@param args table?
function LicensePlateManager:licensePlateI3DFileLoaded(i3dNode, failedReason, args) end

---@return boolean
function LicensePlateManager:getAreLicensePlatesAvailable() end

---@param preferedType integer
---@param includeFrame boolean?
---@return table
function LicensePlateManager:getLicensePlate(preferedType, includeFrame) end

---@param licensePlate table
---@param variationIndex integer
---@return table
function LicensePlateManager:getLicensePlateValues(licensePlate, variationIndex) end

---@return table
function LicensePlateManager:getRandomLicensePlateData() end

---@return table
---@return integer
function LicensePlateManager:getAvailableColors() end

---@return integer
function LicensePlateManager:getDefaultPlacementIndex() end

---@return table
function LicensePlateManager:getFont() end

---@param streamId integer
---@param connection integer
---@return table
function LicensePlateManager.readLicensePlateData(streamId, connection) end

---@param streamId integer
---@param connection integer
---@param licensePlateData table
function LicensePlateManager.writeLicensePlateData(streamId, connection, licensePlateData) end

---@param xmlFile XMLFile
---@param key string
---@param useAbsolutePaths boolean
---@return table
function LicensePlateManager.loadLicensePlateDataFromXML(xmlFile, key, useAbsolutePaths) end

---@param xmlFile XMLFile
---@param key string
---@param licensePlateData table
---@param useAbsolutePaths boolean
function LicensePlateManager.saveLicensePlateDataToXML(xmlFile, key, licensePlateData, useAbsolutePaths) end

function LicensePlateManager.createLicensePlateXMLSchema() end
