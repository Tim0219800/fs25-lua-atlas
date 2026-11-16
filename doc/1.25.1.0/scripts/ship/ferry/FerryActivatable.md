# ship/ferry/FerryActivatable.lua

*[Version française](../../../fr/scripts/ship/ferry/FerryActivatable.md)*

Source: `dataS/scripts/ship/ferry/FerryActivatable.lua` — FS25 1.25.1.0

✍ Activatable (action prompt) that lets a player start a ferry from a trigger. It reads the ferry's `getCanActivateDriving`, uses the localized text `action_startFerry`, and calls `ferry:start()` on activation. The `Ferry` class and the `trigger` assignment are not in this file (UNVERIFIED).

- **FerryActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FerryActivatable.new(ferry: any)` | 15 | ✍ Creates the activatable for a ferry. The `trigger` node starts nil and must be set by the owner; the prompt text comes from `action_startFerry`. |
| `FerryActivatable:getIsActivatable()` | 32 | ✍ Returns true when the ferry reports it can currently be started by driving, otherwise false. |
| `FerryActivatable:getDistance(posX: any, posY: any, posZ: any)` | 42 | ✍ Returns the horizontal (XZ) distance from the given position to the trigger node. Would fail if `trigger` is still nil. |
| `FerryActivatable:run()` | 50 | ✍ Starts the ferry by calling `ferry:start()` with no connection argument. |
