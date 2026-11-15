# vehicles/specializations/PowerTakeOffs.lua

Source : `dataS/scripts/vehicles/specializations/PowerTakeOffs.lua` — FS25 1.25.1.0

- **PowerTakeOffs** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PowerTakeOffs.prerequisitesPresent(specializations: any)` | 18 |  |
| `PowerTakeOffs.initSpecialization()` | 25 |  |
| `PowerTakeOffs.registerXMLPaths(schema: any, basePath: any)` | 98 |  |
| `PowerTakeOffs.registerOutputXMLPaths(schema: any, basePath: any)` | 106 |  |
| `PowerTakeOffs.registerInputXMLPaths(schema: any, basePath: any)` | 120 |  |
| `PowerTakeOffs.registerFunctions(vehicleType: any)` | 153 |  |
| `PowerTakeOffs.registerOverwrittenFunctions(vehicleType: any)` | 192 |  |
| `PowerTakeOffs.registerEventListeners(vehicleType: any)` | 199 |  |
| `PowerTakeOffs:onPreLoad(savegame: any)` | 213 |  |
| `PowerTakeOffs:onLoad(savegame: any)` | 220 |  |
| `PowerTakeOffs:onPostLoad(savegame: any)` | 241 |  |
| `PowerTakeOffs:onDelete()` | 255 |  |
| `PowerTakeOffs:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 322 |  |
| `PowerTakeOffs:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 395 |  |
| `PowerTakeOffs:getPowerTakeOffConfigIndex()` | 402 |  |
| `PowerTakeOffs:loadPowerTakeOffsFromXML(xmlFile: any, key: any)` | 408 |  |
| `PowerTakeOffs:loadOutputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffOutput: any)` | 439 |  |
| `PowerTakeOffs:loadInputPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffInput: any)` | 518 |  |
| `PowerTakeOffs:loadLocalPowerTakeOff(xmlFile: any, baseName: any, powerTakeOffLocal: any)` | 588 |  |
| `PowerTakeOffs:placeLocalPowerTakeOff(powerTakeOff: any)` | 618 |  |
| `PowerTakeOffs:updatePowerTakeOff(input: any, dt: any)` | 636 |  |
| `PowerTakeOffs:updateAttachedPowerTakeOffs(dt: any, attacherVehicle: any)` | 646 |  |
| `PowerTakeOffs:updatePowerTakeOffLength(input: any)` | 661 |  |
| `PowerTakeOffs:getOutputPowerTakeOffsByJointDescIndex(jointDescIndex: any)` | 671 |  |
| `PowerTakeOffs:getOutputPowerTakeOffs()` | 699 |  |
| `PowerTakeOffs:getInputPowerTakeOffsByJointDescIndexAndName(jointDescIndex: any, ptoName: any)` | 705 |  |
| `PowerTakeOffs:getInputPowerTakeOffs()` | 735 |  |
| `PowerTakeOffs:getIsPowerTakeOffActive()` | 741 |  |
| `PowerTakeOffs:attachPowerTakeOff(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any)` | 747 |  |
| `PowerTakeOffs:detachPowerTakeOff(detachingVehicle: any, implement: any, jointDescIndex: any)` | 770 |  |
| `PowerTakeOffs:checkPowerTakeOffCollision(attacherJointNode: any, jointDescIndex: any, isTrailerAttacher: any)` | 809 |  |
| `PowerTakeOffs:parkPowerTakeOff(input: any)` | 828 |  |
| `PowerTakeOffs:onPreAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 854 |  |
| `PowerTakeOffs:onPostAttachImplement(attachableObject: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 860 |  |
| `PowerTakeOffs:onPreDetachImplement(implement: any)` | 882 |  |
| `PowerTakeOffs:loadPowerTakeOffFromConfigFile(powerTakeOff: any, xmlFilename: any)` | 893 |  |
| `PowerTakeOffs:onPowerTakeOffI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 917 |  |
| `PowerTakeOffs:loadSingleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 982 |  |
| `PowerTakeOffs:updateSingleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1018 |  |
| `PowerTakeOffs:loadDoubleJointPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1033 |  |
| `PowerTakeOffs:updateDoubleJointPowerTakeOff(powerTakeOff: any, dt: any)` | 1073 |  |
| `PowerTakeOffs:loadBasicPowerTakeOff(powerTakeOff: any, xmlFile: any, components: any, i3dMappings: any)` | 1098 |  |
| `PowerTakeOffs:updateDistanceOfTypedPowerTakeOff(powerTakeOff: any)` | 1108 |  |
| `PowerTakeOffs:attachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1130 |  |
| `PowerTakeOffs:detachTypedPowerTakeOff(powerTakeOff: any, output: any)` | 1150 |  |
| `PowerTakeOffs:validatePowerTakeOffAttachment(powerTakeOff: any, output: any)` | 1156 |  |
| `PowerTakeOffs:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1180 |  |
| `PowerTakeOffs:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1208 |  |
| `PowerTakeOffs.consoleCommandTestConnection(vehicle: any, attacherJointIndex: any)` | 1242 |  |
| `PowerTakeOffs.consoleCommandDebug(_: any)` | 1295 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getPowerTakeOffConfigIndex` | 154 |
| registerFunction | `loadPowerTakeOffsFromXML` | 155 |
| registerFunction | `loadOutputPowerTakeOff` | 156 |
| registerFunction | `loadInputPowerTakeOff` | 157 |
| registerFunction | `loadLocalPowerTakeOff` | 158 |
| registerFunction | `placeLocalPowerTakeOff` | 159 |
| registerFunction | `updatePowerTakeOff` | 160 |
| registerFunction | `updateAttachedPowerTakeOffs` | 161 |
| registerFunction | `updatePowerTakeOffLength` | 162 |
| registerFunction | `getOutputPowerTakeOffsByJointDescIndex` | 163 |
| registerFunction | `getOutputPowerTakeOffs` | 164 |
| registerFunction | `getInputPowerTakeOffs` | 165 |
| registerFunction | `getInputPowerTakeOffsByJointDescIndexAndName` | 166 |
| registerFunction | `getIsPowerTakeOffActive` | 167 |
| registerFunction | `attachPowerTakeOff` | 168 |
| registerFunction | `detachPowerTakeOff` | 169 |
| registerFunction | `checkPowerTakeOffCollision` | 170 |
| registerFunction | `parkPowerTakeOff` | 171 |
| registerFunction | `loadPowerTakeOffFromConfigFile` | 173 |
| registerFunction | `onPowerTakeOffI3DLoaded` | 174 |
| registerFunction | `loadSingleJointPowerTakeOff` | 176 |
| registerFunction | `updateSingleJointPowerTakeOff` | 177 |
| registerFunction | `loadDoubleJointPowerTakeOff` | 179 |
| registerFunction | `updateDoubleJointPowerTakeOff` | 180 |
| registerFunction | `loadBasicPowerTakeOff` | 182 |
| registerFunction | `attachTypedPowerTakeOff` | 184 |
| registerFunction | `detachTypedPowerTakeOff` | 185 |
| registerFunction | `validatePowerTakeOffAttachment` | 187 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 193 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 194 |
| registerEventListener | `onPreLoad` | 200 |
| registerEventListener | `onLoad` | 201 |
| registerEventListener | `onPostLoad` | 202 |
| registerEventListener | `onDelete` | 203 |
| registerEventListener | `onUpdateInterpolation` | 204 |
| registerEventListener | `onUpdateEnd` | 205 |
| registerEventListener | `onPreAttachImplement` | 206 |
| registerEventListener | `onPostAttachImplement` | 207 |
| registerEventListener | `onPreDetachImplement` | 208 |
