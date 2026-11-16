---@meta
-- FS25 1.25.1.0 : vehicles/specializations/VinePrepruner.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vine prepruners. It requires `VineDetector` as a prerequisite and reads the fruit type (default `FruitType.GRAPE`), pruner nodes that slide according to the detected distance, an optional pole animation and an effect. The server decides the effect state (on for one second after the last work time) and syncs pruner node targets and the effect flag by compressed stream values. The overrides it registers (speed limit, vine detection, AI segment use) and `loadPreprunerNodeFromXML`/`getIsPreprunerNodeActive` have no body in this file (UNVERIFIED).
---@class VinePrepruner
VinePrepruner = {}

--- Registers the XML paths for the fruit type, pruner nodes (node, offset, axis, direction, min/max translation, speed, sync bits), the pole animation (name, speed scale, pole threshold) and the effect.
function VinePrepruner.initSpecialization() end

--- Returns true only if the vehicle type has the `VineDetector` specialization.
---@param specializations any
function VinePrepruner.prerequisitesPresent(specializations) end

--- Registers `loadPreprunerNodeFromXML` and `getIsPreprunerNodeActive` on the vehicle type; their implementations are not in this file (UNVERIFIED).
---@param vehicleType any
function VinePrepruner.registerFunctions(vehicleType) end

--- Registers overrides for doCheckSpeedLimit, getCanStartVineDetection, getIsValidVinePlaceable, handleVinePlaceable and getAIImplementUseVineSegment (bodies not in this file, UNVERIFIED).
---@param vehicleType any
function VinePrepruner.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, the four stream events, onUpdate, onTurnedOff and onAnimationPartChanged. Only some have bodies here (onTurnedOff and onAnimationPartChanged are not defined in this file).
---@param vehicleType any
function VinePrepruner.registerEventListeners(vehicleType) end

--- Loads the fruit type, the pruner nodes (through `loadPreprunerNodeFromXML`), the pole animation settings and, on the client, the effects. Allocates a dirty flag and sets `lastWorkTime` far in the past.
---@param savegame any
function VinePrepruner:onLoad(savegame) end

--- Deletes the effects through the effect manager (not guarded by isClient, so on a server the effects table is nil; UNVERIFIED whether the manager tolerates nil).
function VinePrepruner:onDelete() end

--- Client join: reads pruner node positions and the effect state, forcing the nodes to those positions immediately.
---@param streamId any
---@param connection any
function VinePrepruner:onReadStream(streamId, connection) end

--- Server side on join: writes the pruner node targets and the effect state.
---@param streamId any
---@param connection any
function VinePrepruner:onWriteStream(streamId, connection) end

--- Client: if the server flagged a change, reads the pruner state; targets are approached smoothly in onUpdate.
---@param streamId any
---@param timestamp any
---@param connection any
function VinePrepruner:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes a boolean telling whether the dirty flag is set, and the pruner state when it is.
---@param streamId any
---@param connection any
---@param dirtyMask any
function VinePrepruner:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads each node target as an N-bit integer scaled between transMin and transMax, optionally applying it at once (`forceState`), then reads the effect boolean and starts or stops the effects, with the fruit type as effect info.
---@param self any
---@param streamId any
---@param forceState any
function VinePrepruner.readPrePrunerFromStream(self, streamId, forceState) end

--- Writes each node target as an N-bit integer normalized between transMin and transMax, then the effect boolean.
---@param self any
---@param streamId any
function VinePrepruner.writePrePrunerToStream(self, streamId) end

--- Moves each active pruner node toward its target translation at `transSpeed` (the step uses dt directly, so unit handling depends on the XML value). On the server, switches the effect on if work happened within the last second, starts/stops it locally and raises the dirty flag.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function VinePrepruner:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
