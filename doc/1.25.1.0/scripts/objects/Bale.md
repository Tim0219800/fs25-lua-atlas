# objects/Bale.lua

Source: `dataS/scripts/objects/Bale.lua` — FS25 1.25.1.0

- **Bale** inherits from `MountableObject` (l.11)
- **BaleActivatable** (l.1636)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Bale.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 49 |  |
| `Bale:delete()` | 101 |  |
| `Bale:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 |  |
| `Bale:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 180 |  |
| `Bale:readStream(streamId: integer, connection: table)` | 225 |  |
| `Bale:writeStream(streamId: integer, connection: table)` | 271 |  |
| `Bale:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 309 |  |
| `Bale:unmount()` | 316 |  |
| `Bale:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 335 |  |
| `Bale:unmountKinematic()` | 342 |  |
| `Bale:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 353 |  |
| `Bale:unmountDynamic(isDelete: any)` | 364 |  |
| `Bale:setBaleAIObstacle(isActive: any)` | 372 |  |
| `Bale:createNode(i3dFilename: string)` | 385 |  |
| `Bale:loadFromConfigXML(xmlFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, uniqueId: any)` | 406 |  |
| `Bale:loadBaleAttributesFromXML(xmlFile: table)` | 455 |  |
| `Bale:getBaleMatchesSize(diameter: number, width: number, height: number, length: number) → boolean` | 491 |  |
| `Bale:getSupportsWrapping() → boolean` | 502 |  |
| `Bale:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 512 |  |
| `Bale.loadBaleAttributesFromXMLFile(attributes: any, xmlFile: any, key: any, resetVehicles: any)` | 544 |  |
| `Bale:getBaleAttributes()` | 577 |  |
| `Bale.saveBaleAttributesToXMLFile(attributes: any, xmlFile: any, key: any)` | 602 |  |
| `Bale:applyBaleAttributes(attributes: any)` | 629 |  |
| `Bale:saveToXMLFile(xmlFile: any, key: any)` | 672 |  |
| `Bale:getNeedsSaving()` | 708 |  |
| `Bale:getAutoLoadIsSupported()` | 720 |  |
| `Bale:getAutoLoadIsAllowed()` | 726 |  |
| `Bale:getAutoLoadSize()` | 732 |  |
| `Bale:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 742 |  |
| `Bale:getValue()` | 772 |  |
| `Bale:getMass()` | 779 |  |
| `Bale:getDefaultMass()` | 785 |  |
| `Bale:getFillType() → integer` | 792 |  |
| `Bale:setReducedComponentMass(state: any)` | 798 |  |
| `Bale:getAllowComponentMassReduction()` | 808 |  |
| `Bale:setFillType(fillTypeIndex: any, fillBale: any)` | 814 |  |
| `Bale:setVariationIndex(variationIndex: any)` | 861 |  |
| `Bale:setVariationId(variationId: any)` | 876 |  |
| `Bale:getVariationId()` | 894 |  |
| `Bale:getCapacity() → integer` | 910 |  |
| `Bale:getFillLevel() → integer` | 923 |  |
| `Bale:setFillLevel(fillLevel: integer)` | 930 |  |
| `Bale:getFillTypeInfo(fillTypeIndex: integer) → table` | 942 |  |
| `Bale:setCanBeSold(canBeSold: boolean)` | 955 |  |
| `Bale:getCanBeSold() → boolean` | 962 |  |
| `Bale:setWrappingState(wrappingState: number, updateFermentation: boolean)` | 970 |  |
| `Bale:setWrapTextures(diffuse: string, normal: string)` | 1024 |  |
| `Bale:setColor(r: number, g: number, b: number)` | 1066 |  |
| `Bale:setIsMissionBale(state: any)` | 1091 |  |
| `Bale:getMeshNodes()` | 1097 |  |
| `Bale:getSupportsTensionBelts()` | 1103 |  |
| `Bale:getTensionBeltNodeId()` | 1109 |  |
| `Bale:getBaleSupportsBaleLoader()` | 1115 |  |
| `Bale:getAllowPickup()` | 1121 |  |
| `Bale:getAdditionalMountingDistance()` | 1127 |  |
| `Bale:getIsFermenting()` | 1137 |  |
| `Bale:getFermentingPercentage()` | 1143 |  |
| `Bale:onFermentationUpdate(percentage: any)` | 1153 |  |
| `Bale:onFermentationEnd()` | 1160 |  |
| `Bale:getCanBeOpened()` | 1176 |  |
| `Bale:getInteractionPosition()` | 1194 |  |
| `Bale:getCanInteract()` | 1204 |  |
| `Bale:open()` | 1221 |  |
| `Bale:resetDetailVisibilityCut()` | 1227 |  |
| `Bale:setDetailVisibilityCutNode(node: any, axis: any, direction: any)` | 1238 |  |
| `Bale.setBaleMeshVisibilityCut(baleMesh: any, node: any, axis: any, direction: any, recursively: any)` | 1246 |  |
| `Bale:doDensityMapItemAreaUpdate(func: any, target: any, ...: any)` | 1277 |  |
| `Bale:showInfo(box: any)` | 1300 |  |
| `Bale.createDummyBale(xmlFilename: string, fillTypeIndex: integer, variationId: string, wrappingState: number?, wrappingColor: table?) → integer, integer` | 1330 |  |
| `Bale.loadFillTypesFromXML(fillTypes: table, xmlFile: table, baseDirectory: string)` | 1388 |  |
| `Bale.loadVariationsFromXML(variations: table, xmlFile: table, baseDirectory: string)` | 1423 |  |
| `Bale.setFillTypeTextures(meshes: table, fillTypes: table, fillTypeIndex: integer)` | 1446 |  |
| `Bale.setVariationTextures(meshes: table, variations: table, id: string)` | 1486 |  |
| `Bale.setTexturesForNode(nodeId: integer, textureData: table)` | 1513 |  |
| `Bale.loadVisualMeshesFromXML(rootNode: integer, xmlFile: table, baseDirectory: string) → table, table` | 1559 |  |
| `Bale.updateVisualMeshVisibility(meshes: table, fillTypeIndex: integer, isWrapped: boolean)` | 1590 |  |
| `Bale.updateVisualMeshWrappingState(meshes: table, wrappingState: number, wrappingColor: table)` | 1615 |  |
| `BaleActivatable.new(bale: any)` | 1640 |  |
| `BaleActivatable:getIsActivatable()` | 1651 |  |
| `BaleActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1667 |  |
| `BaleActivatable:run()` | 1679 |  |
