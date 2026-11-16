# shop/BuyHandToolData.lua

*[Version française](../../fr/scripts/shop/BuyHandToolData.md)*

Source: `dataS/scripts/shop/BuyHandToolData.lua` — FS25 1.25.1.0

✍ Data holder for buying a hand tool: store item, free-of-charge flag, owner farm and price. It can be sent over the network (readStream/writeStream) and executes the purchase through HandToolLoadingData. The onBought callback used by buy is not defined in this file (UNVERIFIED), and `holder` is only read here, never set.

- **BuyHandToolData** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `BuyHandToolData.new(customMt: any) → table` | 17 | ✍ Creates empty purchase data: no store item, not free, owner AccessHandler.EVERYONE, price 0 and no holder. |
| `BuyHandToolData:isValid() → boolean` | 32 | ✍ Returns true when a store item is set; on console builds the item's XML file must also exist. |
| `BuyHandToolData:setStoreItem(storeItem: table)` | 51 | ✍ Sets the store item to buy. |
| `BuyHandToolData:setIsFreeOfCharge(isFreeOfCharge: boolean)` | 58 | ✍ Sets whether the tool is given for free, for example as a reward. |
| `BuyHandToolData:setOwnerFarmId(ownerFarmId: integer)` | 65 | ✍ Sets the id of the farm that will own the tool. |
| `BuyHandToolData:setPrice(price: integer)` | 72 | ✍ Sets the purchase price directly, overriding any computed price. |
| `BuyHandToolData:updatePrice()` | 78 | ✍ Recomputes the price from the economy manager's buy price for the store item. |
| `BuyHandToolData:readStream(streamId: integer, connection: table)` | 86 | ✍ Reads the store item (by lower-cased XML filename), the free flag and the owner farm id from a network stream. The price is not transmitted. |
| `BuyHandToolData:writeStream(streamId: integer, connection: table)` | 97 | ✍ Writes the store item XML filename, the free flag and the owner farm id to a network stream, mirroring readStream. |
| `BuyHandToolData:buy(callback: function?, callbackTarget: table?, callbackArguments: table?)` | 108 | ✍ Starts the purchase by loading the hand tool with a HandToolLoadingData built from this data. The optional callback is wrapped and called through self.onBought after loading, which is not defined here (UNVERIFIED). |
