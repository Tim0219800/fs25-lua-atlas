# vehicles/ai/AICollisionTriggerHandler.lua

*[Version française](../../../fr/scripts/vehicles/ai/AICollisionTriggerHandler.md)*

Source: `dataS/scripts/vehicles/ai/AICollisionTriggerHandler.lua` — FS25 1.25.1.0

✍ Helper used by AI strategies to detect obstacles ahead of an AI-driven vehicle chain. On the server it gathers collision triggers from all child vehicles, periodically casts a vehicle-collision query along each trigger path, and tracks dynamic and static hit points. It reports blocked state, static collision and nearest collision distance through callbacks set by the strategy.

- **AICollisionTriggerHandler** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `AICollisionTriggerHandler.new(customMt: any)` | 20 | ✍ Constructor; sets empty trigger tables, no collision, and infinite hit distances. |
| `AICollisionTriggerHandler:init(vehicle: any, strategy: any)` | 40 | ✍ Server only: collects collision triggers from all child vehicles of the root vehicle via `getAICollisionTriggers` and `getAIImplementCollisionTriggers`, initializes each trigger's state and staggers their update indices. |
| `AICollisionTriggerHandler:update(dt: any, movingDirection: any)` | 97 | ✍ Updates hit distances every frame and, on each trigger's staggered turn, rebuilds its path and issues the engine `getVehicleCollisionDistance` query. Calls the distance callback with the minimum distance and draws debug lines in AI debug mode. |
| `AICollisionTriggerHandler:setStaticCollisionCallback(callback: any)` | 151 | ✍ Sets the callback invoked when the presence of a static collision changes. |
| `AICollisionTriggerHandler:updateStaticCollisionCallback()` | 157 | ✍ Recomputes whether any trigger has a static collision and calls the static callback only when that state changed. |
| `AICollisionTriggerHandler:setIsBlockedCallback(callback: any)` | 177 | ✍ Sets the callback invoked when the blocked state changes. |
| `AICollisionTriggerHandler:updateBlockedCallback()` | 183 | ✍ Recomputes whether any trigger has a dynamic collision and calls the blocked callback only when that state changed. |
| `AICollisionTriggerHandler:setCollisionDistanceCallback(callback: any)` | 203 | ✍ Sets the callback that receives the smallest collision distance each update. |
| `AICollisionTriggerHandler:generateTriggerPath(vehicle: any, trigger: any, movingDirection: any)` | 209 | ✍ Fills the trigger's sampled path points along its length (front or back node depending on moving direction), placing each at terrain height plus half the trigger height. |
| `AICollisionTriggerHandler:countHitObject(objectId: integer, trigger: table)` | 227 | ✍ Classifies a hit node: players and vehicle-group or moving-obstacle objects add to the dynamic counter, non-dynamic bodies to the static one. Own vehicles, triggers and other dynamic objects such as bales are ignored. |
| `AICollisionTriggerHandler:onVehicleCollisionDistanceCallback(distance: any, objectId: any, subShapeIndex: any, isLast: any, trigger: any)` | 268 | ✍ Asynchronous engine callback of the collision query. Counts each hit, and on the last one updates the trigger's collision flags and stored hit points, then notifies the callbacks. Returns false to stop, true to continue, and ignores calls after a vehicle was deleted. |
