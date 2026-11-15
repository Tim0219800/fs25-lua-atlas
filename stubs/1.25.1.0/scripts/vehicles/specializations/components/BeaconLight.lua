---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/BeaconLight.lua (stub généré, atlas Lua FS25)

---@class BeaconLight
BeaconLight = {}

---@param vehicle any
---@param customMt any
function BeaconLight.new(vehicle, customMt) end

function BeaconLight:delete() end

---@param callback any
---@param callbackTarget any
function BeaconLight:setCallback(callback, callbackTarget) end

---@param targetTable any
---@param xmlFile any
---@param key any
---@param vehicle any
function BeaconLight.loadFromVehicleXML(targetTable, xmlFile, key, vehicle) end

---@param speed any
---@param intensity any
---@param mountType any
---@param variationName any
function BeaconLight:setXMLSettings(speed, intensity, mountType, variationName) end

---@param useRealLights any
---@param customRealLight any
---@param realLightRangeScale any
function BeaconLight:setRealLight(useRealLights, customRealLight, realLightRangeScale) end

---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function BeaconLight:loadFromXML(linkNode, xmlFilename, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param args any
function BeaconLight:onI3DLoaded(i3dNode, failedReason, args) end

---@param success any
function BeaconLight:onFinished(success) end

---@param xmlFile any
---@param key any
function BeaconLight:loadVariationFromXML(xmlFile, key) end

---@param dt any
function BeaconLight:update(dt) end

---@param isActive any
function BeaconLight:setIsActive(isActive) end

function BeaconLight:onLightsRealBeaconLightChanged() end

---@param rootNode any
function BeaconLight.spawnDebugBeacons(rootNode) end

---@param schema any
function BeaconLight.registerXMLPaths(schema) end

---@param schema any
---@param basePath any
function BeaconLight.registerVariationPaths(schema, basePath) end

---@param schema any
---@param basePath any
function BeaconLight.registerVehicleXMLPaths(schema, basePath) end
