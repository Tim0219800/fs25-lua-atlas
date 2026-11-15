# shop/BrandManager.lua

Source: `dataS/scripts/shop/BrandManager.lua` — FS25 1.25.1.0

- **BrandManager** inherits from `AbstractManager` (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BrandManager.new(customMt: any) → table` | 18 |  |
| `BrandManager:initDataStructures()` | 28 |  |
| `BrandManager:loadMapData(missionInfo: any) → boolean` | 40 |  |
| `BrandManager:addBrand(name: string, title: string, imageFilename: string, baseDir: string, isMod: boolean, imageShopOverview: string?, imageOffset: number?) → table?` | 74 |  |
| `BrandManager:getBrandByIndex(brandIndex: integer) → table` | 139 |  |
| `BrandManager:getBrandIconByIndex(brandIndex: integer) → string` | 150 |  |
| `BrandManager:getBrandByName(brandName: string) → table` | 161 |  |
| `BrandManager:getBrandIndexByName(brandName: string) → integer` | 172 |  |
