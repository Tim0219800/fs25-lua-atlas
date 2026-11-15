---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PowerTakeOffs.lua (stub généré, atlas Lua FS25)

---@class PowerTakeOffs
PowerTakeOffs = {}

---@param specializations any
function PowerTakeOffs.prerequisitesPresent(specializations) end

function PowerTakeOffs.initSpecialization() end

---@param schema any
---@param basePath any
function PowerTakeOffs.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PowerTakeOffs.registerOutputXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PowerTakeOffs.registerInputXMLPaths(schema, basePath) end

---@param vehicleType any
function PowerTakeOffs.registerFunctions(vehicleType) end

---@param vehicleType any
function PowerTakeOffs.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function PowerTakeOffs.registerEventListeners(vehicleType) end

---@param savegame any
function PowerTakeOffs:onPreLoad(savegame) end

---@param savegame any
function PowerTakeOffs:onLoad(savegame) end

---@param savegame any
function PowerTakeOffs:onPostLoad(savegame) end

function PowerTakeOffs:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PowerTakeOffs:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function PowerTakeOffs:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function PowerTakeOffs:getPowerTakeOffConfigIndex() end

---@param xmlFile any
---@param key any
function PowerTakeOffs:loadPowerTakeOffsFromXML(xmlFile, key) end

---@param xmlFile any
---@param baseName any
---@param powerTakeOffOutput any
function PowerTakeOffs:loadOutputPowerTakeOff(xmlFile, baseName, powerTakeOffOutput) end

---@param xmlFile any
---@param baseName any
---@param powerTakeOffInput any
function PowerTakeOffs:loadInputPowerTakeOff(xmlFile, baseName, powerTakeOffInput) end

---@param xmlFile any
---@param baseName any
---@param powerTakeOffLocal any
function PowerTakeOffs:loadLocalPowerTakeOff(xmlFile, baseName, powerTakeOffLocal) end

---@param powerTakeOff any
function PowerTakeOffs:placeLocalPowerTakeOff(powerTakeOff) end

---@param input any
---@param dt any
function PowerTakeOffs:updatePowerTakeOff(input, dt) end

---@param dt any
---@param attacherVehicle any
function PowerTakeOffs:updateAttachedPowerTakeOffs(dt, attacherVehicle) end

---@param input any
function PowerTakeOffs:updatePowerTakeOffLength(input) end

---@param jointDescIndex any
function PowerTakeOffs:getOutputPowerTakeOffsByJointDescIndex(jointDescIndex) end

function PowerTakeOffs:getOutputPowerTakeOffs() end

---@param jointDescIndex any
---@param ptoName any
function PowerTakeOffs:getInputPowerTakeOffsByJointDescIndexAndName(jointDescIndex, ptoName) end

function PowerTakeOffs:getInputPowerTakeOffs() end

function PowerTakeOffs:getIsPowerTakeOffActive() end

---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
function PowerTakeOffs:attachPowerTakeOff(attachableObject, inputJointDescIndex, jointDescIndex) end

---@param detachingVehicle any
---@param implement any
---@param jointDescIndex any
function PowerTakeOffs:detachPowerTakeOff(detachingVehicle, implement, jointDescIndex) end

---@param attacherJointNode any
---@param jointDescIndex any
---@param isTrailerAttacher any
function PowerTakeOffs:checkPowerTakeOffCollision(attacherJointNode, jointDescIndex, isTrailerAttacher) end

---@param input any
function PowerTakeOffs:parkPowerTakeOff(input) end

---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function PowerTakeOffs:onPreAttachImplement(attachableObject, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param attachableObject any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function PowerTakeOffs:onPostAttachImplement(attachableObject, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param implement any
function PowerTakeOffs:onPreDetachImplement(implement) end

---@param powerTakeOff any
---@param xmlFilename any
function PowerTakeOffs:loadPowerTakeOffFromConfigFile(powerTakeOff, xmlFilename) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PowerTakeOffs:onPowerTakeOffI3DLoaded(i3dNode, failedReason, args) end

---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadSingleJointPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

---@param powerTakeOff any
---@param dt any
function PowerTakeOffs:updateSingleJointPowerTakeOff(powerTakeOff, dt) end

---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadDoubleJointPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

---@param powerTakeOff any
---@param dt any
function PowerTakeOffs:updateDoubleJointPowerTakeOff(powerTakeOff, dt) end

---@param powerTakeOff any
---@param xmlFile any
---@param components any
---@param i3dMappings any
function PowerTakeOffs:loadBasicPowerTakeOff(powerTakeOff, xmlFile, components, i3dMappings) end

---@param powerTakeOff any
function PowerTakeOffs:updateDistanceOfTypedPowerTakeOff(powerTakeOff) end

---@param powerTakeOff any
---@param output any
function PowerTakeOffs:attachTypedPowerTakeOff(powerTakeOff, output) end

---@param powerTakeOff any
---@param output any
function PowerTakeOffs:detachTypedPowerTakeOff(powerTakeOff, output) end

---@param powerTakeOff any
---@param output any
function PowerTakeOffs:validatePowerTakeOffAttachment(powerTakeOff, output) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function PowerTakeOffs:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function PowerTakeOffs:updateExtraDependentParts(superFunc, part, dt) end

---@param vehicle any
---@param attacherJointIndex any
function PowerTakeOffs.consoleCommandTestConnection(vehicle, attacherJointIndex) end

---@param _ any
function PowerTakeOffs.consoleCommandDebug(_) end
