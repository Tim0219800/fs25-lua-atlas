# shop/BuyPlaceableData.lua

*[Version française](../../fr/scripts/shop/BuyPlaceableData.md)*

Source: `dataS/scripts/shop/BuyPlaceableData.lua` — FS25 1.25.1.0

✍ Data holder for buying a placeable: store item, configurations, owner, price, terrain leveling options, position and rotation. It is serialized for multiplayer (readStream/writeStream, using g_placeableConfigurationManager) and executes the purchase through PlaceableLoadingData. The onLoaded callback used by buy is not defined in this file (UNVERIFIED).

- **BuyPlaceableData** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BuyPlaceableData.new(customMt: table?) → BuyPlaceableData` | 19 | ✍ Creates empty purchase data: no item, empty configuration tables, owner EVERYONE, zero price and displacement costs, no terrain modification, realign enabled, position and rotation zeroed. |
| `BuyPlaceableData:isValid() → boolean` | 41 | ✍ Returns true when a store item is set; on console builds its XML file must also exist. |
| `BuyPlaceableData:setStoreItem(storeItem: table)` | 56 | ✍ Sets the store item to buy. |
| `BuyPlaceableData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 79 | ✍ Sets whether the placeable is given for free, for example as a reward. |
| `BuyPlaceableData:setConfigurations(configurations: table, boughtConfigurations: table)` | 87 | ✍ Stores the selected and bought configurations (nil keeps the current ones) and marks every selected configuration index as bought. |
| `BuyPlaceableData:setConfigurationData(configurationData: table)` | 103 | ✍ Stores the per-configuration extra data; nil keeps the current value. |
| `BuyPlaceableData:setOwnerFarmId(ownerFarmId: integer)` | 110 | ✍ Sets the id of the farm that will own the placeable. |
| `BuyPlaceableData:setPrice(price: integer)` | 117 | ✍ Sets the purchase price directly, overriding any computed price. |
| `BuyPlaceableData:updatePrice()` | 123 | ✍ Recomputes the price from the economy manager's buy price for the store item and its current configurations. |
| `BuyPlaceableData:setDisplacementCosts(displacementCosts: integer)` | 130 | ✍ Sets the displacement (terrain moving) costs, sent with the purchase data. They are not added to the price in this file. |
| `BuyPlaceableData:setModifyTerrain(modifyTerrain: boolean)` | 137 | ✍ Sets whether the terrain is modified (leveled) when placing the placeable. |
| `BuyPlaceableData:setRealignToTerrainAfterLeveling(realignToTerrain: boolean)` | 144 | ✍ Sets whether the placeable is realigned to the terrain after leveling; the default is true. |
| `BuyPlaceableData:readStream(streamId: integer, connection: table)` | 152 | ✍ Reads from a network stream the store item (by lower-cased XML filename), position, rotation, configurations, owner farm, free flag, displacement costs and the terrain flags. The price is not transmitted. |
| `BuyPlaceableData:writeStream(streamId: integer, connection: table)` | 176 | ✍ Writes the same fields as readStream, in the same order, to a network stream. |
| `BuyPlaceableData:buy(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 200 | ✍ Starts the purchase by loading the placeable with a PlaceableLoadingData configured with the item, configurations, owner, position and rotation. The optional callback is wrapped and called through self.onLoaded, not defined here (UNVERIFIED). |
