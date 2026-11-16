# placeables/specializations/PlaceableIncomePerHour.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableIncomePerHour.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableIncomePerHour.lua` — FS25 1.25.1.0

✍ Placeable specialization that pays a fixed income per in-game hour to the owning farm, with an amount that can depend on an incomePerHour configuration. It also registers the incomePerHour store spec and configuration type, so the value appears in the shop. Income is added on the server only, and only once the placeable is fully built.

- **PlaceableIncomePerHour** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableIncomePerHour.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableIncomePerHour.registerFunctions(placeableType: any)` | 24 | ✍ Registers the getIncomePerHour method. |
| `PlaceableIncomePerHour.registerOverwrittenFunctions(placeableType: any)` | 30 | ✍ Overrides getNeedHourChanged and finalizeConstruction (the latter has no body in the SDK dump: UNVERIFIED). |
| `PlaceableIncomePerHour.registerEventListeners(placeableType: any)` | 37 | ✍ Subscribes to the load and hour-changed events. |
| `PlaceableIncomePerHour.registerXMLPaths(schema: any, basePath: any)` | 44 | ✍ Declares incomePerHour as a plain value and per configuration entry. |
| `PlaceableIncomePerHour.initSpecialization()` | 54 | ✍ Registers the incomePerHour store spec type (loader, getter, placeable species) and the incomePerHour configuration type with the placeable configuration manager. |
| `PlaceableIncomePerHour:onLoad(savegame: table)` | 62 | ✍ Reads the income for the selected configuration (default 1st), falling back to the base value then 0. The placeable counts as finished unless it has constructible states (getNumFinishedConstructibleStates). |
| `PlaceableIncomePerHour:getNeedHourChanged(superFunc: any)` | 85 | ✍ Always returns true so the placeable receives hour-changed events. |
| `PlaceableIncomePerHour:onHourChanged()` | 91 | ✍ Server only. Skips unowned or unfinished placeables; otherwise adds getIncomePerHour times the environment time adjustment to the owner farm as PROPERTY_INCOME money. |
| `PlaceableIncomePerHour:getIncomePerHour()` | 116 | ✍ Returns the hourly income value (before the time adjustment factor). |
| `PlaceableIncomePerHour.loadSpecValueIncomePerHour(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → table` | 126 | ✍ Store spec loader: returns a fixed income (first configuration or base value) and a variable income summed from wind turbine and first solar panel configuration, or nil if all are zero. |
| `PlaceableIncomePerHour.getSpecValueIncomePerHour(storeItem: table, realItem: table) → integer` | 145 | ✍ Formats the shop text per month (24 times the hourly value): a single amount, or a range from fixed to fixed plus variable income when a variable part exists. Returns nil without stored spec. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIncomePerHour` | 25 |
| registerOverwrittenFunction | `getNeedHourChanged` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onHourChanged` | 39 |
