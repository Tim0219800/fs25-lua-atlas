---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FruitExtraObjects.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function FruitExtraObjects.prerequisitesPresent(specializations) end

function FruitExtraObjects.initSpecialization() end

---@param schema any
---@param basePath any
function FruitExtraObjects.registerXMLPaths(schema, basePath) end

---@param vehicleType table
function FruitExtraObjects.registerFunctions(vehicleType) end

---@param vehicleType table
function FruitExtraObjects.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType table
function FruitExtraObjects.registerEventListeners(vehicleType) end

---@param savegame table
function FruitExtraObjects:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function FruitExtraObjects:saveToXMLFile(xmlFile, key, usedModNames) end

---@param dynamicMountType any
---@param mountObject any
function FruitExtraObjects:onDynamicMountTypeChanged(dynamicMountType, mountObject) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function FruitExtraObjects:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

---@param attacherVehicle table
---@param implement table
function FruitExtraObjects:onPostDetach(attacherVehicle, implement) end

---@param xmlFile any
---@param key any
---@param extraObject any
function FruitExtraObjects:loadFruitExtraObjectFromXML(xmlFile, key, extraObject) end

function FruitExtraObjects:getFruitExtraObjectTypeData() end

function FruitExtraObjects:updateFruitExtraObjects() end
