# missions/field/StonePickMission.lua

*[Version française](../../../fr/scripts/missions/field/StonePickMission.md)*

Source: `dataS/scripts/missions/field/StonePickMission.lua` — FS25 1.25.1.0

✍ Stone picking contract, a subclass of AbstractFieldMission using WorkAreaType.STONEPICKER. Progress is measured in the stone system density map. It is only offered on plowed, unsown fields that really contain stones, outside winter, when stones are enabled in the savegame.

- **StonePickMission** inherits from `AbstractFieldMission` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `StonePickMission.new(isServer: any, isClient: any, customMt: any)` | 24 | ✍ Constructor. Builds the mission with the stone-pick title and description texts, stone picker work area type, stoneValue 3 and spawnedPixels 0. |
| `StonePickMission:getFieldPreparingTask()` | 51 | ✍ On the server, sets the field state stone level to stoneValue, then returns the parent preparing task. |
| `StonePickMission:getFieldFinishTask()` | 62 | ✍ On the server, resets stone level to 0 and ground type to CULTIVATED on the field state, then returns the parent finish task. |
| `StonePickMission:createModifier()` | 74 | ✍ Creates masked and unmasked density map modifiers on the stone density map, with filters comparing the value to the maximum stone value, greater than 0, and equal to 0. |
| `StonePickMission:getPartitionCompletion(partitionIndex: any)` | 95 | ✍ Sets the partition region and returns sum of pixels, area and total area from the stone map. The total excludes the unmasked (stone-free) area. Returns 0, 0, 0 without modifier. |
| `StonePickMission:initializeModifier()` | 113 | ✍ Calls the parent version, then applies the field density map polygon to the unmasked modifier. |
| `StonePickMission:setPartitionRegion(partitionIndex: any)` | 124 | ✍ Calls the parent, then, if there is more than one partition, clips the unmasked modifier to the partition minZ/maxZ range. |
| `StonePickMission:getRewardPerHa()` | 139 | ✍ Returns the reward per hectare stored for this mission type in MissionManager. |
| `StonePickMission:getMissionTypeName()` | 146 | ✍ Returns StonePickMission.NAME (the value is set elsewhere, not in this file). |
| `StonePickMission:validate(event: any)` | 152 | ✍ Runs the parent validation, then, if the mission is not finished, rechecks that the field is still eligible. Returns false when either check fails. |
| `StonePickMission.loadMapData(xmlFile: any, key: any, baseDirectory: any)` | 168 | ✍ Reads #rewardPerHa from the map XML (default 2200) into the mission type data. Returns true. |
| `StonePickMission.tryGenerateMission()` | 177 | ✍ Server-side generator: if canRun, takes a field for a mission, requires it to be free and eligible, builds and inits a mission and sets its default end date. Returns the mission or nil. |
| `StonePickMission.getFieldHasStones(field: table) → boolean` | 210 | ✍ Returns true if the stone density map has at least one pixel above 0 inside the field polygon. False when the map has no stones. |
| `StonePickMission.isAvailableForField(field: any, mission: any)` | 235 | ✍ For a new mission, requires a valid field state, no fruit, plowed ground and stones present. In all cases refuses during winter. |
| `StonePickMission.canRun()` | 268 | ✍ Returns true only if the instance limit is not reached, the map has stones and stones are enabled in the savegame settings. |
