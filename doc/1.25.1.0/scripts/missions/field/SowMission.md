# missions/field/SowMission.lua

*[Version française](../../../fr/scripts/missions/field/SowMission.md)*

Source: `dataS/scripts/missions/field/SowMission.lua` — FS25 1.25.1.0

✍ Sowing contract, a subclass of AbstractFieldMission. In this file it only provides the partition completion query; everything else is inherited.

- **SowMission** inherits from `AbstractFieldMission` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `SowMission:getPartitionCompletion(partitionIndex: any)` | 167 | ✍ Sets the region of the given partition, then runs the completion modifier with its filter and returns summed pixels, area and total area. Returns 0, 0, 0 if no completion modifier exists. |
