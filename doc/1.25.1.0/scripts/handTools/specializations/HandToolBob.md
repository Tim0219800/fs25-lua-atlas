# handTools/specializations/HandToolBob.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolBob.md)*

Source: `dataS/scripts/handTools/specializations/HandToolBob.lua` — FS25 1.25.1.0

✍ Hand tool specialization that adds a procedural first-person bob to chosen nodes of the tool: a constant slow idle sway plus a walking sway that scales with the player's speed. It is only applied for the local player in first person, and the node is restored to its rest position otherwise. Nodes are configured under `handTool.bob.node(?)`; HandToolMotorized can overwrite `updateBobNode` to add its vibration.

- **HandToolBob** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolBob.registerXMLPaths(xmlSchema: table)` | 46 | ✍ Registers the XML schema entries for `handTool.bob.node(?)`: target node, vertical/horizontal amplitudes, frequency, reference speed and the three idle parameters, with the class constants as defaults. |
| `HandToolBob.registerFunctions(handToolType: table)` | 62 | ✍ Registers the specialization functions `getIsBobActive`, `updateBobNode` and `resetBobNode` on the hand tool type. |
| `HandToolBob.registerEventListeners(handToolType: table)` | 71 | ✍ Subscribes the specialization to `onLoad`, `onUpdate` and `onHeldEnd`. |
| `HandToolBob.prerequisitesPresent(specializations: table) → boolean` | 81 | ✍ Always returns true: this specialization has no prerequisite. |
| `HandToolBob:onLoad(xmlFile: table)` | 89 | ✍ Reads every `handTool.bob.node` entry, resolves its node (warning and skipping if missing), stores its rest translation and parameters, and initialises phase state. Reference speed is clamped to at least 0.0001. |
| `HandToolBob:onUpdate(dt: number)` | 128 | ✍ Each frame, if the tool has bob nodes, determines whether bobbing is active and gets the carrying player's graphical speed, then calls `updateBobNode` for every node. |
| `HandToolBob:onHeldEnd()` | 149 | ✍ Resets all bob nodes to their rest pose when the tool stops being held, since `onUpdate` no longer runs then. |
| `HandToolBob:getIsBobActive() → boolean` | 162 | ✍ Returns true only when the tool is held by the local player and that player's camera is in first person. |
| `HandToolBob:updateBobNode(bobNode: table, dt: number, isActive: boolean, speed: number)` | 184 | ✍ Advances one node's idle and walk phases, smooths the speed factor, and sets the node translation to rest plus sinusoidal X/Y offsets. When inactive it resets the node once. The `speed` argument is in m/s. |
| `HandToolBob:resetBobNode(bobNode: table)` | 219 | ✍ Puts the node back to its stored rest translation and clears phase, speed factor, bobbing flag and offsets. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsBobActive` | 63 |
| registerFunction | `updateBobNode` | 64 |
| registerFunction | `resetBobNode` | 65 |
| registerEventListener | `onLoad` | 72 |
| registerEventListener | `onUpdate` | 73 |
| registerEventListener | `onHeldEnd` | 74 |
