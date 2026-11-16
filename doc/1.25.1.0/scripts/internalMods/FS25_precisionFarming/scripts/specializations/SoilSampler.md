# internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua` — FS25 1.25.1.0

✍ Vehicle specialization of Precision Farming for soil sampling tools (requires PrecisionFarmingStatistic). The player takes samples at a sampling node with a radius, which triggers an animation and a cover map analysis, then sends the collected samples to the lab. It manages animations, input actions, minimap display, savegame/network sync of the sample count, and uses SoilSamplerStartEvent and SoilSamplerSendEvent.

- **SoilSampler** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SoilSampler.prerequisitesPresent(specializations: table) → boolean` | 22 | ✍ True only if the vehicle has the PrecisionFarmingStatistic specialization. |
| `SoilSampler.initSpecialization()` | 28 | ✍ Registers the vehicle.soilSampler XML keys (node, radius default 10, input action names, animations, fold limits, samples animation, visual sample nodes) and the savegame attribute numCollectedSamples. |
| `SoilSampler:onLoad(savegame: any)` | 88 | ✍ Reads the XML settings, resolves the input actions (take defaults to IMPLEMENT_EXTRA, send to IMPLEMENT_EXTRA3), hides the visual sample nodes, loads texts and caches the soil map, cover map and farmland statistics from g_precisionFarming. Note: the send action fallback after a failed lookup is IMPLEMENT_EXTRA, not EXTRA3. |
| `SoilSampler:onPostLoad(savegame: any)` | 154 | ✍ Restores the collected sample count from the savegame unless vehicles are being reset, updating the visuals. |
| `SoilSampler:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 164 | ✍ Saves the number of collected samples as the numCollectedSamples attribute. |
| `SoilSampler:onReadStream(streamId: integer, connection: Connection)` | 173 | ✍ Client side on join: reads the sample count (SEND_NUM_BITS bits) and applies it with visual update. |
| `SoilSampler:onWriteStream(streamId: integer, connection: Connection)` | 184 | ✍ Server side on join: writes the sample count with SEND_NUM_BITS bits. |
| `SoilSampler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 194 | ✍ While sampling, updates visual samples on the client and, when the sampling animation ends, resets it, clears the minimap sampling state, runs processSoilSampling and lifts the speed limit. Shows the collected count as extra HUD text. Note: visualSampleUpdated is set to false inside the branch that checks it as false, so the visual refresh repeats each update until the animation ends. |
| `SoilSampler:onFoldStateChanged(direction: any, moveToMiddle: any)` | 230 | ✍ When active for input, asks the soil map to show the minimap if the tool is unfolding (direction 1) and hide it otherwise. |
| `SoilSampler:onLeaveRootVehicle()` | 239 | ✍ If this sampler's node is the minimap link node, hides the minimap display and clears its link node and sampling state. |
| `SoilSampler:onPreDetach()` | 250 | ✍ Same minimap cleanup as onLeaveRootVehicle, done just before the tool is detached. |
| `SoilSampler:startSoilSampling(noEventSend: any)` | 261 | ✍ Starts a sample: on the server lowers the tool via its attacher joint, records 'numSoilSamples' and 'soilSampleCosts' if on a field and sets speed limit 0. Plays the sampling animation, increments the count, updates visuals and action state and sends SoilSamplerStartEvent. |
| `SoilSampler:setNumCollectedSoilSamples(num: any, updateVisuals: any)` | 320 | ✍ Sets the collected count (or adds one when num is nil). With updateVisuals, shows the matching visual sample nodes and sets the samples animation time. |
| `SoilSampler:getNormalizedSampleIndex()` | 337 | ✍ Maps the sample count to a 0 to N index over the N visual sample nodes, wrapping around so a full rack shows N rather than 0. |
| `SoilSampler:getCanStartSoilSampling()` | 353 | ✍ Returns a boolean and an optional warning text. Refuses if the sampling node is not on farmland the farm can access, the motor (own or root vehicle) is off, the fold state is outside the allowed limits, or a sampling is already running. |
| `SoilSampler:processSoilSampling()` | 394 | ✍ Server only: builds a density circle at the sampling node with the sampling radius and has the cover map analyse the area for the owner farm. |
| `SoilSampler:sendTakenSoilSamples(noEventSend: any)` | 407 | ✍ Server: asks the soil map to analyse the collected samples for the owner farm. Client: hides visual samples and plays the samples animation backwards. Resets the count to 0 and sends SoilSamplerSendEvent. |
| `SoilSampler:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 432 | ✍ Client side: registers the take and send input actions with high priority and texts, refreshes their state and sets up the minimap link node and sampling area size (twice the radius). |
| `SoilSampler.updateActionEventState(self: any)` | 456 | ✍ Enables the send action only when at least one sample has been collected. |
| `SoilSampler.actionEventStartSample(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 466 | ✍ Input callback: starts sampling if allowed, otherwise shows the blocking warning for 2000 ms. |
| `SoilSampler.actionEventSendSamples(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 477 | ✍ Input callback: when samples exist and none is being taken, opens an info dialog whose confirmation calls onSendSoilSamplesDialog. |
| `SoilSampler.onSendSoilSamplesDialog(self: any)` | 486 | ✍ Dialog callback: tells the soil map to send all samples of the owner farm, from any sampler, since results are tracked per farm and not per vehicle. |
| `SoilSampler:doCheckSpeedLimit(superFunc: any) → boolean` | 497 | ✍ Override. Returns true if the parent does or if a sample is being taken, so the speed limit applies while sampling. |
| `SoilSampler:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 503 | ✍ Override. Forbids folding while sampling; otherwise defers to the parent. |
