# vehicles/wheels/WheelVisualPartConnector.lua

*[Version française](../../../fr/scripts/vehicles/wheels/WheelVisualPartConnector.md)*

Source: `dataS/scripts/vehicles/wheels/WheelVisualPartConnector.lua` — FS25 1.25.1.0

✍ Visual wheel part for the connector between twin wheels (subclass of WheelVisualPart). When the visual wheel has a connected twin, it positions the connector node and feeds connector shader parameters, in inches, from the wheel widths and offsets, with two modes (connectorPos or widthAndDiam).

- **WheelVisualPartConnector** inherits from `WheelVisualPart` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `WheelVisualPartConnector.new(name: any, visualWheel: any, linkNode: any, customMt: any)` | 16 | ✍ Creates a connector part through the parent constructor. Note: the customMt argument is ignored; the connector metatable is always used. |
| `WheelVisualPartConnector:loadFromXML(xmlObject: any, key: any)` | 25 | ✍ Calls the parent loader, then reads the connector options (useWidthAndDiam, usePosAndScale, diameter, offset, hookOffset, width, start/end positions and offsets, uniformScale). Returns false if the parent load fails. |
| `WheelVisualPartConnector:setNode(node: any)` | 50 | ✍ Calls the parent `setNode`; if a connected wheel exists, moves the node to it and sets the connectorPos or widthAndDiam shader parameters (and connectorPosAndScale if enabled) from the wheel dimensions. |
| `WheelVisualPartConnector.registerXMLPaths(schema: any, key: any, name: any)` | 82 | ✍ Registers the XML paths of the connector; currently just forwards to the parent registration. |
