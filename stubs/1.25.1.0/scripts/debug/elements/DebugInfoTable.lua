---@meta
-- FS25 1.25.1.0 : debug/elements/DebugInfoTable.lua (generated stub, FS25 Lua Atlas)

--- DebugInfoTable renders a titled name/value information table as 3D text in the world, facing the camera by default. Derived from DebugElement but only this static function is present here.
---@class DebugInfoTable : DebugElement
DebugInfoTable = {}

--- Renders groups of rows ({title, content={{name, value, color?, sizeFactor?}}}) as 3D text stacked upward from a world position, last group first, with right-aligned names, 4-decimal numbers and bold centred titles. Without rotation it faces the camera via `DebugUtil.getYRotatationToCamera` (not in this dump).
---@param x number
---@param y number
---@param z number
---@param information array
---@param rx number?
---@param ry number?
---@param rz number?
---@param size number?
---@param color table?
function DebugInfoTable.renderAtPosition(x, y, z, information, rx, ry, rz, size, color) end
