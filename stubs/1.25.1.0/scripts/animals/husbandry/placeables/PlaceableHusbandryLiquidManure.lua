---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that makes a husbandry produce liquid manure. It has no prerequisites but relies on husbandry storage methods (`addHusbandryFillLevelFromTool`, `getHusbandryFreeCapacity`, ...) provided by another specialization. The hourly output is computed from the animal clusters' `liquidManure` output curve and added to the storage on the server; a full tank slows the husbandry's production.
---@class PlaceableHusbandryLiquidManure
PlaceableHusbandryLiquidManure = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableHusbandryLiquidManure.prerequisitesPresent(specializations) end

--- Registers overrides of `updateOutput`, `updateProduction`, `updateInfo` and `getConditionInfos`.
---@param placeableType any
function PlaceableHusbandryLiquidManure.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onFinalizePlacement` and `onHusbandryAnimalsUpdate`.
---@param placeableType any
function PlaceableHusbandryLiquidManure.registerEventListeners(placeableType) end

--- Registers `husbandry.liquidManure.manure#factor` and `#active`. Note: no code in this file reads these two values.
---@param schema any
---@param basePath any
function PlaceableHusbandryLiquidManure.registerXMLPaths(schema, basePath) end

--- Initializes the hourly output to 0, sets the fill type to liquid manure and prepares the info entry.
---@param savegame any
function PlaceableHusbandryLiquidManure:onLoad(savegame) end

--- Logs an XML warning if the husbandry storage does not support the liquid manure fill type.
function PlaceableHusbandryLiquidManure:onFinalizePlacement() end

--- Override: on the server adds liquid manure to the husbandry storage (food factor times liters per hour times time adjustment), then calls the parent.
---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryLiquidManure:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

--- Override: on the server multiplies the parent's production factor by 0.75 when the liquid manure storage has no free capacity.
---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryLiquidManure:updateProduction(superFunc, foodFactor) end

--- Recomputes `litersPerHour` from the clusters: daily liquid manure per animal for its age times the animal count, divided by 24.
---@param clusters any
function PlaceableHusbandryLiquidManure:onHusbandryAnimalsUpdate(clusters) end

--- Override: appends a liquid manure fill entry (level and clamped ratio, inverted bar); if there is no tank capacity the entry is disabled and labelled with a missing tank message.
---@param superFunc any
function PlaceableHusbandryLiquidManure:getConditionInfos(superFunc) end

--- Override: appends the current liquid manure level in liters to the info list.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryLiquidManure:updateInfo(superFunc, infoTable) end
