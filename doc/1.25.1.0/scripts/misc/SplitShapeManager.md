# misc/SplitShapeManager.lua

Source: `dataS/scripts/misc/SplitShapeManager.lua` — FS25 1.25.1.0

- **SplitShapeManager** inherits from `AbstractManager` (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SplitShapeManager.new(customMt: table?) → SplitShapeManager` | 18 |  |
| `SplitShapeManager:initDataStructures()` | 26 |  |
| `SplitShapeManager:loadMapData() → boolean` | 36 |  |
| `SplitShapeManager:addSplitType(name: string, l10nKey: string, splitTypeIndex: integer, pricePerLiter: number, woodChipsPerLiter: number, allowsWoodHarvester: boolean, customEnvironment: string?, volumeToLiter: number?, woodHarvesterAreaThreshold: any)` | 108 |  |
| `SplitShapeManager:getSplitTypeByIndex(index: integer) → table?` | 142 |  |
| `SplitShapeManager:getSplitTypeNameByIndex(index: integer) → string` | 155 |  |
