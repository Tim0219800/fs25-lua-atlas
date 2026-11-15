---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TestAreas.lua (stub généré, atlas Lua FS25)

---@class TestAreas
TestAreas = {}

function TestAreas.initSpecialization() end

---@param specializations any
function TestAreas.prerequisitesPresent(specializations) end

---@param vehicleType any
function TestAreas.registerFunctions(vehicleType) end

---@param vehicleType any
function TestAreas.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TestAreas.registerEventListeners(vehicleType) end

---@param savegame any
function TestAreas:onPreLoad(savegame) end

---@param savegame any
function TestAreas:onPostLoad(savegame) end

---@param streamId any
---@param connection any
function TestAreas:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function TestAreas:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function TestAreas:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function TestAreas:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param streamId any
---@param connection any
function TestAreas:readTestAreasStream(streamId, connection) end

---@param streamId any
---@param connection any
function TestAreas:writeTestAreasStream(streamId, connection) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function TestAreas:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function TestAreas:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param workArea any
function TestAreas:generateTestAreasForWorkArea(workArea) end

---@param workArea any
---@param testArea any
function TestAreas:calculateTestAreaDimensions(workArea, testArea) end

---@param workArea any
---@param testArea any
function TestAreas:registerTestAreaForWorkArea(workArea, testArea) end

---@param fruitTypeIndex any
---@param fillTypeIndex any
---@param allowsForageGrowthState any
function TestAreas:setTestAreaRequirements(fruitTypeIndex, fillTypeIndex, allowsForageGrowthState) end

---@param testArea any
function TestAreas:getIsTestAreaActive(testArea) end

---@param testArea any
function TestAreas:processTestArea(testArea) end

---@param workAreaIndex any
function TestAreas:getTestAreaWidthByWorkAreaIndex(workAreaIndex) end

---@param workAreaIndex any
function TestAreas:getTestAreaChargeByWorkAreaIndex(workAreaIndex) end
