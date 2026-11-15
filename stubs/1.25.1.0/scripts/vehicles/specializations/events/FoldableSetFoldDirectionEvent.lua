---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua (generated stub, FS25 Lua Atlas)

---@class FoldableSetFoldDirectionEvent : Event
FoldableSetFoldDirectionEvent = {}

---@return table
function FoldableSetFoldDirectionEvent.emptyNew() end

---@param object table
---@param direction integer
---@param moveToMiddle boolean
function FoldableSetFoldDirectionEvent.new(object, direction, moveToMiddle) end

---@param streamId integer
---@param connection Connection
function FoldableSetFoldDirectionEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FoldableSetFoldDirectionEvent:writeStream(streamId, connection) end

---@param connection Connection
function FoldableSetFoldDirectionEvent:run(connection) end
