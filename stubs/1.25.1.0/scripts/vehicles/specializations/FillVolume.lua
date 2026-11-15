---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillVolume.lua (generated stub, FS25 Lua Atlas)

---@class FillVolume
FillVolume = {}

---@param specializations any
function FillVolume.prerequisitesPresent(specializations) end

function FillVolume.initSpecialization() end

---@param schema any
---@param basePath any
function FillVolume.registerInfoNodeXMLPaths(schema, basePath) end

---@param vehicleType any
function FillVolume.registerFunctions(vehicleType) end

---@param vehicleType any
function FillVolume.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FillVolume.registerEventListeners(vehicleType) end

---@param savegame any
function FillVolume:onLoad(savegame) end

function FillVolume:onDelete() end

---@param streamId any
---@param timestamp any
---@param connection any
function FillVolume:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function FillVolume:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function FillVolume:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolume(xmlFile, key, entry) end

---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolumeInfo(xmlFile, key, entry) end

---@param xmlFile any
---@param key any
---@param entry any
function FillVolume:loadFillVolumeHeightNode(xmlFile, key, entry) end

---@param loadInfoIndex any
function FillVolume:getFillVolumeLoadInfo(loadInfoIndex) end

---@param unloadInfoIndex any
function FillVolume:getFillVolumeUnloadInfo(unloadInfoIndex) end

---@param fillUnitIndex any
function FillVolume:getFillVolumeIndicesByFillUnitIndex(fillUnitIndex) end

---@param fillUnitIndex any
---@param forcedFillType any
function FillVolume:setFillVolumeForcedFillTypeByFillUnitIndex(fillUnitIndex, forcedFillType) end

---@param fillVolumeIndex any
---@param forcedFillType any
function FillVolume:setFillVolumeForcedFillType(fillVolumeIndex, forcedFillType) end

function FillVolume:getFillVolumeUVScrollSpeed() end

---@param superFunc function
---@param node integer
---@param forceUpdate boolean
---@param dt number
function FillVolume:setMovingToolDirty(superFunc, node, forceUpdate, dt) end

---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function FillVolume:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

---@param superFunc any
---@param part any
---@param dt any
function FillVolume:updateExtraDependentParts(superFunc, part, dt) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param _ any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function FillVolume:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, _, toolType, fillPositionData, appliedDelta) end

---@param values any
function FillVolume:updateDebugValues(values) end
