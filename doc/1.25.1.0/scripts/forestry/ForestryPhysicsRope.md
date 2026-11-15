# forestry/ForestryPhysicsRope.lua

Source : `dataS/scripts/forestry/ForestryPhysicsRope.lua` — FS25 1.25.1.0

- **ForestryPhysicsRope** (l.33)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForestryPhysicsRope.new(vehicle: any, linkActor: any, linkNode: any, isServer: any, customMt: any)` | 37 |  |
| `ForestryPhysicsRope.registerXMLPaths(schema: any, baseKey: any)` | 66 |  |
| `ForestryPhysicsRope.registerSavegameXMLPaths(schema: any, baseKey: any)` | 85 |  |
| `ForestryPhysicsRope:loadFromXML(xmlFile: any, key: any, minLength: any, maxLength: any, baseDirectory: any)` | 91 |  |
| `ForestryPhysicsRope:clone(linkActor: integer?, linkNode: integer?, maxLength: number?) → ForestryPhysicsRope?` | 131 |  |
| `ForestryPhysicsRope:saveToXMLFile(xmlFile: any, key: any)` | 160 |  |
| `ForestryPhysicsRope.loadPositionDataFromSavegame(xmlFile: any, key: any)` | 174 |  |
| `ForestryPhysicsRope:delete()` | 187 |  |
| `ForestryPhysicsRope:writeStream(streamId: any)` | 206 |  |
| `ForestryPhysicsRope.readStream(streamId: any, invert: any)` | 227 |  |
| `ForestryPhysicsRope:writeUpdateStream(streamId: any)` | 249 |  |
| `ForestryPhysicsRope:readUpdateStream(streamId: any)` | 259 |  |
| `ForestryPhysicsRope:update(dt: any)` | 273 |  |
| `ForestryPhysicsRope:updateAnchorNodes()` | 412 |  |
| `ForestryPhysicsRope:setUseDynamicLength(useDynamicLength: any)` | 424 |  |
| `ForestryPhysicsRope:applySavegamePositions(savegamePositions: any)` | 432 |  |
| `ForestryPhysicsRope:copyNodePositions(otherRope: any, invert: any)` | 443 |  |
| `ForestryPhysicsRope:create(targetActor: any, targetNode: any, linkActor: any, linkNode: any, inverted: any, useNodePositions: any, callback: any, callbackTarget: any)` | 460 |  |
| `ForestryPhysicsRope:setCustomVisualNodes(targetNode: any, linkNode: any)` | 494 |  |
| `ForestryPhysicsRope:destroy()` | 501 |  |
| `ForestryPhysicsRope:setMaxLength(maxLength: any)` | 529 |  |
| `ForestryPhysicsRope:generateNodes()` | 544 |  |
| `ForestryPhysicsRope:getRopeDirectLengthPercentage(referenceMaxLength: any)` | 559 |  |
| `ForestryPhysicsRope:getLength()` | 570 |  |
| `ForestryPhysicsRope:setLength(length: any)` | 580 |  |
| `ForestryPhysicsRope:adjustLength(lengthDelta: any, sumUp: any)` | 590 |  |
| `ForestryPhysicsRope:setVisibility(visibility: any)` | 611 |  |
| `ForestryPhysicsRope:setEmissiveColor(r: any, g: any, b: any, a: any)` | 620 |  |
| `ForestryPhysicsRope:onI3DLoaded(i3dNode: any, failedReason: any)` | 635 |  |
