# events/PlayerPermissionsEvent.lua

*[Version française](../../fr/scripts/events/PlayerPermissionsEvent.md)*

Source: `dataS/scripts/events/PlayerPermissionsEvent.lua` — FS25 1.25.1.0

✍ Event class for pushing a player's farm permissions. In this dump only the static helper `sendEvent` is present; `new`, the stream methods and `run` are absent, so what the event carries and how it is applied are UNVERIFIED.

- **PlayerPermissionsEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerPermissionsEvent.sendEvent(userId: integer, permissions: table, isFarmManager: boolean, noEventSend: boolean)` | 113 | ✍ Builds the event (unless `noEventSend` is true). On a server it broadcasts it, passing the player found through the user's farm; on a client it sends it to the server connection. Assumes the user belongs to a farm. |
