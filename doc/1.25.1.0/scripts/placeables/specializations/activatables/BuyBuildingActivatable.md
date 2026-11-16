# placeables/specializations/activatables/BuyBuildingActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/BuyBuildingActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/BuyBuildingActivatable.lua` — FS25 1.25.1.0

✍ Activatable object that shows a buy-building action prompt for an unowned placeable. It is usable when the local farm can access the placeable, and running it asks the placeable to start a purchase if it still has no owner.

- **BuyBuildingActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BuyBuildingActivatable.new(placeable: any)` | 15 | ✍ Creates the activatable for a placeable and sets the localized prompt `action_buyBuilding`. |
| `BuyBuildingActivatable:getIsActivatable()` | 26 | ✍ Returns whether the current farm may access the placeable according to the mission access handler. |
| `BuyBuildingActivatable:run()` | 32 | ✍ If the placeable owner is the unowned marker (`AccessHandler.EVERYONE`), calls its `buyRequest`; otherwise does nothing. |
