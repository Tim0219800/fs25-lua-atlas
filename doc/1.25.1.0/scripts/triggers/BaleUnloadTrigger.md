# triggers/BaleUnloadTrigger.lua

Source: `dataS/scripts/triggers/BaleUnloadTrigger.lua` — FS25 1.25.1.0

- **BaleUnloadTrigger** inherits from `UnloadTrigger` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BaleUnloadTrigger.registerXMLPaths(schema: any, basePath: any)` | 22 |  |
| `BaleUnloadTrigger.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 |  |
| `BaleUnloadTrigger:load(components: table, xmlFile: table, xmlNode: string, target: table, extraAttributes: table, i3dMappings: table) → boolean` | 52 |  |
| `BaleUnloadTrigger:delete()` | 86 |  |
| `BaleUnloadTrigger:update(dt: number)` | 116 |  |
| `BaleUnloadTrigger:baleTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 172 |  |
