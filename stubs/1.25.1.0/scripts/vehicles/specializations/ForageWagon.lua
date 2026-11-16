---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ForageWagon.lua (generated stub, FS25 Lua Atlas)

--- Specialization of the forage wagon (picking up grass/hay/silage windrows from the height map, DensityMapHeightUtil). Prerequisites: FillUnit, TurnOnVehicle, Pickup, WorkArea. EFFECTS (client): fillEffects (vehicle.forageWagon.fillEffect, material flow) and startFillEffect (vehicle.forageWagon.startFillEffect, fill start effect with delay and fade) loaded by g_effectManager:loadEffect; effect classes are absent from the dump: rendering UNVERIFIED. TRIGGER: the server arms spec.fillTimer = 500 ms as soon as litres have been picked up during the pass (onEndWorkAreaProcessing); onUpdateTick counts this time down with dt and isFilling stays true while it is positive; any change of isFilling raises dirtyFlag and calls setFillEffectActive. The client receives isFilling and the fill type (FillTypeManager.SEND_NUM_BITS bits) through the initial and update streams and itself calls setFillEffectActive. The effect receives spec.lastFillType (the last material type picked up) as its type, no growth stage, no width; the density of startFillEffect is modulated by the fill level (onFillUnitFillLevelChanged: 1 - level/fillStartFadeOff). CONDITIONS: the area is active if the tool is turned on and if Pickup allows picking up (allowPickingUp, Pickup specialization not re-read: the lowered/ground contact criterion there is therefore UNVERIFIED here). The other sources only show doCheckSpeedLimit tied to turned on AND lowered. PICKUP: processForageWagonArea draws, along the area line (radius 0.5), the litres of each supported type (tipToGroundAroundLine with -infinity = suction), remembers the first type found (forcedFillType), treats wet/dry grass/hay windrows as interchangeable, applies additives on the server side (+5 % weighted by the available additive level) and accumulates the litres; workArea.pickupParticlesActive is set according to pickupLiters > 0 (field probably read by Pickup: UNVERIFIED). The returned area = line width * lastMovedDistance, only when driving forward. This script reads no weather or wetness data, and does not modify any terrain density map other than the height map (no crop map). Remark: processForageWagonArea has no client distance guard (unlike ground tools), but only the server fills the vehicle. dt: fillTimer in ms of game time. EXTENSION POINTS: functions processForageWagonArea, setFillEffectActive, fillForageWagon; overrides loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit, getConsumingLoad; stream events, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate, onFillUnitFillLevelChanged. Default speed limit: 20.
---@class ForageWagon
ForageWagon = {}

--- Declares the forageWagon area type and the XML schema: area/unit/load info indices, additives (unit, usage, types), volume UV scrolling, maxPickupLitersPerSecond, fillEffect and startFillEffect. Not re-read key by key.
function ForageWagon.initSpecialization() end

--- Requires FillUnit, TurnOnVehicle, Pickup and WorkArea.
---@param specializations any
function ForageWagon.prerequisitesPresent(specializations) end

--- Registers processForageWagonArea, setFillEffectActive and fillForageWagon.
---@param vehicleType any
function ForageWagon.registerFunctions(vehicleType) end

--- Overrides loadSpeedRotatingPartFromXML, getIsSpeedRotatingPartActive, getFillVolumeUVScrollSpeed, getIsWorkAreaActive, doCheckSpeedLimit and getConsumingLoad.
---@param vehicleType any
function ForageWagon.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to the stream events, onLoad, onDelete, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOff, onDeactivate and onFillUnitFillLevelChanged (exact list not re-read).
---@param vehicleType any
function ForageWagon.registerEventListeners(vehicleType) end

--- Initializes the filling state, reads area/unit/load indices, additives (default usage 0.0000275 per litre, type GRASS_WINDROW), UV scroll speeds, maximum flow (500 l/s), loads the effects (client) and a litres buffer over 750 ms; removes the onFillUnitFillLevelChanged listener if there is no startFillEffect.
---@param savegame any
function ForageWagon:onLoad(savegame) end

--- Frees the two effect groups.
function ForageWagon:onDelete() end

--- Reads isFilling and the fill type on connection and applies setFillEffectActive.
---@param streamId any
---@param connection any
function ForageWagon:onReadStream(streamId, connection) end

--- Writes isFillingSent and lastFillType.
---@param streamId any
---@param connection any
function ForageWagon:onWriteStream(streamId, connection) end

--- Client side: if the flag is raised, reads isFilling and the type, applies setFillEffectActive.
---@param streamId any
---@param timestamp any
---@param connection any
function ForageWagon:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes isFillingSent and lastFillType when dirtyFlag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function ForageWagon:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: counts down fillTimer (dt), derives isFilling, broadcasts the change and triggers setFillEffectActive; feeds the buffer of picked-up litres (engine load).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ForageWagon:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Picks up the windrow under the area line (forced type if already loaded, otherwise first supported type that yields litres), handles the additive on the server side, sets pickupParticlesActive and lastPickUpLiters on the area, remembers lastFillType (with network flag) and computes the area when driving forward.
---@param workArea any
function ForageWagon:processForageWagonArea(workArea) end

--- Applies the current fill type to the two effect groups then starts or stops them. Single entry point of the visual effects; called on server and client.
---@param isActive any
function ForageWagon:setFillEffectActive(isActive) end

--- Server: pours the accumulated litres into the fill unit; if not everything fits, turns the tool off and raises the pickup.
function ForageWagon:fillForageWagon() end

--- Reads the rotateOnlyIfFillLevelIncreased option of a rotating part.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function ForageWagon:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Makes a part marked rotateOnlyIfFillLevelIncreased rotate only while isFilling.
---@param superFunc any
---@param speedRotatingPart any
function ForageWagon:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- UV scroll speed of the volume: loading value if isFilling, unloading value if unloading is in progress, otherwise the parent value.
---@param superFunc any
---@param fillVolumeIndex any
function ForageWagon:getFillVolumeUVScrollSpeed(superFunc, fillVolumeIndex) end

--- For the pickup area: inactive if the tool is not turned on or if allowPickingUp is false.
---@param superFunc any
---@param workArea any
function ForageWagon:getIsWorkAreaActive(superFunc, workArea) end

--- Applies the speed limit if the tool is turned on and lowered.
---@param superFunc any
function ForageWagon:doCheckSpeedLimit(superFunc) end

--- Adds the pickup load (litres over 1 s / maximum flow) to the consumed load.
---@param superFunc any
function ForageWagon:getConsumingLoad(superFunc) end

--- Before the pass: forces the loaded type if there is more than the type change threshold, possibly arms the start effect delay and resets lastPickupLiters to zero.
---@param dt any
function ForageWagon:onStartWorkAreaProcessing(dt) end

--- Server: if litres were picked up, lets the start effect run (delay), calls fillForageWagon and arms fillTimer = 500 ms.
---@param dt any
---@param hasProcessed any
function ForageWagon:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Client: resets fillTimer to zero and stops the effects.
function ForageWagon:onTurnedOff() end

--- Client: resets fillTimer to zero and stops the effects.
function ForageWagon:onDeactivate() end

--- Client: sets the startFillEffect density according to the fill level (fade).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ForageWagon:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Default speed limit: 20.
function ForageWagon.getDefaultSpeedLimit() end
