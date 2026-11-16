# triggers/BasketTrigger.lua

*[Version française](../../fr/scripts/triggers/BasketTrigger.md)*

Source: `dataS/scripts/triggers/BasketTrigger.lua` — FS25 1.25.1.0

✍ Small trigger class for a basket (target area) placed in a map through the onCreate mechanism. It registers a trigger and remembers which objects that were thrown (those with a thrownFromPosition field) entered it. Distance or scoring logic exists only as commented-out code, so in this dump the trigger has no visible gameplay effect.

- **BasketTrigger** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BasketTrigger:onCreate(id: integer)` | 16 | ✍ Map onCreate entry point: creates a trigger from the given node and registers it as non-updateable in the mission if loading succeeds, otherwise deletes it. |
| `BasketTrigger.new(customMt: table?) → table` | 29 | ✍ Constructor. Creates an instance with trigger and node ids set to 0. |
| `BasketTrigger:load(nodeId: integer) → boolean` | 42 | ✍ Resolves the trigger shape from the node's triggerIndex user attribute (falling back to the node itself), registers the trigger callback, enables it and returns true. |
| `BasketTrigger:delete()` | 60 | ✍ Removes the trigger registration. |
| `BasketTrigger:triggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: any)` | 71 | ✍ When enabled, flags an entering actor as inside if its object has a thrownFromPosition, and clears the flag when it leaves. Note: the object returned for the actor is not checked for nil on enter, which would raise an error for unknown nodes. |
