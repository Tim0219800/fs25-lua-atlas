# triggers/UnloadTrigger.lua

Source: `dataS/scripts/triggers/UnloadTrigger.lua` — FS25 1.25.1.0

- **UnloadTrigger** inherits from `Object` (l.63)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `UnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 51 |  |
| `UnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 71 |  |
| `UnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 93 |  |
| `UnloadTrigger:delete()` | 140 |  |
| `UnloadTrigger:loadAcceptedToolType(xmlFile: XMLFile, xmlNode: string)` | 152 |  |
| `UnloadTrigger:loadFillTypes(xmlFile: XMLFile, xmlNode: string)` | 171 |  |
| `UnloadTrigger:setTarget(object: table)` | 186 |  |
| `UnloadTrigger:getFillUnitIndexFromNode(node: integer)` | 202 |  |
| `UnloadTrigger:getFillUnitExactFillRootNode(fillUnitIndex: integer)` | 209 |  |
| `UnloadTrigger:addFillUnitFillLevel(farmId: integer, fillUnitIndex: integer, fillLevelDelta: number, fillTypeIndex: integer, toolType: table, fillPositionData: table, extraAttributes: any) → number` | 221 |  |
| `UnloadTrigger:getFillUnitAllowsFillType(fillUnitIndex: integer, fillType: integer) → boolean` | 247 |  |
| `UnloadTrigger:getIsFillTypeAllowed(fillType: integer) → boolean` | 255 |  |
| `UnloadTrigger:getIsFillTypeSupported(fillType: integer) → boolean` | 263 |  |
| `UnloadTrigger:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: any) → number` | 296 |  |
| `UnloadTrigger:getIsToolTypeAllowed(toolType: integer) → boolean` | 311 |  |
| `UnloadTrigger:getCustomDischargeNotAllowedWarning()` | 329 |  |
| `UnloadTrigger.loadSpecValueFillTypes(xmlFile: XMLFile, xmlPath: string, customEnvironment: string?, baseDir: string?) → table?` | 349 |  |
