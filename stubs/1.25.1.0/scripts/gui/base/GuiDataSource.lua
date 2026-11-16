---@meta
-- FS25 1.25.1.0 : gui/base/GuiDataSource.lua (generated stub, FS25 Lua Atlas)

--- Simple observable list that feeds data to GUI elements such as lists and tables. It holds an array, lets listeners register a callback per target table, and notifies them when the data is replaced or modified. NO_DATA and NO_CALLBACK are globals defined elsewhere (UNVERIFIED here).
---@class GuiDataSource
GuiDataSource = {}

--- Creates a data source with an empty data array (NO_DATA) and an empty listener table. An optional metatable lets subclasses reuse the constructor.
---@param subclass_mt any
function GuiDataSource.new(subclass_mt) end

--- Replaces the underlying array (nil falls back to NO_DATA) and immediately notifies all listeners. The array is stored by reference, not copied.
---@param data any
function GuiDataSource:setData(data) end

--- Registers a callback keyed by the target table. A second registration for the same target overwrites the first; a nil callback is replaced by NO_CALLBACK.
---@param target any
---@param callback any
function GuiDataSource:addChangeListener(target, callback) end

--- Removes the listener registered for the given target table.
---@param target any
function GuiDataSource:removeChangeListener(target) end

--- Calls every registered callback with its target as the only argument. Call it manually after editing the data array in place. Iteration order is not defined (pairs).
function GuiDataSource:notifyChange() end

--- Returns the number of items in the data array (length operator).
function GuiDataSource:getCount() end

--- Returns the item at the given 1-based index, or nil if absent.
---@param index any
function GuiDataSource:getItem(index) end

--- Stores a value at an existing index only; out-of-range indices are silently ignored. Listeners are notified only when needsNotification is truthy.
---@param index any
---@param value any
---@param needsNotification any
function GuiDataSource:setItem(index, value, needsNotification) end

--- Returns a generic-for iterator over items from startIndex to endIndex, stopping early at the first nil item. It yields (nextIndex, item), so the first loop variable is the index plus one.
---@param startIndex any
---@param endIndex any
function GuiDataSource:iterateRange(startIndex, endIndex) end
