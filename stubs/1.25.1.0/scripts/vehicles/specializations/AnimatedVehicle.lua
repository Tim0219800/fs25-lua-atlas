---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AnimatedVehicle.lua (generated stub, FS25 Lua Atlas)

--- Specialization that gives any vehicle named, time-based animations defined in vehicle.animations (and per-configuration animationConfigurations). Each animation is a list of timed parts, or a keyframe set, driving node rotation, translation, scale, visibility, shader parameters, animation clips, splines, rolling gates, other animations, and on the server joint limits, masses, centres of mass and friction. Playing and stopping is synchronised through AnimatedVehicleStartEvent and AnimatedVehicleStopEvent. It also overrides the speed-rotating-part, work-area, moving-tool and moving-part loaders so they can depend on an animation time range. Other specializations register extra value types through the onRegisterAnimationValueTypes event.
---@class AnimatedVehicle
AnimatedVehicle = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function AnimatedVehicle.prerequisitesPresent(specializations) end

--- Adds the shop configuration type 'animation', registers the animation XML paths (plain and per configuration), the animName/limit attributes for speed rotating parts and work areas, and the requiredAnimation attributes for Cylindered moving tools and parts.
function AnimatedVehicle.initSpecialization() end

--- Registers every XML key of one animation: name, looping, resetOnStart, startAnimTime, keyframe flag, all part attributes (rot/trans/scale, limits, spring, mass, shader, clip, spline, rolling gate, requirements) and the sound entries.
---@param schema any
---@param basePath any
function AnimatedVehicle.registerAnimationXMLPaths(schema, basePath) end

--- Registers onRegisterAnimationValueTypes, onPlayAnimation, onStartAnimation, onUpdateAnimation, onFinishAnimation, onStopAnimation and onAnimationPartChanged.
---@param vehicleType any
function AnimatedVehicle.registerEvents(vehicleType) end

--- Registers the public animation API on the vehicle type (load, play, stop, time/speed getters and setters, reset, active count).
---@param vehicleType any
function AnimatedVehicle.registerFunctions(vehicleType) end

--- Overrides the load and is-active functions for speed rotating parts, work areas, moving tools and moving parts so they can be gated by an animation.
---@param vehicleType any
function AnimatedVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onLoad, onPostLoad, onDelete, onUpdate and onRegisterAnimationValueTypes.
---@param vehicleType any
function AnimatedVehicle.registerEventListeners(vehicleType) end

--- Creates the animation value type table and raises onRegisterAnimationValueTypes so every specialization can register its own value types before animations load.
---@param savegame table
function AnimatedVehicle:onPreLoad(savegame) end

--- Loads all vehicle.animations.animation entries, then those of the selected animation configuration, into spec.animations indexed by name. Same name in the configuration replaces the base one.
---@param savegame table
function AnimatedVehicle:onLoad(savegame) end

--- For animations with resetOnStart, snaps them to the configured start time by a forced instant update. Removes the onUpdate listener when the vehicle has no animation.
---@param savegame table
function AnimatedVehicle:onPostLoad(savegame) end

--- On clients, deletes all animation sound samples, including the stop-time event samples.
function AnimatedVehicle:onDelete() end

--- Advances all active animations by dt, handles the short delay used to stop non-looping samples of finished fixed-time updates, and keeps the vehicle raised active while any animation runs.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AnimatedVehicle:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Registers a value type (name, start/end XML attribute names, class object, load/get/set callbacks) used by animation parts. Ignored if the name is already registered. Call it from onRegisterAnimationValueTypes.
---@param name any
---@param startName any
---@param endName any
---@param initialUpdate any
---@param classObject any
---@param load any
---@param get any
---@param set any
function AnimatedVehicle:registerAnimationValueType(name, startName, endName, initialUpdate, classObject, load, get, set) end

--- Loads one animation from XML into the given table: flags, sorted parts (or keyframe curves), computed duration in ms, start time and sound samples. Returns true if a name was found, false otherwise.
---@param xmlFile any
---@param key any
---@param animation any
---@param components any
function AnimatedVehicle:loadAnimation(xmlFile, key, animation, components) end

--- Loads one timed part: builds a value object for every registered type that the XML part uses, stores requirements (other animation range, configuration) and times in ms. Returns false if no value applies or timing is missing.
---@param xmlFile any
---@param partKey any
---@param part any
---@param animation any
---@param components any
function AnimatedVehicle:loadAnimationPart(xmlFile, partKey, part, animation, components) end

--- Keyframe variant: adds translation/rotation/scale keyframes for a node into its AnimCurve, from either a time attribute or start/end times. Returns true when the node resolves.
---@param xmlFile any
---@param partKey any
---@param part any
---@param animation any
---@param components any
function AnimatedVehicle:loadStaticAnimationPart(xmlFile, partKey, part, animation, components) end

