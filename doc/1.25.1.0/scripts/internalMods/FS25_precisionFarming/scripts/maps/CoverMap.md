# internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/maps/CoverMap.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/maps/CoverMap.lua` — FS25 1.25.1.0

✍ Precision Farming map class (child of ValueMap) that tracks ground cover per pixel and uses a temporary harvest lock bitmap to detect which pixels were actually harvested. When a harvest finishes, it triggers the harvest updates of the nitrogen, pH and seed rate maps. The class's constructor and loading code are not present in this dump; only the cover update functions are.

- **CoverMap** inherits from `ValueMap` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `CoverMap:getCoverUpdateDensityMapModifiers(fruitTypes: table, preUpdate: boolean, useMinForageState: boolean, strawChopperActive: boolean) → DensityMapMultiModifier, table, table` | 319 | ✍ Builds, then caches per fruit type set and forage flag, the DensityMapMultiModifier used before (preUpdate) or after a harvest. Returns the multi-modifier plus the two shared stats tables for changed and total pixels. |
| `CoverMap:preUpdateCoverArea(fruitTypes: table, densityMapShape: DensityMapPolygon, useMinForageState: boolean?, strawChopperActive: boolean) → integer?` | 472 | ✍ Runs before the harvest: marks pixels in harvestable (or preparable) growth state on the temporary lock map inside the given shape. Returns the index of the fruit type found with changed pixels, or nil, and remembers it as fallback. |
| `CoverMap:postUpdateCoverArea(fruitTypes: table, densityMapShape: DensityMapPolygon, useMinForageState: boolean?, strawChopperActive: boolean, usedFruitIndex: integer?) → boolean, boolean` | 514 | ✍ Runs after the harvest: lowers the cover state on pixels that held fruit and no longer do, and calls harvestUpdate on the nitrogen, pH and seed rate maps when pixels were locked. Clears the lock and returns two booleans (pH map updated, nitrogen map updated). |
