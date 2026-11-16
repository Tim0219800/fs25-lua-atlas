---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWeighingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a vehicle weighing station (weighbridge). A trigger tracks vehicle nodes on the platform and the total mass is shown on one or more digit displays configured under `placeable.weighingStation.display`. Display fonts come from the material manager.
---@class PlaceableWeighingStation
PlaceableWeighingStation = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableWeighingStation.prerequisitesPresent(specializations) end

--- Registers `updateWeightDisplay`, `setWeightDisplay` and `onWeighingTriggerCallback` on the placeable type.
---@param placeableType any
function PlaceableWeighingStation.registerFunctions(placeableType) end

--- Subscribes to onLoad and onDelete.
---@param placeableType any
function PlaceableWeighingStation.registerEventListeners(placeableType) end

--- Declares the weighing station XML keys (trigger node and display settings such as node, font, alignment, size, mask, colors).
---@param schema any
---@param basePath any
function PlaceableWeighingStation.registerXMLPaths(schema, basePath) end

--- Reads the trigger node (logs an error and stops if missing), registers it, and builds each display (font material, alignment, size, scale, mask, colors) as a character line. Starts by showing 0.
---@param savegame table
function PlaceableWeighingStation:onLoad(savegame) end

--- Removes the trigger node.
function PlaceableWeighingStation:onDelete() end

--- Resolves tracked trigger nodes to vehicles (dropping nodes that no longer exist), sums their total mass and shows the sum multiplied by 1000 (so presumably tonnes to kilograms, assumption).
function PlaceableWeighingStation:updateWeightDisplay() end

--- Formats the given number with each display mask (integer and decimal part) and writes the text to its character line.
---@param mass any
function PlaceableWeighingStation:setWeightDisplay(mass) end

--- Trigger callback: on enter or leave, adds or removes the other node from the tracked set and refreshes the displayed weight.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function PlaceableWeighingStation:onWeighingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
