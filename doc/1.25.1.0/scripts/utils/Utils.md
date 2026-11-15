# utils/Utils.lua

Source : `dataS/scripts/utils/Utils.lua` — FS25 1.25.1.0

- **Utils** (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Utils.getNoNil(value: any, setTo: any) → any` | 13 |  |
| `Utils.getNoNilRad(valueDeg: number, defaultRad: any) → number` | 25 |  |
| `Utils.limitTextToWidth(text: string, textSize: number, width: number, trimFront: boolean?, trimReplaceText: string) → string, integer, integer` | 42 |  |
| `Utils.getMovedLimitedValue(curVal: number, maxVal: number, minVal: number, speed: number, dt: number, inverted: boolean) → number` | 70 |  |
| `Utils.getMovedLimitedValues(currentValues: number, maxValues: number, minValues: number, numValues: number, speed: number, dt: number, inverted: boolean) → array` | 97 |  |
| `Utils.setMovedLimitedValues(values: number, maxValues: number, minValues: number, numValues: number, speed: number, dt: number, inverted: boolean) → boolean` | 115 |  |
| `Utils.getUniqueId(value: any, mappingTable: table?, prefix: string?, md5Length: integer?) → string` | 179 |  |
| `Utils.getModNameAndBaseDirectory(filename: string) → string, string` | 214 |  |
| `Utils.getVersatileRotation(repr: integer, componentNode: integer, dt: number, posX: number, posY: number, posZ: number, currentAngle: number, minAngle: number, maxAngle: number) → number` | 247 |  |
| `Utils.getYRotationBetweenNodes(node1: integer, node2: integer, offset1: number, offset2: number, wrapRotation: boolean) → number` | 286 |  |
| `Utils.getPerformanceClassIndex(profileClass: string) → integer` | 320 |  |
| `Utils.getPerformanceClassFromIndex(profileClassIndex: integer) → string` | 348 |  |
| `Utils.getPerformanceClassId() → integer` | 367 |  |
| `Utils.getStateFromValues(values: array, steps: number, value: number) → integer` | 377 |  |
| `Utils.getValueIndex(targetValue: number, values: table) → integer` | 393 |  |
| `Utils.getNumTimeScales() → integer` | 410 |  |
| `Utils.getTimeScaleString(timeScaleIndex: integer) → string` | 427 |  |
| `Utils.getTimeScaleIndex(timeScale: number) → integer` | 450 |  |
| `Utils.getTimeScaleFromIndex(timeScaleIndex: integer) → number` | 475 |  |
| `Utils.getMasterVolumeIndex(masterVolume: number) → integer` | 494 |  |
| `Utils.getMasterVolumeFromIndex(masterVolumeIndex: integer) → number` | 517 |  |
| `Utils.getUIScaleIndex(uiScale: number) → integer` | 529 |  |
| `Utils.getUIScaleFromIndex(uiScaleIndex: integer) → number` | 546 |  |
| `Utils.getRecordingVolumeIndex(volume: number) → integer` | 558 |  |
| `Utils.getRecordingVolumeFromIndex(index: integer) → number` | 579 |  |
| `Utils.getFilename(filename: string?, baseDir: string?) → string?, boolean?` | 593 |  |
| `Utils.getFilenameFromPath(path: string) → string` | 626 |  |
| `Utils.getDirectory(filePath: string) → string?` | 637 |  |
| `Utils.getDirectoryName(directoryPath: string) → string?` | 652 |  |
| `Utils.resolveRelativePath(path: string) → string?` | 669 |  |
| `Utils.getPathIsValid(path: string) → boolean, string?` | 692 |  |
| `Utils.getMaxJointForceLimit(forceLimit1: number, forceLimit2: number) → number` | 706 |  |
| `Utils.appendedFunction(oldFunc: function, newFunc: function) → function` | 718 |  |
| `Utils.prependedFunction(oldFunc: function, newFunc: function) → function` | 734 |  |
| `Utils.overwrittenFunction(oldFunc: function, newFunc: function) → function` | 750 |  |
| `Utils.shuffle(t: table)` | 766 |  |
| `Utils.getFilenameInfo(filename: string, excludePath: boolean?) → string, string?` | 784 |  |
| `Utils.stringToBoolean(booleanString: string?) → boolean` | 807 |  |
| `Utils.parseConsoleParameter(str: string) → string?` | 819 |  |
| `Utils.getMinuteOfDayFromTime(value: string) → number?` | 835 |  |
| `Utils.formatTime(timeInMinutes: number) → string` | 856 |  |
| `Utils.renderMultiColumnText(x: number, y: number, textSize: number, texts: table, spacingX: number, aligns: table?)` | 872 |  |
| `Utils.getCoinToss() → boolean` | 892 |  |
| `Utils.getNormallyDistributedRandomVariables(mean: number, sigmaSq: number) → number, number` | 902 |  |
| `Utils.getIntersectionOfLinearMovementAndTerrain(node: integer, speed: number) → number, number, number` | 927 |  |
| `Utils.clearBit(bitMask: integer, bit: integer) → integer` | 963 |  |
| `Utils.setBit(bitMask: integer, bit: integer) → integer` | 973 |  |
| `Utils.isBitSet(bitMask: integer, bit: integer) → boolean` | 983 |  |
| `Utils.clearFlags(bitMask: integer, ...: integer) → integer` | 994 |  |
| `Utils.renderTextAtWorldPosition(x: number, y: number, z: number, text: string, textSize: number?, textOffset: number?, r: number?, g: number?, b: number?, a: number?)` | 1012 |  |
| `Utils.getGreenRedBlendedColor(factor: number) → number, number, number, number` | 1056 |  |
| `Utils.maskToFormat(textMask: string) → string, number` | 1068 |  |
| `Utils.getClosestMatchingString(str: string, listOfStrings: array, maxDistance: integer?, caseSensitive: boolean?) → string?, integer` | 1113 |  |
| `Utils.getNumOfWords(str: string) → integer` | 1141 |  |
| `Utils.getVersionParts(versionStr: string) → array` | 1151 |  |
| `Utils.compareVersions(version1: array, version2: array) → integer` | 1170 |  |
| `Utils.compareVersionStrings(version1: string, version2: string) → integer` | 1196 |  |
| `Utils.naturalSort(tbl: table, keyFn: function) → table` | 1212 |  |
