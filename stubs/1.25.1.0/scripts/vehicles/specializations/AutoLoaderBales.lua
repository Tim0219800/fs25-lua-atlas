---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoaderBales.lua (generated stub, FS25 Lua Atlas)

--- Specialization that automatically picks up bales entering a trigger and either mounts them on a spawn node or drops them there as physics objects. It targets tools such as straw blowers or mixer wagons, on platforms that enable automatic loading. Bale types are defined in XML by size (round or square) and optional fill types. Detection and mounting run on the server only, and mounted bales are saved with the vehicle.
---@class AutoLoaderBales
AutoLoaderBales = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function AutoLoaderBales.prerequisitesPresent(specializations) end

--- Registers the XML keys under `vehicle.autoLoaderBales` (pickup trigger, bale types with fill types, dimensions and spawn place settings) and the savegame bale paths.
function AutoLoaderBales.initSpecialization() end

--- Registers `autoLoaderBalesTriggerCallback`, `getAutoLoadBaleTypeFromBale`, `doAutoLoadBale` and `getIsBaleAutoLoadable`.
---@param vehicleType any
function AutoLoaderBales.registerFunctions(vehicleType) end

--- Empty: this specialization overrides no vehicle function.
---@param vehicleType any
function AutoLoaderBales.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onLoadFinished, onDelete and onUpdate.
---@param vehicleType any
function AutoLoaderBales.registerEventListeners(vehicleType) end

--- Initialises the bale tables. On the server it adds the pickup trigger and reads each bale type; a type needs a spawn node and either diameter and width, or width, height and length, otherwise a warning is logged and it is skipped.
---@param savegame table
function AutoLoaderBales:onLoad(savegame) end

--- When a non-reset savegame is given, recreates each saved bale, applies its attributes and loads it into a matching bale type; bales without a matching type are deleted.
---@param savegame table
function AutoLoaderBales:onLoadFinished(savegame) end

--- Removes the trigger and delete listeners, unmounts every mounted bale and flags it as needing to be saved so it persists in the world.
function AutoLoaderBales:onDelete() end

--- Saves each mounted bale through the bale's own save routine under indexed `bale` keys.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoaderBales:saveToXMLFile(xmlFile, key, usedModNames) end

--- Every update, after a short pickup delay (counted in updates, not time), picks the highest loadable bale in the trigger whose type still has room and loads it, then sets the delay to 10 updates.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AutoLoaderBales:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Delete listener for mounted bales: forgets the bale, decrements the mounted count and clears the loaded bale type once none remains.
---@param self any
---@param object any
function AutoLoaderBales.onDeleteAutoLoaderBalesObject(self, object) end

--- Delete listener for bales inside the trigger: removes the bale from the in-trigger table.
---@param self any
---@param object any
function AutoLoaderBales.onBaleDeleted(self, object) end

--- Trigger callback that keeps a per-bale counter of shapes inside the trigger, only for bales the active farm may access and that allow pickup. Any non-enter event, including stay, decrements the counter.
---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function AutoLoaderBales:autoLoaderBalesTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Returns the first bale type compatible with the bale (same type as already loaded if any, allowed fill type, matching size), or nil if none fits.
---@param bale any
function AutoLoaderBales:getAutoLoadBaleTypeFromBale(bale) end

--- If the type mounts bales, mounts the bale kinematically on the spawn node, offset by the number already mounted, and records it. Otherwise it teleports the bale to the spawn node and gives it the parent component's velocity.
---@param baleType any
---@param bale any
function AutoLoaderBales:doAutoLoadBale(baleType, bale) end

--- Returns true if the bale is not currently mounted on any object.
---@param bale any
function AutoLoaderBales:getIsBaleAutoLoadable(bale) end
