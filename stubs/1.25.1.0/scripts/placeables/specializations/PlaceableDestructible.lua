---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDestructible.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a constructible placeable be destroyed and repaired by moving between its constructible states (XML `destruct` and `repair` transitions, resolved through `getConstructibleStateIndexByName`). It requires `PlaceableConstructible`, adds an optional player trigger with an activatable, a repair bonus and a destruction sound, and saves the repairing farm id. Many of its registered functions (`destruct`, `destructed`, `startRepairDestructible`, `finalizeConstruction`, etc.) have no body in the dump: UNVERIFIED.
---@class PlaceableDestructible
PlaceableDestructible = {}

--- Declares the `destructible` XML keys: trigger node, destruct and repair state transitions (`from`/`to`), repair bonus and a `destructed` sound.
---@param schema any
---@param basePath any
function PlaceableDestructible.registerXMLPaths(schema, basePath) end

--- Declares the savegame key `repairingFarm#id`.
---@param schema any
---@param basePath any
function PlaceableDestructible.registerSavegameXMLPaths(schema, basePath) end

--- Returns true only if the `PlaceableConstructible` specialization is present.
---@param specializations table
---@return boolean
function PlaceableDestructible.prerequisitesPresent(specializations) end

--- Registers seven functions, among them `destruct`, `destructed`, `startRepairDestructible`, `getCanRepairDestructible`, `getCanBeDestructedByTwister` and `onDestructibleTriggerCallback`. Only the trigger callback has a body in the dump.
---@param placeableType any
function PlaceableDestructible.registerFunctions(placeableType) end

--- Overrides `finalizeConstruction`; its replacement has no body in the dump (UNVERIFIED).
---@param placeableType any
function PlaceableDestructible.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete` and `onFinalizePlacement`; no `onDelete` body appears in the dump (UNVERIFIED).
---@param placeableType any
function PlaceableDestructible.registerEventListeners(placeableType) end

--- Builds the destruct and repair transition tables from the XML by state name (logging an XML error on an unknown state), reads the repair bonus and trigger node (warning if it lacks the player collision bit), loads the destruction sound on clients and creates the `DestructibleActivatable`.
---@param savegame table
function PlaceableDestructible:onLoad(savegame) end

--- Registers the destructible trigger callback on the trigger node, if one is defined.
function PlaceableDestructible:onFinalizePlacement() end

--- Saves the repairing farm id when one is set.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableDestructible:saveToXMLFile(xmlFile, key, usedModNames) end

--- Restores the repairing farm id if the farm still exists; otherwise logs a warning. Note: the warning passes `xmlFile` as first argument of `Logging.warning`, which looks like a mistake.
---@param xmlFile any
---@param key any
function PlaceableDestructible:loadFromXMLFile(xmlFile, key) end

--- Trigger callback: adds the destructible activatable when the local player enters, removes it when the player leaves.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableDestructible:onDestructibleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay) end
