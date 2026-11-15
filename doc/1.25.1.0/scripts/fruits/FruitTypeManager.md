# fruits/FruitTypeManager.lua

Source : `dataS/scripts/fruits/FruitTypeManager.lua` — FS25 1.25.1.0

- **FruitTypeManager** hérite de `AbstractManager` (l.43)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FruitTypeManager.new(customMt: table?) → any` | 49 |  |
| `FruitTypeManager:initDataStructures()` | 57 |  |
| `FruitTypeManager:loadDefaultTypes()` | 93 |  |
| `FruitTypeManager:loadMapData(xmlFileHandle: integer, missionInfo: table, baseDirectory: string?) → boolean` | 105 |  |
| `FruitTypeManager:loadFruitTypes(xmlFileHandle: integer, missionInfo: table, baseDirectory: string?, isBaseType: boolean?) → boolean` | 208 |  |
| `FruitTypeManager:getFruitTypeByIndex(index: integer) → table` | 303 |  |
| `FruitTypeManager:getFruitTypeNameByIndex(index: integer) → string?` | 311 |  |
| `FruitTypeManager:getFruitTypeByName(name: string) → table` | 328 |  |
| `FruitTypeManager:getFruitTypes() → table` | 352 |  |
| `FruitTypeManager:getFruitTypeIndexByFillTypeIndex(index: integer) → integer?` | 360 |  |
| `FruitTypeManager:getFruitTypeByFillTypeIndex(index: integer) → table?` | 369 |  |
| `FruitTypeManager:getFillTypeIndexByFruitTypeIndex(index: integer) → integer?` | 378 |  |
| `FruitTypeManager:getFillTypeByFruitTypeIndex(index: integer) → table?` | 391 |  |
| `FruitTypeManager:getFillTypeNameByFruitTypeIndex(index: integer) → string?` | 400 |  |
| `FruitTypeManager:getCutHeightByFruitTypeIndex(index: integer, isForageCutter: boolean?) → number` | 411 |  |
| `FruitTypeManager:addFruitTypeCategory(name: string, isBaseType: boolean) → integer?` | 439 |  |
| `FruitTypeManager:addFruitTypeToCategory(fruitTypeIndex: integer, categoryIndex: integer) → table` | 470 |  |
| `FruitTypeManager:getFruitTypesByCategoryNames(names: string, warning: string) → array` | 483 |  |
| `FruitTypeManager:getFruitTypeIndicesByCategoryNames(names: string, warning: string) → table` | 513 |  |
| `FruitTypeManager:getFruitTypesByNames(names: string, warning: string?) → array` | 529 |  |
| `FruitTypeManager:getFruitTypeIndicesByNames(names: string, warning: string?) → array` | 556 |  |
| `FruitTypeManager:getFillTypesByFruitTypeNames(names: string, warning: string?) → table` | 572 |  |
| `FruitTypeManager:getFillTypeIndicesByFruitTypeNames(names: string, warning: string?) → table` | 602 |  |
| `FruitTypeManager:getFillTypesByFruitTypeCategoryNames(fruitTypeCategoryNames: string, warning: string?) → table` | 618 |  |
| `FruitTypeManager:getFillTypeIndicesByFruitTypeCategoryName(fruitTypeCategoryNames: string, warning: string?) → table` | 649 |  |
| `FruitTypeManager:isFillTypeWindrow(index: integer) → boolean` | 665 |  |
| `FruitTypeManager:getWindrowFillTypeIndexByFruitTypeIndex(index: integer) → integer?` | 677 |  |
| `FruitTypeManager:getFillTypeLiterPerSqm(fillTypeIndex: integer, defaultValue: number) → number` | 688 |  |
| `FruitTypeManager:addFruitTypeConverter(name: string, isBaseType: boolean) → integer` | 727 |  |
| `FruitTypeManager:addFruitTypeConversion(converter: integer, fruitTypeName: integer, fillTypeName: integer, conversionFactor: number)` | 758 |  |
| `FruitTypeManager:getConverterDataByName(converterName: string) → table` | 772 |  |
| `FruitTypeManager:addModFoliageType(name: string, filename: string, requiredMapModName: string?)` | 781 |  |
