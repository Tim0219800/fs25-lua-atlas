# shop/BuyVehicleData.lua

*[Version française](../../fr/scripts/shop/BuyVehicleData.md)*

Source: `dataS/scripts/shop/BuyVehicleData.lua` — FS25 1.25.1.0

✍ Data holder for buying a vehicle or changing an existing vehicle's configuration: store item, configurations, lease flag, owner, license plate, sale item and price. It is serialized for multiplayer (using g_vehicleConfigurationManager) and executes the purchase through VehicleLoadingData at given store places. The onBought callback used by buy is not defined in this file (UNVERIFIED).

- **BuyVehicleData** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `BuyVehicleData.new(customMt: table?) → BuyVehicleData` | 19 | ✍ Creates empty purchase data: no item, empty configuration tables, not leased, owner EVERYONE, no license plate or sale item, price 0. |
| `BuyVehicleData:isValid() → boolean` | 39 | ✍ Returns true when a store item is set; on console builds its XML file must also exist. |
| `BuyVehicleData:setStoreItem(storeItem: table)` | 54 | ✍ Sets the store item to buy. |
| `BuyVehicleData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 61 | ✍ Sets whether the vehicle is given for free, for example as a reward. |
| `BuyVehicleData:setConfigurations(configurations: table, boughtConfigurations: table)` | 69 | ✍ Stores the selected and bought configurations (nil keeps the current ones) and marks every selected configuration index as bought. |
| `BuyVehicleData:setConfigurationData(configurationData: table)` | 85 | ✍ Stores the per-configuration extra data; nil keeps the current value. |
| `BuyVehicleData:setLeaseVehicle(leaseVehicle: boolean)` | 92 | ✍ Sets whether the vehicle is leased instead of bought; this changes the price in updatePrice and the property state in buy. |
| `BuyVehicleData:setOwnerFarmId(ownerFarmId: integer)` | 99 | ✍ Sets the id of the farm that will own the vehicle. |
| `BuyVehicleData:setLicensePlateData(licensePlateData: table)` | 106 | ✍ Sets the license plate data transmitted with the purchase. |
| `BuyVehicleData:setSaleItem(saleItem: table)` | 113 | ✍ Sets the used-vehicle sale entry when the purchase comes from the sales list; it also influences the price and is passed to the loading data. |
| `BuyVehicleData:setPrice(price: integer)` | 120 | ✍ Sets the purchase price directly, overriding any computed price. |
| `BuyVehicleData:updatePrice()` | 126 | ✍ Recomputes the price from the economy manager for the item, configurations and sale item; for a lease it converts that price into the initial leasing price. |
| `BuyVehicleData:getIsLimitedObjectPurchase() → boolean, boolean` | 138 | ✍ Opens the store item's XML and returns two booleans: bale purchase and pallet purchase, from the `vehicle.multipleItemPurchase#isVehicle` attribute. Both are false if the element is absent. |
| `BuyVehicleData:readStream(streamId: integer, connection: table)` | 152 | ✍ Reads from a network stream the store item, free flag, configurations, lease flag, owner farm, license plate data and a sale id (0 means none, otherwise it looks up the sale via vehicleSaleSystem). The price is not transmitted. |
| `BuyVehicleData:writeStream(streamId: integer, connection: table)` | 175 | ✍ Writes the same fields as readStream, in the same order, to a network stream; the sale item is sent as its id or 0. |
| `BuyVehicleData:buy(storePlaces: table, usedStorePlaces: table, callback: function?, callbackTarget: table?, callbackArguments: table?)` | 201 | ✍ Starts the purchase by loading the vehicle(s) with a VehicleLoadingData configured with the item, configurations, store places, owned or leased state, owner and sale item. The callback is wrapped and called through self.onBought, not defined here (UNVERIFIED). |
