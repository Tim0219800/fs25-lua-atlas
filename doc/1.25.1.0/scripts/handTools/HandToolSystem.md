# handTools/HandToolSystem.lua

Source: `dataS/scripts/handTools/HandToolSystem.lua` — FS25 1.25.1.0

- **HandToolSystem** inherits from `AbstractManager` (l.21)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolSystem.new() → HandToolSystem` | 50 |  |
| `HandToolSystem:addHandTool(handTool: any)` | 127 |  |
| `HandToolSystem:removeHandTool(handTool: any)` | 154 |  |
| `HandToolSystem:getHandToolByUniqueId(uniqueId: any)` | 173 |  |
| `HandToolSystem:addHandToolHolder(handToolHolder: any)` | 191 |  |
| `HandToolSystem:removeHandToolHolder(handToolHolder: any)` | 226 |  |
| `HandToolSystem:getHandToolHolderByUniqueId(uniqueId: any)` | 251 |  |
| `HandToolSystem:save(xmlFilename: any, usedModNames: any)` | 264 |  |
| `HandToolSystem:saveToXML(handTools: any, xmlFile: any, usedModNames: any)` | 274 |  |
| `HandToolSystem:saveHandToolToXML(handTool: any, xmlFile: any, index: any, i: any, usedModNames: any)` | 293 |  |
| `HandToolSystem:loadHandToolFromXML(xmlFile: any, key: any)` | 356 |  |
| `HandToolSystem:loadHandToolFinished(handTool: any, loadingState: any)` | 390 |  |
| `HandToolSystem:addPendingHandToolLoad(handTool: any)` | 414 |  |
| `HandToolSystem:removePendingHandToolLoad(handTool: any)` | 420 |  |
| `HandToolSystem:canStartMission()` | 431 |  |

## Messages

- publishes `MessageType.HANDTOOL_ADDED` (l.147)
- publishes `MessageType.HANDTOOL_REMOVED` (l.168)