--- Reads translation, rotation and scale for one keyframe, using the node's current transform for missing ones, warns on inconsistent attribute sets for a node, and adds the keyframe to the curve.
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

--- Initialises every part of an animation in two passes: init for all, then postInit for all.
---@param animation table
function AnimatedVehicle:initializeAnimationParts(animation) end

--- Calls init on each value object of the part, passing the part index and the part count.
---@param animation table
---@param part table
---@param i any
---@param numParts any
function AnimatedVehicle:initializeAnimationPart(animation, part, i, numParts) end

--- Calls postInit on each value object of the part, normally to fill missing start values from the previous part's end values.
---@param animation table
---@param part table
---@param i any
---@param numParts any
function AnimatedVehicle:postInitializeAnimationPart(animation, part, i, numParts) end

--- Starts or resumes an animation at the given speed (negative plays backwards, 0 or nil with no stored speed is skipped) and start time (0-1). Unless noEventSend, broadcasts an AnimatedVehicleStartEvent. Raises onPlayAnimation and onStartAnimation.
---@param name string
---@param speed number
---@param animTime number
---@param noEventSend boolean
---@param allowSounds any
function AnimatedVehicle:playAnimation(name, speed, animTime, noEventSend, allowSounds) end

--- Stops an animation, clears its stop time, stops its non-looping sounds and raises onStopAnimation and onFinishAnimation. Unless noEventSend, sends an AnimatedVehicleStopEvent even if the name is unknown.
---@param name string
---@param noEventSend boolean
function AnimatedVehicle:stopAnimation(name, noEventSend) end

--- Returns true if an animation with this name is defined on the vehicle.
---@param name string
---@return boolean
function AnimatedVehicle:getAnimationExists(name) end

--- Returns the internal animation table for the name, or nil.
---@param name string
---@return table
function AnimatedVehicle:getAnimationByName(name) end

--- Returns true if the animation is currently in the active animation list.
---@param name string
---@return boolean
function AnimatedVehicle:getIsAnimationPlaying(name) end

--- Returns the current animation time in milliseconds, or 0 for an unknown animation.
---@param name string
---@return number
function AnimatedVehicle:getRealAnimationTime(name) end

--- Jumps an animation to a time in ms. By default (update true) it applies all part values immediately, with optional sounds. With update false it only stores the time.
---@param name string
---@param animTime number
---@param update boolean
---@param playSounds any
function AnimatedVehicle:setRealAnimationTime(name, animTime, update, playSounds) end

--- Returns the normalised animation time (0 to 1), or 0 when unknown or of zero duration.
---@param name string
---@return number
function AnimatedVehicle:getAnimationTime(name) end

--- Sets the normalised time (0 to 1) via setRealAnimationTime, optionally applying values at once.
---@param name string
---@param animTime number
---@param update boolean
---@param playSounds any
function AnimatedVehicle:setAnimationTime(name, animTime, update, playSounds) end

--- Returns the animation duration in ms, or 1 if the animation does not exist.
---@param name string
---@return number
function AnimatedVehicle:getAnimationDuration(name) end

--- Sets the playback speed factor. If a playing animation changes direction, its part values are reset.
---@param name string
---@param speed number
function AnimatedVehicle:setAnimationSpeed(name, speed) end

--- Returns the current speed factor of the animation, or 0 if unknown.
---@param name string
---@return number
function AnimatedVehicle:getAnimationSpeed(name) end

--- Sets a normalised time (0 to 1) at which the animation will stop on its own.
---@param name string
---@param stopTime number
function AnimatedVehicle:setAnimationStopTime(name, stopTime) end

--- Recomputes the current part index and resets the value objects of all parts of the animation.
---@param animation table
function AnimatedVehicle:resetAnimationValues(animation) end

--- Resets every value object of one animation part.
---@param part table
function AnimatedVehicle:resetAnimationPartValues(part) end

--- Override: after the parent loader succeeds, reads animName, animOuterRange, animMinLimit and animMaxLimit. Returns false if the parent fails.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function AnimatedVehicle:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Override: with an animName set, the part is inactive outside the min/max animation time range (or inside it with animOuterRange); otherwise defers to the parent. Note: the outer-range test uses 'or', so with default limits 0 and 1 it is almost always inactive.
---@param superFunc any
---@param speedRotatingPart any
function AnimatedVehicle:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Override: reads animName, animMinLimit and animMaxLimit on the work area, then calls the parent loader.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function AnimatedVehicle:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Override: the work area is inactive while its linked animation time lies outside the min/max limits; otherwise the parent decides.
---@param superFunc any
---@param workArea any
function AnimatedVehicle:getIsWorkAreaActive(superFunc, workArea) end

--- Override: after the parent loader succeeds, reads requiredAnimation and its min/max time (defaults 0 and 1). Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AnimatedVehicle:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Override: the moving tool is inactive while the required animation time is outside its allowed range; otherwise the parent decides.
---@param superFunc any
---@param movingTool any
function AnimatedVehicle:getIsMovingToolActive(superFunc, movingTool) end

