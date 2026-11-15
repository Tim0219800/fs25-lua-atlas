# vehicles/LicensePlate.lua

Source : `dataS/scripts/vehicles/LicensePlate.lua` — FS25 1.25.1.0

- **LicensePlate** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LicensePlate.new(customMt: table?) → LicensePlate` | 18 |  |
| `LicensePlate:loadFromXML(node: integer, filename: string, customEnvironment: any, xmlFile: XMLFile, key: string) → boolean` | 37 |  |
| `LicensePlate:delete()` | 149 |  |
| `LicensePlate:clone(includeFrame: boolean) → LicensePlate` | 157 |  |
| `LicensePlate:updateData(variationIndex: integer, position: integer, characters: string, validate: boolean)` | 221 |  |
| `LicensePlate:setVariation(variationIndex: integer, position: any)` | 269 |  |
| `LicensePlate:getFontSize() → number, number` | 310 |  |
| `LicensePlate:setColorIndex(colorIndex: integer)` | 317 |  |
| `LicensePlate:getColor(colorIndex: integer) → table` | 329 |  |
| `LicensePlate:setColor(r: number, g: number, b: number)` | 344 |  |
| `LicensePlate:getRandomCharacters(variationIndex: integer) → table` | 365 |  |
| `LicensePlate:validateLicensePlateCharacters(characters: table) → table` | 416 |  |
| `LicensePlate:changeCharacter(variationIndex: integer, currentCharacters: table, valueIndex: integer, direction: integer) → table` | 470 |  |
| `LicensePlate:getFormattedString() → string` | 534 |  |
| `LicensePlate.registerXMLPaths(schema: XMLSchema, baseName: string)` | 564 |  |
