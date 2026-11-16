# shop/BrandManager.lua

*[Version française](../../fr/scripts/shop/BrandManager.md)*

Source: `dataS/scripts/shop/BrandManager.lua` — FS25 1.25.1.0

✍ Manager (subclass of AbstractManager) that registers machine and product brands from dataS/brands.xml and from mods, and looks them up by index or name. It also publishes a global `Brand` table mapping upper-case names to indices (for example Brand.LIZARD, used as the fallback). It registers the console command gsBrandUsageList, whose handler consoleCommandBrandUsageList is not defined in this file (UNVERIFIED).

- **BrandManager** inherits from `AbstractManager` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BrandManager.new(customMt: any) → table` | 18 | ✍ Creates the manager and registers the console command gsBrandUsageList, which prints the used brands (handler not in this file, UNVERIFIED). |
| `BrandManager:initDataStructures()` | 28 | ✍ Resets the brand counter and the name-to-index, name-to-brand and index-to-brand tables, and assigns the global `Brand` to the name-to-index table. |
| `BrandManager:loadMapData(missionInfo: any) → boolean` | 40 | ✍ Calls the parent loadMapData, then reads every brand of dataS/brands.xml (name, title with optional $l10n_ translation, images, offset) and registers it with addBrand as a non-mod brand. Returns true. |
| `BrandManager:addBrand(name: string, title: string, imageFilename: string, baseDir: string, isMod: boolean, imageShopOverview: string?, imageOffset: number?) → table?` | 74 | ✍ Registers a brand. The name is upper-cased and must be a valid index name; title, image and baseDir are required, and the shop-overview image defaults to the main one. Returns the brand table, false on missing data, or nil if invalid or already present. |
| `BrandManager:getBrandByIndex(brandIndex: integer) → table` | 139 | ✍ Returns the brand table for an index, or nil for a nil or unknown index. |
| `BrandManager:getBrandIconByIndex(brandIndex: integer) → string` | 150 | ✍ Returns the icon file path of the brand with the given index, or nil if the index is nil or unknown. |
| `BrandManager:getBrandByName(brandName: string) → table` | 161 | ✍ Returns the brand table for a name, matched case-insensitively, or nil. |
| `BrandManager:getBrandIndexByName(brandName: string) → integer` | 172 | ✍ Returns a brand index from a name. Unknown or invalid names log a warning (with a close-match suggestion) and return Brand.LIZARD. A nil name returns nil. |
