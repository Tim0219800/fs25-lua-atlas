# internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/maps/ValueMap.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua` — FS25 1.25.1.0

✍ Base class of the Precision Farming value maps (soil, nitrogen, pH, yield, cover, tramline and so on). Only a static coordinate helper survives in this dump; the class body is not included.

- **ValueMap** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `ValueMap.roundToPixelCenter(x: any, z: any, terrainSize: any, mapSize: any)` | 280 | ✍ Snaps a world x/z position to the centre of the map pixel containing it, given the terrain size and the map resolution. Returns the adjusted world x and z coordinates. |
