---@meta
-- FS25 1.25.1.0 : utils/Utils.lua (generated stub, FS25 Lua Atlas)

---@class Utils
Utils = {}

---@param value any
---@param setTo any
---@return any
function Utils.getNoNil(value, setTo) end

---@param valueDeg number
---@param defaultRad any
---@return number
function Utils.getNoNilRad(valueDeg, defaultRad) end

---@param text string
---@param textSize number
---@param width number
---@param trimFront boolean?
---@param trimReplaceText string
---@return string
---@return integer
---@return integer
function Utils.limitTextToWidth(text, textSize, width, trimFront, trimReplaceText) end

---@param curVal number
---@param maxVal number
---@param minVal number
---@param speed number
---@param dt number
---@param inverted boolean
---@return number
function Utils.getMovedLimitedValue(curVal, maxVal, minVal, speed, dt, inverted) end

---@param currentValues number
---@param maxValues number
---@param minValues number
---@param numValues number
---@param speed number
---@param dt number
---@param inverted boolean
---@return array
function Utils.getMovedLimitedValues(currentValues, maxValues, minValues, numValues, speed, dt, inverted) end

---@param values number
---@param maxValues number
---@param minValues number
---@param numValues number
---@param speed number
---@param dt number
---@param inverted boolean
---@return boolean
function Utils.setMovedLimitedValues(values, maxValues, minValues, numValues, speed, dt, inverted) end

---@param value any
---@param mappingTable table?
---@param prefix string?
---@param md5Length integer?
---@return string
function Utils.getUniqueId(value, mappingTable, prefix, md5Length) end

---@param filename string
---@return string
---@return string
function Utils.getModNameAndBaseDirectory(filename) end

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

---@param node1 integer
---@param node2 integer
---@param offset1 number
---@param offset2 number
---@param wrapRotation boolean
---@return number
function Utils.getYRotationBetweenNodes(node1, node2, offset1, offset2, wrapRotation) end

---@param profileClass string
---@return integer
function Utils.getPerformanceClassIndex(profileClass) end

---@param profileClassIndex integer
---@return string
function Utils.getPerformanceClassFromIndex(profileClassIndex) end

---@return integer
function Utils.getPerformanceClassId() end

---@param values array
---@param steps number
---@param value number
---@return integer
function Utils.getStateFromValues(values, steps, value) end

---@param targetValue number
---@param values table
---@return integer
function Utils.getValueIndex(targetValue, values) end

---@return integer
function Utils.getNumTimeScales() end

---@param timeScaleIndex integer
---@return string
function Utils.getTimeScaleString(timeScaleIndex) end

---@param timeScale number
---@return integer
function Utils.getTimeScaleIndex(timeScale) end

---@param timeScaleIndex integer
---@return number
function Utils.getTimeScaleFromIndex(timeScaleIndex) end

---@param masterVolume number
---@return integer
function Utils.getMasterVolumeIndex(masterVolume) end

---@param masterVolumeIndex integer
---@return number
function Utils.getMasterVolumeFromIndex(masterVolumeIndex) end

---@param uiScale number
---@return integer
function Utils.getUIScaleIndex(uiScale) end

---@param uiScaleIndex integer
---@return number
function Utils.getUIScaleFromIndex(uiScaleIndex) end

---@param volume number
---@return integer
function Utils.getRecordingVolumeIndex(volume) end

---@param index integer
---@return number
function Utils.getRecordingVolumeFromIndex(index) end

---@param filename string?
---@param baseDir string?
---@return string?
---@return boolean?
function Utils.getFilename(filename, baseDir) end

---@param path string
---@return string
function Utils.getFilenameFromPath(path) end

---@param filePath string
---@return string?
function Utils.getDirectory(filePath) end

---@param directoryPath string
---@return string?
function Utils.getDirectoryName(directoryPath) end

---@param path string
---@return string?
function Utils.resolveRelativePath(path) end

---@param path string
---@return boolean
---@return string?
function Utils.getPathIsValid(path) end

---@param forceLimit1 number
---@param forceLimit2 number
---@return number
function Utils.getMaxJointForceLimit(forceLimit1, forceLimit2) end

---@param oldFunc function
---@param newFunc function
---@return function
function Utils.appendedFunction(oldFunc, newFunc) end

---@param oldFunc function
---@param newFunc function
---@return function
function Utils.prependedFunction(oldFunc, newFunc) end

---@param oldFunc function
---@param newFunc function
---@return function
function Utils.overwrittenFunction(oldFunc, newFunc) end

---@param t table
function Utils.shuffle(t) end

---@param filename string
---@param excludePath boolean?
---@return string
---@return string?
function Utils.getFilenameInfo(filename, excludePath) end

---@param booleanString string?
---@return boolean
function Utils.stringToBoolean(booleanString) end

---@param str string
---@return string?
function Utils.parseConsoleParameter(str) end

---@param value string
---@return number?
function Utils.getMinuteOfDayFromTime(value) end

---@param timeInMinutes number
---@return string
function Utils.formatTime(timeInMinutes) end

---@param x number
---@param y number
---@param textSize number
---@param texts table
---@param spacingX number
---@param aligns table?
function Utils.renderMultiColumnText(x, y, textSize, texts, spacingX, aligns) end

---@return boolean
function Utils.getCoinToss() end

---@param mean number
---@param sigmaSq number
---@return number
---@return number
function Utils.getNormallyDistributedRandomVariables(mean, sigmaSq) end

---@param node integer
---@param speed number
---@return number
---@return number
---@return number
function Utils.getIntersectionOfLinearMovementAndTerrain(node, speed) end

---@param bitMask integer
---@param bit integer
---@return integer
function Utils.clearBit(bitMask, bit) end

---@param bitMask integer
---@param bit integer
---@return integer
function Utils.setBit(bitMask, bit) end

---@param bitMask integer
---@param bit integer
---@return boolean
function Utils.isBitSet(bitMask, bit) end

---@param bitMask integer
---@return integer
function Utils.clearFlags(bitMask, ...) end

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

---@param factor number
---@return number
---@return number
---@return number
---@return number
function Utils.getGreenRedBlendedColor(factor) end

---@param textMask string
---@return string
---@return number
function Utils.maskToFormat(textMask) end

---@param str string
---@param listOfStrings array
---@param maxDistance integer?
---@param caseSensitive boolean?
---@return string?
---@return integer
function Utils.getClosestMatchingString(str, listOfStrings, maxDistance, caseSensitive) end

---@param str string
---@return integer
function Utils.getNumOfWords(str) end

---@param versionStr string
---@return array
function Utils.getVersionParts(versionStr) end

---@param version1 array
---@param version2 array
---@return integer
function Utils.compareVersions(version1, version2) end

---@param version1 string
---@param version2 string
---@return integer
function Utils.compareVersionStrings(version1, version2) end

---@param tbl table
---@param keyFn function
---@return table
function Utils.naturalSort(tbl, keyFn) end
