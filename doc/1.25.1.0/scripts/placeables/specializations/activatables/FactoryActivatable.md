# placeables/specializations/activatables/FactoryActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/FactoryActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/FactoryActivatable.lua` — FS25 1.25.1.0

✍ Activatable object that offers to buy a factory that has no owner yet. The prompt text includes the factory name and running it requests the purchase when the factory is still unowned.

- **FactoryActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FactoryActivatable.new(factory: any)` | 15 | ✍ Creates the activatable for a factory and builds the prompt from `action_buyOBJECT` and the factory name. |
| `FactoryActivatable:getIsActivatable()` | 26 | ✍ Returns true only while the factory owner is the unowned marker (`AccessHandler.EVERYONE`). |
| `FactoryActivatable:run()` | 33 | ✍ If the factory is still unowned, calls its `buyRequest`. |
