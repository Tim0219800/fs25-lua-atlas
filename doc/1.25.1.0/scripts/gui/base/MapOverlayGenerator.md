# gui/base/MapOverlayGenerator.lua

Source: `dataS/scripts/gui/base/MapOverlayGenerator.lua` — FS25 1.25.1.0

- **MapOverlayGenerator** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `MapOverlayGenerator.new(l10n: table, fruitTypeManager: table, fillTypeManager: table, farmlandManager: table, farmManager: table, weedSystem: table) → MapOverlayGenerator` | 50 |  |
| `MapOverlayGenerator:delete()` | 103 |  |
| `MapOverlayGenerator:adjustedOverlayResolution(default: any, limitToTwo: any)` | 121 |  |
| `MapOverlayGenerator:setMissionFruitTypes(missionFruitTypes: any)` | 137 |  |
| `MapOverlayGenerator:setColorBlindMode(isColorBlindMode: any)` | 163 |  |
| `MapOverlayGenerator:buildFruitTypeMapOverlay(fruitTypeFilter: any)` | 174 |  |
| `MapOverlayGenerator:buildFieldsOverlay(fruitTypeFilter: any)` | 189 |  |
| `MapOverlayGenerator:buildGrowthStateMapOverlay(growthStateFilter: any, fruitTypeFilter: any)` | 195 |  |
| `MapOverlayGenerator:buildSoilStateMapOverlay(soilStateFilter: any)` | 285 |  |
| `MapOverlayGenerator:buildFarmlandsMapOverlay(selectedFarmland: any)` | 395 |  |
| `MapOverlayGenerator:buildSingleFarmlandsMapOverlay(selectedFarmland: any)` | 432 |  |
| `MapOverlayGenerator:generateOverlay(mapOverlayType: any, finishedCallback: any, overlayState: any, overlayState2: any)` | 461 |  |
| `MapOverlayGenerator:generateFruitTypeOverlay(finishedCallback: any, fruitTypeFilter: any)` | 491 |  |
| `MapOverlayGenerator:generateFieldsOverlay(finishedCallback: any)` | 501 |  |
| `MapOverlayGenerator:generateGrowthStateOverlay(finishedCallback: any, growthStateFilter: any, fruitTypeFilter: any)` | 512 |  |
| `MapOverlayGenerator:generateSoilStateOverlay(finishedCallback: any, soilStateFilter: any)` | 523 |  |
| `MapOverlayGenerator:generateSingleFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 532 |  |
| `MapOverlayGenerator:generateFarmlandOverlay(finishedCallback: any, mapPosition: any)` | 541 |  |
| `MapOverlayGenerator:checkOverlayFinished()` | 547 |  |
| `MapOverlayGenerator:reset()` | 558 |  |
| `MapOverlayGenerator:update(dt: any)` | 568 |  |
| `MapOverlayGenerator:getDisplayCropTypes()` | 593 |  |
| `MapOverlayGenerator:getDisplayGrowthStates() → array` | 625 |  |
| `MapOverlayGenerator:getDisplaySoilStates() → array` | 699 |  |
