# placeables/specializations/PlaceableIncomePerHour.lua

Source: `dataS/scripts/placeables/specializations/PlaceableIncomePerHour.lua` — FS25 1.25.1.0

- **PlaceableIncomePerHour** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableIncomePerHour.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableIncomePerHour.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableIncomePerHour.registerOverwrittenFunctions(placeableType: any)` | 30 |  |
| `PlaceableIncomePerHour.registerEventListeners(placeableType: any)` | 37 |  |
| `PlaceableIncomePerHour.registerXMLPaths(schema: any, basePath: any)` | 44 |  |
| `PlaceableIncomePerHour.initSpecialization()` | 54 |  |
| `PlaceableIncomePerHour:onLoad(savegame: table)` | 62 |  |
| `PlaceableIncomePerHour:getNeedHourChanged(superFunc: any)` | 85 |  |
| `PlaceableIncomePerHour:onHourChanged()` | 91 |  |
| `PlaceableIncomePerHour:getIncomePerHour()` | 116 |  |
| `PlaceableIncomePerHour.loadSpecValueIncomePerHour(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → table` | 126 |  |
| `PlaceableIncomePerHour.getSpecValueIncomePerHour(storeItem: table, realItem: table) → integer` | 145 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIncomePerHour` | 25 |
| registerOverwrittenFunction | `getNeedHourChanged` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 32 |
| registerEventListener | `onLoad` | 38 |
| registerEventListener | `onHourChanged` | 39 |
