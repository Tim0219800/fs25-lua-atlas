---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `FoldableSetFoldDirectionEvent` (extends `Event`) that replicates the fold direction of a foldable implement. It carries the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag. It belongs to the vehicle specialization events and defines nothing else.
---@class FoldableSetFoldDirectionEvent : Event
FoldableSetFoldDirectionEvent = {}

--- Creates an empty `FoldableSetFoldDirectionEvent` instance without data, used when the event is read from a network stream.
---@return table
function FoldableSetFoldDirectionEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag.
---@param object table
---@param direction integer
---@param moveToMiddle boolean
function FoldableSetFoldDirectionEvent.new(object, direction, moveToMiddle) end

--- Reads the event data from the network stream (the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag), then calls `run`.
---@param streamId integer
---@param connection Connection
function FoldableSetFoldDirectionEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag).
---@param streamId integer
---@param connection Connection
function FoldableSetFoldDirectionEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: calls `setFoldState(direction, moveToMiddle, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender.
---@param connection Connection
function FoldableSetFoldDirectionEvent:run(connection) end
