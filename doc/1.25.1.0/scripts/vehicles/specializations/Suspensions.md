# vehicles/specializations/Suspensions.lua

Source : `dataS/scripts/vehicles/specializations/Suspensions.lua` — FS25 1.25.1.0

- **Suspensions** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Suspensions.prerequisitesPresent(specializations: any)` | 19 |  |
| `Suspensions.initSpecialization()` | 25 |  |
| `Suspensions.registerFunctions(vehicleType: any)` | 53 |  |
| `Suspensions.registerEventListeners(vehicleType: any)` | 62 |  |
| `Suspensions:onLoad(savegame: any)` | 71 |  |
| `Suspensions:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 114 |  |
| `Suspensions:loadSuspensionNodeFromXML(xmlFile: any, key: any, suspensionNode: any)` | 240 |  |
| `Suspensions:getSuspensionNodeFromIndex(suspensionIndex: any)` | 314 |  |
| `Suspensions:getIsSuspensionNodeActive(suspensionNode: any)` | 325 |  |
| `Suspensions:setSuspensionNodeCharacter(suspensionNode: any, character: any)` | 331 |  |
| `Suspensions:onEnterVehicle(isControlling: any)` | 347 |  |
| `Suspensions:onVehicleCharacterChanged(character: any)` | 361 |  |
| `Suspensions.subCollisionErrorFunction(collisionNode: any, xmlFile: any, nodeName: any)` | 376 |  |
| `Suspensions:getSuspensionModfier()` | 384 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadSuspensionNodeFromXML` | 54 |
| registerFunction | `getSuspensionNodeFromIndex` | 55 |
| registerFunction | `getIsSuspensionNodeActive` | 56 |
| registerFunction | `setSuspensionNodeCharacter` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onUpdate` | 64 |
| registerEventListener | `onEnterVehicle` | 65 |
| registerEventListener | `onVehicleCharacterChanged` | 66 |
