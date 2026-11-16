# player/networking/PlayerRemoteNetworkComponent.lua

*[Version française](../../../fr/scripts/player/networking/PlayerRemoteNetworkComponent.md)*

Source: `dataS/scripts/player/networking/PlayerRemoteNetworkComponent.lua` — FS25 1.25.1.0

✍ Client-side network component for players controlled by someone else. It reads the server's position, yaw and state flags and feeds them to the positional interpolator so the remote avatar moves smoothly.

- **PlayerRemoteNetworkComponent** inherits from `PlayerNetworkComponent` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerRemoteNetworkComponent.new(player: Player) → PlayerRemoteNetworkComponent` | 18 | ✍ Constructor. Creates the component for the given player. |
| `PlayerRemoteNetworkComponent:readUpdateStream(streamId: integer, connection: Connection, timestamp: integer)` | 32 | ✍ Reads controlled/skip flags, position, compressed yaw, grounded, first-person, crouch and visibility. Applies visibility and crouch state, sets the interpolator targets and starts a new network interpolation phase. |
