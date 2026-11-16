---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolMotorized.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for any tool with a motor (such as the chainsaw): it simulates RPM that rises or falls toward a target at configurable rates, a load value, start/idle/stop sounds, exhaust effects and optional vibration of a node. RPM and load are synchronised in the update stream, and it can combine its vibration with HandToolBob. XML keys are under `handTool.motorized`. Note: `startTime` is read but not used in this file.
---@class HandToolMotorized
HandToolMotorized = {}

--- Registers the motor attributes (min/max RPM, gain and loss speed, variability), vibration node and amount, the start/stop/idle sounds and the exhaust effects.
---@param xmlSchema any
function HandToolMotorized.registerXMLPaths(xmlSchema) end

--- Registers the RPM, load, target RPM, sound and vibration functions on the hand tool type.
---@param handToolType any
function HandToolMotorized.registerFunctions(handToolType) end

--- Overrides `updateBobNode` so vibration can be applied on top of the bob (see HandToolBob).
---@param handToolType any
function HandToolMotorized.registerOverwrittenFunctions(handToolType) end

--- Subscribes to load, post-load, delete, update, update stream read/write, held start/end and debug draw.
---@param handToolType any
function HandToolMotorized.registerEventListeners(handToolType) end

--- Always returns true: no prerequisite.
---@param specializations any
function HandToolMotorized.prerequisitesPresent(specializations) end

--- Reads min RPM (default 10), max RPM (default 100), gain/loss speeds (default max minus min per second), variability and vibration settings. Starts at min RPM with zero load. On clients loads sounds and exhaust effects; sound keys use the base path `sounds.motorized.sounds`, which differs from the registered `handTool.motorized.sounds` (UNVERIFIED which one is intended).
---@param xmlFile any
---@param baseDirectory any
function HandToolMotorized:onLoad(xmlFile, baseDirectory) end

--- Detects whether a bob node of HandToolBob is the same node as the vibration node, and records it so `updateVibrations` can skip it.
---@param savegame any
function HandToolMotorized:onPostLoad(savegame) end

--- On clients frees the samples and tries to delete `fillEffects`, which this file never sets; the exhaust effects are not deleted here. Note: likely a leftover name.
function HandToolMotorized:onDelete() end

--- Writes, when the dirty flag is set, the RPM as a fraction between min and max and the load, each compressed to 8 bits.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolMotorized:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads RPM and load. Applies them on the server, or on a client when the player carrying the tool is not the owner.
---@param streamId any
---@param timestamp any
---@param connection any
function HandToolMotorized:onReadUpdateStream(streamId, timestamp, connection) end

--- On clients, plays the start sound followed by the idle loop (if idle is not already playing), stops the stop sound and starts exhaust effects.
function HandToolMotorized:onHeldStart() end

--- On clients, stops start and idle sounds, plays the stop sound and stops exhaust effects.
function HandToolMotorized:onHeldEnd() end

--- Updates RPM every frame, and on clients also updates sound parameters and vibrations.
---@param dt any
function HandToolMotorized:onUpdate(dt) end

--- Moves current RPM toward the target at the gain or loss rate per second. With variability set, the target is lowered by a time-based pseudo-random offset that grows with load.
---@param dt any
function HandToolMotorized:updateRPM(dt) end

--- Feeds the idle loop synthesis sound with the RPM fraction and the current load.
---@param dt any
function HandToolMotorized:updateSounds(dt) end

--- Sets the vibration node translation to a random offset, unless the bob specialization drives that same node.
---@param dt any
function HandToolMotorized:updateVibrations(dt) end

--- Returns a random X, Y, Z offset in metres within the configured amount, scaled by low RPM (strongest at idle) and reduced by load.
---@return number
---@return number
---@return number
function HandToolMotorized:getVibrationOffset() end

--- Overwritten function: calls the original, then, on clients, adds the vibration to the bob node if it is the vibration node.
---@param superFunc function
---@param bobNode table
---@param dt number
---@param isActive boolean
---@param speed number
function HandToolMotorized:updateBobNode(superFunc, bobNode, dt, isActive, speed) end

--- Returns seconds needed to reach the given RPM from the current one, using the gain rate going up and the loss rate going down; 0 if equal.
---@param rpm number
---@return number
function HandToolMotorized:getTimeToReachRPM(rpm) end

--- Returns the RPM gain rate per second.
function HandToolMotorized:getRPMGainPerSecond() end

--- Sets the RPM gain rate per second.
---@param rpmGainPerSecond any
function HandToolMotorized:setRPMGainPerSecond(rpmGainPerSecond) end

--- Returns the RPM loss rate per second.
function HandToolMotorized:getRPMLossPerSecond() end

--- Sets the RPM loss rate per second.
---@param rpmLossPerSecond any
function HandToolMotorized:setRPMLossPerSecond(rpmLossPerSecond) end

--- Returns the current load, 0 to 1.
function HandToolMotorized:getCurrentLoad() end

--- Clamps load to 0..1 and stores it. If it changed by more than 0.01, flags a network update (server, or owning player).
---@param currentLoad any
function HandToolMotorized:setCurrentLoad(currentLoad) end

--- Returns the current RPM.
function HandToolMotorized:getCurrentRPM() end

--- Clamps RPM between min and max and stores it. If it changed by more than 1, flags a network update (server, or owning player).
---@param currentRPM any
function HandToolMotorized:setCurrentRPM(currentRPM) end

--- Returns the target RPM.
function HandToolMotorized:getTargetRPM() end

--- Returns the maximum RPM.
function HandToolMotorized:getMaxRPM() end

--- Returns the minimum (idle) RPM.
function HandToolMotorized:getMinRPM() end

--- Sets the target RPM, clamped between min and max.
---@param targetRPM any
function HandToolMotorized:setTargetRPM(targetRPM) end

--- Sets the target RPM to the minimum.
function HandToolMotorized:setTargetRPMToIdle() end

--- Sets the target RPM to the maximum.
function HandToolMotorized:setTargetRPMToMax() end

--- Adds debug lines for current RPM, target RPM, load and vibration percentage; returns the updated y position.
---@param x any
---@param y any
---@param textSize any
function HandToolMotorized:onDebugDraw(x, y, textSize) end
