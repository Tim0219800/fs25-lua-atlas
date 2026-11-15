# shop/BuyPlaceableData.lua

Source: `dataS/scripts/shop/BuyPlaceableData.lua` — FS25 1.25.1.0

- **BuyPlaceableData** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BuyPlaceableData.new(customMt: table?) → BuyPlaceableData` | 19 |  |
| `BuyPlaceableData:isValid() → boolean` | 41 |  |
| `BuyPlaceableData:setStoreItem(storeItem: table)` | 56 |  |
| `BuyPlaceableData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 79 |  |
| `BuyPlaceableData:setConfigurations(configurations: table, boughtConfigurations: table)` | 87 |  |
| `BuyPlaceableData:setConfigurationData(configurationData: table)` | 103 |  |
| `BuyPlaceableData:setOwnerFarmId(ownerFarmId: integer)` | 110 |  |
| `BuyPlaceableData:setPrice(price: integer)` | 117 |  |
| `BuyPlaceableData:updatePrice()` | 123 |  |
| `BuyPlaceableData:setDisplacementCosts(displacementCosts: integer)` | 130 |  |
| `BuyPlaceableData:setModifyTerrain(modifyTerrain: boolean)` | 137 |  |
| `BuyPlaceableData:setRealignToTerrainAfterLeveling(realignToTerrain: boolean)` | 144 |  |
| `BuyPlaceableData:readStream(streamId: integer, connection: table)` | 152 |  |
| `BuyPlaceableData:writeStream(streamId: integer, connection: table)` | 176 |  |
| `BuyPlaceableData:buy(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 200 |  |
