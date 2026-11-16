---@meta
-- FS25 1.25.1.0 : player/networking/PlayerServerNetworkComponent.lua (generated stub, FS25 Lua Atlas)

--- Server-side network component that receives each client's movement input, queues it in the physics system and sends authoritative state back, with the controlling client getting its acknowledged tick index. The tick bookkeeping is skipped for the player who owns the server process.
---@class PlayerServerNetworkComponent : PlayerNetworkComponent
PlayerServerNetworkComponent = {}

--- Constructor. Creates the component and, for non-owner players, a tick history and next-send tick counter. Initialises the skip and first-person flags to false.
---@param player Player
---@return PlayerServerNetworkComponent
function PlayerServerNetworkComponent.new(player) end

--- Empty per-frame hook.
---@param dt number
function PlayerServerNetworkComponent:update(dt) end

--- Per-tick step: for non-owners, removes history entries whose physics index is already simulated, records the latest one as the tick to send and raises the default dirty flag so clients get an update.
---@param dt number
function PlayerServerNetworkComponent:updateTick(dt) end

--- Writes the state to a client: the acknowledged tick (controlling client only), flags, and the position. Other clients also get yaw, grounded (from the capsule), first-person, crouch and graphics visibility.
---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function PlayerServerNetworkComponent:writeUpdateStream(streamId, connection, dirtyMask) end

--- Reads a client's tick, movement, yaw, first-person and crouch flags (ignored for the host's own player). Queues the move in the capsule controller, sets yaw and crouch, and records the physics index in the tick history.
---@param streamId integer
---@param connection Connection
---@param timestamp integer
function PlayerServerNetworkComponent:readUpdateStream(streamId, connection, timestamp) end
