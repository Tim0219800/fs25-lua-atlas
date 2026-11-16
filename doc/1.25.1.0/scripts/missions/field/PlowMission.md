# missions/field/PlowMission.lua

*[Version française](../../../fr/scripts/missions/field/PlowMission.md)*

Source: `dataS/scripts/missions/field/PlowMission.lua` — FS25 1.25.1.0

✍ Plowing contract, a subclass of AbstractFieldMission using WorkAreaType.PLOW. Completion is the share of field pixels whose ground type is PLOWED. It is offered on fields with a harvested or withered crop whose plow level is not yet at maximum.

- **PlowMission** inherits from `AbstractFieldMission` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlowMission.new(isServer: any, isClient: any, customMt: any)` | 24 | ✍ Constructor. Builds the mission with the plow title and description texts and the plow work area type. |
| `PlowMission:createModifier()` | 39 | ✍ Creates a density map modifier on the ground type map and a filter matching the PLOWED value; used to measure completion. |
| `PlowMission:getFieldFinishTask()` | 51 | ✍ Sets the field state to fruit type unknown and ground type PLOWED, then returns the parent finish task. Unlike StonePickMission, it does not check isServer. |
| `PlowMission:getRewardPerHa()` | 61 | ✍ Returns the reward per hectare stored for the plow mission type in MissionManager. |
| `PlowMission:getMissionTypeName()` | 68 | ✍ Returns PlowMission.NAME (value defined elsewhere, not in this file). |
| `PlowMission:validate(event: any)` | 74 | ✍ Runs the parent validation, then, if not finished, rechecks that the field is still eligible. Returns false if either fails. |
| `PlowMission.loadMapData(xmlFile: any, key: any, baseDirectory: any)` | 90 | ✍ Reads #rewardPerHa from the map XML (default 2800) into the plow mission type data. Returns true. |
| `PlowMission.tryGenerateMission()` | 99 | ✍ Server-side generator: if canRun, picks a free eligible field, creates and inits a PlowMission and sets its default end date. Returns the mission or nil. |
| `PlowMission.isAvailableForField(field: any, mission: any)` | 129 | ✍ For a new mission, requires a valid state, a non-grass-only field, plow level below max, a known fruit not harvest-mission-only, not a fresh catch crop, and a cut or withered growth state. Always true for an existing mission. |
| `PlowMission.canRun()` | 170 | ✍ Returns true while the number of running plow missions is below the maximum for the type. |
