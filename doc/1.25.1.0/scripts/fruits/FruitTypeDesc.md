# fruits/FruitTypeDesc.lua

*[Version française](../../fr/scripts/fruits/FruitTypeDesc.md)*

Source: `dataS/scripts/fruits/FruitTypeDesc.lua` — FS25 1.25.1.0

✍ Data class describing one fruit type (crop): its fill type, density map channels, ordered growth states and the special states derived from them (harvest-ready, forage, cut, withered, mulched, destruction, weeding, regrowth). It is created and indexed by FruitTypeManager and filled from a foliage XML file. In this dump the file contains only the constructor and the XML loader; methods it calls (updatePlantSpacing, getGrowthStateByName, loadGrowth) are not defined here (UNVERIFIED where they come from).

- **FruitTypeDesc** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FruitTypeDesc.new(customMt: table?) → FruitTypeDesc` | 157 | ✍ Constructor. Creates a fruit type with defaults: 4 state channels, 1 haulm channel, empty growth state tables, no special states set (harvest, forage, cut, destruction and preparing states at 0 or -1) and no regrowth. The index is assigned later by FruitTypeManager. |
| `FruitTypeDesc:loadFromFoliageXMLFile(xmlFilename: string) → boolean` | 225 | ✍ Loads a foliage XML file and fills the fruit type: name (upper-cased, needs a matching fill type), map colors, density channels, every foliageState flag (harvest, forage, cut, withered, ground type, weeding, regrowth, destruction, preparing, mulched, water needs), harvest, growth, soil, seeding, windrow and mulcher settings, and harvest transitions. Returns false if the file, name or fill type is missing or invalid. Note: the invalid-name warning prints self.name, which is still nil at that point; the later check on disasterDestructionState against nil can never be true because it defaults to 0. |
