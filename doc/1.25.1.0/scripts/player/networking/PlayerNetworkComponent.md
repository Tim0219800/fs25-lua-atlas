# player/networking/PlayerNetworkComponent.lua

*[Version française](../../../fr/scripts/player/networking/PlayerNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerNetworkComponent.lua` — FS25 1.25.1.0

✍ Abstract base class for the player's network components. It stores the owning player and declares empty hooks (update, updateTick, stream read/write, debugDraw) that the local, remote and server subclasses override.

- **PlayerNetworkComponent** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerNetworkComponent.new(player: Player, custom_mt: table) → PlayerNetworkComponent` | 18 | ✍ Creates an instance with the given metatable and owning player. Meant to be called only by subclass constructors. |
| `PlayerNetworkComponent:update(dt: number)` | 39 | ✍ Empty per-frame hook, overridden by subclasses. |
| `PlayerNetworkComponent:updateTick(dt: number)` | 45 | ✍ Empty per-tick hook, overridden by subclasses. |
| `PlayerNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 53 | ✍ Empty hook that subclasses override to write their state to the outgoing stream. |
| `PlayerNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 62 | ✍ Empty hook that subclasses override to read their state from the incoming stream. |
| `PlayerNetworkComponent:debugDraw(x: number, y: number, textSize: number) → number` | 72 | ✍ Debug hook that draws nothing and returns the unchanged y position; subclasses may override it. |
