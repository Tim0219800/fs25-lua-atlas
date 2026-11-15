# vehicles/specializations/GroundAdjustedNodes.lua

Source: `dataS/scripts/vehicles/specializations/GroundAdjustedNodes.lua` — FS25 1.25.1.0

- **GroundAdjustedNodes** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `GroundAdjustedNodes.prerequisitesPresent(specializations: any)` | 20 |  |
| `GroundAdjustedNodes.initSpecialization()` | 26 |  |
| `GroundAdjustedNodes.registerNodeXMLPaths(schema: any, basePath: any)` | 51 |  |
| `GroundAdjustedNodes.registerAdjustNodeXMLPaths(schema: any, basePath: any)` | 68 |  |
| `GroundAdjustedNodes.registerFunctions(vehicleType: any)` | 83 |  |
| `GroundAdjustedNodes.registerEventListeners(vehicleType: any)` | 95 |  |
| `GroundAdjustedNodes:onLoad(savegame: any)` | 104 |  |
| `GroundAdjustedNodes:onLoadFinished(savegame: any)` | 143 |  |
| `GroundAdjustedNodes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 165 |  |
| `GroundAdjustedNodes:loadGroundAdjustedNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any)` | 178 |  |
| `GroundAdjustedNodes:loadGroundAdjustedRaycastNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, raycastNode: any)` | 232 |  |
| `GroundAdjustedNodes:loadGroundAdjustedAdjustNodeFromXML(xmlFile: any, key: any, groundAdjustedNode: any, adjustNode: any, required: any)` | 280 |  |
| `GroundAdjustedNodes:initGroundAdjustedAdjustNode(groundAdjustedNode: any, adjustNode: any)` | 317 |  |
| `GroundAdjustedNodes:updateGroundAdjustedRaycasts(dt: any)` | 332 |  |
| `GroundAdjustedNodes:updateGroundAdjustedNode(groundAdjustedNode: any, dt: any)` | 390 |  |
| `GroundAdjustedNodes:getIsGroundAdjustedNodeActive(groundAdjustedNode: any, ignoreAttachState: any)` | 490 |  |
| `GroundAdjustedNodes:onRegisterAnimationValueTypes()` | 497 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadGroundAdjustedNodeFromXML` | 84 |
| registerFunction | `loadGroundAdjustedAdjustNodeFromXML` | 85 |
| registerFunction | `initGroundAdjustedAdjustNode` | 86 |
| registerFunction | `loadGroundAdjustedRaycastNodeFromXML` | 87 |
| registerFunction | `getIsGroundAdjustedNodeActive` | 88 |
| registerFunction | `updateGroundAdjustedRaycasts` | 89 |
| registerFunction | `updateGroundAdjustedNode` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onLoadFinished` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onRegisterAnimationValueTypes` | 99 |
