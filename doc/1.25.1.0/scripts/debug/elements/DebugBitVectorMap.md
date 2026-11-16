# debug/elements/DebugBitVectorMap.lua

*[Version française](../../../fr/scripts/debug/elements/DebugBitVectorMap.md)*

Source: `dataS/scripts/debug/elements/DebugBitVectorMap.lua` — FS25 1.25.1.0

✍ DebugBitVectorMap draws a coloured grid of small cells on the terrain around a centre, where each cell colour comes from a value returned by a check function (default palette: 0 red, 1 green, 2 blue, undefined dark grey; default radius 15, cell size 0.5, optional legend). It is not a DebugElement subclass; it has its own `draw`. The grid routine `drawAroundCenter` is not in this dump (UNVERIFIED).

- **DebugBitVectorMap** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DebugBitVectorMap.new(customMt: table?) → DebugBitVectorMap` | 18 | ✍ Creates the grid object with default radius, cell size, opacity, value-to-colour table, undefined-value colour, Y offset, padding factor and legend enabled. |
| `DebugBitVectorMap:draw()` | 71 | ✍ Draws the grid centred on the AI vehicle's root node (skipped if the vehicle is deleted or being deleted) with `aiAreaCheck`, or else centred on the active camera with the custom function. Does nothing if neither is set. |
| `DebugBitVectorMap:createWithAIVehicle(vehicle: table) → DebugBitVectorMap` | 87 | ✍ Binds the grid to an AI vehicle so cell values come from the vehicle's AI work area check. Returns self for chaining. |
| `DebugBitVectorMap:createWithCustomFunc(customFunc: function) → DebugBitVectorMap` | 97 | ✍ Sets a custom function that supplies the cell value for each area; the grid is then drawn around the active camera. Returns self. |
| `DebugBitVectorMap:setAdditionalDrawInfoFunc(drawInfoFunc: function) → DebugBitVectorMap` | 107 | ✍ Stores a function for extra drawing or information; how and when it is called is in code absent from this dump (UNVERIFIED). Returns self. |
| `DebugBitVectorMap:aiAreaCheck(startWorldX: any, startWorldZ: any, widthWorldX: any, widthWorldZ: any, heightWorldX: any, heightWorldZ: any)` | 179 | ✍ Returns the result of `AIVehicleUtil.getAIAreaOfVehicle` for the stored AI vehicle on the given parallelogram in world XZ coordinates (start, width, height corners). |
