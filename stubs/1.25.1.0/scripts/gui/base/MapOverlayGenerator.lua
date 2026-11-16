---@meta
-- FS25 1.25.1.0 : gui/base/MapOverlayGenerator.lua (generated stub, FS25 Lua Atlas)

--- Builds the density-map based overlays drawn over the in-game map: crop types, growth states, soil states, farmlands, a single farmland and the minimap field layer. Three engine visualization overlay handles are reused; generation is asynchronous and signalled by a callback, polled in `update`. It depends on the fruit type, fill type, farmland and farm managers, the weed system and the field ground system. Helpers such as `buildFieldMapOverlay` and the constants tables are not defined in this file (UNVERIFIED).
---@class MapOverlayGenerator
MapOverlayGenerator = {}

--- Constructor taking the l10n, fruit type, fill type, farmland and farm managers plus the weed system. Creates the foliage, farmland and fields density-map overlays at an adjusted resolution and the type-to-builder and type-to-handle tables.
---@param l10n table
---@param fruitTypeManager table
---@param fillTypeManager table
---@param farmlandManager table
---@param farmManager table
---@param weedSystem table
---@return MapOverlayGenerator
function MapOverlayGenerator.new(l10n, fruitTypeManager, fillTypeManager, farmlandManager, farmManager, weedSystem) end

--- Resets any generation in progress and deletes the three engine overlays (foliage state, farmland state, fields).
function MapOverlayGenerator:delete() end

--- Scales a default {w, h} resolution by the performance class: unchanged on low, x4 on high (unless limited, on mobile, or in a mission-dependent case cut off in this dump), otherwise x2.
---@param default any
---@param limitToTwo any
function MapOverlayGenerator:adjustedOverlayResolution(default, limitToTwo) end

--- Stores the mission's fruit types (foliage id, index, shownOnMap, default and color-blind colors) and rebuilds the crop, growth and soil display lists.
---@param missionFruitTypes any
function MapOverlayGenerator:setMissionFruitTypes(missionFruitTypes) end

--- Sets the flag selecting color-blind palettes for subsequently generated overlays; no overlay is regenerated.
---@param isColorBlindMode any
function MapOverlayGenerator:setColorBlindMode(isColorBlindMode) end

--- Sets the type color on the foliage overlay for every displayed crop whose fruit type is enabled in the filter and has a valid foliage id.
---@param fruitTypeFilter any
function MapOverlayGenerator:buildFruitTypeMapOverlay(fruitTypeFilter) end

--- Builder for the fields overlay type; it only delegates to `buildFieldMapOverlay`, which is not defined in this file (UNVERIFIED). The filter argument is unused.
---@param fruitTypeFilter any
function MapOverlayGenerator:buildFieldsOverlay(fruitTypeFilter) end

--- Colors growth states per crop (withered, harvested, growing, topping, harvestable) from the filters, then ground types from the ground system (cultivated, plowed, stubble tillage, seedbed and rolled seedbed).
---@param growthStateFilter any
---@param fruitTypeFilter any
function MapOverlayGenerator:buildGrowthStateMapOverlay(growthStateFilter, fruitTypeFilter) end

--- Colors soil states selected in the filter: weeds and stones (if enabled in the savegame), needs plowing, rolling, mulched, lime (not on mobile), fertilization levels and watered, using field ground system density maps.
---@param soilStateFilter any
function MapOverlayGenerator:buildSoilStateMapOverlay(soilStateFilter) end

--- Colors each buyable farmland: selected one with a highlight color, owned ones with the owner farm color, others as unowned. Adds borders on high performance classes, then the field layer.
---@param selectedFarmland any
function MapOverlayGenerator:buildFarmlandsMapOverlay(selectedFarmland) end

--- Highlights only the selected farmland (does nothing if nil), then adds the field layer. Parameter is a farmland table with an `id`, although the public wrapper's doc speaks of a map position.
---@param selectedFarmland any
function MapOverlayGenerator:buildSingleFarmlandsMapOverlay(selectedFarmland) end

--- Internal entry point: validates the overlay type, stores the callback, resets the handle, runs the matching builder, starts engine generation and checks for immediate completion. Returns false with a warning for an invalid type.
---@param mapOverlayType any
---@param finishedCallback any
---@param overlayState any
---@param overlayState2 any
function MapOverlayGenerator:generateOverlay(mapOverlayType, finishedCallback, overlayState, overlayState2) end

--- Starts generation of the crop type overlay; the callback receives the overlay id when ready. The filter maps fruit type index to boolean.
---@param finishedCallback any
---@param fruitTypeFilter any
function MapOverlayGenerator:generateFruitTypeOverlay(finishedCallback, fruitTypeFilter) end

--- Starts generation of the fields overlay used by the minimap; the callback receives the overlay id. Used by `update` to refresh it periodically.
---@param finishedCallback any
function MapOverlayGenerator:generateFieldsOverlay(finishedCallback) end

--- Starts generation of the growth state overlay from a growth state filter and a fruit type filter; the callback receives the overlay id.
---@param finishedCallback any
---@param growthStateFilter any
---@param fruitTypeFilter any
function MapOverlayGenerator:generateGrowthStateOverlay(finishedCallback, growthStateFilter, fruitTypeFilter) end

--- Starts generation of the soil state overlay from a soil state filter; the callback receives the overlay id.
---@param finishedCallback any
---@param soilStateFilter any
function MapOverlayGenerator:generateSoilStateOverlay(finishedCallback, soilStateFilter) end

--- Starts generation of an overlay highlighting one farmland only. The second argument is passed to the builder as the selected farmland (see `buildSingleFarmlandsMapOverlay`).
---@param finishedCallback any
---@param mapPosition any
function MapOverlayGenerator:generateSingleFarmlandOverlay(finishedCallback, mapPosition) end

--- Starts generation of the farmland overlay (all farmlands colored by owner); the second argument is the selected farmland to highlight.
---@param finishedCallback any
---@param mapPosition any
function MapOverlayGenerator:generateFarmlandOverlay(finishedCallback, mapPosition) end

--- If an overlay is being generated and the engine reports it ready, calls the finished callback with the handle and clears the current handle.
function MapOverlayGenerator:checkOverlayFinished() end

--- Resets all three engine overlays and forgets the current generation; the pending callback is not called.
function MapOverlayGenerator:reset() end

--- Per-frame update: when no fields refresh is running and the timer has elapsed, regenerates the fields overlay and schedules the next refresh, then polls `checkOverlayFinished`.
---@param dt any
function MapOverlayGenerator:update(dt) end

--- Builds the list of crop display entries (colors per color-blind mode, icon file, UVs, title, fruit type index, foliage id) for fruit types shown on the map. Meant to be overridden by mods.
function MapOverlayGenerator:getDisplayCropTypes() end

--- Returns the growth state legend table (colors per color-blind mode and localized description) for cultivated, stubble tillage, seedbed, growing, harvest, harvested, topping and plowed, plus withered if the platform supports withering.
---@return array
function MapOverlayGenerator:getDisplayGrowthStates() end

--- Builds the soil state legend, starting with fertilizer colors trimmed to the maximum spray level from the field ground system. The rest of the table is outside the part examined here (UNVERIFIED).
---@return array
function MapOverlayGenerator:getDisplaySoilStates() end
