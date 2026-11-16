# triggers/LadderTrigger.lua

*[Version française](../../fr/scripts/triggers/LadderTrigger.md)*

Source: `dataS/scripts/triggers/LadderTrigger.lua` — FS25 1.25.1.0

✍ Client-side trigger that tells the local player's mover it is on a ladder while the player's root node is inside the trigger volume. It is created from an i3d trigger node at map load and warns if the node's collision mask lacks the player bit.

- **LadderTrigger** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `LadderTrigger:onCreate(id: integer)` | 16 | ✍ Map-load entry point for a ladder trigger node: builds a LadderTrigger and adds it to the mission's non-updateable objects. |
| `LadderTrigger.new(node: integer) → table` | 24 | ✍ Creates the instance. Only on a client it checks that the node's collision mask has the PLAYER flag (warning otherwise) and registers the physics trigger callback `triggerCallback`; on a dedicated server nothing is registered. |
| `LadderTrigger:delete()` | 42 | ✍ Removes the physics trigger if one was registered. |
| `LadderTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 55 | ✍ On enter or leave of the local player's root node, calls setIsOnLadder(true) or (false) on the local player's mover. Other actors and stay events are ignored. |
