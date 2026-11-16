# triggers/FillPlane.lua

*[Version française](../../fr/scripts/triggers/FillPlane.md)*

Source: `dataS/scripts/triggers/FillPlane.lua` — FS25 1.25.1.0

✍ Small helper class that drives a visual fill plane node (the surface showing a load inside a container). It moves the node vertically and optionally tilts it according to a 0..1 fill state, and can change its fill-type material and color shader. Configuration comes from an XML block (node, minY/maxY, minRotX/maxRotX, changeVisibility, colorChange) declared through registerXMLPaths.

- **FillPlane** (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `FillPlane.new(customMt: table?) → table` | 23 | ✍ Creates a fill plane instance with no node, zero range and nothing loaded; call load afterwards. Accepts an optional custom metatable for subclassing. |
| `FillPlane:delete()` | 38 | ✍ Destructor; empty body, it releases nothing. |
| `FillPlane:load(components: table, xmlFile: table, xmlNode: string, i3dMappings: table) → boolean` | 48 | ✍ Reads the node and settings from the XML key, resolving the node through components and i3dMappings. Returns false if no node is found. Swaps inverted minY/maxY with a warning, disables colorChange if the node lacks a `colorScale` shader parameter, then places the node at minY and hides it when changeVisibility is set. |
| `FillPlane:setState(state: number) → boolean` | 87 | ✍ Interpolates the node height between minY and maxY and its X rotation between minRotX and maxRotX using the 0..1 state. With changeVisibility the node is visible only when state is above 0. Returns true if the height changed; does nothing if not loaded. |
| `FillPlane:setFillType(fillTypeIndex: integer)` | 107 | ✍ Applies the material for the given fill type index to the node, using default materials taken from the terrain node, and sets the `isCustomShape` shader parameter. The actual material logic lives in FillPlaneUtil, which is not in the dump (UNVERIFIED). |
| `FillPlane:setColorScale(colorScale: array)` | 119 | ✍ Sets the `colorScale` shader parameter of the node from an array of three components (r, g, b). Does nothing if the plane is not loaded. |
| `FillPlane.registerXMLPaths(schema: XMLFile, basePath: string)` | 129 | ✍ Registers the XML attributes the class reads under the given base path: node, minY, maxY, minRotX, maxRotX, changeVisibility and colorChange. |
