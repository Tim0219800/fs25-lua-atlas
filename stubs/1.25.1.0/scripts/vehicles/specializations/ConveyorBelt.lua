---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConveyorBelt.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for conveyor belts that carry material from a discharge node to another object. It requires `Dischargeable`, delays the actual discharge until a visual morph effect has travelled along the belt, and drives belt animations, sounds and effects. The server computes the filling and scrolling state and syncs it to clients through the update stream. Optional offsets bound to `Cylindered` moving tools change the belt effect length. EffectManager, AnimationManager and SoundManager internals are UNVERIFIED (not in the dump).
---@class ConveyorBelt
ConveyorBelt = {}

--- Returns true only if the vehicle type has the `Dischargeable` specialization.
---@param specializations table
---@return boolean
function ConveyorBelt.prerequisitesPresent(specializations) end

--- Registers the XML schema entries under `vehicle.conveyorBelt`: discharge node index, start percentage (default 0.9), offsets with moving tool node and effect ranges, animation nodes, effects and belt sounds.
function ConveyorBelt.initSpecialization() end

--- Registers the vehicle functions `getConveyorBeltFillLevel`, `getConveyorBeltTargetObject` and `getLoadTriggerMaxFillSpeed`.
---@param vehicleType any
function ConveyorBelt.registerFunctions(vehicleType) end

--- Overrides six existing vehicle functions: discharge empty factor, discharge on empty, discharge handling, enterable check, fill type acceptance and free capacity of a fill unit.
---@param vehicleType any
function ConveyorBelt.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, the two update stream events, onUpdateTick, onFillUnitFillLevelChanged and onMovingToolChanged.
---@param vehicleType any
function ConveyorBelt.registerEventListeners(vehicleType) end

--- Loads effects (sorted by start delay), plus animations and the belt sound on clients. It selects the discharge node, computes the start fill level from the capacity and reads the moving tool offsets, warning about invalid effect indices.
---@param savegame table
function ConveyorBelt:onLoad(savegame) end

--- Resolves each offset's moving tool once all specializations are loaded and applies its initial state. Offsets with no matching tool are removed with a warning. Without `Cylindered`, offsets are disabled and an XML error is logged.
---@param savegame any
function ConveyorBelt:onPostLoad(savegame) end

--- Deletes the effects, animation nodes and sound samples owned by the belt.
function ConveyorBelt:onDelete() end

--- Client side only: when the dirty bit is set, reads the `isFilling` and `isScrolling` booleans sent by the server.
---@param streamId integer
---@param timestamp integer
---@param connection table
function ConveyorBelt:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side only: writes a dirty-flag bool, then `isFilling` and `isScrolling` when the belt's dirty flag is set.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function ConveyorBelt:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Main per-tick logic. Clients derive morph and scrolling from synced flags. While discharging, it advances the morph start and end positions by `dt`/delay and updates the empty factor. It starts or stops animations, sound and effect scrolling, and pushes the morph values to the effects.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ConveyorBelt:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns the fill level of the belt's fill unit plus, recursively, the level of the next belt in the chain it is discharging onto.
function ConveyorBelt:getConveyorBeltFillLevel() end

--- Follows the chain of belts from the current discharge node and returns the final target object and its fill unit index, or nil if nothing is hit.
function ConveyorBelt:getConveyorBeltTargetObject() end

--- Returns the maximum fill speed allowed by the chain: the minimum of this node's empty speed and that of downstream objects, or infinity without a discharge node.
function ConveyorBelt:getLoadTriggerMaxFillSpeed() end

--- Override. For the belt's discharge node, returns 0 until the morph end reaches 1, then the computed empty factor, which delays real discharge. Other nodes use the parent value.
---@param superFunc any
---@param dischargeNode any
function ConveyorBelt:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

--- Override. Calls the parent behaviour only for discharge nodes other than the belt's own, which is therefore ignored.
---@param superFunc any
---@param dischargeNode any
function ConveyorBelt:handleDischargeOnEmpty(superFunc, dischargeNode) end

--- Override. Skips discharge handling for the belt's own discharge node and delegates to the parent for all others.
---@param superFunc any
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function ConveyorBelt:handleDischarge(superFunc, dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- Override. The vehicle can be entered only if it is not attached to another vehicle and the parent check also passes.
---@param superFunc any
function ConveyorBelt:getIsEnterable(superFunc) end

--- Walks the belt chain from a vehicle and returns true if it leads back to the root vehicle, meaning a loop. Used to avoid endless recursion in fill type and capacity queries.
---@param rootVehicle any
---@param vehicle any
---@param fillUnitIndex any
function ConveyorBelt.getHasConveyorBeltLoop(rootVehicle, vehicle, fillUnitIndex) end

--- Override. After the parent check, if there is no loop, it also asks the target object whether it accepts the fill type, including through the node's fill type converter.
---@param superFunc any
---@param fillUnitIndex any
---@param fillType any
function ConveyorBelt:getFillUnitAllowsFillType(superFunc, fillUnitIndex, fillType) end

--- Override. Without a loop, adds the free capacity of the downstream target object to the parent value, so the belt reports the combined room of the chain.
---@param superFunc any
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param farmId any
function ConveyorBelt:getFillUnitFreeCapacity(superFunc, fillUnitIndex, fillTypeIndex, farmId) end

--- On the belt's fill unit: the server updates morph positions and the filling and scrolling flags, raising a dirty flag on change. At empty it stops effects and resets the morph; otherwise it sets the fill type info and starts effects.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function ConveyorBelt:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- When a linked moving tool changes state, sets the offsets of its effects by interpolation, honouring inversion, then recomputes the total belt delay.
---@param movingTool any
---@param speed any
---@param dt any
function ConveyorBelt:onMovingToolChanged(movingTool, speed, dt) end

--- Adds debug entries to the given list: fill factor, visual factor, current delay, offset and the morph start and end positions.
---@param values any
function ConveyorBelt:updateDebugValues(values) end
