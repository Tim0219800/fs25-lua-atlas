# vehicles/specializations/AnimatedVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AnimatedVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AnimatedVehicle.lua` — FS25 1.25.1.0

✍ Specialization that gives any vehicle named, time-based animations defined in vehicle.animations (and per-configuration animationConfigurations). Each animation is a list of timed parts, or a keyframe set, driving node rotation, translation, scale, visibility, shader parameters, animation clips, splines, rolling gates, other animations, and on the server joint limits, masses, centres of mass and friction. Playing and stopping is synchronised through AnimatedVehicleStartEvent and AnimatedVehicleStopEvent. It also overrides the speed-rotating-part, work-area, moving-tool and moving-part loaders so they can depend on an animation time range. Other specializations register extra value types through the onRegisterAnimationValueTypes event.

- **AnimatedVehicle** (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimatedVehicle.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Always returns true: no prerequisite specialization. |
| `AnimatedVehicle.initSpecialization()` | 31 | ✍ Adds the shop configuration type 'animation', registers the animation XML paths (plain and per configuration), the animName/limit attributes for speed rotating parts and work areas, and the requiredAnimation attributes for Cylindered moving tools and parts. |
| `AnimatedVehicle.registerAnimationXMLPaths(schema: any, basePath: any)` | 70 | ✍ Registers every XML key of one animation: name, looping, resetOnStart, startAnimTime, keyframe flag, all part attributes (rot/trans/scale, limits, spring, mass, shader, clip, spline, rolling gate, requirements) and the sound entries. |
| `AnimatedVehicle.registerEvents(vehicleType: any)` | 176 | ✍ Registers onRegisterAnimationValueTypes, onPlayAnimation, onStartAnimation, onUpdateAnimation, onFinishAnimation, onStopAnimation and onAnimationPartChanged. |
| `AnimatedVehicle.registerFunctions(vehicleType: any)` | 188 | ✍ Registers the public animation API on the vehicle type (load, play, stop, time/speed getters and setters, reset, active count). |
| `AnimatedVehicle.registerOverwrittenFunctions(vehicleType: any)` | 218 | ✍ Overrides the load and is-active functions for speed rotating parts, work areas, moving tools and moving parts so they can be gated by an animation. |
| `AnimatedVehicle.registerEventListeners(vehicleType: any)` | 231 | ✍ Subscribes to onPreLoad, onLoad, onPostLoad, onDelete, onUpdate and onRegisterAnimationValueTypes. |
| `AnimatedVehicle:onPreLoad(savegame: table)` | 245 | ✍ Creates the animation value type table and raises onRegisterAnimationValueTypes so every specialization can register its own value types before animations load. |
| `AnimatedVehicle:onLoad(savegame: table)` | 255 | ✍ Loads all vehicle.animations.animation entries, then those of the selected animation configuration, into spec.animations indexed by name. Same name in the configuration replaces the base one. |
| `AnimatedVehicle:onPostLoad(savegame: table)` | 287 | ✍ For animations with resetOnStart, snaps them to the configured start time by a forced instant update. Removes the onUpdate listener when the vehicle has no animation. |
| `AnimatedVehicle:onDelete()` | 305 | ✍ On clients, deletes all animation sound samples, including the stop-time event samples. |
| `AnimatedVehicle:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 323 | ✍ Advances all active animations by dt, handles the short delay used to stop non-looping samples of finished fixed-time updates, and keeps the vehicle raised active while any animation runs. |
| `AnimatedVehicle:registerAnimationValueType(name: any, startName: any, endName: any, initialUpdate: any, classObject: any, load: any, get: any, set: any)` | 356 | ✍ Registers a value type (name, start/end XML attribute names, class object, load/get/set callbacks) used by animation parts. Ignored if the name is already registered. Call it from onRegisterAnimationValueTypes. |
| `AnimatedVehicle:loadAnimation(xmlFile: any, key: any, animation: any, components: any)` | 377 | ✍ Loads one animation from XML into the given table: flags, sorted parts (or keyframe curves), computed duration in ms, start time and sound samples. Returns true if a name was found, false otherwise. |
| `AnimatedVehicle:loadAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 504 | ✍ Loads one timed part: builds a value object for every registered type that the XML part uses, stores requirements (other animation range, configuration) and times in ms. Returns false if no value applies or timing is missing. |
| `AnimatedVehicle:loadStaticAnimationPart(xmlFile: any, partKey: any, part: any, animation: any, components: any)` | 569 | ✍ Keyframe variant: adds translation/rotation/scale keyframes for a node into its AnimCurve, from either a time attribute or start/end times. Returns true when the node resolves. |
| `AnimatedVehicle:loadStaticAnimationPartValues(xmlFile: any, partKey: any, curve: any, node: any, transName: any, rotName: any, scaleName: any, time: any, animation: any)` | 628 | ✍ Reads translation, rotation and scale for one keyframe, using the node's current transform for missing ones, warns on inconsistent attribute sets for a node, and adds the keyframe to the curve. |
| `AnimatedVehicle:initializeAnimationParts(animation: table)` | 672 | ✍ Initialises every part of an animation in two passes: init for all, then postInit for all. |
| `AnimatedVehicle:initializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 687 | ✍ Calls init on each value object of the part, passing the part index and the part count. |
| `AnimatedVehicle:postInitializeAnimationPart(animation: table, part: table, i: any, numParts: any)` | 696 | ✍ Calls postInit on each value object of the part, normally to fill missing start values from the previous part's end values. |
| `AnimatedVehicle:playAnimation(name: string, speed: number, animTime: number, noEventSend: boolean, allowSounds: any)` | 709 | ✍ Starts or resumes an animation at the given speed (negative plays backwards, 0 or nil with no stored speed is skipped) and start time (0-1). Unless noEventSend, broadcasts an AnimatedVehicleStartEvent. Raises onPlayAnimation and onStartAnimation. |
| `AnimatedVehicle:stopAnimation(name: string, noEventSend: boolean)` | 759 | ✍ Stops an animation, clears its stop time, stops its non-looping sounds and raises onStopAnimation and onFinishAnimation. Unless noEventSend, sends an AnimatedVehicleStopEvent even if the name is unknown. |
| `AnimatedVehicle:getAnimationExists(name: string) → boolean` | 795 | ✍ Returns true if an animation with this name is defined on the vehicle. |
| `AnimatedVehicle:getAnimationByName(name: string) → table` | 805 | ✍ Returns the internal animation table for the name, or nil. |
| `AnimatedVehicle:getIsAnimationPlaying(name: string) → boolean` | 814 | ✍ Returns true if the animation is currently in the active animation list. |
| `AnimatedVehicle:getRealAnimationTime(name: string) → number` | 824 | ✍ Returns the current animation time in milliseconds, or 0 for an unknown animation. |
| `AnimatedVehicle:setRealAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 839 | ✍ Jumps an animation to a time in ms. By default (update true) it applies all part values immediately, with optional sounds. With update false it only stores the time. |
| `AnimatedVehicle:getAnimationTime(name: string) → number` | 866 | ✍ Returns the normalised animation time (0 to 1), or 0 when unknown or of zero duration. |
| `AnimatedVehicle:setAnimationTime(name: string, animTime: number, update: boolean, playSounds: any)` | 882 | ✍ Sets the normalised time (0 to 1) via setRealAnimationTime, optionally applying values at once. |
| `AnimatedVehicle:getAnimationDuration(name: string) → number` | 899 | ✍ Returns the animation duration in ms, or 1 if the animation does not exist. |
| `AnimatedVehicle:setAnimationSpeed(name: string, speed: number)` | 913 | ✍ Sets the playback speed factor. If a playing animation changes direction, its part values are reset. |
| `AnimatedVehicle:getAnimationSpeed(name: string) → number` | 933 | ✍ Returns the current speed factor of the animation, or 0 if unknown. |
| `AnimatedVehicle:setAnimationStopTime(name: string, stopTime: number)` | 948 | ✍ Sets a normalised time (0 to 1) at which the animation will stop on its own. |
| `AnimatedVehicle:resetAnimationValues(animation: table)` | 960 | ✍ Recomputes the current part index and resets the value objects of all parts of the animation. |
| `AnimatedVehicle:resetAnimationPartValues(part: table)` | 970 | ✍ Resets every value object of one animation part. |
| `AnimatedVehicle:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 978 | ✍ Override: after the parent loader succeeds, reads animName, animOuterRange, animMinLimit and animMaxLimit. Returns false if the parent fails. |
| `AnimatedVehicle:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 993 | ✍ Override: with an animName set, the part is inactive outside the min/max animation time range (or inside it with animOuterRange); otherwise defers to the parent. Note: the outer-range test uses 'or', so with default limits 0 and 1 it is almost always inactive. |
| `AnimatedVehicle:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1012 | ✍ Override: reads animName, animMinLimit and animMaxLimit on the work area, then calls the parent loader. |
| `AnimatedVehicle:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1022 | ✍ Override: the work area is inactive while its linked animation time lies outside the min/max limits; otherwise the parent decides. |
| `AnimatedVehicle:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1035 | ✍ Override: after the parent loader succeeds, reads requiredAnimation and its min/max time (defaults 0 and 1). Returns false if the parent fails. |
| `AnimatedVehicle:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1051 | ✍ Override: the moving tool is inactive while the required animation time is outside its allowed range; otherwise the parent decides. |
| `AnimatedVehicle:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1064 | ✍ Override: after the parent loader succeeds, reads requiredAnimation and its min/max time (defaults 0 and 1). Returns false if the parent fails. |
| `AnimatedVehicle:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1080 | ✍ Override: the moving part is inactive while the required animation time is outside its allowed range; otherwise the parent decides. |
| `AnimatedVehicle.initializeAnimationPartAttribute(self: any, animation: any, part: any, i: any, numParts: any, nextName: any, prevName: any, startName: any, endName: any, warningName: any, startName2: any, endName2: any, additionalCompareParam: any)` | 1093 | ✍ Helper used by value types: links each part to the next part on the same node and direction, copies end values into the next part's missing start values, and warns on overlapping parts. Parts with different required ranges or configurations are not linked. |
| `AnimatedVehicle.animPartSorter(a: table, b: table) → boolean` | 1153 | ✍ Sort comparator: orders parts by start time, then by shorter duration. |
| `AnimatedVehicle.animPartSorterReverse(a: table, b: table) → boolean` | 1167 | ✍ Sort comparator for reverse playback: orders parts by later end time first, then later start time. |
| `AnimatedVehicle.getMovedLimitedValue(currentValue: number, destValue: number, speed: number, dt: number) → number` | 1185 | ✍ Moves a value toward a target by speed times dt (ms) and never overshoots the target. Returns the new value. |
| `AnimatedVehicle.setMovedLimitedValuesN(n: integer, currentValues: table, destValues: table, speeds: table, dt: number)` | 1202 | ✍ Applies getMovedLimitedValue to the first n entries of a table in place. Returns true if any value changed. |
| `AnimatedVehicle.setMovedLimitedValues3(currentValues: table, destValues: table, speeds: table, dt: number)` | 1220 | ✍ Shortcut for setMovedLimitedValuesN with 3 values (for example an x/y/z vector). Returns true if any value changed. |
| `AnimatedVehicle.setMovedLimitedValues4(currentValues: table, destValues: table, speeds: table, dt: number)` | 1230 | ✍ Shortcut for setMovedLimitedValuesN with 4 values. Returns true if any value changed. |
| `AnimatedVehicle.findCurrentPartIndex(animation: table) → integer` | 1238 | ✍ Finds the index of the part being played at the current time, using the forward or reversed part order depending on the speed sign. Stores it in animation.currentPartIndex. |
| `AnimatedVehicle.getDurationToEndOfPart(part: table, anim: table) → number` | 1265 | ✍ Returns the time in ms from the current animation time to the end of the part in the playback direction. |
| `AnimatedVehicle.getNextPartIsPlaying(nextPart: table, prevPart: table, anim: table, default: boolean) → boolean` | 1280 | ✍ Returns whether the following part (in playback direction) is already past its start, or the default value when there is no such part. |
| `AnimatedVehicle.updateAnimations(self: number, dt: number, fixedTimeUpdate: any)` | 1296 | ✍ Updates every active animation for dt, iterating from the end of the list so finished animations can be removed safely. |
| `AnimatedVehicle.updateAnimationByName(self: string, animName: string, dt: number, fixedTimeUpdate: any)` | 1311 | ✍ Updates one named animation for dt, respecting its stop time. Does nothing if the name is unknown. |
| `AnimatedVehicle.updateAnimationCurrentTime(self: table, anim: table, dt: number, stopTime: number) → number, boolean` | 1328 | ✍ Advances the animation clock by dt times speed, clamps it at the stop time if reached, and returns the effective dt and whether the animation should stop. |
| `AnimatedVehicle.updateAnimation(self: table, anim: table, dtToUse: number, stopAnim: boolean, fixedTimeUpdate: boolean, playSounds: playSounds)` | 1360 | ✍ Core step: updates the parts in range (or evaluates keyframe curves), drives sounds with start/end times, direction and pitch, raises onUpdateAnimation and finishes the animation (events, stop samples, optional looping). A fixed-time update skips sounds and looping. |
| `AnimatedVehicle:updateAnimationPart(animation: table, part: table, durationToEnd: number, dtToUse: number, realDt: number, fixedTimeUpdate: any)` | 1592 | ✍ Updates all value objects of a part and returns true if any of them changed. |
| `AnimatedVehicle:getNumOfActiveAnimations()` | 1605 | ✍ Returns how many animations are currently playing on the vehicle. |
| `AnimatedVehicle:onRegisterAnimationValueTypes()` | 1611 | ✍ Registers the built-in value types: rotation, translation, scale, shaderParameter, visibility, visibilityInter, animationClip, dependentAnimation, spline and rollingGate for all, plus rotLimit, transLimit, rotationLimitSpring, componentMass, centerOfMass and frictionVelocity on the server only. |

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
