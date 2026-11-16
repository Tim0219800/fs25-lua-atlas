# objects/ProductionPointActivatable.lua

*[Version française](../../fr/scripts/objects/ProductionPointActivatable.md)*

Source: `dataS/scripts/objects/ProductionPointActivatable.lua` — FS25 1.25.1.0

✍ Activatable shown when the player stands in a production point's interaction trigger. Depending on ownership it offers to buy the production point or to manage it (open the production menu). Created and registered by ProductionPoint's interaction trigger callback.

- **ProductionPointActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionPointActivatable.new(productionPoint: any)` | 15 | ✍ Creates the activatable for a production point, keeps its mission and sets the action text. |
| `ProductionPointActivatable:updateText()` | 28 | ✍ Sets the action text to 'buy' when the point is unowned and buying uses the interaction trigger, otherwise to 'manage'. |
| `ProductionPointActivatable:getIsActivatable()` | 38 | ✍ True if the local farm has access to the production point according to the access handler. |
| `ProductionPointActivatable:run()` | 44 | ✍ If the point is unowned (EVERYONE) and buyable through the trigger, starts the purchase request; if the local farm owns it, opens the production menu. |
| `ProductionPointActivatable:getDistance(x: any, y: any, z: any)` | 56 | ✍ Returns the distance from the position to the interaction trigger node for an owned point not bought through the trigger; otherwise math.huge so it is never preferred. |
