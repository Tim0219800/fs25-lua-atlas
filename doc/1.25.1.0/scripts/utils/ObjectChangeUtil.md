# utils/ObjectChangeUtil.lua

*[Version française](../../fr/scripts/utils/ObjectChangeUtil.md)*

Source: `dataS/scripts/utils/ObjectChangeUtil.lua` — FS25 1.25.1.0

✍ Handles the objectChange XML feature: a node can have one set of values when a configuration is active and another when inactive (visibility, translation, rotation, scale, shader parameter, mass, center of mass, parent node, rigid body type, compound child, deletion). It loads these entries, applies them with optional interpolation through ValueInterpolator, and registers the schema paths. The helper loadValueType it calls is not defined in this file (UNVERIFIED).

- **ObjectChangeUtil** (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `ObjectChangeUtil.loadObjectChangeFromXML(xmlFile: XMLFile, key: string, objects: table?, rootNode: integer, parent: table?) → array?` | 14 | ✍ Reads every objectChange child under a key, resolves its node (using the parent's i3dMappings if any) and loads its values. Returns the given or a new table of change objects, or nil when none was loaded. |
| `ObjectChangeUtil.loadValuesFromXML(xmlFile: XMLFile, key: string, node: integer, object: table, parent: table?, rootNode: integer?, i3dMappings: table?)` | 81 | ✍ Fills a change object from one XML entry: interpolation settings and active/inactive values for parent, delete, transform, shader parameter, center of mass, mass (in the XML unit divided by 1000), visibility, compound child and rigid body type. Calls the parent's loadObjectChangeValuesFromXML if it exists. |
| `ObjectChangeUtil.setObjectChanges(objects: table, isActive: boolean, target: table?, updateFunc: function?, skipInterpolation: boolean?)` | 292 | ✍ Applies setObjectChange to every object of a table in the given active or inactive state. Does nothing if the table is nil. |
| `ObjectChangeUtil.setObjectChange(object: table, isActive: boolean, target: table, updateFunc: function, skipInterpolation: boolean?)` | 307 | ✍ Applies the active or inactive values of one change object, either directly or through a ValueInterpolator when interpolation is on and not skipped, then sets the rigid body type. Finally calls target:setObjectChangeValues and the update function if given. |
| `ObjectChangeUtil.updateObjectChanges(xmlFile: XMLFile, key: string, configIndex: integer, rootNode: integer, parent: table)` | 374 | ✍ Loops over the numbered objectChange blocks under a key, sets all non-selected configurations inactive first and the one chosen by the config index active last, so it wins on conflicts. The config index is 1-based. |
| `ObjectChangeUtil.registerObjectChangeXMLPaths(schema: XMLSchema, basePath: string)` | 401 | ✍ Registers the schema paths for a single objectChange group at the base path, using a shared registration named ObjectChange_single. |
| `ObjectChangeUtil.registerObjectChangesXMLPaths(schema: XMLSchema, basePath: string)` | 411 | ✍ Registers the schema paths for multiple objectChange entries under an objectChanges sub-element, using a shared registration named ObjectChange_multiple. |
| `ObjectChangeUtil.registerObjectChangeSingleXMLPaths(schema: XMLSchema, basePath: string)` | 421 | ✍ Declares every objectChange attribute: node, interpolation and its time, and the Active/Inactive pairs for delete, visibility, translation, rotation, scale, shaderParameter, mass, centerOfMass, compoundChild, rigidBodyType and parentNode. Note: deleteInactive is registered with the same description text as deleteActive. |
| `ObjectChangeUtil.addAdditionalObjectChangeXMLPaths(schema: XMLSchema, func: function)` | 472 | ✍ Queues a function to be run later to register extra objectChange paths, through the schema's delayed registration under the name ObjectChange. |
