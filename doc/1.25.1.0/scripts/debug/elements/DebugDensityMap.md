# debug/elements/DebugDensityMap.lua

*[Version française](../../../fr/scripts/debug/elements/DebugDensityMap.md)*

Source: `dataS/scripts/debug/elements/DebugDensityMap.lua` — FS25 1.25.1.0

✍ DebugDensityMap is a debug element that visualises the values of a density map as coloured, numbered terrain cells around the camera or a chosen centre, with an on-screen colour legend. It relies on fields set elsewhere (`modifier`, `filter`, `numChannels`, `pixelValueToColor`, resolution, radius) and on `drawDebugAreaRectangleFilled`, none of which are defined in this dump.

- **DebugDensityMap** inherits from `DebugElement` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugDensityMap:draw()` | 65 | ✍ Samples the density map cell by cell on a grid snapped to the resolution, finds the first value (0 to 2^numChannels-1) present in each cell, fills it with that value's colour and prints the value on it. It then draws a colour legend at the left of the screen. Costly: one modifier query per value per cell. |
