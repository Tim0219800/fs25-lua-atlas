---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterFillType.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter for choosing a fill type from a list of valid types, each shown with its available level in liters. It is saved to XML by fill type name and streamed by fill type index; used for example by `AIJobLoadAndDeliver`.
---@class AIParameterFillType : AIParameter
AIParameterFillType = {}

--- Creates the parameter with type FILLTYPE, an empty list and no selection.
---@param customMt any
function AIParameterFillType.new(customMt) end

--- Writes the selected fill type name to the `#fillType` attribute, if one is selected.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterFillType:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads `#fillType` and converts the name to a fill type index through `g_fillTypeManager`.
---@param xmlFile any
---@param key any
function AIParameterFillType:loadFromXMLFile(xmlFile, key) end

--- Reads an optional fill type index (`FillTypeManager.SEND_NUM_BITS` bits) and selects it.
---@param streamId any
---@param connection any
function AIParameterFillType:readStream(streamId, connection) end

--- Writes a presence flag and, if selected, the fill type index.
---@param streamId any
---@param connection any
function AIParameterFillType:writeStream(streamId, connection) end

--- Replaces the list from a table of fill type index to level, with titles like "Name (N l)" sorted alphabetically. If the current selection is not in the list, selects a fill type with level above 0 or the first entry. Note: `maxFillLevel` is never updated, so the chosen one is the last iterated with stock, not the highest (apparent bug).
---@param fillTypes any
function AIParameterFillType:setValidFillTypes(fillTypes) end

--- Selects the next entry in the list, wrapping to the first.
function AIParameterFillType:setNextItem() end

--- Selects the previous entry in the list, wrapping to the last.
function AIParameterFillType:setPreviousItem() end

--- Selects the fill type at the given list position; clears the selection if the position does not exist.
---@param index any
function AIParameterFillType:setFillTypeByIndex(index) end

--- Sets the selected fill type index directly, without checking the list.
---@param fillTypeIndex any
function AIParameterFillType:setFillTypeIndex(fillTypeIndex) end

--- Returns the selected fill type index, or nil.
function AIParameterFillType:getFillTypeIndex() end

--- Returns the list title of the selected fill type, or an empty string.
function AIParameterFillType:getString() end

--- Returns false plus a localized "no fill type" error if nothing is selected, otherwise true and nil.
function AIParameterFillType:validate() end
