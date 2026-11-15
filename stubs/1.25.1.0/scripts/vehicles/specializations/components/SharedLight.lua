---@meta
-- FS25 1.25.1.0 : vehicles/specializations/components/SharedLight.lua (generated stub, FS25 Lua Atlas)

---@class SharedLight
SharedLight = {}

---@param vehicle any
---@param staticLights any
---@param customMt any
function SharedLight.new(vehicle, staticLights, customMt) end

function SharedLight:delete() end

---@param callback any
---@param callbackTarget any
function SharedLight:setCallback(callback, callbackTarget) end

---@param success any
function SharedLight:onFinished(success) end

---@param rotationNodes any
function SharedLight:setRotationNodes(rotationNodes) end

---@param lightTypes any
---@param excludedLightTypes any
function SharedLight:setLightTypes(lightTypes, excludedLightTypes) end

---@param key any
---@param baseDirectory any
---@param callback any
function SharedLight:loadFromVehicleXML(key, baseDirectory, callback) end

---@param linkNode any
---@param xmlFilename any
---@param baseDirectory any
function SharedLight:loadFromXML(linkNode, xmlFilename, baseDirectory) end

---@param i3dNode any
---@param failedReason any
---@param args any
function SharedLight:onI3DLoaded(i3dNode, failedReason, args) end

---@param _ any
---@param defaultLight any
---@param brakeLight any
---@param highBeam any
---@param workLightBack any
---@param workLightFront any
---@param turnLightLeft any
---@param turnLeftRight any
---@param reverseLight any
function SharedLight.consoleCommandDebug(_, defaultLight, brakeLight, highBeam, workLightBack, workLightFront, turnLightLeft, turnLeftRight, reverseLight) end

---@param schema any
---@param basePath any
function SharedLight.registerXMLPaths(schema, basePath) end

---@param schema any
function SharedLight.registerExternalXMLPaths(schema) end