--- Override: after the parent loader succeeds, reads requiredAnimation and its min/max time (defaults 0 and 1). Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function AnimatedVehicle:loadMovingPartFromXML(superFunc, xmlFile, key, entry) end

--- Override: the moving part is inactive while the required animation time is outside its allowed range; otherwise the parent decides.
---@param superFunc any
---@param movingPart any
function AnimatedVehicle:getIsMovingPartActive(superFunc, movingPart) end

--- Helper used by value types: links each part to the next part on the same node and direction, copies end values into the next part's missing start values, and warns on overlapping parts. Parts with different required ranges or configurations are not linked.
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

--- Sort comparator: orders parts by start time, then by shorter duration.
---@param a table
---@param b table
---@return boolean
function AnimatedVehicle.animPartSorter(a, b) end

--- Sort comparator for reverse playback: orders parts by later end time first, then later start time.
---@param a table
---@param b table
---@return boolean
function AnimatedVehicle.animPartSorterReverse(a, b) end

--- Moves a value toward a target by speed times dt (ms) and never overshoots the target. Returns the new value.
---@param currentValue number
---@param destValue number
---@param speed number
---@param dt number
---@return number
function AnimatedVehicle.getMovedLimitedValue(currentValue, destValue, speed, dt) end

--- Applies getMovedLimitedValue to the first n entries of a table in place. Returns true if any value changed.
---@param n integer
---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValuesN(n, currentValues, destValues, speeds, dt) end

--- Shortcut for setMovedLimitedValuesN with 3 values (for example an x/y/z vector). Returns true if any value changed.
---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValues3(currentValues, destValues, speeds, dt) end

--- Shortcut for setMovedLimitedValuesN with 4 values. Returns true if any value changed.
---@param currentValues table
---@param destValues table
---@param speeds table
---@param dt number
function AnimatedVehicle.setMovedLimitedValues4(currentValues, destValues, speeds, dt) end

--- Finds the index of the part being played at the current time, using the forward or reversed part order depending on the speed sign. Stores it in animation.currentPartIndex.
---@param animation table
---@return integer
function AnimatedVehicle.findCurrentPartIndex(animation) end

--- Returns the time in ms from the current animation time to the end of the part in the playback direction.
---@param part table
---@param anim table
---@return number
function AnimatedVehicle.getDurationToEndOfPart(part, anim) end

--- Returns whether the following part (in playback direction) is already past its start, or the default value when there is no such part.
---@param nextPart table
---@param prevPart table
---@param anim table
---@param default boolean
---@return boolean
function AnimatedVehicle.getNextPartIsPlaying(nextPart, prevPart, anim, default) end

--- Updates every active animation for dt, iterating from the end of the list so finished animations can be removed safely.
---@param self number
---@param dt number
---@param fixedTimeUpdate any
function AnimatedVehicle.updateAnimations(self, dt, fixedTimeUpdate) end

--- Updates one named animation for dt, respecting its stop time. Does nothing if the name is unknown.
---@param self string
---@param animName string
---@param dt number
---@param fixedTimeUpdate any
function AnimatedVehicle.updateAnimationByName(self, animName, dt, fixedTimeUpdate) end

--- Advances the animation clock by dt times speed, clamps it at the stop time if reached, and returns the effective dt and whether the animation should stop.
---@param self table
---@param anim table
---@param dt number
---@param stopTime number
---@return number
---@return boolean
function AnimatedVehicle.updateAnimationCurrentTime(self, anim, dt, stopTime) end

--- Core step: updates the parts in range (or evaluates keyframe curves), drives sounds with start/end times, direction and pitch, raises onUpdateAnimation and finishes the animation (events, stop samples, optional looping). A fixed-time update skips sounds and looping.
---@param self table
---@param anim table
---@param dtToUse number
---@param stopAnim boolean
---@param fixedTimeUpdate boolean
---@param playSounds playSounds
function AnimatedVehicle.updateAnimation(self, anim, dtToUse, stopAnim, fixedTimeUpdate, playSounds) end

--- Updates all value objects of a part and returns true if any of them changed.
---@param animation table
---@param part table
---@param durationToEnd number
---@param dtToUse number
---@param realDt number
---@param fixedTimeUpdate any
function AnimatedVehicle:updateAnimationPart(animation, part, durationToEnd, dtToUse, realDt, fixedTimeUpdate) end

--- Returns how many animations are currently playing on the vehicle.
function AnimatedVehicle:getNumOfActiveAnimations() end

--- Registers the built-in value types: rotation, translation, scale, shaderParameter, visibility, visibilityInter, animationClip, dependentAnimation, spline and rollingGate for all, plus rotLimit, transLimit, rotationLimitSpring, componentMass, centerOfMass and frictionVelocity on the server only.
function AnimatedVehicle:onRegisterAnimationValueTypes() end
