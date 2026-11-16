# ai/parameters/AIParameterFillType.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterFillType.md)*

Source: `dataS/scripts/ai/parameters/AIParameterFillType.lua` — FS25 1.25.1.0

✍ AI job parameter for choosing a fill type from a list of valid types, each shown with its available level in liters. It is saved to XML by fill type name and streamed by fill type index; used for example by `AIJobLoadAndDeliver`.

- **AIParameterFillType** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterFillType.new(customMt: any)` | 16 | ✍ Creates the parameter with type FILLTYPE, an empty list and no selection. |
| `AIParameterFillType:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 29 | ✍ Writes the selected fill type name to the `#fillType` attribute, if one is selected. |
| `AIParameterFillType:loadFromXMLFile(xmlFile: any, key: any)` | 38 | ✍ Reads `#fillType` and converts the name to a fill type index through `g_fillTypeManager`. |
| `AIParameterFillType:readStream(streamId: any, connection: any)` | 47 | ✍ Reads an optional fill type index (`FillTypeManager.SEND_NUM_BITS` bits) and selects it. |
| `AIParameterFillType:writeStream(streamId: any, connection: any)` | 56 | ✍ Writes a presence flag and, if selected, the fill type index. |
| `AIParameterFillType:setValidFillTypes(fillTypes: any)` | 64 | ✍ Replaces the list from a table of fill type index to level, with titles like "Name (N l)" sorted alphabetically. If the current selection is not in the list, selects a fill type with level above 0 or the first entry. Note: `maxFillLevel` is never updated, so the chosen one is the last iterated with stock, not the highest (apparent bug). |
| `AIParameterFillType:setNextItem()` | 98 | ✍ Selects the next entry in the list, wrapping to the first. |
| `AIParameterFillType:setPreviousItem()` | 115 | ✍ Selects the previous entry in the list, wrapping to the last. |
| `AIParameterFillType:setFillTypeByIndex(index: any)` | 132 | ✍ Selects the fill type at the given list position; clears the selection if the position does not exist. |
| `AIParameterFillType:setFillTypeIndex(fillTypeIndex: any)` | 143 | ✍ Sets the selected fill type index directly, without checking the list. |
| `AIParameterFillType:getFillTypeIndex()` | 149 | ✍ Returns the selected fill type index, or nil. |
| `AIParameterFillType:getString()` | 155 | ✍ Returns the list title of the selected fill type, or an empty string. |
| `AIParameterFillType:validate()` | 167 | ✍ Returns false plus a localized "no fill type" error if nothing is selected, otherwise true and nil. |
