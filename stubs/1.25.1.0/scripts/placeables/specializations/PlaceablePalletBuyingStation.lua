---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceablePalletBuyingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a pallet buying station: a trigger opens a shop of pallets (one per configured fill type, priced from the pallet store item and the economy multiplier) and a PalletSpawner creates the bought pallets. The station registers with the mission storage system. This file declares no registerEventListeners, so how onLoad/onDelete are wired is UNVERIFIED here; PalletBuyingStationActivatable is defined elsewhere.
---@class PlaceablePalletBuyingStation
PlaceablePalletBuyingStation = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceablePalletBuyingStation.prerequisitesPresent(specializations) end

--- Reads the trigger node (error and early return if missing), optional pallet spawner, and the fillType entries to build the pallet list with price = store price x priceScale x economy multiplier. Creates the activatable and registers the station in the storage system; returns true on success. The trigger callback onActivationTriggerCallback is not defined in this file.
---@param savegame table
function PlaceablePalletBuyingStation:onLoad(savegame) end

--- Unregisters the station from the storage system, deletes the pallet spawner if any and removes the trigger.
function PlaceablePalletBuyingStation:onDelete() end
