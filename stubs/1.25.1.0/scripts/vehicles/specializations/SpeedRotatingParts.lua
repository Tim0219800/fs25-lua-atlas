---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SpeedRotatingParts.lua (generated stub, FS25 Lua Atlas)

--- Specialization for non-wheel parts that rotate or scroll with the driving speed (belts, drums, reels, steering-following rollers, texture scrolling via shader parameters). Each `vehicle.speedRotatingParts.speedRotatingPart` takes its speed from a wheel group, a speed reference node or the vehicle speed, accumulates an `xDrive` angle, and applies it to nodes, shader parameters and optionally tire tracks. Parts are only updated within a camera distance, fade out when inactive, and "versatile Y rotation" angles are sent from server to clients. It has no prerequisites; other specializations (e.g. RidgeMarker) extend loading and activity through the overridable functions.
---@class SpeedRotatingParts
SpeedRotatingParts = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function SpeedRotatingParts.prerequisitesPresent(specializations) end

--- Declares the large `speedRotatingPart` XML schema: nodes and shader nodes, shader scroll settings, wheel references, direction nodes, steering and Y rotation options, radius and wheel scale, activity, fade-out and activation speed, tire track options and max update distance.
function SpeedRotatingParts.initSpecialization() end

--- Registers `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `getSpeedRotatingPartDirection` and `updateSpeedRotatingPart`.
---@param vehicleType any
function SpeedRotatingParts.registerFunctions(vehicleType) end

--- Overrides `validateWashableNode` so that tire-linked rotating part nodes use the wheel's dirt data.
---@param vehicleType any
function SpeedRotatingParts.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onUpdate and onUpdateTick.
---@param vehicleType any
function SpeedRotatingParts.registerEventListeners(vehicleType) end

--- Loads every `speedRotatingPart` (removing the tire track node of a failed one), tracks whether parts use different max update distances, allocates the dirty flag, and removes all stream and update listeners if no part loaded.
---@param savegame table
function SpeedRotatingParts:onLoad(savegame) end

--- Client on join: reads a 9-bit steering angle for every part with versatile Y rotation.
---@param streamId integer
---@param connection Connection
function SpeedRotatingParts:onReadStream(streamId, connection) end

--- Server on join: writes the steering angle of every versatile Y rotation part, quantised to 9 bits over a full turn.
---@param streamId integer
---@param connection Connection
function SpeedRotatingParts:onWriteStream(streamId, connection) end

--- Client side: when the server flagged an update, reads the 9-bit steering angle of each versatile part.
---@param streamId integer
---@param timestamp integer
---@param connection table
function SpeedRotatingParts:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: if the part dirty flag is set, writes true followed by the quantised steering angle of each versatile part; otherwise writes false.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function SpeedRotatingParts:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Every frame, for parts within their update distance, calls `updateSpeedRotatingPart` when the part is active or still spinning down (unless it stops immediately when inactive).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SpeedRotatingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Refreshes each in-range part's `isActive` flag from `getIsSpeedRotatingPartActive`.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SpeedRotatingParts:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one part (represent/shader nodes, shader parameter type, drive node, wheels, tire tracks, direction, steering options, wheel scale, fade-out, update distance). Returns false with a warning on invalid node, missing wheels, missing tire track wheel, bad versatile setup or speed reference equal to the drive node. Wheels used get contact sync enabled.
---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function SpeedRotatingParts:loadSpeedRotatingPartFromXML(speedRotatingPart, xmlFile, key) end

--- Default activity test: true, except false when the part is limited to the lowered state and the vehicle is raised. Overridden by other specializations to add conditions.
---@param speedRotatingPart table
---@return boolean
function SpeedRotatingParts:getIsSpeedRotatingPartActive(speedRotatingPart) end

--- Returns 1 by default: the direction multiplier applied to the rotation of a part, meant to be overridden.
---@param speedRotatingPart table
---@return integer
function SpeedRotatingParts:getSpeedRotatingPartDirection(speedRotatingPart) end

--- Per-frame update of one part: measures speed (from a reference node, the average wheel rotation of wheels in contact, or vehicle speed) and direction, or slows it down when inactive, advances `xDrive`, updates versatile steering (server, networked through the dirty flag) or direction alignment, rotates the nodes and writes shader scroll/rotation parameters. Note: with `dirRefNode` and without alignDirection it indexes `wheels[1]`, which would fail if no wheel is configured (UNVERIFIED in practice).
---@param speedRotatingPart any
---@param dt any
---@param isPartActive any
function SpeedRotatingParts:updateSpeedRotatingPart(speedRotatingPart, dt, isPartActive) end

--- For nodes belonging to a rotating part linked to wheels and carrying the dirt shader parameter, returns false plus the wheel dirt update function and node data copied from that wheel (dirt multipliers, wetness factor, colour change speed, snow node); otherwise defers to the parent.
---@param superFunc any
---@param node any
function SpeedRotatingParts:validateWashableNode(superFunc, node) end
