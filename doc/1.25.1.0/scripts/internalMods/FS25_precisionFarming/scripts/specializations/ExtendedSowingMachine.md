# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua` — FS25 1.25.1.0

- **ExtendedSowingMachine** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ExtendedSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 25 |  |
| `ExtendedSowingMachine:onDelete()` | 84 |  |
| `ExtendedSowingMachine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 93 |  |
| `ExtendedSowingMachine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 141 |  |
| `ExtendedSowingMachine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 169 |  |
| `ExtendedSowingMachine:setSeedRateAutoMode(state: any, noEventSend: any)` | 191 |  |
| `ExtendedSowingMachine:setManualSeedRate(seedRate: any, noEventSend: any)` | 210 |  |
| `ExtendedSowingMachine:onTramlinesChanged()` | 222 |  |
| `ExtendedSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 229 |  |
| `ExtendedSowingMachine:processOverSeedingArea(superFunc: any, workArea: any, dt: any)` | 262 |  |
| `ExtendedSowingMachine.actionEventToggleAuto(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 295 |  |
| `ExtendedSowingMachine.actionEventChangeSeedRate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, ...: any)` | 301 |  |
| `ExtendedSowingMachine.updateActionEventState(self: any)` | 308 |  |
