---@meta
-- FS25 1.25.1.0 : vehicles/VehicleCamera.lua (generated stub, FS25 Lua Atlas)

---@class VehicleCamera
VehicleCamera = {}

---@param vehicle Vehicle
---@param customMt table?
---@return table
function VehicleCamera.new(vehicle, customMt) end

---@param xmlFile XMLFile
---@param key string
---@param savegame any
---@param cameraIndex any
---@return boolean
function VehicleCamera:loadFromXML(xmlFile, key, savegame, cameraIndex) end

---@param savegame table
function VehicleCamera:onPostLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function VehicleCamera:saveToXMLFile(xmlFile, key, usedModNames) end

function VehicleCamera:delete() end

---@param offset number
function VehicleCamera:zoomSmoothly(offset) end

---@param transformId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
function VehicleCamera:raycastCallback(transformId, x, y, z, distance, nx, ny, nz) end

---@param dt number
function VehicleCamera:update(dt) end

function VehicleCamera:onActivate() end

---@param state any
---@param zoom any
function VehicleCamera:setLODDebugState(state, zoom) end

---@param state any
---@param height any
function VehicleCamera:setCameraYDebugState(state, height) end

function VehicleCamera:onDeactivate() end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function VehicleCamera:actionEventLookUpDown(actionName, inputValue, callbackState, isAnalog, isMouse) end

---@param value any
function VehicleCamera:touchEventLookUpDown(value) end

---@param value any
function VehicleCamera:touchEventZoomInOut(value) end

---@param value any
function VehicleCamera:touchEventLookLeftRight(value) end

---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function VehicleCamera:actionEventLookLeftRight(actionName, inputValue, callbackState, isAnalog, isMouse) end

function VehicleCamera:resetCamera() end

function VehicleCamera:updateRotateNodeRotation() end

function VehicleCamera:setSeparateCameraPose() end

function VehicleCamera:getTiltDirectionOffset() end

---@return boolean
---@return number
---@return number
---@return number
---@return number
---@return number
function VehicleCamera:getCollisionDistance() end

---@param newState boolean
function VehicleCamera:onActiveCameraSuspensionSettingChanged(newState) end

function VehicleCamera:onFovySettingChanged() end

---@param newState boolean
function VehicleCamera:onCameraCollisionDetectionSettingChanged(newState) end

---@param schema any
---@param basePath any
function VehicleCamera.registerCameraXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function VehicleCamera.registerCameraSavegameXMLPaths(schema, basePath) end

function VehicleCamera.consoleCommandLODDebug() end

---@param height any
function VehicleCamera.consoleCommandCameraYDebug(height) end
