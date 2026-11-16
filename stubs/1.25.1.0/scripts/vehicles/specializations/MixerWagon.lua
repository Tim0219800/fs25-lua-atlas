---@meta
-- FS25 1.25.1.0 : vehicles/specializations/MixerWagon.lua (generated stub, FS25 Lua Atlas)

--- Specialization for feed mixer wagons that absorb bales (and shovel loads) and blend them into forage. It requires the Trailer and TurnOnVehicle specializations. When a recipe fill type is set in XML, it tracks one fill level per recipe ingredient and decides whether the mix is FORAGE or FORAGE_MIXING; the server picks up bales through triggers and the client plays animations and effects.
---@class MixerWagon
MixerWagon = {}

--- Returns true only if the vehicle type also has the Trailer and TurnOnVehicle specializations.
---@param specializations table
---@return boolean
function MixerWagon.prerequisitesPresent(specializations) end

--- Registers the XML schema paths under vehicle.mixerWagon (animation nodes, bale triggers, mixingTime, fillUnitIndex, recipe, fill effect) and the savegame fill level per fill type.
function MixerWagon.initSpecialization() end

--- Adds the bale trigger callback and the bale-deleted callback as vehicle functions.
---@param vehicleType any
function MixerWagon.registerFunctions(vehicleType) end

--- Overrides fill level handling, fill type acceptance, discharge fill type, bale auto-load, PTO power consumption, consuming load and PTO active state.
---@param vehicleType any
function MixerWagon.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, delete, stream read/write, update, draw, turn on/off and fill level changed events.
---@param vehicleType any
function MixerWagon.registerEventListeners(vehicleType) end

--- Reads the XML: loads animations and fill effect on the client, bale triggers on the server, mixing time, fill unit and recipe ingredients from the animal food system. With a recipe it disables the fill unit's own saving and sync, and creates the HUD extension.
---@param savegame table
function MixerWagon:onLoad(savegame) end

--- Restores per-ingredient fill levels from the savegame and logs a developer warning if no hudInfoTrigger is present.
---@param savegame table
function MixerWagon:onPostLoad(savegame) end

--- Removes bale triggers and bale delete listeners, deletes animations and effects, and removes and deletes the HUD extension.
function MixerWagon:onDelete() end

--- Writes the fill level of each recipe ingredient to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function MixerWagon:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side, on join: reads each ingredient's fill level and adds it to the fill unit, then reads the current effect fill type.
---@param streamId integer
---@param connection Connection
function MixerWagon:onReadStream(streamId, connection) end

--- Server side, on join: writes each ingredient's fill level and the current effect fill type.
---@param streamId integer
---@param connection Connection
function MixerWagon:onWriteStream(streamId, connection) end

--- Client only: applies ingredient fill level differences received from the server and updates the effect fill type when flagged.
---@param streamId integer
---@param timestamp integer
---@param connection table
function MixerWagon:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: sends ingredient fill levels when the dirty flag is set, and the effect fill type when the effect dirty flag is set.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function MixerWagon:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Runs the mixing animations while powered and active, decrements the mix timer, and on the server drains bales in the triggers into the fill unit at pickupSpeed. It also chooses the effect fill type; the client starts or stops the fill effect.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function MixerWagon:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Trigger callback: tracks accepted bales entering or leaving a bale trigger (with delete listener). If the fill unit rejects the bale type, it broadcasts a bale-not-accepted event to the farm.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function MixerWagon:mixerWagonBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Removes a deleted bale from all bale triggers' tracking tables.
---@param bale any
function MixerWagon:onMixerWagonBaleDeleted(bale) end

--- Overrides fill handling for the mixer fill unit. With a recipe it tracks levels per ingredient, splits returned forage by ratio, scales all ingredients on discharge, then sets the fill type to a single ingredient, FORAGE (ratios within min/max) or FORAGE_MIXING. Other units use the parent.
---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function MixerWagon:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

--- Accepts any fill type that belongs to a recipe ingredient on the mixer unit; otherwise defers to the parent.
---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
function MixerWagon:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillTypeIndex) end

--- For the mixer unit returns the current fill type with ratio 1; while the content is FORAGE_MIXING it reports the first ingredient that still has a level instead.
---@param superFunc any
---@param dischargeNode any
function MixerWagon:getDischargeFillType(superFunc, dischargeNode) end

--- Allows auto-loading a bale only if the mixer is turned on, no bale is currently in a trigger, the bale type matches the content, and there is free capacity; then defers to the parent.
---@param superFunc any
---@param bale any
function MixerWagon:getIsBaleAutoLoadable(superFunc, bale) end

--- Returns true while the mix timer is running, otherwise defers to the parent.
---@param superFunc any
---@return boolean
function MixerWagon:getDoConsumePtoPower(superFunc) end

--- Adds one load entry to the parent's result, with value 1 while the mix timer is running and 0 otherwise.
---@param superFunc any
function MixerWagon:getConsumingLoad(superFunc) end

--- Reports the PTO as active while the mix timer is running, or if the parent says so.
---@param superFunc any
function MixerWagon:getIsPowerTakeOffActive(superFunc) end

--- When the mixer fill unit becomes empty, resets every ingredient level to zero.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function MixerWagon:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Client only: starts the pickup animation nodes.
function MixerWagon:onTurnedOn() end

--- Client only: stops the pickup animation nodes.
function MixerWagon:onTurnedOff() end

--- Appends debug rows: whether the content is valid FORAGE and the fill level of each ingredient.
---@param values any
function MixerWagon:updateDebugValues(values) end
