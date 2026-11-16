# player/networking/PlayerLocalNetworkComponent.lua

*[Version française](../../../fr/scripts/player/networking/PlayerLocalNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerLocalNetworkComponent.lua` — FS25 1.25.1.0

✍ Client-side network component that exists only for the player controlled locally. It records per-tick movement history so that, when the server sends back an authoritative position, the client can replay the not-yet-acknowledged movement on top of it (reconciliation).

- **PlayerLocalNetworkComponent** inherits from `PlayerNetworkComponent` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerLocalNetworkComponent.new(player: Player) → PlayerLocalNetworkComponent` | 21 | ✍ Constructor. Creates the component for the given player with an empty tick history and zeroed accumulated movement. |
| `PlayerLocalNetworkComponent:update(dt: number)` | 46 | ✍ Per-frame update. Opens a new history entry if a tick was requested (trimming the history to a maximum length), then accumulates the mover's position delta into both the outgoing total and the current entry. |
| `PlayerLocalNetworkComponent:updateTick(dt: number)` | 81 | ✍ Per-tick hook. It only flags that a new history entry must be created on the next frame update. |
| `PlayerLocalNetworkComponent:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 91 | ✍ Sends to the server the current tick index, the accumulated movement, compressed yaw, first-person flag and crouch flag, then resets the accumulated movement. Only valid for the owning player. |
| `PlayerLocalNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 116 | ✍ Reads the server's answer (acknowledged tick, controlled/skip flags, authoritative position), sets the mover position, drops acknowledged history and re-applies the remaining history through the capsule controller, aggregated into about five steps. |
