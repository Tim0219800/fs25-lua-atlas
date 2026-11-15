# shop/BrandManager.lua

Source : `dataS/scripts/shop/BrandManager.lua` — FS25 1.25.1.0

- **BrandManager** hérite de `AbstractManager` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BrandManager.new(customMt: any) → table` | 18 |  |
| `BrandManager:initDataStructures()` | 28 |  |
| `BrandManager:loadMapData(missionInfo: any) → boolean` | 40 |  |
| `BrandManager:addBrand(name: string, title: string, imageFilename: string, baseDir: string, isMod: boolean, imageShopOverview: string?, imageOffset: number?) → table?` | 74 |  |
| `BrandManager:getBrandByIndex(brandIndex: integer) → table` | 139 |  |
| `BrandManager:getBrandIconByIndex(brandIndex: integer) → string` | 150 |  |
| `BrandManager:getBrandByName(brandName: string) → table` | 161 |  |
| `BrandManager:getBrandIndexByName(brandName: string) → integer` | 172 |  |
