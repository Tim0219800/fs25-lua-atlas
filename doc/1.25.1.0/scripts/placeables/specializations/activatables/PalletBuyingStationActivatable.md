# placeables/specializations/activatables/PalletBuyingStationActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/PalletBuyingStationActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/PalletBuyingStationActivatable.lua` — FS25 1.25.1.0

✍ Activatable object for a pallet buying station placeable. It is available to players who can access the placeable, with a caller-supplied prompt text, and running it opens the placeable shop.

- **PalletBuyingStationActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletBuyingStationActivatable.new(placeable: any, text: any)` | 15 | ✍ Creates the activatable for a placeable with the given prompt text. |
| `PalletBuyingStationActivatable:getIsActivatable()` | 26 | ✍ Returns whether the local player may access the placeable according to the access handler. |
| `PalletBuyingStationActivatable:run()` | 32 | ✍ Calls `openShop` on the placeable. |
