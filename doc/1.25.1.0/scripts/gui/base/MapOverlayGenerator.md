# gui/base/MapOverlayGenerator.lua

*[Version française](../../../fr/scripts/gui/base/MapOverlayGenerator.md)*

Source: `dataS/scripts/gui/base/MapOverlayGenerator.lua` — FS25 1.25.1.0

✍ Builds the density-map based overlays drawn over the in-game map: crop types, growth states, soil states, farmlands, a single farmland and the minimap field layer. Three engine visualization overlay handles are reused; generation is asynchronous and signalled by a callback, polled in `update`. It depends on the fruit type, fill type, farmland and farm managers, the weed system and the field ground system. Helpers such as `buildFieldMapOverlay` and the constants tables are not defined in this file (UNVERIFIED).

- **MapOverlayGenerator** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `MapOverlayGenerator.new(l10n: table, fruitTypeManager: table, fillTypeManager: table, farmlandManager: table, farmManager: table, weedSystem: table) → MapOverlayGenerator` | 50 | ✍ Constructor taking the l10n, fruit type, fill type, farmland and farm managers plus the weed system. Creates the foliage, farmland and fields density-map overlays at an adjusted resolution and the type-to-builder and type-to-handle tables. |
| `MapOverlayGenerator:delete()` | 103 | ✍ Resets any generation in progress and deletes the three engine overlays (foliage state, farmland state, fields). |
| `MapOverlayGenerator:adjustedOverlayResolution(default: any, limitToTwo: any)` | 121 | ✍ Scales a default {w, h} resolution by the performance class: unchanged on low, x4 on high (unless limited, on mobile, or in a mission-dependent case cut off in this dump), otherwise x2. |
| `MapOverlayGenerator:setMissionFruitTypes(missionFruitTypes: any)` | 137 | ✍ Stores the mission's fruit types (foliage id, index, shownOnMap, default and color-blind colors) and rebuilds the crop, growth and soil display lists. |
| `MapOverlayGenerator:setColorBlindMode(isColorBlindMode: any)` | 163 | ✍ Sets the flag selecting color-blind palettes for subsequently generated overlays; no overlay is regenerated. |
| `MapOverlayGenerator:buildFruitTypeMapOverlay(fruitTypeFilter: any)` | 174 | ✍ Sets the type color on the foliage overlay for every displayed crop whose fruit type is enabled in the filter and has a valid foliage id. |
| `MapOverlayGenerator:buildFieldsOverlay(fruitTypeFilter: any)` | 189 | ✍ Builder for the fields overlay type; it only delegates to `buildFieldMapOverlay`, which is not defined in this file (UNVERIFIED). The filter argument is unused. |
| `MapOverlayGenerator:buildGrowthStateMapOverlay(growthStateFilter: any, fruitTypeFilter: any)` | 195 | ✍ Colors growth states per crop (withered, harvested, growing, topping, harvestable) from the filters, then ground types from the ground system (cultivated, plowed, stubble tillage, seedbed and rolled seedbed). |
| `MapOverlayGenerator:buildSoilStateMapOverlay(soilStateFilter: any)` | 285 | ✍ Colors soil states selected in the filter: weeds and stones (if enabled in the savegame), needs plowing, rolling, mulched, lime (not on mobile), fertilization levels and watered, using field ground system density maps. |
| `MapOverlayGenerator:buildFarmlandsMapOverlay(selectedFarmland: any)` | 395 | ✍ Colors each buyable farmland: selected one with a highlight color, owned ones with the owner farm color, others as unowned. Adds borders on high performance classes, then the field layer. |
| `MapOverlayGenerator:buildSingleFarmlandsMapOverlay(selectedFarmland: any)` | 432 | ✍ Highlights only the selected farmland (does nothing if nil), then adds the field layer. Parameter is a farmland table with an `id`, although the public wrapper's doc speaks of a map position. |
| `MapOverlayGenerator:generateOverlay(mapOverlayType: any, finishedCallback: any, overlayState: any, overlayState2: any)` | 461 | ✍ Internal entry point: validates the overlay type, stores the callback, resets the handle, runs the matching builder, starts engine generation and checks for immediate completion. Returns false with a warning for an invalid type. |
| `MapOverlayGenerator:generateFruitTypeOverlay(finishedCallback: any, fruitTypeFilter: any)` | 491 | ✍ Starts generation of the crop type overlay; the callback receives the overlay id when ready. The filter maps fruit type index to boolean. |
| `MapOverlayGenerator:generateFieldsOverlay(finishedCallback: any)` | 501 | ✍ Starts generation of the fields overlay used by the minimap; the callback receives the overlay id. Used by `update` to refresh it periodically. |
| `MapOverlayGenerator:generateGrowthStateOverlay(finishedCallback: any, growthStateFilter: any, fruitTypeFilter: any)` | 512 | ✍ Starts generation of the growth state overlay from a growth state filter and a fruit type filter; the callback receives the overlay id. |
| `MapOverlayGenerator:generateSoilStateOverlay(finishedCallback: any, soilStateFilter: any)` | 523 | ✍ Starts generation of the soil state overlay from a soil state filter; the callback receives the overlay id. |
| `MapOverlayGenerator:generateSingleFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 532 | ✍ Starts generation of an overlay highlighting one farmland only. The second argument is passed to the builder as the selected farmland (see `buildSingleFarmlandsMapOverlay`). |
| `MapOverlayGenerator:generateFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 541 | ✍ Starts generation of the farmland overlay (all farmlands colored by owner); the second argument is the selected farmland to highlight. |
| `MapOverlayGenerator:checkOverlayFinished()` | 547 | ✍ If an overlay is being generated and the engine reports it ready, calls the finished callback with the handle and clears the current handle. |
| `MapOverlayGenerator:reset()` | 558 | ✍ Resets all three engine overlays and forgets the current generation; the pending callback is not called. |
| `MapOverlayGenerator:update(dt: any)` | 568 | ✍ Per-frame update: when no fields refresh is running and the timer has elapsed, regenerates the fields overlay and schedules the next refresh, then polls `checkOverlayFinished`. |
| `MapOverlayGenerator:getDisplayCropTypes()` | 593 | ✍ Builds the list of crop display entries (colors per color-blind mode, icon file, UVs, title, fruit type index, foliage id) for fruit types shown on the map. Meant to be overridden by mods. |
| `MapOverlayGenerator:getDisplayGrowthStates() → array` | 625 | ✍ Returns the growth state legend table (colors per color-blind mode and localized description) for cultivated, stubble tillage, seedbed, growing, harvest, harvested, topping and plowed, plus withered if the platform supports withering. |
| `MapOverlayGenerator:getDisplaySoilStates() → array` | 699 | ✍ Builds the soil state legend, starting with fertilizer colors trimmed to the maximum spray level from the field ground system. The rest of the table is outside the part examined here (UNVERIFIED). |
