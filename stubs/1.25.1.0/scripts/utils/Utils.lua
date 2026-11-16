---@meta
-- FS25 1.25.1.0 : utils/Utils.lua (generated stub, FS25 Lua Atlas)

--- Global `Utils` helper table: general-purpose helpers for defaults, value stepping, file paths, settings index conversion, function hooking (append/prepend/overwrite), bit masks, version strings and text. In the SDK dump almost all bodies are stripped, so only getUniqueId has a visible implementation; the others are described from names and parameters and are UNVERIFIED.
---@class Utils
Utils = {}

--- Signature only (no body in the SDK dump): returns the second argument when the first is nil, otherwise the first. UNVERIFIED.
---@param value any
---@param setTo any
---@return any
function Utils.getNoNil(value, setTo) end

--- Signature only (no body in the SDK dump): converts a value given in degrees to radians, or returns the default (already in radians) when the value is nil. UNVERIFIED.
---@param valueDeg number
---@param defaultRad any
---@return number
function Utils.getNoNilRad(valueDeg, defaultRad) end

--- Signature only (no body in the SDK dump): shortens text so it fits a screen-space width at a given text size, optionally trimming the front and using a replacement marker; also returns first and last kept character indices. UNVERIFIED.
---@param text string
---@param textSize number
---@param width number
---@param trimFront boolean?
---@param trimReplaceText string
---@return string
---@return integer
---@return integer
function Utils.limitTextToWidth(text, textSize, width, trimFront, trimReplaceText) end

--- Signature only (no body in the SDK dump): moves a value toward a maximum or minimum at a given speed scaled by dt, with an inverted option, and returns the new value. UNVERIFIED.
---@param curVal number
---@param maxVal number
---@param minVal number
---@param speed number
---@param dt number
---@param inverted boolean
---@return number
function Utils.getMovedLimitedValue(curVal, maxVal, minVal, speed, dt, inverted) end

--- Signature only (no body in the SDK dump): array version of getMovedLimitedValue: computes new values for several entries and returns them as a new array. UNVERIFIED.
---@param currentValues number
---@param maxValues number
---@param minValues number
---@param numValues number
---@param speed number
---@param dt number
---@param inverted boolean
---@return array
function Utils.getMovedLimitedValues(currentValues, maxValues, minValues, numValues, speed, dt, inverted) end

--- Signature only (no body in the SDK dump): in-place variant of getMovedLimitedValues: updates the given values and returns a boolean telling whether anything changed. UNVERIFIED.
---@param values number
---@param maxValues number
---@param minValues number
---@param numValues number
---@param speed number
---@param dt number
---@param inverted boolean
---@return boolean
function Utils.setMovedLimitedValues(values, maxValues, minValues, numValues, speed, dt, inverted) end

--- builds an id from an MD5 hash of the value, the current time and a counter, with an optional prefix and truncated hash length (1 to 31, otherwise full 32). Loops until the id is absent from the optional mapping table; calling twice with the same value gives different ids.
---@param value any
---@param mappingTable table?
---@param prefix string?
---@param md5Length integer?
---@return string
function Utils.getUniqueId(value, mappingTable, prefix, md5Length) end

--- Signature only (no body in the SDK dump): extracts the mod name and its base directory from a filename path. UNVERIFIED.
---@param filename string
---@return string
---@return string
function Utils.getModNameAndBaseDirectory(filename) end

--- Signature only (no body in the SDK dump): computes a steering angle (radians) for a node from a reference node, a world position, dt and the current, minimum and maximum angles. UNVERIFIED.
---@param repr integer
---@param componentNode integer
---@param dt number
---@param posX number
---@param posY number
---@param posZ number
---@param currentAngle number
---@param minAngle number
---@param maxAngle number
---@return number
function Utils.getVersatileRotation(repr, componentNode, dt, posX, posY, posZ, currentAngle, minAngle, maxAngle) end

