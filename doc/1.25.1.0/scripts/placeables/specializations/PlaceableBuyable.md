# placeables/specializations/PlaceableBuyable.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableBuyable.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableBuyable.lua` — FS25 1.25.1.0

✍ Placeable specialization for existing buildings the player can buy from the world. It adds an optional buy trigger and marker node, shows a `BuyBuildingActivatable` when the local player enters the trigger, asks for confirmation and sends a `BuyExistingPlaceableEvent` to the server. The trigger is active only while the owner is `AccessHandler.EVERYONE`.

- **PlaceableBuyable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableBuyable.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableBuyable.registerFunctions(placeableType: any)` | 25 | ✍ Registers `onBuyingTriggerCallback`, `setIsBuyingTriggerActive`, `buyRequest` and `getHasBuyingTrigger`. The bodies of `setIsBuyingTriggerActive` and `getHasBuyingTrigger` are not in the dump: UNVERIFIED. |
| `PlaceableBuyable.registerOverwrittenFunctions(placeableType: any)` | 34 | ✍ Overrides `setOwnerFarmId`. |
| `PlaceableBuyable.registerEventListeners(placeableType: any)` | 40 | ✍ Subscribes to `onLoad` and `onDelete`. |
| `PlaceableBuyable.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Declares the optional XML keys `buyable.trigger#node` and `buyable.marker#node`. |
| `PlaceableBuyable:onLoad(savegame: table)` | 57 | ✍ Creates the `BuyBuildingActivatable`, loads the optional trigger and marker nodes, registers the trigger callback and marks the trigger as active. |
| `PlaceableBuyable:onDelete()` | 73 | ✍ Removes the activatable, the trigger marker (if any) and the trigger node. |
| `PlaceableBuyable:onBuyingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 111 | ✍ Trigger callback for the local player: on enter adds the activatable (or runs it directly when the platform auto-activates triggers), on leave removes it. Does nothing when the trigger is inactive. |
| `PlaceableBuyable:buyRequest(requestCallback: any, target: any)` | 133 | ✍ Client side: refused during a guided tour. Computes the price (plus the unowned farmland price when the placeable buys farmland), asks yes/no, then sends `BuyExistingPlaceableEvent` to the server and calls `onBuy` when the answer event arrives. |
| `PlaceableBuyable:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 184 | ✍ Calls the parent, then activates the buying trigger only when the new owner is `AccessHandler.EVERYONE`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onBuyingTriggerCallback` | 26 |
| registerFunction | `setIsBuyingTriggerActive` | 27 |
| registerFunction | `buyRequest` | 28 |
| registerFunction | `getHasBuyingTrigger` | 29 |
| registerOverwrittenFunction | `setOwnerFarmId` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
