---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of Precision Farming for soil sampling tools (requires PrecisionFarmingStatistic). The player takes samples at a sampling node with a radius, which triggers an animation and a cover map analysis, then sends the collected samples to the lab. It manages animations, input actions, minimap display, savegame/network sync of the sample count, and uses SoilSamplerStartEvent and SoilSamplerSendEvent.
---@class SoilSampler
SoilSampler = {}

--- True only if the vehicle has the PrecisionFarmingStatistic specialization.
---@param specializations table
---@return boolean
function SoilSampler.prerequisitesPresent(specializations) end

--- Registers the vehicle.soilSampler XML keys (node, radius default 10, input action names, animations, fold limits, samples animation, visual sample nodes) and the savegame attribute numCollectedSamples.
function SoilSampler.initSpecialization() end

--- Reads the XML settings, resolves the input actions (take defaults to IMPLEMENT_EXTRA, send to IMPLEMENT_EXTRA3), hides the visual sample nodes, loads texts and caches the soil map, cover map and farmland statistics from g_precisionFarming. Note: the send action fallback after a failed lookup is IMPLEMENT_EXTRA, not EXTRA3.
---@param savegame any
function SoilSampler:onLoad(savegame) end

--- Restores the collected sample count from the savegame unless vehicles are being reset, updating the visuals.
---@param savegame any
function SoilSampler:onPostLoad(savegame) end

--- Saves the number of collected samples as the numCollectedSamples attribute.
---@param xmlFile any
---@param key any
---@param usedModNames any
function SoilSampler:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the sample count (SEND_NUM_BITS bits) and applies it with visual update.
---@param streamId integer
---@param connection Connection
function SoilSampler:onReadStream(streamId, connection) end

--- Server side on join: writes the sample count with SEND_NUM_BITS bits.
---@param streamId integer
---@param connection Connection
function SoilSampler:onWriteStream(streamId, connection) end

--- While sampling, updates visual samples on the client and, when the sampling animation ends, resets it, clears the minimap sampling state, runs processSoilSampling and lifts the speed limit. Shows the collected count as extra HUD text. Note: visualSampleUpdated is set to false inside the branch that checks it as false, so the visual refresh repeats each update until the animation ends.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SoilSampler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When active for input, asks the soil map to show the minimap if the tool is unfolding (direction 1) and hide it otherwise.
---@param direction any
---@param moveToMiddle any
function SoilSampler:onFoldStateChanged(direction, moveToMiddle) end

--- If this sampler's node is the minimap link node, hides the minimap display and clears its link node and sampling state.
function SoilSampler:onLeaveRootVehicle() end

--- Same minimap cleanup as onLeaveRootVehicle, done just before the tool is detached.
function SoilSampler:onPreDetach() end

--- Starts a sample: on the server lowers the tool via its attacher joint, records 'numSoilSamples' and 'soilSampleCosts' if on a field and sets speed limit 0. Plays the sampling animation, increments the count, updates visuals and action state and sends SoilSamplerStartEvent.
---@param noEventSend any
function SoilSampler:startSoilSampling(noEventSend) end

--- Sets the collected count (or adds one when num is nil). With updateVisuals, shows the matching visual sample nodes and sets the samples animation time.
---@param num any
---@param updateVisuals any
function SoilSampler:setNumCollectedSoilSamples(num, updateVisuals) end

--- Maps the sample count to a 0 to N index over the N visual sample nodes, wrapping around so a full rack shows N rather than 0.
function SoilSampler:getNormalizedSampleIndex() end

--- Returns a boolean and an optional warning text. Refuses if the sampling node is not on farmland the farm can access, the motor (own or root vehicle) is off, the fold state is outside the allowed limits, or a sampling is already running.
function SoilSampler:getCanStartSoilSampling() end

--- Server only: builds a density circle at the sampling node with the sampling radius and has the cover map analyse the area for the owner farm.
function SoilSampler:processSoilSampling() end

--- Server: asks the soil map to analyse the collected samples for the owner farm. Client: hides visual samples and plays the samples animation backwards. Resets the count to 0 and sends SoilSamplerSendEvent.
---@param noEventSend any
function SoilSampler:sendTakenSoilSamples(noEventSend) end

--- Client side: registers the take and send input actions with high priority and texts, refreshes their state and sets up the minimap link node and sampling area size (twice the radius).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function SoilSampler:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Enables the send action only when at least one sample has been collected.
---@param self any
function SoilSampler.updateActionEventState(self) end

--- Input callback: starts sampling if allowed, otherwise shows the blocking warning for 2000 ms.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SoilSampler.actionEventStartSample(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: when samples exist and none is being taken, opens an info dialog whose confirmation calls onSendSoilSamplesDialog.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function SoilSampler.actionEventSendSamples(self, actionName, inputValue, callbackState, isAnalog) end

--- Dialog callback: tells the soil map to send all samples of the owner farm, from any sampler, since results are tracked per farm and not per vehicle.
---@param self any
function SoilSampler.onSendSoilSamplesDialog(self) end

--- Override. Returns true if the parent does or if a sample is being taken, so the speed limit applies while sampling.
---@param superFunc any
---@return boolean
function SoilSampler:doCheckSpeedLimit(superFunc) end

--- Override. Forbids folding while sampling; otherwise defers to the parent.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function SoilSampler:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end
