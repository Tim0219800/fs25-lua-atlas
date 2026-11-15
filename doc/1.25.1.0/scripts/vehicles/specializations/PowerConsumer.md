# vehicles/specializations/PowerConsumer.lua

Source : `dataS/scripts/vehicles/specializations/PowerConsumer.lua` — FS25 1.25.1.0

- **PowerConsumer** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PowerConsumer.initSpecialization()` | 15 |  |
| `PowerConsumer.registerPowerConsumerXMLPaths(schema: any, basePath: any)` | 40 |  |
| `PowerConsumer.prerequisitesPresent(specializations: table) → boolean` | 70 |  |
| `PowerConsumer.registerFunctions(vehicleType: any)` | 76 |  |
| `PowerConsumer.registerOverwrittenFunctions(vehicleType: any)` | 87 |  |
| `PowerConsumer.registerEventListeners(vehicleType: any)` | 97 |  |
| `PowerConsumer:onLoad(savegame: table)` | 108 |  |
| `PowerConsumer:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 161 |  |
| `PowerConsumer:loadPowerSetup(xmlFile: table, baseKey: any)` | 192 |  |
| `PowerConsumer:getPtoRpm() → number` | 210 |  |
| `PowerConsumer:getDoConsumePtoPower() → boolean` | 221 |  |
| `PowerConsumer:getPowerMultiplier() → number` | 228 |  |
| `PowerConsumer:getConsumedPtoTorque(expected: any, ignoreTurnOnPeak: any) → number` | 236 |  |
| `PowerConsumer:getConsumingLoad()` | 264 |  |
| `PowerConsumer:getCanBeTurnedOn(superFunc: any) → boolean` | 271 |  |
| `PowerConsumer:getCanBeTurnedOnAll(superFunc: any) → boolean` | 299 |  |
| `PowerConsumer:getTurnedOnNotAllowedWarning(superFunc: any) → string` | 325 |  |
| `PowerConsumer:getRawSpeedLimit(superFunc: any)` | 337 |  |
| `PowerConsumer:loadWorkModeFromXML(superFunc: any, xmlFile: any, key: any, workMode: any)` | 353 |  |
| `PowerConsumer:onStateChange(state: any, data: any)` | 366 |  |
| `PowerConsumer:onWorkModeChanged(workMode: any, oldWorkMode: any)` | 381 |  |
| `PowerConsumer:onTurnedOn()` | 398 |  |
| `PowerConsumer.getTotalConsumedPtoTorque(self: table?, excludeVehicle: table?, expected: boolean?, ignoreTurnOnPeak: boolean?) → number, number` | 409 |  |
| `PowerConsumer.getMaxPtoRpm(self: any) → number` | 438 |  |
| `PowerConsumer:consoleSetPowerConsumer(neededMinPtoPower: any, neededMaxPtoPower: any, forceFactor: any, maxForce: any, forceDir: any, ptoRpm: any)` | 458 |  |
| `PowerConsumer.loadSpecValueNeededPower(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → number` | 500 |  |
| `PowerConsumer.getSpecValueNeededPower(storeItem: table, realItem: table, configurations: any, saleItem: any, returnValues: any, returnRange: any) → string, number, number` | 529 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadPowerSetup` | 77 |
| registerFunction | `getPtoRpm` | 78 |
| registerFunction | `getDoConsumePtoPower` | 79 |
| registerFunction | `getPowerMultiplier` | 80 |
| registerFunction | `getConsumedPtoTorque` | 81 |
| registerFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 88 |
| registerOverwrittenFunction | `getCanBeTurnedOnAll` | 89 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 90 |
| registerOverwrittenFunction | `getRawSpeedLimit` | 91 |
| registerOverwrittenFunction | `loadWorkModeFromXML` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onUpdate` | 99 |
| registerEventListener | `onStateChange` | 100 |
| registerEventListener | `onWorkModeChanged` | 101 |
| registerEventListener | `onTurnedOn` | 102 |
