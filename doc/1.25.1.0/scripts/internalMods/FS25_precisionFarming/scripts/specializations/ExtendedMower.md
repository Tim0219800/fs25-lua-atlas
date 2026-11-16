# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua` — FS25 1.25.1.0

✍ Precision Farming specialization added to mowers (requires Mower and PrecisionFarmingStatistic). It shows the yield map on the minimap while on a field and wraps processMowerArea with the harvest extension's pre and post processing. The class doc comment in the source says it toggles minimap zoom.

- **ExtendedMower** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedMower.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true when the vehicle type has both Mower and PrecisionFarmingStatistic. |
| `ExtendedMower:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 36 | ✍ Client only: while active for input (ignoring AI), refreshes the minimap yield map display state. |
| `ExtendedMower:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 46 | ✍ Client only: refreshes the minimap state, forcing it off when the vehicle is not active for input. |
| `ExtendedMower.updateMinimapActiveState(self: any, forcedState: any)` | 58 | ✍ Tells the yield map to show on the minimap when the mower is on a field, unless a state is forced. Note: unlike ExtendedCombine, it does not check that the yield map is non-nil. |
| `ExtendedMower:processMowerArea(superFunc: any, workArea: any, dt: any)` | 72 | ✍ Override: calls preProcessMowerArea and postProcessMowerArea of g_precisionFarming.harvestExtension around the base function, skipped for far clients beyond Mower.CLIENT_DM_UPDATE_RADIUS. Returns the base changed and total area. |
