# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSprayer.lua` — FS25 1.25.1.0

- **ExtendedSprayer** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ExtendedSprayer.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `ExtendedSprayer.initSpecialization()` | 28 |  |
| `ExtendedSprayer:onPostLoad(savegame: any)` | 203 |  |
| `ExtendedSprayer:onDelete()` | 214 |  |
| `ExtendedSprayer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 223 |  |
| `ExtendedSprayer:onReadStream(streamId: integer, connection: Connection)` | 233 |  |
| `ExtendedSprayer:onWriteStream(streamId: integer, connection: Connection)` | 245 |  |
| `ExtendedSprayer:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 254 |  |
| `ExtendedSprayer:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 278 |  |
| `ExtendedSprayer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 300 |  |
| `ExtendedSprayer:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 370 |  |
| `ExtendedSprayer:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 404 |  |
| `ExtendedSprayer:onTurnedOn()` | 417 |  |
| `ExtendedSprayer:onTurnedOff()` | 425 |  |
| `ExtendedSprayer:onStateChange(state: any, data: any)` | 433 |  |
| `ExtendedSprayer:onVariableWorkWidthSectionChanged()` | 443 |  |
| `ExtendedSprayer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 459 |  |
| `ExtendedSprayer.getValidSprayerToUse(self: any)` | 494 |  |
| `ExtendedSprayer.getIsVehicleValid(vehicle: any)` | 508 |  |
| `ExtendedSprayer.actionEventToggleAuto(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 530 |  |
| `ExtendedSprayer.actionEventChangeSprayAmount(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 536 |  |
| `ExtendedSprayer.actionEventChangeDefaultFruitRequirement(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 543 |  |
| `ExtendedSprayer.updateActionEventState(self: any)` | 550 |  |
| `ExtendedSprayer.updateActionEventAutoModeDefault(self: any)` | 566 |  |
| `ExtendedSprayer.getFillTypeSourceVehicle(sprayer: any)` | 576 |  |
| `ExtendedSprayer:getCurrentSprayerMode()` | 608 |  |
| `ExtendedSprayer:getCurrentNitrogenLevelOffset(lastChangeLevels: any)` | 639 |  |
| `ExtendedSprayer:getCurrentNitrogenUsageLevelOffset(lastChangeLevels: any)` | 645 |  |
| `ExtendedSprayer:getUseExtendedSprayerHudExtension()` | 651 |  |
| `ExtendedSprayer:getShowExtendedSprayerHudExtension()` | 665 |  |
| `ExtendedSprayer:getIsUsingExactNitrogenAmount()` | 694 |  |
| `ExtendedSprayer.updateMinimapActiveState(self: any)` | 700 |  |
| `ExtendedSprayer:getIsPrecisionSprayingRequired()` | 721 |  |
| `ExtendedSprayer.updateSprayerEffectState(self: any, force: any)` | 758 |  |
| `ExtendedSprayer:updateWorkAreaWidth(superFunc: integer, workAreaIndex: integer, workArea: any)` | 810 |  |
| `ExtendedSprayer:getSprayerUsage(superFunc: any, fillType: any, dt: any)` | 1441 |  |
| `ExtendedSprayer:processSprayerArea(superFunc: any, workArea: any, dt: any)` | 1608 |  |
| `ExtendedSprayer:changeSeedIndex(superFunc: any, ...: any)` | 1684 |  |
| `ExtendedSprayer:getSprayerDoubledAmountActive(superFunc: any, sprayTypeIndex: any)` | 1694 |  |
| `ExtendedSprayer:updateSprayerEffects(superFunc: any, force: any)` | 1701 |  |
| `ExtendedSprayer:updateExtendedSprayerNozzleEffectState(superFunc: any, effectData: any, dt: any, isTurnedOn: any, lastSpeed: any)` | 1706 |  |
| `ExtendedSprayer:setSprayerAITerrainDetailProhibitedRange(superFunc: any, fillType: any)` | 1728 |  |
| `ExtendedSprayer:preProcessExtUnderRootFertilizerArea(workArea: any, dt: any)` | 1764 |  |
| `ExtendedSprayer:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 1785 |  |
| `ExtendedSprayer:setSprayAmountAutoMode(state: any, noEventSend: any)` | 1823 |  |
| `ExtendedSprayer:setSprayAmountManualValue(value: any, noEventSend: any)` | 1842 |  |
| `ExtendedSprayer:setSprayAmountAutoFruitTypeIndex(index: any)` | 1853 |  |
| `ExtendedSprayer:setSprayAmountDefaultFruitRequirementIndex(index: any, noEventSend: any)` | 1865 |  |
| `ExtendedSprayer:updateDebugValues(values: any)` | 1876 |  |
