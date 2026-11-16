# vehicles/LicensePlate.lua

*[Version française](../../fr/scripts/vehicles/LicensePlate.md)*

Source: `dataS/scripts/vehicles/LicensePlate.lua` — FS25 1.25.1.0

✍ One license plate object: an i3d node with several variations, each made of value nodes (characters or static parts) and optional materials. Instances are loaded from the map license plate XML by LicensePlateManager (global `g_licensePlateManager`), then cloned for each vehicle. It displays text with CharacterLine objects using the font material, can be coloured, validated and randomised, and also registers the XML paths of the plate definition. The CharacterLine, VehicleMaterial and font classes are outside this file (UNVERIFIED).

- **LicensePlate** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `LicensePlate.new(customMt: table?) → LicensePlate` | 18 | ✍ Constructor. Starts at variation 1, position ANY, empty characters, and keeps a reference to `g_licensePlateManager`. |
| `LicensePlate:loadFromXML(node: integer, filename: string, customEnvironment: any, xmlFile: XMLFile, key: string) → boolean` | 37 | ✍ Loads the plate from the map XML: type (ELONGATED by default), size, font settings, variations with their value nodes and materials, and an optional frame node. Fetches the font from the manager. Returns false on an unknown type or missing font. |
| `LicensePlate:delete()` | 149 | ✍ Deletes the plate i3d node. |
| `LicensePlate:clone(includeFrame: boolean) → LicensePlate` | 157 | ✍ Creates an independent copy with a cloned node, copied settings and variations (value nodes rebound to the clone), then applies the current variation. The frame is shown and added to the size only if `includeFrame` is true. |
| `LicensePlate:updateData(variationIndex: integer, position: integer, characters: string, validate: boolean)` | 221 | ✍ Applies variation, placement position and text: switches variation if needed, optionally validates the characters, then positions each value node and sets its text or visibility according to position and whether it is static. Note: indexing is byte-based, not UTF-8 safe. |
| `LicensePlate:setVariation(variationIndex: integer, position: any)` | 269 | ✍ Switches to another variation: deletes the children of the old non-static value nodes, creates a centered CharacterLine for each new non-static value, and applies the variation materials matching the position. Does nothing for an unknown index. |
| `LicensePlate:getFontSize() → number, number` | 310 | ✍ Returns two values: the maximum character width (font size times the font max width ratio) and the font size. |
| `LicensePlate:setColorIndex(colorIndex: integer)` | 317 | ✍ Looks up the manager color at this index and applies it with `setColor`. Does nothing if the index is invalid. |
| `LicensePlate:getColor(colorIndex: integer) → table` | 329 | ✍ Returns the color table (r, g, b) from the manager list at this index, or nil if the index does not exist. |
| `LicensePlate:setColor(r: number, g: number, b: number)` | 344 | ✍ Colors the plate material named by the manager and sets the character shader parameter to the same RGB on all non-static value nodes of every variation. |
| `LicensePlate:getRandomCharacters(variationIndex: integer) → table` | 365 | ✍ Returns a table of characters for a variation: fixed characters are kept, others are drawn at random from the font set matching the node type (letters, digits, special). The first random digit is never zero. |
| `LicensePlate:validateLicensePlateCharacters(characters: table) → table` | 416 | ✍ Filters the given text (string or table) with `filterText`, and replaces each changed character with the first character of the allowed set of the matching value node. Returns the corrected characters in the same form. Byte-based, not UTF-8 safe. |
| `LicensePlate:changeCharacter(variationIndex: integer, currentCharacters: table, valueIndex: integer, direction: integer) → table` | 470 | ✍ Steps the character at a value index by `direction` through the allowed sets (letters, digits, special) of that node, moving to the neighbouring set at the ends and clamping at the extremes. Edits and returns the given table. |
| `LicensePlate:getFormattedString() → string` | 534 | ✍ Builds the displayed text from the stored characters, skipping static nodes and underscores and inserting a space before nodes marked as a new section. Returns nil when the plate has no characters. |
| `LicensePlate.registerXMLPaths(schema: XMLSchema, baseName: string)` | 564 | ✍ Registers the XML schema paths of a plate definition (filename, node, type, size, font, variations, values, materials, frame). Note: the registered default height is 0.2 while `loadFromXML` uses 0.3. |
