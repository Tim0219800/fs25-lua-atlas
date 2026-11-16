# utils/Utils.lua

*[Version française](../../fr/scripts/utils/Utils.md)*

Source: `dataS/scripts/utils/Utils.lua` — FS25 1.25.1.0

✍ Global `Utils` helper table: general-purpose helpers for defaults, value stepping, file paths, settings index conversion, function hooking (append/prepend/overwrite), bit masks, version strings and text. In the SDK dump almost all bodies are stripped, so only getUniqueId has a visible implementation; the others are described from names and parameters and are UNVERIFIED.

- **Utils** (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `Utils.getNoNil(value: any, setTo: any) → any` | 13 | ✍ Signature only (no body in the SDK dump): returns the second argument when the first is nil, otherwise the first. UNVERIFIED. |
| `Utils.getNoNilRad(valueDeg: number, defaultRad: any) → number` | 25 | ✍ Signature only (no body in the SDK dump): converts a value given in degrees to radians, or returns the default (already in radians) when the value is nil. UNVERIFIED. |
| `Utils.limitTextToWidth(text: string, textSize: number, width: number, trimFront: boolean?, trimReplaceText: string) → string, integer, integer` | 42 | ✍ Signature only (no body in the SDK dump): shortens text so it fits a screen-space width at a given text size, optionally trimming the front and using a replacement marker; also returns first and last kept character indices. UNVERIFIED. |
| `Utils.getMovedLimitedValue(curVal: number, maxVal: number, minVal: number, speed: number, dt: number, inverted: boolean) → number` | 70 | ✍ Signature only (no body in the SDK dump): moves a value toward a maximum or minimum at a given speed scaled by dt, with an inverted option, and returns the new value. UNVERIFIED. |
| `Utils.getMovedLimitedValues(currentValues: number, maxValues: number, minValues: number, numValues: number, speed: number, dt: number, inverted: boolean) → array` | 97 | ✍ Signature only (no body in the SDK dump): array version of getMovedLimitedValue: computes new values for several entries and returns them as a new array. UNVERIFIED. |
| `Utils.setMovedLimitedValues(values: number, maxValues: number, minValues: number, numValues: number, speed: number, dt: number, inverted: boolean) → boolean` | 115 | ✍ Signature only (no body in the SDK dump): in-place variant of getMovedLimitedValues: updates the given values and returns a boolean telling whether anything changed. UNVERIFIED. |
| `Utils.getUniqueId(value: any, mappingTable: table?, prefix: string?, md5Length: integer?) → string` | 179 | ✍ builds an id from an MD5 hash of the value, the current time and a counter, with an optional prefix and truncated hash length (1 to 31, otherwise full 32). Loops until the id is absent from the optional mapping table; calling twice with the same value gives different ids. |
| `Utils.getModNameAndBaseDirectory(filename: string) → string, string` | 214 | ✍ Signature only (no body in the SDK dump): extracts the mod name and its base directory from a filename path. UNVERIFIED. |
| `Utils.getVersatileRotation(repr: integer, componentNode: integer, dt: number, posX: number, posY: number, posZ: number, currentAngle: number, minAngle: number, maxAngle: number) → number` | 247 | ✍ Signature only (no body in the SDK dump): computes a steering angle (radians) for a node from a reference node, a world position, dt and the current, minimum and maximum angles. UNVERIFIED. |
| `Utils.getYRotationBetweenNodes(node1: integer, node2: integer, offset1: number, offset2: number, wrapRotation: boolean) → number` | 286 | ✍ Signature only (no body in the SDK dump): returns the Y rotation between two nodes, with an offset per node in radians and an option to wrap the rotation. UNVERIFIED. |
| `Utils.getPerformanceClassIndex(profileClass: string) → integer` | 320 | ✍ Signature only (no body in the SDK dump): maps a performance profile class name to its GS_PROFILE_* index. UNVERIFIED. |
| `Utils.getPerformanceClassFromIndex(profileClassIndex: integer) → string` | 348 | ✍ Signature only (no body in the SDK dump): maps a profile index back to its class name such as "Very High". UNVERIFIED. |
| `Utils.getPerformanceClassId() → integer` | 367 | ✍ Signature only (no body in the SDK dump): returns the index of the current performance profile. UNVERIFIED. |
| `Utils.getStateFromValues(values: array, steps: number, value: number) → integer` | 377 | ✍ Signature only (no body in the SDK dump): finds the state index matching a value in a list of values with a given step count. UNVERIFIED. |
| `Utils.getValueIndex(targetValue: number, values: table) → integer` | 393 | ✍ Signature only (no body in the SDK dump): returns the index of a target value in a table of values. UNVERIFIED. |
| `Utils.getNumTimeScales() → integer` | 410 | ✍ Signature only (no body in the SDK dump): returns the number of available time scale settings. UNVERIFIED. |
| `Utils.getTimeScaleString(timeScaleIndex: integer) → string` | 427 | ✍ Signature only (no body in the SDK dump): returns the formatted display string of the time scale at the given index. UNVERIFIED. |
| `Utils.getTimeScaleIndex(timeScale: number) → integer` | 450 | ✍ Signature only (no body in the SDK dump): returns the setting index corresponding to a time scale value. UNVERIFIED. |
| `Utils.getTimeScaleFromIndex(timeScaleIndex: integer) → number` | 475 | ✍ Signature only (no body in the SDK dump): returns the time scale value for a setting index. UNVERIFIED. |
| `Utils.getMasterVolumeIndex(masterVolume: number) → integer` | 494 | ✍ Signature only (no body in the SDK dump): returns the setting index for a master volume value. UNVERIFIED. |
| `Utils.getMasterVolumeFromIndex(masterVolumeIndex: integer) → number` | 517 | ✍ Signature only (no body in the SDK dump): returns the master volume value for a setting index. UNVERIFIED. |
| `Utils.getUIScaleIndex(uiScale: number) → integer` | 529 | ✍ Signature only (no body in the SDK dump): returns the setting index for a UI scale value. UNVERIFIED. |
| `Utils.getUIScaleFromIndex(uiScaleIndex: integer) → number` | 546 | ✍ Signature only (no body in the SDK dump): returns the UI scale value for a setting index. UNVERIFIED. |
| `Utils.getRecordingVolumeIndex(volume: number) → integer` | 558 | ✍ Signature only (no body in the SDK dump): returns the setting index for a voice recording volume. UNVERIFIED. |
| `Utils.getRecordingVolumeFromIndex(index: integer) → number` | 579 | ✍ Signature only (no body in the SDK dump): returns the recording volume for a setting index. UNVERIFIED. |
| `Utils.getFilename(filename: string?, baseDir: string?) → string?, boolean?` | 593 | ✍ Signature only (no body in the SDK dump): resolves an optional filename against an optional base directory and also returns a flag for mod-directory use. UNVERIFIED. |
| `Utils.getFilenameFromPath(path: string) → string` | 626 | ✍ Signature only (no body in the SDK dump): returns the file name part of a path, for example the last element of a slash-separated path. UNVERIFIED. |
| `Utils.getDirectory(filePath: string) → string?` | 637 | ✍ Signature only (no body in the SDK dump): returns the directory part of a file path, or nil. UNVERIFIED. |
| `Utils.getDirectoryName(directoryPath: string) → string?` | 652 | ✍ Signature only (no body in the SDK dump): returns the name of the last directory in a directory path, or nil. UNVERIFIED. |
| `Utils.resolveRelativePath(path: string) → string?` | 669 | ✍ Signature only (no body in the SDK dump): collapses parent-directory segments (../) in a path and returns nil when there are not enough parent elements. UNVERIFIED. |
| `Utils.getPathIsValid(path: string) → boolean, string?` | 692 | ✍ Signature only (no body in the SDK dump): checks a path for invalid characters such as backslashes; returns a boolean and a description usable in log output. The boolean's polarity is UNVERIFIED despite its name hasInvalidCharacters. |
| `Utils.getMaxJointForceLimit(forceLimit1: number, forceLimit2: number) → number` | 706 | ✍ Signature only (no body in the SDK dump): combines two joint force limits into one, with -1 as fallback. UNVERIFIED. |
| `Utils.appendedFunction(oldFunc: function, newFunc: function) → function` | 718 | ✍ Signature only (no body in the SDK dump): builds a function that calls the old function and then the new one; used to hook into existing functions. UNVERIFIED. |
| `Utils.prependedFunction(oldFunc: function, newFunc: function) → function` | 734 | ✍ Signature only (no body in the SDK dump): builds a function that calls the new function first and then the old one. UNVERIFIED. |
| `Utils.overwrittenFunction(oldFunc: function, newFunc: function) → function` | 750 | ✍ Signature only (no body in the SDK dump): builds a replacement function around the old one, typically passing the old function to the new one. UNVERIFIED. |
| `Utils.shuffle(t: table)` | 766 | ✍ Signature only (no body in the SDK dump): shuffles a list in place. UNVERIFIED. |
| `Utils.getFilenameInfo(filename: string, excludePath: boolean?) → string, string?` | 784 | ✍ Signature only (no body in the SDK dump): splits a filename into a clean name and its extension, with an option to drop the path. UNVERIFIED. |
| `Utils.stringToBoolean(booleanString: string?) → boolean` | 807 | ✍ Signature only (no body in the SDK dump): returns true only when the string is "true" in any letter case, false for nil or anything else. UNVERIFIED. |
| `Utils.parseConsoleParameter(str: string) → string?` | 819 | ✍ Signature only (no body in the SDK dump): turns the string "nil" or a nil value into nil and returns other strings unchanged; used for console command arguments. UNVERIFIED. |
| `Utils.getMinuteOfDayFromTime(value: string) → number?` | 835 | ✍ Signature only (no body in the SDK dump): parses an hh:mm string into minutes since midnight; nil if the format or range is invalid. UNVERIFIED. |
| `Utils.formatTime(timeInMinutes: number) → string` | 856 | ✍ Signature only (no body in the SDK dump): formats minutes since midnight as an hh:mm string. UNVERIFIED. |
| `Utils.renderMultiColumnText(x: number, y: number, textSize: number, texts: table, spacingX: number, aligns: table?)` | 872 | ✍ Signature only (no body in the SDK dump): draws several texts side by side at a screen position (0 to 1) with a horizontal spacing and optional per-column alignment; a debug-style drawing helper to call each frame. UNVERIFIED. |
| `Utils.getCoinToss() → boolean` | 892 | ✍ Signature only (no body in the SDK dump): returns a random boolean, a fair coin flip. UNVERIFIED. |
| `Utils.getNormallyDistributedRandomVariables(mean: number, sigmaSq: number) → number, number` | 902 | ✍ Signature only (no body in the SDK dump): returns two normally distributed random numbers for a given mean and variance (parameter named sigmaSq). UNVERIFIED. |
| `Utils.getIntersectionOfLinearMovementAndTerrain(node: integer, speed: number) → number, number, number` | 927 | ✍ Signature only (no body in the SDK dump): estimates where a node moving linearly at a given speed meets the terrain and returns the x, y, z of that point. UNVERIFIED. |
| `Utils.clearBit(bitMask: integer, bit: integer) → integer` | 963 | ✍ Signature only (no body in the SDK dump): returns the 32-bit mask with the bit at the given index (0 to 31) cleared. UNVERIFIED. |
| `Utils.setBit(bitMask: integer, bit: integer) → integer` | 973 | ✍ Signature only (no body in the SDK dump): returns the 32-bit mask with the bit at the given index (0 to 31) set. UNVERIFIED. |
| `Utils.isBitSet(bitMask: integer, bit: integer) → boolean` | 983 | ✍ Signature only (no body in the SDK dump): tells whether the bit at the given index (0 to 31) is set in the mask. UNVERIFIED. |
| `Utils.clearFlags(bitMask: integer, ...: integer) → integer` | 994 | ✍ Signature only (no body in the SDK dump): removes all the listed flag values (not bit indices) from a bitmask and returns the result. UNVERIFIED. |
| `Utils.renderTextAtWorldPosition(x: number, y: number, z: number, text: string, textSize: number?, textOffset: number?, r: number?, g: number?, b: number?, a: number?)` | 1012 | ✍ Signature only (no body in the SDK dump): draws text at a world position with optional size, offset and RGBA colour; a debug rendering helper called each frame. UNVERIFIED. |
| `Utils.getGreenRedBlendedColor(factor: number) → number, number, number, number` | 1056 | ✍ Signature only (no body in the SDK dump): returns r, g, b, a for a green-to-red gradient where factor 0 is green and 1 is red. UNVERIFIED beyond the parameter naming. |
| `Utils.maskToFormat(textMask: string) → string, number` | 1068 | ✍ Signature only (no body in the SDK dump): converts a text mask into a format string and a numeric precision. UNVERIFIED. |
| `Utils.getClosestMatchingString(str: string, listOfStrings: array, maxDistance: integer?, caseSensitive: boolean?) → string?, integer` | 1113 | ✍ Signature only (no body in the SDK dump): finds the list entry with the smallest Levenshtein distance to a string (case-insensitive by default, optional max distance); returns the match and its distance. UNVERIFIED. |
| `Utils.getNumOfWords(str: string) → integer` | 1141 | ✍ Signature only (no body in the SDK dump): counts the words in a string. UNVERIFIED. |
| `Utils.getVersionParts(versionStr: string) → array` | 1151 | ✍ Signature only (no body in the SDK dump): splits a version string such as a.b.c.d into an array of numbers, ignoring non-numeric characters. UNVERIFIED. |
| `Utils.compareVersions(version1: array, version2: array) → integer` | 1170 | ✍ Signature only (no body in the SDK dump): compares two version arrays and returns 1, -1 or 0 for greater, lower or equal. UNVERIFIED. |
| `Utils.compareVersionStrings(version1: string, version2: string) → integer` | 1196 | ✍ Signature only (no body in the SDK dump): compares two version strings a.b.c.d and returns 1, -1 or 0 for greater, lower or equal. UNVERIFIED. |
| `Utils.naturalSort(tbl: table, keyFn: function) → table` | 1212 | ✍ Signature only (no body in the SDK dump): sorts a table in place with natural ordering (item2 before item10) using a key function, stable for equal keys, and returns it. UNVERIFIED. |