--- Signature only (no body in the SDK dump): returns the Y rotation between two nodes, with an offset per node in radians and an option to wrap the rotation. UNVERIFIED.
---@param node1 integer
---@param node2 integer
---@param offset1 number
---@param offset2 number
---@param wrapRotation boolean
---@return number
function Utils.getYRotationBetweenNodes(node1, node2, offset1, offset2, wrapRotation) end

--- Signature only (no body in the SDK dump): maps a performance profile class name to its GS_PROFILE_* index. UNVERIFIED.
---@param profileClass string
---@return integer
function Utils.getPerformanceClassIndex(profileClass) end

--- Signature only (no body in the SDK dump): maps a profile index back to its class name such as "Very High". UNVERIFIED.
---@param profileClassIndex integer
---@return string
function Utils.getPerformanceClassFromIndex(profileClassIndex) end

--- Signature only (no body in the SDK dump): returns the index of the current performance profile. UNVERIFIED.
---@return integer
function Utils.getPerformanceClassId() end

--- Signature only (no body in the SDK dump): finds the state index matching a value in a list of values with a given step count. UNVERIFIED.
---@param values array
---@param steps number
---@param value number
---@return integer
function Utils.getStateFromValues(values, steps, value) end

--- Signature only (no body in the SDK dump): returns the index of a target value in a table of values. UNVERIFIED.
---@param targetValue number
---@param values table
---@return integer
function Utils.getValueIndex(targetValue, values) end

--- Signature only (no body in the SDK dump): returns the number of available time scale settings. UNVERIFIED.
---@return integer
function Utils.getNumTimeScales() end

--- Signature only (no body in the SDK dump): returns the formatted display string of the time scale at the given index. UNVERIFIED.
---@param timeScaleIndex integer
---@return string
function Utils.getTimeScaleString(timeScaleIndex) end

--- Signature only (no body in the SDK dump): returns the setting index corresponding to a time scale value. UNVERIFIED.
---@param timeScale number
---@return integer
function Utils.getTimeScaleIndex(timeScale) end

--- Signature only (no body in the SDK dump): returns the time scale value for a setting index. UNVERIFIED.
---@param timeScaleIndex integer
---@return number
function Utils.getTimeScaleFromIndex(timeScaleIndex) end

--- Signature only (no body in the SDK dump): returns the setting index for a master volume value. UNVERIFIED.
---@param masterVolume number
---@return integer
function Utils.getMasterVolumeIndex(masterVolume) end

--- Signature only (no body in the SDK dump): returns the master volume value for a setting index. UNVERIFIED.
---@param masterVolumeIndex integer
---@return number
function Utils.getMasterVolumeFromIndex(masterVolumeIndex) end

--- Signature only (no body in the SDK dump): returns the setting index for a UI scale value. UNVERIFIED.
---@param uiScale number
---@return integer
function Utils.getUIScaleIndex(uiScale) end

--- Signature only (no body in the SDK dump): returns the UI scale value for a setting index. UNVERIFIED.
---@param uiScaleIndex integer
---@return number
function Utils.getUIScaleFromIndex(uiScaleIndex) end

--- Signature only (no body in the SDK dump): returns the setting index for a voice recording volume. UNVERIFIED.
---@param volume number
---@return integer
function Utils.getRecordingVolumeIndex(volume) end

--- Signature only (no body in the SDK dump): returns the recording volume for a setting index. UNVERIFIED.
---@param index integer
---@return number
function Utils.getRecordingVolumeFromIndex(index) end

--- Signature only (no body in the SDK dump): resolves an optional filename against an optional base directory and also returns a flag for mod-directory use. UNVERIFIED.
---@param filename string?
---@param baseDir string?
---@return string?
---@return boolean?
function Utils.getFilename(filename, baseDir) end

--- Signature only (no body in the SDK dump): returns the file name part of a path, for example the last element of a slash-separated path. UNVERIFIED.
---@param path string
---@return string
function Utils.getFilenameFromPath(path) end

