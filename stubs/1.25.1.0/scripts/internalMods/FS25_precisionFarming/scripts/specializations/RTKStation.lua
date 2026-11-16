---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/RTKStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for RTK base stations of Precision Farming. It has no XML paths or functions of its own and only registers and unregisters the placeable with the precision farming AI extension when placed or deleted.
---@class RTKStation
RTKStation = {}

--- Always returns true: no prerequisite specialization is needed.
---@param specializations table
---@return boolean
function RTKStation.prerequisitesPresent(specializations) end

--- Empty: the specialization adds no new placeable functions.
---@param placeableType any
function RTKStation.registerFunctions(placeableType) end

--- Empty: no placeable function is overwritten.
---@param placeableType any
function RTKStation.registerOverwrittenFunctions(placeableType) end

--- Subscribes the placeable type to onFinalizePlacement and onDelete.
---@param placeableType any
function RTKStation.registerEventListeners(placeableType) end

--- Empty: no XML keys are registered.
---@param schema any
---@param basePath any
function RTKStation.registerXMLPaths(schema, basePath) end

--- Registers this station with g_precisionFarming.aiExtension via registerRTKStation, if the precision farming object exists. What the extension does with it is UNVERIFIED here.
---@param savegame any
function RTKStation:onFinalizePlacement(savegame) end

--- Unregisters this station from g_precisionFarming.aiExtension when the placeable is deleted, if precision farming exists.
function RTKStation:onDelete() end
