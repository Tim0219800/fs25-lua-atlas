---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDeletedNodes.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that deletes scene nodes listed in the XML (`deletedNodes.deletedNode`) once loading is finished, typically to remove parts of a shared i3d model. Nodes that are bones of a skinned mesh are skipped with a warning to avoid crashes.
---@class PlaceableDeletedNodes
PlaceableDeletedNodes = {}

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PlaceableDeletedNodes.prerequisitesPresent(specializations) end

--- Subscribes to `onLoadFinished`.
---@param placeableType any
function PlaceableDeletedNodes.registerEventListeners(placeableType) end

--- Declares `deletedNodes.deletedNode(?)#node`.
---@param schema any
---@param basePath any
function PlaceableDeletedNodes.registerXMLPaths(schema, basePath) end

--- Collects all bones of skinned shapes, builds the list of nodes to delete (skipping bones of a skinned mesh with a warning, unless the node is the mesh itself), then deletes them in a second pass so index paths stay valid.
---@param savegame table
function PlaceableDeletedNodes:onLoadFinished(savegame) end