--- Signature only (no body in the SDK dump): returns the directory part of a file path, or nil. UNVERIFIED.
---@param filePath string
---@return string?
function Utils.getDirectory(filePath) end

--- Signature only (no body in the SDK dump): returns the name of the last directory in a directory path, or nil. UNVERIFIED.
---@param directoryPath string
---@return string?
function Utils.getDirectoryName(directoryPath) end

--- Signature only (no body in the SDK dump): collapses parent-directory segments (../) in a path and returns nil when there are not enough parent elements. UNVERIFIED.
---@param path string
---@return string?
function Utils.resolveRelativePath(path) end

--- Signature only (no body in the SDK dump): checks a path for invalid characters such as backslashes; returns a boolean and a description usable in log output. The boolean's polarity is UNVERIFIED despite its name hasInvalidCharacters.
---@param path string
---@return boolean
---@return string?
function Utils.getPathIsValid(path) end

--- Signature only (no body in the SDK dump): combines two joint force limits into one, with -1 as fallback. UNVERIFIED.
---@param forceLimit1 number
---@param forceLimit2 number
---@return number
function Utils.getMaxJointForceLimit(forceLimit1, forceLimit2) end

--- Signature only (no body in the SDK dump): builds a function that calls the old function and then the new one; used to hook into existing functions. UNVERIFIED.
---@param oldFunc function
---@param newFunc function
---@return function
function Utils.appendedFunction(oldFunc, newFunc) end

--- Signature only (no body in the SDK dump): builds a function that calls the new function first and then the old one. UNVERIFIED.
---@param oldFunc function
---@param newFunc function
---@return function
function Utils.prependedFunction(oldFunc, newFunc) end

--- Signature only (no body in the SDK dump): builds a replacement function around the old one, typically passing the old function to the new one. UNVERIFIED.
---@param oldFunc function
---@param newFunc function
---@return function
function Utils.overwrittenFunction(oldFunc, newFunc) end

--- Signature only (no body in the SDK dump): shuffles a list in place. UNVERIFIED.
---@param t table
function Utils.shuffle(t) end

--- Signature only (no body in the SDK dump): splits a filename into a clean name and its extension, with an option to drop the path. UNVERIFIED.
---@param filename string
---@param excludePath boolean?
---@return string
---@return string?
function Utils.getFilenameInfo(filename, excludePath) end

--- Signature only (no body in the SDK dump): returns true only when the string is "true" in any letter case, false for nil or anything else. UNVERIFIED.
---@param booleanString string?
---@return boolean
function Utils.stringToBoolean(booleanString) end

--- Signature only (no body in the SDK dump): turns the string "nil" or a nil value into nil and returns other strings unchanged; used for console command arguments. UNVERIFIED.
---@param str string
---@return string?
function Utils.parseConsoleParameter(str) end

--- Signature only (no body in the SDK dump): parses an hh:mm string into minutes since midnight; nil if the format or range is invalid. UNVERIFIED.
---@param value string
---@return number?
function Utils.getMinuteOfDayFromTime(value) end

--- Signature only (no body in the SDK dump): formats minutes since midnight as an hh:mm string. UNVERIFIED.
---@param timeInMinutes number
---@return string
function Utils.formatTime(timeInMinutes) end

--- Signature only (no body in the SDK dump): draws several texts side by side at a screen position (0 to 1) with a horizontal spacing and optional per-column alignment; a debug-style drawing helper to call each frame. UNVERIFIED.
---@param x number
---@param y number
---@param textSize number
---@param texts table
---@param spacingX number
---@param aligns table?
function Utils.renderMultiColumnText(x, y, textSize, texts, spacingX, aligns) end

--- Signature only (no body in the SDK dump): returns a random boolean, a fair coin flip. UNVERIFIED.
---@return boolean
function Utils.getCoinToss() end

--- Signature only (no body in the SDK dump): returns two normally distributed random numbers for a given mean and variance (parameter named sigmaSq). UNVERIFIED.
---@param mean number
---@param sigmaSq number
---@return number
---@return number
function Utils.getNormallyDistributedRandomVariables(mean, sigmaSq) end

