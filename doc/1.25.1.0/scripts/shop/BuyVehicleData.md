# shop/BuyVehicleData.lua

Source: `dataS/scripts/shop/BuyVehicleData.lua` — FS25 1.25.1.0

- **BuyVehicleData** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BuyVehicleData.new(customMt: table?) → BuyVehicleData` | 19 |  |
| `BuyVehicleData:isValid() → boolean` | 39 |  |
| `BuyVehicleData:setStoreItem(storeItem: table)` | 54 |  |
| `BuyVehicleData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 61 |  |
| `BuyVehicleData:setConfigurations(configurations: table, boughtConfigurations: table)` | 69 |  |
| `BuyVehicleData:setConfigurationData(configurationData: table)` | 85 |  |
| `BuyVehicleData:setLeaseVehicle(leaseVehicle: boolean)` | 92 |  |
| `BuyVehicleData:setOwnerFarmId(ownerFarmId: integer)` | 99 |  |
| `BuyVehicleData:setLicensePlateData(licensePlateData: table)` | 106 |  |
| `BuyVehicleData:setSaleItem(saleItem: table)` | 113 |  |
| `BuyVehicleData:setPrice(price: integer)` | 120 |  |
| `BuyVehicleData:updatePrice()` | 126 |  |
| `BuyVehicleData:getIsLimitedObjectPurchase() → boolean, boolean` | 138 |  |
| `BuyVehicleData:readStream(streamId: integer, connection: table)` | 152 |  |
| `BuyVehicleData:writeStream(streamId: integer, connection: table)` | 175 |  |
| `BuyVehicleData:buy(storePlaces: table, usedStorePlaces: table, callback: function?, callbackTarget: table?, callbackArguments: table?)` | 201 |  |
