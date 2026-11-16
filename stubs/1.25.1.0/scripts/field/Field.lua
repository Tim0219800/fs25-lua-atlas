---@meta
-- FS25 1.25.1.0 : field/Field.lua (generated stub, FS25 Lua Atlas)

--- Wraps one map field defined in the map i3d: its polygon, area, label position, farmland link and mission flags. Created and loaded by FieldManager. It holds a FieldState instance that is filled with the sampled ground data.
---@class Field
Field = {}

--- Constructor. Initialises empty polygon data, area of 1 ha, no farmland, no current mission, planned fruit type unknown, missions allowed, and a new FieldState.
---@param customMt any
---@return table
function Field.new(customMt) end

--- Reads the field from an i3d node through user attributes (name, polygonIndex, angle, missionAllowed, missionOnlyGrass, indicator nodes). Computes area in ha and label position; returns false if polygonIndex is missing or unresolved, true otherwise.
---@param id integer
---@return boolean
function Field:load(id) end

--- Unsubscribes this object from all message center subscriptions. Does not delete the polygon nodes.
function Field:delete() end
