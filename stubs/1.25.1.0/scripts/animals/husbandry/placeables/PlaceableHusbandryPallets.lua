---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryPallets.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for husbandries that output goods on pallets (for example wool or eggs). It requires `PlaceableHusbandryAnimals`. Animals produce liters per hour, accumulated as pending liters, and the server spawns or reuses pallets through a `PalletSpawner` and fills them. It synchronizes fill levels and capacities to clients, saves the pending liters, and reads `placeable.husbandry.pallets.palletSpawner`.
---@class PlaceableHusbandryPallets
PlaceableHusbandryPallets = {}

--- Returns true only if the placeable type has the `PlaceableHusbandryAnimals` specialization.
---@param specializations table
---@return boolean
function PlaceableHusbandryPallets.prerequisitesPresent(specializations) end

--- Registers new placeable functions: pallet trigger callback, pallet queries and spawning (`updatePallets`, `addPendingLiters`, `getPalletCallback`), warning display and `updatePalletInfo`.
---@param placeableType any
function PlaceableHusbandryPallets.registerFunctions(placeableType) end

--- Registers overrides of `getConditionInfos`, `updateOutput` and `updateInfo`.
---@param placeableType any
function PlaceableHusbandryPallets.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, the four stream events (read/write initial and update) and onHusbandryAnimalsUpdate.
---@param placeableType any
function PlaceableHusbandryPallets.registerEventListeners(placeableType) end

--- Declares the repeatable `husbandry.pallets.palletSpawner` XML: `palletTrigger#node`, fill types, `#unitText`, `#maxNumPallets` and the `PalletSpawner` paths. Note: `#unitText` is registered but `onLoad` here does not read it.
---@param schema any
---@param basePath any
function PlaceableHusbandryPallets.registerXMLPaths(schema, basePath) end

--- Declares the savegame paths `pendingLiters(?)#fillType` and `#liters` used to persist pending output.
---@param schema any
---@param basePath any
function PlaceableHusbandryPallets.registerSavegameXMLPaths(schema, basePath) end

--- Builds per-fill-type tables, creates one `PalletSpawner` per XML spawner (warns on duplicate fill types), and on the server collects pallet triggers that have the VEHICLE collision bit. Also sets a dirty flag and warns if an animal subtype outputs a pallet fill type the husbandry does not support.
---@param savegame any
function PlaceableHusbandryPallets:onLoad(savegame) end

--- Deletes every pallet spawner and removes the pallet triggers that were added.
function PlaceableHusbandryPallets:onDelete() end

--- Registers the pallet triggers with `addTrigger` and the callback `onPalletTriggerCallback`, marking them as added.
function PlaceableHusbandryPallets:onFinalizePlacement() end

--- Client: reads, per fill type, the fill level and capacity (float32) and the pallet-limit-reached flag from the initial stream.
---@param streamId any
---@param connection any
function PlaceableHusbandryPallets:onReadStream(streamId, connection) end

--- Server: writes the last sent fill levels and capacities per fill type, then the pallet-limit-reached flag.
---@param streamId any
---@param connection any
function PlaceableHusbandryPallets:onWriteStream(streamId, connection) end

--- Client: if the server's dirty bit is set, reads the same data as the initial stream (levels, capacities, limit flag).
---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryPallets:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: when the placeable dirty flag is set in the mask, writes levels, capacities and the limit flag to the client.
---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryPallets:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Loads the saved pending liters per fill type, then refreshes the pallet info.
---@param xmlFile any
---@param key any
function PlaceableHusbandryPallets:loadFromXMLFile(xmlFile, key) end

--- Saves each fill type that still has pending liters above 0 under `pendingLiters(i)`.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryPallets:saveToXMLFile(xmlFile, key, usedModNames) end

--- Resets liters per hour and recomputes them from the animal clusters (output curve at age times animal count divided by 24), and lists the fill types currently produced.
---@param clusters any
function PlaceableHusbandryPallets:onHusbandryAnimalsUpdate(clusters) end

--- Trigger callback; only handles leave events: forgets the leaving pallet object (current and tracked pallets) and refreshes pallet info.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableHusbandryPallets:onPalletTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Server only, and only if no query is running: resets pending sums and asks each pallet spawner for all its pallets, with `getAllPalletsCallback` as the answer.
function PlaceableHusbandryPallets:updatePalletInfo() end

--- Adds each pallet's capacity and fill level to pending totals; when all queries are done, publishes fill levels and capacities (using max pallets times the largest capacity if there is room for more pallets) and raises the dirty flag when a value moved by more than 1.
---@param pallets any
---@param fillTypeIndex any
function PlaceableHusbandryPallets:getAllPalletsCallback(pallets, fillTypeIndex) end

--- Server only: if no spawn is pending, asks the pallet spawner for a pallet (existing or new) for each fill type having more than 5 pending liters.
function PlaceableHusbandryPallets:updatePallets() end

--- Server only: adds positive liters to the pending amount of a supported fill type and triggers pallet spawning. Returns the liters added, or 0 if client, non-positive amount or unsupported fill type.
---@param fillTypeIndex integer
---@param liters number
---@return number
function PlaceableHusbandryPallets:addPendingLiters(fillTypeIndex, liters) end

--- Spawner answer: stores the pallet, clears the limit flag, empties a newly spawned pallet and fills it with pending liters, retriggering if over 5 remain. On no space it shows a blocked warning; on the pallet limit it sets the limit flag. Finally refreshes pallet info.
---@param pallet any
---@param result any
---@param fillTypeIndex any
function PlaceableHusbandryPallets:getPalletCallback(pallet, result, fillTypeIndex) end

--- Once per output cycle, on the server broadcasts `AnimalHusbandryNoMorePalletSpaceEvent` to the owner farm and shows the local warning.
---@param fillTypeIndex any
function PlaceableHusbandryPallets:showSpawnerBlockedWarning(fillTypeIndex) end

--- Client, only for the owner farm: shows a critical in-game notification that the pallet spawner of this husbandry is blocked for the fill type.
---@param fillTypeIndex any
function PlaceableHusbandryPallets:showPalletBlockedWarning(fillTypeIndex) end

--- Override. After the parent, adds a highlighted too-many-pallets entry to the info table when the pallet limit is reached.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryPallets:updateInfo(superFunc, infoTable) end

--- Override. For each currently produced fill type, appends an inverted condition bar with fill level and capacity ratio. Note: it uses `spec.fillTypeUnit`, which this file never sets (UNVERIFIED).
---@param superFunc any
function PlaceableHusbandryPallets:getConditionInfos(superFunc) end

--- Override. Calls the parent, clears the warning flag and, on the server, adds liters per hour times production factors times `timeAdjustment` to pending liters, then spawns pallets if needed.
---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryPallets:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end
