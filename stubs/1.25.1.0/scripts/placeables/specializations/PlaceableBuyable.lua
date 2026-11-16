---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBuyable.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for existing buildings the player can buy from the world. It adds an optional buy trigger and marker node, shows a `BuyBuildingActivatable` when the local player enters the trigger, asks for confirmation and sends a `BuyExistingPlaceableEvent` to the server. The trigger is active only while the owner is `AccessHandler.EVERYONE`.
---@class PlaceableBuyable
PlaceableBuyable = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableBuyable.prerequisitesPresent(specializations) end

--- Registers `onBuyingTriggerCallback`, `setIsBuyingTriggerActive`, `buyRequest` and `getHasBuyingTrigger`. The bodies of `setIsBuyingTriggerActive` and `getHasBuyingTrigger` are not in the dump: UNVERIFIED.
---@param placeableType any
function PlaceableBuyable.registerFunctions(placeableType) end

--- Overrides `setOwnerFarmId`.
---@param placeableType any
function PlaceableBuyable.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad` and `onDelete`.
---@param placeableType any
function PlaceableBuyable.registerEventListeners(placeableType) end

--- Declares the optional XML keys `buyable.trigger#node` and `buyable.marker#node`.
---@param schema any
---@param basePath any
function PlaceableBuyable.registerXMLPaths(schema, basePath) end

--- Creates the `BuyBuildingActivatable`, loads the optional trigger and marker nodes, registers the trigger callback and marks the trigger as active.
---@param savegame table
function PlaceableBuyable:onLoad(savegame) end

--- Removes the activatable, the trigger marker (if any) and the trigger node.
function PlaceableBuyable:onDelete() end

--- Trigger callback for the local player: on enter adds the activatable (or runs it directly when the platform auto-activates triggers), on leave removes it. Does nothing when the trigger is inactive.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function PlaceableBuyable:onBuyingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Client side: refused during a guided tour. Computes the price (plus the unowned farmland price when the placeable buys farmland), asks yes/no, then sends `BuyExistingPlaceableEvent` to the server and calls `onBuy` when the answer event arrives.
---@param requestCallback any
---@param target any
function PlaceableBuyable:buyRequest(requestCallback, target) end

--- Calls the parent, then activates the buying trigger only when the new owner is `AccessHandler.EVERYONE`.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableBuyable:setOwnerFarmId(superFunc, farmId, noEventSend) end
