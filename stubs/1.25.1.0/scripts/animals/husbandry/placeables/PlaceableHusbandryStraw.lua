---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryStraw.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for the straw bedding of a husbandry: animals consume straw and, optionally, produce manure from it. It overwrites the husbandry output, production, condition and info functions, drives an optional visual straw fill plane, and reads its settings from `placeable.husbandry.straw` (`strawPlane`, `manure#factor`, `manure#active`). It relies on the husbandry specialization functions (UNVERIFIED, file not in this lot).
---@class PlaceableHusbandryStraw
PlaceableHusbandryStraw = {}

--- Prerequisite check; always returns true, so the specialization has no requirement on other specializations.
---@param specializations table
---@return boolean
function PlaceableHusbandryStraw.prerequisitesPresent(specializations) end

--- Registers the new placeable function `updateStrawPlane`.
---@param placeableType any
function PlaceableHusbandryStraw.registerFunctions(placeableType) end

--- Registers overrides of `updateOutput`, `updateProduction`, `getConditionInfos` and `updateInfo`.
---@param placeableType any
function PlaceableHusbandryStraw.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onPostFinalizePlacement, onDelete, onFinalizePlacement, onReadStream, onHusbandryAnimalsUpdate and onHusbandryFillLevelChanged.
---@param placeableType any
function PlaceableHusbandryStraw.registerEventListeners(placeableType) end

--- Declares the XML paths under `husbandry.straw`: the `strawPlane` fill plane, `manure#factor` (default 1) and `manure#active` (default true).
---@param schema any
---@param basePath any
function PlaceableHusbandryStraw.registerXMLPaths(schema, basePath) end

--- Reads the manure factor and active flag, creates the optional straw `FillPlane` (deleted if loading fails), sets straw as input and manure as output fill types, and initializes liters-per-hour and info tables.
---@param savegame any
function PlaceableHusbandryStraw:onLoad(savegame) end

--- Refreshes the straw plane once placement is finalized.
function PlaceableHusbandryStraw:onPostFinalizePlacement() end

--- Deletes the straw fill plane if there is one.
function PlaceableHusbandryStraw:onDelete() end

--- Logs an XML warning if the husbandry storage does not support straw. Note: the manure check reads `self.isManureActive` instead of `spec.isManureActive`, so it is probably never true (apparent bug).
function PlaceableHusbandryStraw:onFinalizePlacement() end

--- Refreshes the straw plane after a client receives the initial stream.
---@param streamId any
---@param connection any
function PlaceableHusbandryStraw:onReadStream(streamId, connection) end

--- Sets the straw plane state to the straw fill level divided by capacity (0 if capacity is 0). Does nothing without a plane.
function PlaceableHusbandryStraw:updateStrawPlane() end

--- Override. On the server, removes straw according to liters per hour scaled by `environment.timeAdjustment`, adds manure in proportion to the straw really consumed, and refreshes the plane. Then calls the parent function.
---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryStraw:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

--- Override. Takes the parent production factor and, on the server, multiplies it by 0.75 if straw is present but manure storage is full, or by 0.9 if there is no straw. Returns the factor.
---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryStraw:updateProduction(superFunc, foodFactor) end

--- Recomputes straw input and manure output in liters per hour by summing, over the animal clusters, the subtype age-based daily amounts times animal count divided by 24.
---@param clusters any
function PlaceableHusbandryStraw:onHusbandryAnimalsUpdate(clusters) end

--- Refreshes the straw plane when the changed fill type is straw.
---@param fillTypeIndex any
---@param delta any
function PlaceableHusbandryStraw:onHusbandryFillLevelChanged(fillTypeIndex, delta) end

--- Override. Appends a straw condition bar (value and ratio of capacity) and a manure bar (inverted bar, disabled with a missing-manure-heap label when manure capacity is 0) to the parent list.
---@param superFunc any
function PlaceableHusbandryStraw:getConditionInfos(superFunc) end

--- Override. After the parent, appends two info entries to the table: straw and manure levels formatted as whole liters.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryStraw:updateInfo(superFunc, infoTable) end
