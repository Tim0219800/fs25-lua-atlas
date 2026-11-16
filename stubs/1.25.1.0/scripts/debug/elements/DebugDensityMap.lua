---@meta
-- FS25 1.25.1.0 : debug/elements/DebugDensityMap.lua (generated stub, FS25 Lua Atlas)

--- DebugDensityMap is a debug element that visualises the values of a density map as coloured, numbered terrain cells around the camera or a chosen centre, with an on-screen colour legend. It relies on fields set elsewhere (`modifier`, `filter`, `numChannels`, `pixelValueToColor`, resolution, radius) and on `drawDebugAreaRectangleFilled`, none of which are defined in this dump.
---@class DebugDensityMap : DebugElement
DebugDensityMap = {}

--- Samples the density map cell by cell on a grid snapped to the resolution, finds the first value (0 to 2^numChannels-1) present in each cell, fills it with that value's colour and prints the value on it. It then draws a colour legend at the left of the screen. Costly: one modifier query per value per cell.
function DebugDensityMap:draw() end