--- Signature only (no body in the SDK dump): estimates where a node moving linearly at a given speed meets the terrain and returns the x, y, z of that point. UNVERIFIED.
---@param node integer
---@param speed number
---@return number
---@return number
---@return number
function Utils.getIntersectionOfLinearMovementAndTerrain(node, speed) end

--- Signature only (no body in the SDK dump): returns the 32-bit mask with the bit at the given index (0 to 31) cleared. UNVERIFIED.
---@param bitMask integer
---@param bit integer
---@return integer
function Utils.clearBit(bitMask, bit) end

--- Signature only (no body in the SDK dump): returns the 32-bit mask with the bit at the given index (0 to 31) set. UNVERIFIED.
---@param bitMask integer
---@param bit integer
---@return integer
function Utils.setBit(bitMask, bit) end

--- Signature only (no body in the SDK dump): tells whether the bit at the given index (0 to 31) is set in the mask. UNVERIFIED.
---@param bitMask integer
---@param bit integer
---@return boolean
function Utils.isBitSet(bitMask, bit) end

--- Signature only (no body in the SDK dump): removes all the listed flag values (not bit indices) from a bitmask and returns the result. UNVERIFIED.
---@param bitMask integer
---@return integer
function Utils.clearFlags(bitMask, ...) end

--- Signature only (no body in the SDK dump): draws text at a world position with optional size, offset and RGBA colour; a debug rendering helper called each frame. UNVERIFIED.
---@param x number
---@param y number
---@param z number
---@param text string
---@param textSize number?
---@param textOffset number?
---@param r number?
---@param g number?
---@param b number?
---@param a number?
function Utils.renderTextAtWorldPosition(x, y, z, text, textSize, textOffset, r, g, b, a) end

--- Signature only (no body in the SDK dump): returns r, g, b, a for a green-to-red gradient where factor 0 is green and 1 is red. UNVERIFIED beyond the parameter naming.
---@param factor number
---@return number
---@return number
---@return number
---@return number
function Utils.getGreenRedBlendedColor(factor) end

--- Signature only (no body in the SDK dump): converts a text mask into a format string and a numeric precision. UNVERIFIED.
---@param textMask string
---@return string
---@return number
function Utils.maskToFormat(textMask) end

--- Signature only (no body in the SDK dump): finds the list entry with the smallest Levenshtein distance to a string (case-insensitive by default, optional max distance); returns the match and its distance. UNVERIFIED.
---@param str string
---@param listOfStrings array
---@param maxDistance integer?
---@param caseSensitive boolean?
---@return string?
---@return integer
function Utils.getClosestMatchingString(str, listOfStrings, maxDistance, caseSensitive) end

--- Signature only (no body in the SDK dump): counts the words in a string. UNVERIFIED.
---@param str string
---@return integer
function Utils.getNumOfWords(str) end

--- Signature only (no body in the SDK dump): splits a version string such as a.b.c.d into an array of numbers, ignoring non-numeric characters. UNVERIFIED.
---@param versionStr string
---@return array
function Utils.getVersionParts(versionStr) end

--- Signature only (no body in the SDK dump): compares two version arrays and returns 1, -1 or 0 for greater, lower or equal. UNVERIFIED.
---@param version1 array
---@param version2 array
---@return integer
function Utils.compareVersions(version1, version2) end

--- Signature only (no body in the SDK dump): compares two version strings a.b.c.d and returns 1, -1 or 0 for greater, lower or equal. UNVERIFIED.
---@param version1 string
---@param version2 string
---@return integer
function Utils.compareVersionStrings(version1, version2) end

--- Signature only (no body in the SDK dump): sorts a table in place with natural ordering (item2 before item10) using a key function, stable for equal keys, and returns it. UNVERIFIED.
---@param tbl table
---@param keyFn function
---@return table
function Utils.naturalSort(tbl, keyFn) end
