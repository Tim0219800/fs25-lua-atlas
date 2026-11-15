# utils/ObjectChangeUtil.lua

Source: `dataS/scripts/utils/ObjectChangeUtil.lua` — FS25 1.25.1.0

- **ObjectChangeUtil** (l.4)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ObjectChangeUtil.loadObjectChangeFromXML(xmlFile: XMLFile, key: string, objects: table?, rootNode: integer, parent: table?) → array?` | 14 |  |
| `ObjectChangeUtil.loadValuesFromXML(xmlFile: XMLFile, key: string, node: integer, object: table, parent: table?, rootNode: integer?, i3dMappings: table?)` | 81 |  |
| `ObjectChangeUtil.setObjectChanges(objects: table, isActive: boolean, target: table?, updateFunc: function?, skipInterpolation: boolean?)` | 292 |  |
| `ObjectChangeUtil.setObjectChange(object: table, isActive: boolean, target: table, updateFunc: function, skipInterpolation: boolean?)` | 307 |  |
| `ObjectChangeUtil.updateObjectChanges(xmlFile: XMLFile, key: string, configIndex: integer, rootNode: integer, parent: table)` | 374 |  |
| `ObjectChangeUtil.registerObjectChangeXMLPaths(schema: XMLSchema, basePath: string)` | 401 |  |
| `ObjectChangeUtil.registerObjectChangesXMLPaths(schema: XMLSchema, basePath: string)` | 411 |  |
| `ObjectChangeUtil.registerObjectChangeSingleXMLPaths(schema: XMLSchema, basePath: string)` | 421 |  |
| `ObjectChangeUtil.addAdditionalObjectChangeXMLPaths(schema: XMLSchema, func: function)` | 472 |  |
