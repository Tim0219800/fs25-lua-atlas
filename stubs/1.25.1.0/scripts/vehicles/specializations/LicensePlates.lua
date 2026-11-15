---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LicensePlates.lua (generated stub, FS25 Lua Atlas)

---@class LicensePlates
LicensePlates = {}

---@param specializations table
---@return boolean
function LicensePlates.prerequisitesPresent(specializations) end

function LicensePlates.initSpecialization() end

---@param vehicleType any
function LicensePlates.registerFunctions(vehicleType) end

---@param vehicleType any
function LicensePlates.registerEventListeners(vehicleType) end

---@param savegame table
function LicensePlates:onLoad(savegame) end

---@param savegame any
function LicensePlates:onPostLoad(savegame) end

---@param savegame any
function LicensePlates:onDelete(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function LicensePlates:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection Connection
function LicensePlates:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function LicensePlates:onWriteStream(streamId, connection) end

---@param licensePlateData any
function LicensePlates:setLicensePlatesData(licensePlateData) end

function LicensePlates:getLicensePlatesData() end

---@param data any
function LicensePlates:getLicensePlatesDataIsEqual(data) end

---@return boolean
function LicensePlates:getHasLicensePlates() end

---@return string
---@return boolean
function LicensePlates:getLicensePlateDialogSettings() end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LicensePlates.loadSpecValuePlateText(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function LicensePlates.getSpecValuePlateText(storeItem, realItem) end
