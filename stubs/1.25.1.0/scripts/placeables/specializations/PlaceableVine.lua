---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableVine.lua (stub généré, atlas Lua FS25)

---@class PlaceableVine
PlaceableVine = {}

---@param specializations table
---@return boolean
function PlaceableVine.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableVine.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableVine.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableVine.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableVine.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableVine.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableVine:onLoad(savegame) end

---@param superFunc any
---@param segment any
function PlaceableVine:deleteSegment(superFunc, segment) end

---@param superFunc any
---@param segment any
---@param sync any
function PlaceableVine:generateSegmentPoles(superFunc, segment, sync) end

---@param isPreview any
---@param segment any
---@param panel any
---@param poleIndex any
---@param dy any
---@param pole any
function PlaceableVine:onCreateSegmentPanel(isPreview, segment, panel, poleIndex, dy, pole) end

---@param superFunc any
---@param segment any
---@param segmentIndex any
---@param poleIndex any
function PlaceableVine:doDeletePanel(superFunc, segment, segmentIndex, poleIndex) end

---@param data any
function PlaceableVine:destroyVineArea(data) end

function PlaceableVine:getVineFruitTypeIndex() end

---@return integer
function PlaceableVine:getInitialGrowthState() end

---@param node any
---@param isGrowing any
function PlaceableVine:updateVineNode(node, isGrowing) end

---@param data any
function PlaceableVine:updateVineVisuals(data) end

---@param node any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
---@param callback any
---@param target any
function PlaceableVine:harvestVine(node, startX, startY, startZ, currentX, currentY, currentZ, callback, target) end

---@param node any
---@param worldX any
---@param worldY any
---@param worldZ any
---@param intensity any
function PlaceableVine:setShakingFactor(node, worldX, worldY, worldZ, intensity) end

---@param node integer
---@param worldX number
---@param worldY number
---@param worldZ number
---@param strength number
---@param length number
---@param fadeLength number?
function PlaceableVine:setSqueezeFactor(node, worldX, worldY, worldZ, strength, length, fadeLength) end

---@param node any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlaceableVine:prepareVine(node, startX, startY, startZ, currentX, currentY, currentZ) end

---@param node any
---@param i any
---@param startX any
---@param startY any
---@param startZ any
---@param currentX any
---@param currentY any
---@param currentZ any
function PlaceableVine:getSectionFactor(node, i, startX, startY, startZ, currentX, currentY, currentZ) end

---@param node any
function PlaceableVine:getVineAreaByNode(node) end

function PlaceableVine:getVineFruitType() end

---@param segment any
---@param fruitTypeIndex any
---@param useHarvestStates any
---@param usePrepareStates any
function PlaceableVine:getHasSegmentTargetGrowthState(segment, fruitTypeIndex, useHarvestStates, usePrepareStates) end

---@param segment any
---@param segmentSide any
function PlaceableVine:getSegmentSideArea(segment, segmentSide) end
