# vehicles/specializations/components/ToolConnectionHoseMount.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/components/ToolConnectionHoseMount.md)*

Source: `dataS/scripts/vehicles/specializations/components/ToolConnectionHoseMount.lua` — FS25 1.25.1.0

✍ Loads an extra hose-mount asset (XML plus shared i3d) that sits between two connection hose targets of a vehicle, so hoses of an attached tool can be routed through an intermediate mount. After loading it registers new hose targets and tool connector hoses into the vehicle's `spec_connectionHoses` (the ConnectionHoses specialization, defined elsewhere, UNVERIFIED) and can stretch itself to a requested length. Client-side visual/setup helper.

- **ToolConnectionHoseMount** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `ToolConnectionHoseMount.new(vehicle: any, customMt: any)` | 16 | ✍ Creates a hose mount object for a vehicle with empty component and i3d mapping tables. |
| `ToolConnectionHoseMount:delete()` | 30 | ✍ Deletes the pending XML file and the mount node, and releases the shared i3d request. |
| `ToolConnectionHoseMount:setCallback(callback: any, callbackTarget: any)` | 49 | ✍ Stores a callback (and optional target) called with the success flag after loading. |
| `ToolConnectionHoseMount:onFinished(success: any)` | 56 | ✍ Invokes the registered callback, with or without target, passing the success flag. |
| `ToolConnectionHoseMount:setReferenceTargets(startTarget: any, endTarget: any)` | 68 | ✍ Stores the start and end hose targets the mount sits between and looks up the parent tool connection hose of the start target in `spec_connectionHoses`. |
| `ToolConnectionHoseMount:setLinkNode(linkNode: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 78 | ✍ Stores the node to link under and the local translation and rotation (default 0) of the mount. |
| `ToolConnectionHoseMount:loadFromXML(xmlFilename: any, baseDirectory: any)` | 86 | ✍ Loads the mount XML and starts the async shared i3d load. Requires start/end targets and a link node, otherwise logs a warning, calls `onFinished(false)` and returns false. |
| `ToolConnectionHoseMount:onI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 129 | ✍ Async callback: reads default length, hose targets (back/front/mounting nodes, type name, options), extra hoses, adjust nodes and scale nodes; links and places the root, creates the hoses and applies a pending length. |
| `ToolConnectionHoseMount:setLength(length: any)` | 215 | ✍ Stretches the mount to the given length by scaling adjust node z translations and scale node z scales relative to the default length. If not loaded yet, the length is kept and applied after loading. |
| `ToolConnectionHoseMount:addHoseTarget(node: any, sourceTarget: any, newType: any)` | 236 | ✍ Adds a hose target for a node into the vehicle's target list and type index, copying joints, straightening factor and adapter name from a source target. Returns the new target index. |
| `ToolConnectionHoseMount:createToolConnectionHoses()` | 263 | ✍ For each configured target, creates front and back hose targets and a new tool connection hose entry linking them (hiding the mounting node) and registers it in `toolConnectorHoses` and `targetNodeToToolConnection`. |
| `ToolConnectionHoseMount.registerExternalXMLPaths(schema: any)` | 296 | ✍ Registers the XML paths of the hose mount asset (i3d mappings under `toolConnectionHoseMount`; other paths registration lines may exist but are not summarised). |
