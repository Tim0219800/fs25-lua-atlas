# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua` — FS25 1.25.1.0

✍ Precision Farming specialization added to combines (requires Combine and PrecisionFarmingStatistic). It shows the yield map on the minimap while harvesting on a field, adds a HUD help extension, and synchronises the last yield weight, yield percentage and yield potential from server to clients. The class doc comment in the source says it toggles minimap zoom.

- **ExtendedCombine** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedCombine.prerequisitesPresent(specializations: table) → boolean` | 27 | ✍ Returns true when the vehicle type has both Combine and PrecisionFarmingStatistic. |
| `ExtendedCombine:onDelete()` | 63 | ✍ Deletes the HUD extension if one was created. |
| `ExtendedCombine:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 72 | ✍ Client side: if the server sent a flag, reads the last yield weight (tenths), yield percentage and yield potential percentage. |
| `ExtendedCombine:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 86 | ✍ Server side: when the usage values dirty flag is set, writes the three yield values, each capped at its maximum bit range. |
| `ExtendedCombine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 100 | ✍ When the vehicle is active for input (ignoring AI), adds its HUD extension to the HUD help. |
| `ExtendedCombine:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 112 | ✍ Client only: while active for input (ignoring AI), refreshes the minimap yield map display state. |
| `ExtendedCombine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 122 | ✍ Client only: refreshes the minimap state, forcing it off when the vehicle is not active for input. |
| `ExtendedCombine.updateMinimapActiveState(self: any, forcedState: any)` | 134 | ✍ Tells the yield map whether the minimap should show it: true when the combine is on a field with an attached cutter and no mission, unless a state is forced. Does nothing if there is no yield map. |
| `ExtendedCombine:setLastYieldValues(lastYieldWeight: any, lastYieldPercentage: any, lastYieldPotential: any)` | 150 | ✍ Stores the last yield weight, percentage and potential and raises the dirty flag for network sync only if one of them changed. |
