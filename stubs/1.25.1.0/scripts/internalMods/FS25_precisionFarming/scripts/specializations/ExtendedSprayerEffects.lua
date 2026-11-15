---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayerEffects.lua (stub généré, atlas Lua FS25)

---@class ExtendedSprayerEffects
ExtendedSprayerEffects = {}

---@param specializations table
---@return boolean
function ExtendedSprayerEffects.prerequisitesPresent(specializations) end

function ExtendedSprayerEffects.initSpecialization() end

---@param vehicleType any
function ExtendedSprayerEffects.registerFunctions(vehicleType) end

---@param vehicleType any
function ExtendedSprayerEffects.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ExtendedSprayerEffects.registerEventListeners(vehicleType) end

---@param savegame any
function ExtendedSprayerEffects:onLoad(savegame) end

---@param savegame any
function ExtendedSprayerEffects:onPostLoad(savegame) end

---@param savegame any
function ExtendedSprayerEffects:onPreInitComponentPlacement(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ExtendedSprayerEffects:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function ExtendedSprayerEffects:onDelete() end

---@param linkData any
function ExtendedSprayerEffects:addExtendedSprayerNozzleEffects(linkData) end

---@param effectData any
---@param effectNode any
---@param linkNode any
---@param effectNodeData any
function ExtendedSprayerEffects:addExtendedSprayerNozzleEffect(effectData, effectNode, linkNode, effectNodeData) end

---@param effectData any
function ExtendedSprayerEffects:initExtendedSprayerNozzleEffect(effectData) end

---@param sprayerEffects any
---@param useFullSection any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectsState(sprayerEffects, useFullSection, dt, isTurnedOn, lastSpeed) end

---@param effectData any
---@param dt any
---@param isTurnedOn any
---@param lastSpeed any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffectState(effectData, dt, isTurnedOn, lastSpeed) end

---@param dt any
function ExtendedSprayerEffects:updateExtendedSprayerNozzleEffects(dt) end

function ExtendedSprayerEffects:getNumExtendedSprayerNozzleEffectsActive() end

---@param superFunc any
function ExtendedSprayerEffects:getAreEffectsVisible(superFunc) end
