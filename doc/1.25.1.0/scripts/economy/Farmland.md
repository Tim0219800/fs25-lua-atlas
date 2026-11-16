# economy/Farmland.lua

*[Version française](../../fr/scripts/economy/Farmland.md)*

Source: `dataS/scripts/economy/Farmland.lua` — FS25 1.25.1.0

✍ Data object for one purchasable farmland parcel: id, name, area, price, NPC, owner farm and map hotspot. Loaded from the map farmlands XML by FarmlandManager. updatePrice is called here but not defined in this file.

- **Farmland** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `Farmland.new(customMt: any) → table` | 29 | ✍ Constructor. Starts not owned, with no indicator position, no field and no bounding box. |
| `Farmland:load(xmlFile: XMLFile, key: string) → boolean` | 46 | ✍ Reads one farmland from XML (#id, #indicatorPosition, #name, #areaInHa default 2.5, #price or #priceScale, #npcName, #showOnFarmlandsScreen, #defaultFarmProperty). Returns false with an XML error if the id is missing or 0. |
| `Farmland:delete()` | 88 | ✍ Removes and deletes the map hotspot of this farmland, if one exists. |
| `Farmland:setIndicatorPosition(xWorldPos: number, zWorldPos: number)` | 113 | ✍ Stores the world X/Z position of the farmland indicator and moves the map hotspot to it when present. |
| `Farmland:setArea(areaInHa: number)` | 167 | ✍ Sets the area in hectares and recomputes the price, unless the farmland has a fixed price. |
