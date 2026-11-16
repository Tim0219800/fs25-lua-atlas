---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Leveler.lua (generated stub, FS25 Lua Atlas)

--- Specialization for blades/levelers that push and spread bulk material (silage, chaff, snow-like heaps) over the height-map terrain, mainly in bunker silos. Requires FillUnit and BunkerSiloInteractor. Each `vehicle.leveler.levelerNode` picks material up while driving in the pick-up direction, drops it along a line and in front of the blade, and can smooth the ground. The simulation runs on the server; the client only receives a moved-amount percentage to drive effects.
---@class Leveler
Leveler = {}

--- Returns true only if the vehicle type has both the FillUnit and BunkerSiloInteractor specializations.
---@param specializations table
---@return boolean
function Leveler.prerequisitesPresent(specializations) end

--- Registers the leveler XML schema: node, width, drop widths and offsets, height-check count, smoothing options, fill unit index, occlusion areas, force settings, `ignoreFarmlandState` and the effect paths.
function Leveler.initSpecialization() end

--- Registers `getIsLevelerPickupNodeActive`, `loadLevelerNodeFromXML` and `onLevelerRaycastCallback` on the vehicle type.
---@param vehicleType any
function Leveler.registerFunctions(vehicleType) end

--- Overrides `getIsAttacherJointControlDampingAllowed` so joint damping depends on the leveler position.
---@param vehicleType any
function Leveler.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream and onUpdate.
---@param vehicleType any
function Leveler.registerEventListeners(vehicleType) end

--- Reads leveler settings and all `levelerNode` entries, initialises the moved-amount smoothing state, force node and effects (client). Removes the onUpdate listener if no valid node loaded. Note: the XML default of `maxFillLevelPerMS` is 35 here but 20 in the schema.
---@param savegame table
function Leveler:onLoad(savegame) end

--- Deletes the leveler effects.
function Leveler:onDelete() end

--- Client side: when the server flagged a change, reads the quantised moved-amount percentage from the stream.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Leveler:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes a flag and, if the dirty flag is set, the quantised moved-amount percentage for clients.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Leveler:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Client: starts or stops effects according to the moved-amount percentage. Server: for each node, checks farmland access, picks material up from the height map when moving in the pick-up direction, drops it under and in front of the blade, smooths ground, updates the percentage and applies a drag force. Raises the dirty flag on change.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Leveler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one leveler node (geometry, drop widths and offsets, occlusion areas, smoothing, fill unit) into the given table and creates a reference-frame transform. Returns false if the node or fill unit is missing.
---@param levelerNode table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Leveler:loadLevelerNodeFromXML(levelerNode, xmlFile, key) end

--- Returns true if the vehicle cannot be attached or is currently attached to another vehicle; picking up is active only in that case.
---@param levelerNode table
---@return boolean
function Leveler:getIsLevelerPickupNodeActive(levelerNode) end

--- Override: damping is allowed only if the parent allows it and the height map has material at every leveler node position.
---@param superFunc any
---@return boolean
function Leveler:getIsAttacherJointControlDampingAllowed(superFunc) end

--- Raycast callback (note: called with the node table, not the vehicle). If the ray ends without hitting a non-terrain object, it registers occlusion areas and drops the remaining fill level in front of the blade, returning the leftover to be picked up later.
---@param levelerNode integer
---@param hitObjectId integer
---@param x number
---@param y number
---@param z number
---@param distance number
---@param nx number
---@param ny number
---@param nz number
---@param subShapeIndex integer
---@param shapeId integer
---@param isLast boolean
---@return boolean
function Leveler.onLevelerRaycastCallback(levelerNode, hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end
