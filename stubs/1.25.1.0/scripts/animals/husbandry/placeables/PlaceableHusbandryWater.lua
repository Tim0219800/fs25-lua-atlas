---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryWater.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the water supply of a husbandry. Water is either drawn from the husbandry storage or bought automatically (charged to the owner farm), it can show a water plane, and it registers water places as feeding places in the animal engine. XML keys are under `placeable.husbandry.water` (`#automaticWaterSupply`, `waterPlaces.waterPlace#node`, `waterPlane`).
---@class PlaceableHusbandryWater
PlaceableHusbandryWater = {}

--- Prerequisite check; always returns true, so the specialization has no requirement on other specializations.
---@param specializations table
---@return boolean
function PlaceableHusbandryWater.prerequisitesPresent(specializations) end

--- Registers the new placeable function `updateWaterPlane`.
---@param placeableType any
function PlaceableHusbandryWater.registerFunctions(placeableType) end

--- Registers overrides of `updateFeeding`, `getConditionInfos` and `updateInfo`.
---@param placeableType any
function PlaceableHusbandryWater.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onPostFinalizePlacement, onHusbandryAnimalsUpdate, onHusbandryAnimalsCreated and onHusbandryFillLevelChanged.
---@param placeableType any
function PlaceableHusbandryWater.registerEventListeners(placeableType) end

--- Declares the XML paths under `husbandry.water`: `#automaticWaterSupply` (default false), repeated `waterPlaces.waterPlace#node` and the `waterPlane` fill plane.
---@param schema any
---@param basePath any
function PlaceableHusbandryWater.registerXMLPaths(schema, basePath) end

--- Initializes state, reads `#automaticWaterSupply`, creates the optional water `FillPlane` (full if automatic supply, else empty; deleted if loading fails) and loads each water place node.
---@param savegame any
function PlaceableHusbandryWater:onLoad(savegame) end

--- Refreshes the water plane and water places once placement is finalized.
function PlaceableHusbandryWater:onPostFinalizePlacement() end

--- Deletes the water fill plane if there is one.
function PlaceableHusbandryWater:onDelete() end

--- If automatic supply is off but the husbandry storage does not support water, logs an XML warning and switches to automatic water supply.
function PlaceableHusbandryWater:onFinalizePlacement() end

--- Sets the water plane state to water level divided by capacity, and, if the engine husbandry exists, calls `updateFeedingPlace` for each registered water place with the current level.
function PlaceableHusbandryWater:updateWaterPlane() end

--- Override. Server only: consumes `litersPerHour` times `timeAdjustment`. With automatic supply it charges the owner farm (`MoneyType.PURCHASE_WATER`); otherwise it removes water from storage and scales the parent factor by the share actually supplied. Returns the factor.
---@param superFunc any
function PlaceableHusbandryWater:updateFeeding(superFunc) end

--- Stores the engine husbandry id and registers each water place node as a water feeding place with `addFeedingPlace`; the place is kept only if it is reachable (accessible).
---@param husbandryId any
function PlaceableHusbandryWater:onHusbandryAnimalsCreated(husbandryId) end

--- Recomputes water demand in liters per hour by summing, over the animal clusters, the age-based daily water amount times animal count divided by 24.
---@param clusters any
function PlaceableHusbandryWater:onHusbandryAnimalsUpdate(clusters) end

--- Refreshes the water plane and places when the changed fill type is water.
---@param fillTypeIndex any
---@param delta any
function PlaceableHusbandryWater:onHusbandryFillLevelChanged(fillTypeIndex, delta) end

--- Override. Unless automatic supply is on, appends a water condition bar (level and ratio of capacity) to the parent list.
---@param superFunc any
function PlaceableHusbandryWater:getConditionInfos(superFunc) end

--- Override. After the parent, appends the water level in whole liters to the info table, unless automatic supply is on.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryWater:updateInfo(superFunc, infoTable) end
