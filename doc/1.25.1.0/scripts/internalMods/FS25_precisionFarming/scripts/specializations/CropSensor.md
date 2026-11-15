# internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/CropSensor.lua` — FS25 1.25.1.0

- **CropSensor** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CropSensor.prerequisitesPresent(specializations: table) → boolean` | 40 |  |
| `CropSensor.initSpecialization()` | 46 |  |
| `CropSensor:onLoad(savegame: any)` | 97 |  |
| `CropSensor:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 216 |  |
| `CropSensor:onDraw()` | 232 |  |
| `CropSensor:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 252 |  |
| `CropSensor:onRootVehicleChanged(rootVehicle: table)` | 269 |  |
| `CropSensor.actionEventToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 301 |  |
| `CropSensor.updateActionEventTexts(self: any)` | 307 |  |
| `CropSensor.actionControllerToggleEvent(self: any, direction: any)` | 317 |  |
| `CropSensor:doCheckSpeedLimit(superFunc: any) → boolean` | 326 |  |
| `CropSensor:getUseTurnedOnSchema(superFunc: any)` | 333 |  |
| `CropSensor:setCropSensorActive(state: any, noEventSend: any)` | 340 |  |
| `CropSensor:updateCropSensorWorkingWidth()` | 373 |  |
| `CropSensor:updateSensorRadius(sensorNode: any, workingWidth: any)` | 385 |  |
| `CropSensor:updateSensorNode(sensorNode: any)` | 400 |  |
| `CropSensor:linkCropSensor(linkData: any)` | 419 |  |
| `CropSensor.getMaxWorkingWidth(sensorVehicle: any)` | 491 |  |
