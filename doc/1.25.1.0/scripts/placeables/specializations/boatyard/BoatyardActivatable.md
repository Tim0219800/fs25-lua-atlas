# placeables/specializations/boatyard/BoatyardActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/boatyard/BoatyardActivatable.md)*

Source: `dataS/scripts/placeables/specializations/boatyard/BoatyardActivatable.lua` — FS25 1.25.1.0

✍ Activatable object that offers to buy a boatyard that has no owner yet. The prompt includes the boatyard name, and running it requests the purchase if the boatyard is still unowned.

- **BoatyardActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BoatyardActivatable.new(boatyard: any)` | 15 | ✍ Creates the activatable for a boatyard and builds the prompt from `action_buyOBJECT` and the boatyard name. |
| `BoatyardActivatable:getIsActivatable()` | 26 | ✍ Returns true only while the boatyard owner is the unowned marker (`AccessHandler.EVERYONE`). |
| `BoatyardActivatable:run()` | 33 | ✍ If the boatyard is still unowned, calls its `buyRequest`. |
