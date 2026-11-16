---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreeSaw.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicle-mounted saws that cut standing or fallen wood (distinct from the chainsaw hand tool). While turned on, the server looks for a split shape at the configured cut node, waits a delay and then cuts it with ChainsawUtil. Clients play the cut effect and sounds and receive the cutting flag through the update stream. It requires TurnOnVehicle; EffectManager and the split-shape engine functions are not in the dump, so their exact behaviour is UNVERIFIED.
---@class TreeSaw
TreeSaw = {}

--- Returns true only if the vehicle type has the TurnOnVehicle specialization.
---@param specializations table
---@return boolean
function TreeSaw.prerequisitesPresent(specializations) end

--- Registers the `vehicle.treeSaw` XML keys: cut and saw sounds, animation nodes, effects, and the cut node with its size, minimum lengths above/below the cut and cut delay in seconds.
function TreeSaw.initSpecialization() end

--- Subscribes to onLoad, onDelete, update streams, onUpdate, onUpdateTick, onDraw, onDeactivate, onTurnedOn and onTurnedOff.
---@param vehicleType any
function TreeSaw.registerEventListeners(vehicleType) end

--- Loads animation nodes, effects and sounds on clients, reads the cut node parameters (delay converted to milliseconds) and resets the cutting state.
---@param savegame table
function TreeSaw:onLoad(savegame) end

--- Deletes the effects, sound samples and animation nodes.
function TreeSaw:onDelete() end

--- Client only: reads the `isCutting` flag sent by the server.
---@param streamId integer
---@param timestamp integer
---@param connection table
function TreeSaw:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: writes the `isCutting` flag every update, without using a dirty mask.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function TreeSaw:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: drops the target if it no longer exists, counts the cut timer down and performs the cut with ChainsawUtil when it reaches 0. Client: plays the wood chip effect and cut sound while the timer is running, stops them otherwise.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- While turned on, looks for a split shape at the cut node, checks farm land access (otherwise sets a warning), and validates the target: the cut must be testable, not too low near the tree base, and leave minimum lengths on both sides. Starts or cancels the cut timer accordingly.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Shows the 'cutting' info text while cutting and a blinking warning when the tree is on land the farm cannot access.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TreeSaw:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Clears the current target and cancels the cut timer.
function TreeSaw:onDeactivate() end

--- Client only: starts the animation nodes and the saw sound.
function TreeSaw:onTurnedOn() end

--- Clears the target and cancels the timer; on the client also stops animations, effects and sounds.
function TreeSaw:onTurnedOff() end
