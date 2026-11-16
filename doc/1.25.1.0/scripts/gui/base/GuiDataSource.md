# gui/base/GuiDataSource.lua

*[Version française](../../../fr/scripts/gui/base/GuiDataSource.md)*

Source: `dataS/scripts/gui/base/GuiDataSource.lua` — FS25 1.25.1.0

✍ Simple observable list that feeds data to GUI elements such as lists and tables. It holds an array, lets listeners register a callback per target table, and notifies them when the data is replaced or modified. NO_DATA and NO_CALLBACK are globals defined elsewhere (UNVERIFIED here).

- **GuiDataSource** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiDataSource.new(subclass_mt: any)` | 20 | ✍ Creates a data source with an empty data array (NO_DATA) and an empty listener table. An optional metatable lets subclasses reuse the constructor. |
| `GuiDataSource:setData(data: any)` | 31 | ✍ Replaces the underlying array (nil falls back to NO_DATA) and immediately notifies all listeners. The array is stored by reference, not copied. |
| `GuiDataSource:addChangeListener(target: any, callback: any)` | 38 | ✍ Registers a callback keyed by the target table. A second registration for the same target overwrites the first; a nil callback is replaced by NO_CALLBACK. |
| `GuiDataSource:removeChangeListener(target: any)` | 44 | ✍ Removes the listener registered for the given target table. |
| `GuiDataSource:notifyChange()` | 51 | ✍ Calls every registered callback with its target as the only argument. Call it manually after editing the data array in place. Iteration order is not defined (pairs). |
| `GuiDataSource:getCount()` | 59 | ✍ Returns the number of items in the data array (length operator). |
| `GuiDataSource:getItem(index: any)` | 65 | ✍ Returns the item at the given 1-based index, or nil if absent. |
| `GuiDataSource:setItem(index: any, value: any, needsNotification: any)` | 72 | ✍ Stores a value at an existing index only; out-of-range indices are silently ignored. Listeners are notified only when needsNotification is truthy. |
| `GuiDataSource:iterateRange(startIndex: any, endIndex: any)` | 85 | ✍ Returns a generic-for iterator over items from startIndex to endIndex, stopping early at the first nil item. It yields (nextIndex, item), so the first loop variable is the index plus one. |
