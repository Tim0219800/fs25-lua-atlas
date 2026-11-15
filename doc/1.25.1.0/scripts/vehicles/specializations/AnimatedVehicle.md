# vehicles/specializations/AnimatedVehicle.lua

Source: `dataS/scripts/vehicles/specializations/AnimatedVehicle.lua` — FS25 1.25.1.0

- **AnimatedVehicle** (l.17)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AnimatedVehicle.prerequisitesPresent(specializations: table) → boolean` | 25 |  |
| `AnimatedVehicle.initSpecialization()` | 31 |  |
| `AnimatedVehicle.registerAnimationXMLPaths(schema: any, basePath: any)` | 70 |  |
| `AnimatedVehicle.registerEvents(vehicleType: any)` | 176 |  |
| `AnimatedVehicle.registerFunctions(vehicleType: any)` | 188 |  |
| `AnimatedVehicle.registerOverwrittenFunctions(vehicleType: any)` | 218 |  |
| `AnimatedVehicle.registerEventListeners(vehicleType: any)` | 231 |  |
| `AnimatedVehicle:onPreLoad(savegame: table)` | 245 |  |
| `AnimatedVehicle:onLoad(savegame: table)` | 255 |  |
| `AnimatedVehicle:onPostLoad(savegame: table)` | 287 |  |
| `AnimatedVehicle:onDelete()` | 305 |  |
| `AnimatedVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 323 |  |
| `AnimatedVehicle:registerAnimationValueType(name: any, startName: any, endName: any, initialUpdate: any, classObject: any, load: any, get: any, set: any)` | 356 |  |
| `AnimatedVehicle:loadAnimation(xmlFile: any, key: any, animation: any, components: any)` | 377 |  |
| `AnimatedVehicle:loadAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 504 |  |
| `AnimatedVehicle:loadStaticAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 569 |  |
| `AnimatedVehicle:loadStaticAnimationPartValues(xmlFile: any, partKey: any, curve: any, node: any, transName: any, rotName: any, scaleName: any, time: any, animation: any)` | 628 |  |
| `AnimatedVehicle:initializeAnimationParts(animation: table)` | 672 |  |
| `AnimatedVehicle:initializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 687 |  |
| `AnimatedVehicle:postInitializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 696 |  |
| `AnimatedVehicle:playAnimation(name: string, speed: number, animTime: number, noEventSend: boolean, allowSounds: any)` | 709 |  |
| `AnimatedVehicle:stopAnimation(name: string, noEventSend: boolean)` | 759 |  |
| `AnimatedVehicle:getAnimationExists(name: string) → boolean` | 795 |  |
| `AnimatedVehicle:getAnimationByName(name: string) → table` | 805 |  |
| `AnimatedVehicle:getIsAnimationPlaying(name: string) → boolean` | 814 |  |
| `AnimatedVehicle:getRealAnimationTime(name: string) → number` | 824 |  |
| `AnimatedVehicle:setRealAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 839 |  |
| `AnimatedVehicle:getAnimationTime(name: string) → number` | 866 |  |
| `AnimatedVehicle:setAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 882 |  |
| `AnimatedVehicle:getAnimationDuration(name: string) → number` | 899 |  |
| `AnimatedVehicle:setAnimationSpeed(name: string, speed: number)` | 913 |  |
| `AnimatedVehicle:getAnimationSpeed(name: string) → number` | 933 |  |
| `AnimatedVehicle:setAnimationStopTime(name: string, stopTime: number)` | 948 |  |
| `AnimatedVehicle:resetAnimationValues(animation: table)` | 960 |  |
| `AnimatedVehicle:resetAnimationPartValues(part: table)` | 970 |  |
| `AnimatedVehicle:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 978 |  |
| `AnimatedVehicle:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 993 |  |
| `AnimatedVehicle:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1012 |  |
| `AnimatedVehicle:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1022 |  |
| `AnimatedVehicle:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1035 |  |
| `AnimatedVehicle:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1051 |  |
| `AnimatedVehicle:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1064 |  |
| `AnimatedVehicle:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1080 |  |
| `AnimatedVehicle.initializeAnimationPartAttribute(self: any, animation: any, part: any, i: any, numParts: any, nextName: any, prevName: any, startName: any, endName: any, warningName: any, startName2: any, endName2: any, additionalCompareParam: any)` | 1093 |  |
| `AnimatedVehicle.animPartSorter(a: table, b: table) → boolean` | 1153 |  |
| `AnimatedVehicle.animPartSorterReverse(a: table, b: table) → boolean` | 1167 |  |
| `AnimatedVehicle.getMovedLimitedValue(currentValue: number, destValue: number, speed: number, dt: number) → number` | 1185 |  |
| `AnimatedVehicle.setMovedLimitedValuesN(n: integer, currentValues: table, destValues: table, speeds: table, dt: number)` | 1202 |  |
| `AnimatedVehicle.setMovedLimitedValues3(currentValues: table, destValues: table, speeds: table, dt: number)` | 1220 |  |
| `AnimatedVehicle.setMovedLimitedValues4(currentValues: table, destValues: table, speeds: table, dt: number)` | 1230 |  |
| `AnimatedVehicle.findCurrentPartIndex(animation: table) → integer` | 1238 |  |
| `AnimatedVehicle.getDurationToEndOfPart(part: table, anim: table) → number` | 1265 |  |
| `AnimatedVehicle.getNextPartIsPlaying(nextPart: table, prevPart: table, anim: table, default: boolean) → boolean` | 1280 |  |
| `AnimatedVehicle.updateAnimations(self: number, dt: number, fixedTimeUpdate: any)` | 1296 |  |
| `AnimatedVehicle.updateAnimationByName(self: string, animName: string, dt: number, fixedTimeUpdate: any)` | 1311 |  |
| `AnimatedVehicle.updateAnimationCurrentTime(self: table, anim: table, dt: number, stopTime: number) → number, boolean` | 1328 |  |
| `AnimatedVehicle.updateAnimation(self: table, anim: table, dtToUse: number, stopAnim: boolean, fixedTimeUpdate: boolean, playSounds: playSounds)` | 1360 |  |
| `AnimatedVehicle:updateAnimationPart(animation: table, part: table, durationToEnd: number, dtToUse: number, realDt: number, fixedTimeUpdate: any)` | 1592 |  |
| `AnimatedVehicle:getNumOfActiveAnimations()` | 1605 |  |
| `AnimatedVehicle:onRegisterAnimationValueTypes()` | 1611 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onRegisterAnimationValueTypes` | 177 |
| registerEvent | `onPlayAnimation` | 178 |
| registerEvent | `onStartAnimation` | 179 |
| registerEvent | `onUpdateAnimation` | 180 |
| registerEvent | `onFinishAnimation` | 181 |
| registerEvent | `onStopAnimation` | 182 |
| registerEvent | `onAnimationPartChanged` | 183 |
| registerFunction | `registerAnimationValueType` | 189 |
| registerFunction | `loadAnimation` | 190 |
| registerFunction | `loadAnimationPart` | 191 |
| registerFunction | `loadStaticAnimationPart` | 192 |
| registerFunction | `loadStaticAnimationPartValues` | 193 |
| registerFunction | `initializeAnimationParts` | 194 |
| registerFunction | `initializeAnimationPart` | 195 |
| registerFunction | `postInitializeAnimationPart` | 196 |
| registerFunction | `playAnimation` | 197 |
| registerFunction | `stopAnimation` | 198 |
| registerFunction | `getAnimationExists` | 199 |
| registerFunction | `getAnimationByName` | 200 |
| registerFunction | `getIsAnimationPlaying` | 201 |
| registerFunction | `getRealAnimationTime` | 202 |
| registerFunction | `setRealAnimationTime` | 203 |
| registerFunction | `getAnimationTime` | 204 |
| registerFunction | `setAnimationTime` | 205 |
| registerFunction | `getAnimationDuration` | 206 |
| registerFunction | `setAnimationSpeed` | 207 |
| registerFunction | `getAnimationSpeed` | 208 |
| registerFunction | `setAnimationStopTime` | 209 |
| registerFunction | `resetAnimationValues` | 210 |
| registerFunction | `resetAnimationPartValues` | 211 |
| registerFunction | `updateAnimationPart` | 212 |
| registerFunction | `getNumOfActiveAnimations` | 213 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 219 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 220 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 221 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 222 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 223 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 224 |
| registerOverwrittenFunction | `loadMovingPartFromXML` | 225 |
| registerOverwrittenFunction | `getIsMovingPartActive` | 226 |
| registerEventListener | `onPreLoad` | 232 |
| registerEventListener | `onLoad` | 233 |
| registerEventListener | `onPostLoad` | 234 |
| registerEventListener | `onDelete` | 235 |
| registerEventListener | `onUpdate` | 236 |
| registerEventListener | `onRegisterAnimationValueTypes` | 237 |
