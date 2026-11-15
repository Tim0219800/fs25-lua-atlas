# utils/FSDensityMapUtil.lua

Source: `dataS/scripts/utils/FSDensityMapUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

- **FSDensityMapUtil** (l.6)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FSDensityMapUtil.clearCache()` | 56 |  |
| `FSDensityMapUtil.getFieldDataAtWorldPosition(x: number, y: number, z: number) → boolean, number, number` | 68 |  |
| `FSDensityMapUtil.cutFruitArea(fruitIndex: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, destroySpray: boolean, useMinForageState: boolean?, excludedSprayType: boolean?, setsWeeds: boolean?, limitToField: boolean?) → number, number, number, number, number, number, number, number, number, integer, number, number` | 107 |  |
| `FSDensityMapUtil.getFruitArea(fruitIndex: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, allowPreparing: boolean?, useMinForageState: boolean?) → integer, number, number, integer` | 359 |  |
| `FSDensityMapUtil.updateRollerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, angle: number?) → integer` | 428 |  |
| `FSDensityMapUtil.updateGrassRollerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, removeStones: boolean?) → integer, integer` | 534 |  |
| `FSDensityMapUtil.addStoneArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, delta: number, fieldFilter: table?, customFilter: table?)` | 702 |  |
| `FSDensityMapUtil.removeStoneArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer` | 753 |  |
| `FSDensityMapUtil.getStoneArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer` | 788 |  |
| `FSDensityMapUtil.updateStonePickerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, angle: number?) → number, number, number` | 839 |  |
| `FSDensityMapUtil.removeFieldArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, deleteAll: boolean)` | 918 |  |
| `FSDensityMapUtil.removeFieldPolygon(polygonVertices: array, deleteAll: boolean)` | 990 |  |
| `FSDensityMapUtil.updateCultivatorArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, createField: boolean, limitFruitDestructionToField: boolean, angle: number, blockedSprayTypeIndex: integer, setsWeeds: boolean?, disableStones: boolean?) → integer, integer` | 1080 |  |
| `FSDensityMapUtil.updateDiscHarrowArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, createField: boolean?, limitFruitDestructionToField: boolean?, angle: number?, blockedSprayTypeIndex: integer) → number, number` | 1180 |  |
| `FSDensityMapUtil.updatePlowPackerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, angle: number?) → integer, integer` | 1375 |  |
| `FSDensityMapUtil.updateSubsoilerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, forced: boolean?) → number, number` | 1443 |  |
| `FSDensityMapUtil.updatePlowArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, createField: boolean, limitFruitDestructionToField: boolean, angle: number, resetPlowLevel: boolean?, disableStones: boolean?) → integer, integer` | 1506 |  |
| `FSDensityMapUtil.updatePlowShareArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, createField: boolean, limitFruitDestructionToField: boolean, clearFoliageOffset: number)` | 1613 |  |
| `FSDensityMapUtil.resetDisplacementArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, filter1: DensityMapModifier?, filter2: DensityMapModifier?)` | 1669 |  |
| `FSDensityMapUtil.multiModifierAddResetDisplacement(multiModifier: DensityMapModifier, filter1: DensityMapModifier?, filter2: DensityMapModifier?)` | 1687 |  |
| `FSDensityMapUtil.resetDisplacement(densityMapArea: DensityMapPolygon, filter1: DensityMapModifier?, filter2: DensityMapModifier?)` | 1705 |  |
| `FSDensityMapUtil.updateDestroyCommonArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, onlyOnFields: boolean, deleteAll: boolean)` | 1742 |  |
| `FSDensityMapUtil.updateWheelDestructionArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 1873 |  |
| `FSDensityMapUtil.setGroundTypeLayerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, value: DensityValueCompareType) → integer, integer` | 1952 |  |
| `FSDensityMapUtil.setStubbleShredLevelArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, value: integer) → integer, integer` | 1996 |  |
| `FSDensityMapUtil.updateSprayArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, sprayTypeIndex: integer, sprayAmount: number) → integer, integer` | 2037 |  |
| `FSDensityMapUtil.removeSprayArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, blockedSprayTypeIndex: integer?, customFilter: table?)` | 2063 |  |
| `FSDensityMapUtil.updateFertilizerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, sprayType: table, sprayAmount: number) → integer, integer` | 2115 |  |
| `FSDensityMapUtil.updateLimeArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, groundType: integer) → number, integer` | 2202 |  |
| `FSDensityMapUtil.updateHerbicideArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, groundType: integer) → number, integer` | 2303 |  |
| `FSDensityMapUtil.updateWeederArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, isHoeWeeder: boolean) → integer` | 2422 |  |
| `FSDensityMapUtil.removeWeedArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer` | 2552 |  |
| `FSDensityMapUtil.setSparseWeedArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 2586 |  |
| `FSDensityMapUtil.setSowingWeedArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 2630 |  |
| `FSDensityMapUtil.setWeedBlockingState(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, customFilter1: DensityMapModifier?, customFilter2: DensityMapModifier?)` | 2685 |  |
| `FSDensityMapUtil.removeWeedBlockingState(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 2718 |  |
| `FSDensityMapUtil.updateMulcherArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number` | 2751 |  |
| `FSDensityMapUtil.updateMowerArea(fruitType: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, limitToField: boolean?) → number, number, number, number, number, number, number, number, number, integer, number, number` | 2932 |  |
| `FSDensityMapUtil.updateFruitHaulmArea(fruitId: Integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → Integer` | 2992 |  |
| `FSDensityMapUtil.getStubbleFactor(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number` | 3038 |  |
| `FSDensityMapUtil.resetSprayArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, force: boolean, excludeType: boolean?)` | 3074 |  |
| `FSDensityMapUtil.updateSowingArea(fruitIndex: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, fieldGroundType: integer, ridgeSeeding: boolean?, angle: number?, growthState: integer?, blockedSprayTypeIndex: integer?) → integer, integer` | 3127 |  |
| `FSDensityMapUtil.updateDirectSowingArea(fruitIndex: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, fieldGroundType: integer, ridgeSeeding: boolean, angle: number?, growthState: integer?, blockedSprayTypeIndex: integer?) → integer, integer` | 3308 |  |
| `FSDensityMapUtil.updateRidgeFormerArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, angle: number?) → Integer, Integer` | 3577 |  |
| `FSDensityMapUtil.updateFruitPreparerArea(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, startDropWorldX: number, startDropWorldZ: number, widthDropWorldX: number, widthDropWorldZ: number, heightDropWorldX: number, heightDropWorldZ: number, limitToFruit: boolean?) → integer` | 3648 |  |
| `FSDensityMapUtil.clearDecoArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number, boolean` | 3721 |  |
| `FSDensityMapUtil.createVineArea(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, customState: integer?, ignoreExistingFruits: boolean) → number` | 3790 |  |
| `FSDensityMapUtil.destroyVineArea(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 3883 |  |
| `FSDensityMapUtil.updateVineAreaValues(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, values: array) → number` | 3918 |  |
| `FSDensityMapUtil:setVineAreaValue(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, value: integer)` | 3978 |  |
| `FSDensityMapUtil.updateVineCutArea(fruitId: interger, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number, number, number, number, number` | 4017 |  |
| `FSDensityMapUtil.updateVinePrepareArea(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → number, number` | 4189 |  |
| `FSDensityMapUtil.resetVineArea(fruitId: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, resetState: integer) → number, number` | 4243 |  |
| `FSDensityMapUtil.updateVineCultivatorArea(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, changeGroundType: integer) → number` | 4291 |  |
| `FSDensityMapUtil.updateDisasterArea(densityMapArea: DensityMapNodePolygon, perlinPercentage: integer)` | 4368 |  |
| `FSDensityMapUtil.eraseTireTrack(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number)` | 4448 |  |
| `FSDensityMapUtil.getAreaDensity(id: integer, firstChannel: integer, numChannels: integer, value: number, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer, integer` | 4473 |  |
| `FSDensityMapUtil.getFruitTypeIndexAtWorldPos(x: number, z: number) → nil\|integer, integer` | 4509 |  |
| `FSDensityMapUtil.getIsFieldAtWorldPos(x: number, z: number) → boolean` | 4530 |  |
| `FSDensityMapUtil.getFieldTypeAtWorldPos(x: number, z: number) → integer` | 4541 |  |
| `FSDensityMapUtil.getFieldTypeModifierAndFilter(fieldType: integer) → DensityMapModifier, DensityMapFilter` | 4559 |  |
| `FSDensityMapUtil.getFieldTypeArea(fieldType: integer, startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer` | 4590 |  |
| `FSDensityMapUtil.getFieldTypeAreaInPolygon(fieldType: integer, area: DensityMapPolygon) → integer, integer` | 4606 |  |
| `FSDensityMapUtil.getFieldDensity(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer, integer` | 4627 |  |
| `FSDensityMapUtil.getBushDensity(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number) → integer, integer, integer` | 4663 |  |
| `FSDensityMapUtil.convertToDensityMapAngle(angle: number, maxDensityValue: integer) → number` | 4699 |  |
| `FSDensityMapUtil.getWeedFactor(startWorldX: number, startWorldZ: number, widthWorldX: number, widthWorldZ: number, heightWorldX: number, heightWorldZ: number, fruitIndex: integer) → number` | 4722 |  |
| `FSDensityMapUtil.assert(bool: boolean, warning: string?)` | 4788 |  |
