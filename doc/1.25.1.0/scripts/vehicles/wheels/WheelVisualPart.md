# vehicles/wheels/WheelVisualPart.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelVisualPart.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPart.lua` — FS25 1.25.1.0

✍ Base class of a visual wheel part (rim, tire, connector, additional): loads an i3d, optionally through an intermediate xml that names the file and left/right node paths, then links, offsets, scales and applies materials. Subclasses WheelVisualPartTire and WheelVisualPartConnector extend it.

- **WheelVisualPart** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelVisualPart.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Creates a part with its name, owning visual wheel and link node. |
| `WheelVisualPart:delete()` | 28 | ✍ Releases the shared i3d load request. |
| `WheelVisualPart:loadFromXML(xmlObject: any, key: any)` | 36 | ✍ Reads filename (i3d or xml wrapper), node path for left/right, widthAndDiam, offset, scale, holeScale, mass, inversion and materials, then starts the shared i3d load. Returns false if there is no filename or the wrapper xml is invalid. |
| `WheelVisualPart:postLoad()` | 122 | ✍ Applies every loaded material to the part node. |
| `WheelVisualPart:getDefaultMaterialSlotName()` | 130 | ✍ Returns the default material slot name for this part kind (inner rim, outer rim, additional, connector), or nil for other kinds. |
| `WheelVisualPart:onPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 144 | ✍ Callback after the i3d load: finds the node by index path, passes it to `setNode` and deletes the loaded root. |
| `WheelVisualPart:setNode(node: any)` | 157 | ✍ Links the node under the link node, positions it by offset (mirrored for the right side), then applies scale, the widthAndDiam shader parameter (or an inch-based scale if no shader parameter), hole scale and inversion. |
| `WheelVisualPart:setShaderParameterRec(node: any, shaderParameterName: any, x: any, y: any, z: any, w: any)` | 193 | ✍ Recursively sets a shader parameter on this node and all its children that are shapes. |
| `WheelVisualPart:getHasShaderParameterRec(node: any, shaderParameterName: any)` | 206 | ✍ Recursively checks whether a shape in the hierarchy has a shader parameter. Note: the check is hardcoded to the name `widthAndDiam`, ignoring the name argument. |
| `WheelVisualPart:getMass()` | 225 | ✍ Returns the part mass from XML, or 0 if none. |
| `WheelVisualPart.registerXMLPaths(schema: any, key: any, name: any)` | 231 | ✍ Registers the material and short material XML paths of a visual part under the given key. |
