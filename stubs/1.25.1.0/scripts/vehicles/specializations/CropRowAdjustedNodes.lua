---@meta
-- FS25 1.25.1.0 : vehicles/specializations/CropRowAdjustedNodes.lua (generated stub, FS25 Lua Atlas)

--- Specialization that slides configured nodes sideways so implement parts line up with crop rows (or the middle between rows) of row crops. Rows are derived from the fruit type's plant spacing and a rasterized world position, snapped to 90 degree directions; only active while lowered, roughly aligned with the rows, and within a configurable distance of the player. Reads 'vehicle.cropRowAdjustedNodes'.
---@class CropRowAdjustedNodes
CropRowAdjustedNodes = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function CropRowAdjustedNodes.prerequisitesPresent(specializations) end

--- Registers the XML schema: max update distance and, per adjusted node, node, translation axis and limits, move speed, between-rows flag, fruit types and fold time limits.
function CropRowAdjustedNodes.initSpecialization() end

--- Registers loadCropRowAdjustedNodeFromXML, updateCropRowAdjustedNode and getIsCropRowAdjustedNodeActive.
---@param vehicleType any
function CropRowAdjustedNodes.registerFunctions(vehicleType) end

--- Subscribes to load and update.
---@param vehicleType any
function CropRowAdjustedNodes.registerEventListeners(vehicleType) end

--- Loads all adjusted nodes from XML and the max update distance; removes the update listener if none loaded.
---@param savegame any
function CropRowAdjustedNodes:onLoad(savegame) end

--- Each frame, if the vehicle is closer to the player than the max update distance, updates every adjusted node.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function CropRowAdjustedNodes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one adjusted node: creates a reference transform group beside it, stores start translation, axis, limits, speed (converted from m/s to m/ms), between-rows flag, fruit types and fold limits. Returns false with a warning if the node or the fruit types are missing.
---@param xmlFile any
---@param key any
---@param adjustedNode any
function CropRowAdjustedNodes:loadCropRowAdjustedNodeFromXML(xmlFile, key, adjustedNode) end

--- Computes the node's lateral offset to the nearest row from the fruit type under it, clamps it to the min/max translation and moves the node toward it at the configured speed. Returns to the start position when it becomes inactive.
---@param adjustedNode any
---@param dt any
function CropRowAdjustedNodes:updateCropRowAdjustedNode(adjustedNode, dt) end

--- Returns true only when the fold time is within the node's limits, the implement is lowered, and its heading is within CropRowAdjustedNodes.MAX_ACTIVE_ANGLE (value not in this file) of a multiple of 90 degrees.
---@param adjustedNode any
function CropRowAdjustedNodes:getIsCropRowAdjustedNodeActive(adjustedNode) end
