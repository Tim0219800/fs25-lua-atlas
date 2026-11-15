---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AnimatedVehicle.lua (stub généré, atlas Lua FS25)

---@class AnimatedVehicle
AnimatedVehicle = {}

---@param specializations table
---@return boolean
function AnimatedVehicle.prerequisitesPresent(specializations) end

function AnimatedVehicle.initSpecialization() end

---@param schema any
---@param basePath any
function AnimatedVehicle.registerAnimationXMLPaths(schema, basePath) end

---@param vehicleType any
function AnimatedVehicle.registerEvents(vehicleType) end

---@param vehicleType any
function AnimatedVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function AnimatedVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AnimatedVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function AnimatedVehicle:onPreLoad(savegame) end

---@param savegame table
function AnimatedVehicle:onLoad(savegame) end

---@param savegame table
function AnimatedVehicle:onPostLoad(savegame) end

function AnimatedVehicle:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AnimatedVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param name any
---@param startName any
---@param endName any
---@param initialUpdate any
---@param classObject any
---@param load any
---@param get any
---@param set any
function AnimatedVehicle:registerAnimationValueType(name, startName, endName, initialUpdate, classObject, load, get, set) end

---@param xmlFile any
---@param key any
---@param animation any
---@param components any
function AnimatedVehicle:loadAnimation(xmlFile, key, animation, components) end

---@param xmlFile any
---@param partKey any
---@param part any
---@param animation any
---@param components any
function AnimatedVehicle:loadAnimationPart(xmlFile, partKey, part, animation, components) end

---@param xmlFile any
---@param partKey any
---@param part any
---@param animation any
---@param components any
function AnimatedVehicle:loadStaticAnimationPart(xmlFile, partKey, part, animation, components) end

---@param xmlFile any
---@param partKey any
---@param curve any
---@param node any
---@param transName any
---@param rotName any
---@param scaleName any
---@param time any
---@param animation any
function AnimatedVehicle:loadStaticAnimationPartValues(xmlFile, partKey, curve, node, transName, rotName, scaleName, time, animation) end

---@param animation table
function AnimatedVehicle:initializeAnimationParts(animation) end

---@param animation table
---@param part table
---@param i any
---@param numParts any
function AnimatedVehicle:initializeAnimationPart(animation, part, i, numParts) end

---@param animation table
---@param part table
---@param i any
---@param numParts any
function AnimatedVehicle:postInitializeAnimationPart(animation, part, i, numParts) end

---@param name string
---@param speed number
---@param animTime number
---@param noEventSend boolean
---@param allowSounds any
function AnimatedVehicle:playAnimation(name, speed, animTime, noEventSend, allowSounds) end

---@param name string
---@param noEventSend boolean
function AnimatedVehicle:stopAnimation(name, noEventSend) end

---@param name string
---@return boolean
function AnimatedVehicle:getAnimationExists(name) end

---@param name string
---@return table
function AnimatedVehicle:getAnimationByName(name) end

---@param name string
---@return boolean
function AnimatedVehicle:getIsAnimationPlaying(name) end

---@param name string
---@return number
function AnimatedVehicle:getRealAnimationTime(name) end

---@param name string
---@param animTime number
---@param update boolean
---@param playSounds any
function AnimatedVehicle:setRealAnimationTime(name, animTime, update, playSounds) end

---@param name string
---@return number
function AnimatedVehicle:getAnimationTime(name) end

---@param name string
---@param animTime number
---@param update boolean
---@param playSounds any
function AnimatedVehicle:setAnimationTime(name, animTime, update, playSounds) end

---@param name string
---@return number
function AnimatedVehicle:getAnimationDuration(name) end

---@param name string
---@param speed number
function AnimatedVehicle:setAnimationSpeed(name, speed) end

---@param name string
---@return number
function AnimatedVehicle:getAnimationSpeed(name) end

---@param name string
---@param stopTime number
function AnimatedVehicle:setAnimationStopTime(name, stopTime) end

---@param animation table
function AnimatedVehicle:resetAnimationValues(animation) end

---@param part table
function AnimatedVehicle:resetAnimationPartValues(part) end

---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function AnimatedVehicle:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

---@param superFunc any
---@param speedRotatingPart any
function AnimatedVehicle:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function AnimatedVehicle:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc any
---@param workArea any
function AnimatedVehicle:getIsWorkAreaActive(superFunc, workArea) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AnimatedVehicle:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingTool any
function AnimatedVehicle:getIsMovingToolActive(superFunc, movingTool) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AnimatedVehicle:loadMovingPartFromXML(superFunc, xmlFile, key, entry) end

---@param superFunc any
---@param movingPart any
function AnimatedVehicle:getIsMovingPartActive(superFunc, movingPart) end

---@param self any
---@param animation any
---@param part any
---@param i any
---@param numParts any
---@param nextName any
---@param prevName any
---@param startName any
---@param endName any
---@param warningName any
---@param startName2 any
---@param endName2 any
---@param additionalCompareParam any
function AnimatedVehicle.initializeAnimationPartAttribute(self, animation, part, i, numParts, nextName, prevName, startName, endName, warningName, startName2, endName2, additionalCompareParam) end

---@param a table
---@param b table
---@return boolean
function AnimatedVehicle.animPartSorter(a, b) end

---@param a table
---@param b table
---@return boolean
function AnimatedVehicle.animPartSorterReverse(a, b) end

---@param currentValue number
---@param destValue number
---@param speed number
---@param dt number
---@return number
function AnimatedVehicle.getMovedLimitedValue(currentValue, destValue, speed, dt) end

---@param n integer
---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValuesN(n, currentValues, destValues, speeds, dt) end

---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValues3(currentValues, destValues, speeds, dt) end

---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValues4(currentValues, destValues, speeds, dt) end

---@param animation table
---@return integer
function AnimatedVehicle.findCurrentPartIndex(animation) end

---@param part table
---@param anim table
---@return number
function AnimatedVehicle.getDurationToEndOfPart(part, anim) end

---@param nextPart table
---@param prevPart table
---@param anim table
---@param default boolean
---@return boolean
function AnimatedVehicle.getNextPartIsPlaying(nextPart, prevPart, anim, default) end

---@param self number
---@param dt number
---@param fixedTimeUpdate any
function AnimatedVehicle.updateAnimations(self, dt, fixedTimeUpdate) end

---@param self string
---@param animName string
---@param dt number
---@param fixedTimeUpdate any
function AnimatedVehicle.updateAnimationByName(self, animName, dt, fixedTimeUpdate) end

---@param self table
---@param anim table
---@param dt number
---@param stopTime number
---@return number
---@return boolean
function AnimatedVehicle.updateAnimationCurrentTime(self, anim, dt, stopTime) end

---@param self table
---@param anim table
---@param dtToUse number
---@param stopAnim boolean
---@param fixedTimeUpdate boolean
---@param playSounds playSounds
function AnimatedVehicle.updateAnimation(self, anim, dtToUse, stopAnim, fixedTimeUpdate, playSounds) end

---@param animation table
---@param part table
---@param durationToEnd number
---@param dtToUse number
---@param realDt number
---@param fixedTimeUpdate any
function AnimatedVehicle:updateAnimationPart(animation, part, durationToEnd, dtToUse, realDt, fixedTimeUpdate) end

function AnimatedVehicle:getNumOfActiveAnimations() end

function AnimatedVehicle:onRegisterAnimationValueTypes() end
