# vehicles/specializations/Rideable.lua

Source : `dataS/scripts/vehicles/specializations/Rideable.lua` — FS25 1.25.1.0

- **Rideable** (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Rideable.prerequisitesPresent(specializations: table) → boolean` | 55 |  |
| `Rideable.initSpecialization()` | 62 |  |
| `Rideable.registerFunctions(vehicleType: table)` | 143 |  |
| `Rideable.registerEventListeners(vehicleType: table)` | 175 |  |
| `Rideable.registerOverwrittenFunctions(vehicleType: any)` | 197 |  |
| `Rideable:onLoad(savegame: table)` | 218 |  |
| `Rideable:onLoadFinished()` | 450 |  |
| `Rideable:setWorldPosition(superFunc: any, x: any, y: any, z: any, xRot: any, yRot: any, zRot: any, i: any, changeInterp: any)` | 456 |  |
| `Rideable:setWorldPositionQuaternion(superFunc: any, x: any, y: any, z: any, qx: any, qy: any, qz: any, qw: any, i: any, changeInterp: any)` | 470 |  |
| `Rideable:updateVehicleSpeed(superFunc: any, dt: any)` | 484 |  |
| `Rideable:calculateLegsDistance(leftLegNode: integer, rightLegNode: integer) → number` | 498 |  |
| `Rideable:onDelete()` | 510 |  |
| `Rideable:onReadStream(streamId: integer, connection: Connection)` | 544 |  |
| `Rideable:onWriteStream(streamId: integer, connection: Connection)` | 571 |  |
| `Rideable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 590 |  |
| `Rideable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 615 |  |
| `Rideable:onReadPositionUpdateStream(streamId: integer, connection: Connection)` | 633 |  |
| `Rideable:onWritePositionUpdateStream(streamId: integer, connection: Connection, dirtyMask: any)` | 647 |  |
| `Rideable:endFade()` | 654 |  |
| `Rideable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 659 |  |
| `Rideable:setCluster(cluster: any)` | 674 |  |
| `Rideable:updateDirt()` | 696 |  |
| `Rideable:getCluster()` | 708 |  |
| `Rideable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 717 |  |
| `Rideable:onUpdateInterpolation(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 830 |  |
| `Rideable:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 921 |  |
| `Rideable:onSetBroken()` | 931 |  |
| `Rideable:testCCTMove(dt: any)` | 958 |  |
| `Rideable:getIsRideableJumpAllowed(allowWhileJump: any)` | 989 |  |
| `Rideable:jump()` | 1009 |  |
| `Rideable:setCurrentGait(gait: any)` | 1033 |  |
| `Rideable:getCurrentGait()` | 1040 |  |
| `Rideable:setRideableSteer(axisSteer: any)` | 1046 |  |
| `Rideable:resetInputs()` | 1055 |  |
| `Rideable:updateKinematic(dt: number)` | 1063 |  |
| `Rideable:groundRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number) → boolean` | 1138 |  |
| `Rideable:updateAnimation(dt: number)` | 1159 |  |
| `Rideable:updateSound(dt: any)` | 1264 |  |
| `Rideable:setWorldPositionQuat(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, changeInterp: boolean)` | 1298 |  |
| `Rideable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1310 |  |
| `Rideable:onEnterVehicle(isControlling: boolean)` | 1342 |  |
| `Rideable:onVehicleCharacterChanged(character: any)` | 1369 |  |
| `Rideable:onLeaveVehicle()` | 1401 |  |
| `Rideable:unlinkReins()` | 1422 |  |
| `Rideable:setEquipmentVisibility(val: any)` | 1434 |  |
| `Rideable.actionEventAccelerate(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1452 |  |
| `Rideable.actionEventBrake(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1468 |  |
| `Rideable.actionEventSteer(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1482 |  |
| `Rideable.actionEventJump(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1496 |  |
| `Rideable:updateFootsteps(dt: any, speed: any)` | 1504 |  |
| `Rideable:updateRiding(dt: any)` | 1569 |  |
| `Rideable:getHoofSurfaceSound(x: any, y: any, z: any, hitTerrain: any)` | 1603 |  |
| `Rideable:getPosition()` | 1631 |  |
| `Rideable:getRotation()` | 1637 |  |
| `Rideable:setPlayerToEnter(player: any)` | 1643 |  |
| `Rideable:getName(superFunc: any)` | 1652 |  |
| `Rideable:getFullName(superFunc: any)` | 1659 |  |
| `Rideable:getCanBeReset(superFunc: any)` | 1665 |  |
| `Rideable:getCanBeSold(superFunc: any)` | 1671 |  |
| `Rideable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1677 |  |
| `Rideable:getShowInVehiclesOverview(superFunc: any)` | 1687 |  |
| `Rideable:periodChanged(superFunc: any)` | 1693 |  |
| `Rideable:dayChanged(superFunc: any)` | 1703 |  |
| `Rideable:getImageFilename(superFunc: any)` | 1714 |  |
| `Rideable:deleteVehicleCharacter(superFunc: any)` | 1729 |  |
| `Rideable:getInteractionHelp(superFunc: any) → string` | 1739 |  |
| `Rideable:showInfo(superFunc: any, box: any)` | 1751 |  |
| `Rideable:updateDebugValues(values: any)` | 1763 |  |
| `Rideable:updateInputText()` | 1773 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsRideableJumpAllowed` | 144 |
| registerFunction | `jump` | 145 |
| registerFunction | `setCurrentGait` | 146 |
| registerFunction | `getCurrentGait` | 147 |
| registerFunction | `setRideableSteer` | 148 |
| registerFunction | `resetInputs` | 149 |
| registerFunction | `updateKinematic` | 150 |
| registerFunction | `testCCTMove` | 151 |
| registerFunction | `updateAnimation` | 152 |
| registerFunction | `updateSound` | 153 |
| registerFunction | `updateRiding` | 154 |
| registerFunction | `updateDirt` | 155 |
| registerFunction | `calculateLegsDistance` | 156 |
| registerFunction | `setWorldPositionQuat` | 157 |
| registerFunction | `updateFootsteps` | 158 |
| registerFunction | `getPosition` | 159 |
| registerFunction | `getRotation` | 160 |
| registerFunction | `setEquipmentVisibility` | 161 |
| registerFunction | `getHoofSurfaceSound` | 162 |
| registerFunction | `groundRaycastCallback` | 163 |
| registerFunction | `unlinkReins` | 164 |
| registerFunction | `updateInputText` | 165 |
| registerFunction | `setPlayerToEnter` | 166 |
| registerFunction | `endFade` | 167 |
| registerFunction | `setCluster` | 168 |
| registerFunction | `getCluster` | 169 |
| registerEventListener | `onLoad` | 176 |
| registerEventListener | `onLoadFinished` | 177 |
| registerEventListener | `onDelete` | 178 |
| registerEventListener | `onReadStream` | 179 |
| registerEventListener | `onWriteStream` | 180 |
| registerEventListener | `onReadUpdateStream` | 181 |
| registerEventListener | `onWriteUpdateStream` | 182 |
| registerEventListener | `onReadPositionUpdateStream` | 183 |
| registerEventListener | `onWritePositionUpdateStream` | 184 |
| registerEventListener | `onUpdate` | 185 |
| registerEventListener | `onUpdateInterpolation` | 186 |
| registerEventListener | `onDraw` | 187 |
| registerEventListener | `onRegisterActionEvents` | 188 |
| registerEventListener | `onEnterVehicle` | 189 |
| registerEventListener | `onLeaveVehicle` | 190 |
| registerEventListener | `onSetBroken` | 191 |
| registerEventListener | `onVehicleCharacterChanged` | 192 |
| registerOverwrittenFunction | `setWorldPosition` | 198 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 199 |
| registerOverwrittenFunction | `updateVehicleSpeed` | 200 |
| registerOverwrittenFunction | `getName` | 201 |
| registerOverwrittenFunction | `getFullName` | 202 |
| registerOverwrittenFunction | `getCanBeReset` | 203 |
| registerOverwrittenFunction | `getMapHotspotRotation` | 204 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 205 |
| registerOverwrittenFunction | `periodChanged` | 206 |
| registerOverwrittenFunction | `dayChanged` | 207 |
| registerOverwrittenFunction | `getImageFilename` | 208 |
| registerOverwrittenFunction | `showInfo` | 209 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 210 |
| registerOverwrittenFunction | `getCanBeSold` | 211 |
| registerOverwrittenFunction | `getInteractionHelp` | 212 |
