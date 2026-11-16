# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatisticCounter.lua` — FS25 1.25.1.0

✍ Plain data object of Precision Farming holding the numeric counters of one farmland (soil samples, lime, fertilizers, manure, seeds, herbicide, yield, fuel, vehicle and helper costs, subsidies, plus 'Regular' variants). It can be reset, loaded and saved as XML attributes and streamed over the network.

- **FarmlandStatisticCounter** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandStatisticCounter.new(customMt: any)` | 16 | ✍ Constructor. Creates the object and initialises every counter to 0 through reset. |
| `FarmlandStatisticCounter:loadFromItemsXML(xmlFile: any, key: any)` | 26 | ✍ Reads every counter from XML attributes at the key, keeping the current value as default when an attribute is missing. |
| `FarmlandStatisticCounter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 66 | ✍ Writes every counter as an attribute (integer for numSoilSamples, float for the others). The usedModNames parameter is unused here. |
| `FarmlandStatisticCounter:reset()` | 106 | ✍ Sets all 24 counters (samples, costs, used inputs, yield values, fuel, vehicle/helper costs, subsidies) back to 0. |
| `FarmlandStatisticCounter:onReadStream(streamId: integer, connection: Connection)` | 148 | ✍ Reads all counters from the stream: numSoilSamples as 16-bit unsigned, the rest as float32. Must stay in the same order as onWriteStream. |
| `FarmlandStatisticCounter:onWriteStream(streamId: integer, connection: Connection)` | 190 | ✍ Writes all counters to the stream (16-bit unsigned for numSoilSamples, float32 for the rest). Note: the 16-bit field caps at 65535 samples. |
