---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TreeSaplingPallet.lua (generated stub, FS25 Lua Atlas)

--- Specialization for sapling pallets. It stores which tree type and variation the pallet carries, loads the matching sapling I3D model and clones it onto the sapling link nodes, and shows or hides those nodes according to the fill level. TreePlanter reads and writes the type through `getTreeSaplingPalletType` and `setTreeSaplingPalletType`. It has no prerequisites and adds a `treeSaplingType` vehicle configuration.
---@class TreeSaplingPallet
TreeSaplingPallet = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function TreeSaplingPallet.prerequisitesPresent(specializations) end

--- Registers the `treeSaplingType` configuration type and the `vehicle.treeSaplingPallet` XML keys (fill unit index, tree type, variation, custom I3D file, sapling nodes, per-configuration sapling nodes), plus savegame keys for tree type and variation.
function TreeSaplingPallet.initSpecialization() end

--- Registers the sapling load callback, the tree type getter and setter, and the two visual update functions.
---@param vehicleType any
function TreeSaplingPallet.registerFunctions(vehicleType) end

--- Registers an override of `showInfo`.
---@param vehicleType any
function TreeSaplingPallet.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete and onFillUnitFillLevelChanged.
---@param vehicleType any
function TreeSaplingPallet.registerEventListeners(vehicleType) end

--- Resolves tree type, variation, fill unit and I3D file from XML, the selected configuration item and the savegame, finds the sapling file from the tree plant manager, collects the sapling nodes (optionally randomising rotation and scale) and starts loading the visuals. Note: the code default type is "spruce" while the schema documents "spruce1".
---@param savegame any
function TreeSaplingPallet:onLoad(savegame) end

--- Releases the shared sapling I3D request and deletes the cloned sapling shapes.
function TreeSaplingPallet:onDelete() end

--- Saves the current tree type name and variation name.
---@param xmlFile any
---@param key any
---@param usedModNames any
function TreeSaplingPallet:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns the current tree type name and variation name (two values).
---@return string
function TreeSaplingPallet:getTreeSaplingPalletType() end

--- Stores a new tree type and variation and reloads the sapling visuals if either changed. Unlike `onLoad`, it does not look up a new I3D filename, so the file used stays the one resolved at load time.
---@param treeTypeName any
---@param variationName any
---@return string
function TreeSaplingPallet:setTreeSaplingPalletType(treeTypeName, variationName) end

--- Releases any previous shared I3D request and starts loading the sapling file, as a sub-file while the vehicle is still loading or asynchronously afterwards.
---@return string
function TreeSaplingPallet:updateTreeSaplingVisuals() end

--- Load callback: clones the loaded sapling shape onto every sapling node (replacing earlier clones), deletes the loaded I3D root and refreshes node visibility.
---@param i3dNode any
---@param failedReason any
---@param args any
---@return integer
---@return table
function TreeSaplingPallet:onTreeSaplingLoaded(i3dNode, failedReason, args) end

--- Shows as many sapling nodes as the rounded fill level and sets the `hideByIndex` shader parameter from capacity minus fill level.
function TreeSaplingPallet:updateTreeSaplingPalletNodes() end

--- Refreshes the sapling node visibility on any fill unit level change.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function TreeSaplingPallet:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Override: adds a tree type line to the info box when a tree type description was found, then calls the parent.
---@param superFunc any
---@param box any
function TreeSaplingPallet:showInfo(superFunc, box) end
