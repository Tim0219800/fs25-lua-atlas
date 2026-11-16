# player/networking/PlayerServerNetworkComponent.lua

*[Version française](../../../fr/scripts/player/networking/PlayerServerNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerServerNetworkComponent.lua` — FS25 1.25.1.0

✍ Server-side network component that receives each client's movement input, queues it in the physics system and sends authoritative state back, with the controlling client getting its acknowledged tick index. The tick bookkeeping is skipped for the player who owns the server process.

- **PlayerServerNetworkComponent** inherits from `PlayerNetworkComponent` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerServerNetworkComponent.new(player: Player) → PlayerServerNetworkComponent` | 18 | ✍ Constructor. Creates the component and, for non-owner players, a tick history and next-send tick counter. Initialises the skip and first-person flags to false. |
| `PlayerServerNetworkComponent:update(dt: number)` | 52 | ✍ Empty per-frame hook. |
| `PlayerServerNetworkComponent:updateTick(dt: number)` | 59 | ✍ Per-tick step: for non-owners, removes history entries whose physics index is already simulated, records the latest one as the tick to send and raises the default dirty flag so clients get an update. |
| `PlayerServerNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 87 | ✍ Writes the state to a client: the acknowledged tick (controlling client only), flags, and the position. Other clients also get yaw, grounded (from the capsule), first-person, crouch and graphics visibility. |
| `PlayerServerNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 132 | ✍ Reads a client's tick, movement, yaw, first-person and crouch flags (ignored for the host's own player). Queues the move in the capsule controller, sets yaw and crouch, and records the physics index in the tick history. |
