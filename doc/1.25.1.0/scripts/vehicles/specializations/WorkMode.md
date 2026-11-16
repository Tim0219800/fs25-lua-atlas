# vehicles/specializations/WorkMode.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WorkMode.md)*

Source: `dataS/scripts/vehicles/specializations/WorkMode.lua` — FS25 1.25.1.0

✍ Specialization for implements that offer several selectable work modes, each bundling its own animations, work areas, windrower effects, AI setup, moving-tool limits and variable work width. It requires WorkArea and AnimatedVehicle, reads the `vehicle.workModes` XML block (optionally per `workMode` configuration), and saves the current mode in the savegame. The mode is synchronized to clients (join stream and a server-to-client update stream for windrow effects) and changed through SetWorkModeEvent. It raises `onWorkModeChanged`.

- **WorkMode** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `WorkMode.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Returns true only if the vehicle type also has the WorkArea and AnimatedVehicle specializations. |
| `WorkMode.initSpecialization()` | 30 | ✍ Registers the `workMode` configuration type and the XML schema paths under `vehicle.workModes` and each configuration entry, plus the savegame attribute `workMode#state` (default 1). |
| `WorkMode.registerWorkModeXMLPaths(schema: any, basePath: any)` | 48 | ✍ Declares every XML key of a work-mode block: fold limits, change permissions, per-mode animations, work/drop areas, moving-tool limit, variable work width, windrower effect, animation nodes and AI. Also adds `workModeIndex` for spray types and `allowWhileChangingWorkMode` for moving tools. |
| `WorkMode.registerEvents(vehicleType: table)` | 98 | ✍ Registers the vehicle event `onWorkModeChanged`. |
| `WorkMode.registerFunctions(vehicleType: any)` | 104 | ✍ Adds loadWorkModeFromXML, setWorkMode, getWorkMode, getIsWorkModeChangeAllowed and deactivateWindrowerEffects to the vehicle type. Note: `WorkMode:getWorkMode` is registered here but no definition appears in this file (UNVERIFIED where it comes from). |
| `WorkMode.registerOverwrittenFunctions(vehicleType: any)` | 114 | ✍ Overrides getIsWorkAreaActive, getCanBeSelected, getAllowsLowering, loadSprayTypeFromXML, getIsSprayTypeActive, loadMovingToolFromXML, getIsMovingToolActive and getAreEffectsVisible. |
| `WorkMode.registerEventListeners(vehicleType: any)` | 127 | ✍ Subscribes the specialization to load, delete, network stream, update, draw, turn on/off, deactivate, lowering, fold-state and action-event registration callbacks. |
| `WorkMode:onLoad(savegame: table)` | 149 | ✍ Reads the work-mode definitions (using the vehicle's `workMode` configuration if present), applies the default mode, creates the HUD extension and allocates the dirty flag. If no mode is defined, it removes all the other event listeners to avoid any cost. Prints an error if the mode count exceeds what the network bit width can carry. |
| `WorkMode:onPostLoad(savegame: any)` | 219 | ✍ Restores the saved mode from the savegame (clamped to the valid range), fast-forwards the animations to their end state and, for foldable tools that are not moving, sets the fold direction from the current fold time. |
| `WorkMode:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 251 | ✍ Writes the current work mode index to the savegame key `#state`. |
| `WorkMode:onDelete()` | 260 | ✍ Deletes the windrower effects and animation nodes of every mode and the HUD extension. |
| `WorkMode:onReadStream(streamId: integer, connection: Connection)` | 278 | ✍ Client side on join: reads the current mode index from the stream and applies it without sending an event. |
| `WorkMode:onWriteStream(streamId: integer, connection: Connection)` | 287 | ✍ Server side on join: writes the current mode index to the stream. |
| `WorkMode:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 298 | ✍ Client only: when the dirty bit was sent, reads for each windrower effect of the active mode whether it was recently charged, and reads the accumulated fruit type. |
| `WorkMode:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 320 | ✍ Server only: when the dirty flag is set, writes for each windrower effect of the active mode whether it was charged in the last 500 ms, then the accumulated fruit type. |
| `WorkMode:onUpdate(dt: number, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 338 | ✍ Client: fades turned-on animations in and out, starts or stops windrower effects according to the last charge time and fruit type, and enables the work-mode input actions depending on whether a change is allowed. Server: tracks the fruit type and pickup activity of the active mode's work areas and raises the dirty flag. |
| `WorkMode:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 440 | ✍ When the tool is fully unfolded (or at its middle fold position), restarts mode animations flagged to repeat after unfolding and runs a lowering animation that was postponed during folding. |
| `WorkMode:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 481 | ✍ Adds the work-mode HUD help extension to the HUD each frame when one exists. |
| `WorkMode:onDeactivate()` | 492 | ✍ Stops the windrower effects when the vehicle is deactivated. |
| `WorkMode:deactivateWindrowerEffects()` | 498 | ✍ Client only: stops the windrower effects of every work mode. |
| `WorkMode:loadWorkModeFromXML(xmlFile: any, key: any, workMode: any)` | 511 | ✍ Fills a mode table from XML: name, input action, default flag, turned-on and lowering animations (only if the animation exists), work and drop areas, mode-change animations, moving-tool limit, variable work width, windrower effects, animation nodes and AI setup. Always returns true. |
| `WorkMode:setWorkMode(state: integer, noEventSend: boolean)` | 603 | ✍ Switches to the given mode: unless `noEventSend` is set, it sends SetWorkModeEvent (broadcast from the server, request from a client). Then it swaps animations, effects, variable work width, work-area drop indices and moving-tool limits, and raises `onWorkModeChanged`. Silently returns for an invalid index. |
| `WorkMode:getIsWorkAreaActive(superFunc: any, workArea: any)` | 741 | ✍ Returns false for a work area that the active mode maps to drop area 0; otherwise defers to the parent implementation. |
| `WorkMode:getCanBeSelected(superFunc: any)` | 758 | ✍ Always returns true, so the implement can be selected whatever the parent logic says. |
| `WorkMode:getAllowsLowering(superFunc: any)` | 764 | ✍ Returns the parent result, or true if the active mode defines lowering animations; the warning from the parent is passed through. |
| `WorkMode:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 778 | ✍ Reads the optional `#workModeIndex` of a spray type, then calls the parent loader. |
| `WorkMode:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 786 | ✍ Returns false when the spray type is bound to a work mode other than the current one; otherwise defers to the parent. |
| `WorkMode:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 798 | ✍ Calls the parent loader and, if it succeeds, reads `#allowWhileChangingWorkMode` (default true) into the moving tool entry. |
| `WorkMode:getIsMovingToolActive(superFunc: any, movingTool: any)` | 810 | ✍ Returns false for a moving tool that forbids movement during mode changes while any mode-change animation is playing; otherwise defers to the parent. |
| `WorkMode:getAreEffectsVisible(superFunc: any)` | 831 | ✍ Returns false while any mode-change animation is playing or if the parent says effects are hidden; otherwise true. |
| `WorkMode:getIsWorkModeChangeAllowed() → boolean` | 857 | ✍ Returns false if the fold position lies outside the configured fold limits, or if changing while lowered is forbidden and the implement's attacher joint is moving down; otherwise true. |
| `WorkMode:onTurnedOff()` | 884 | ✍ Client only: stops windrower effects, sets the turned-on animations to fade out and stops the mode's animation nodes. |
| `WorkMode:onTurnedOn()` | 901 | ✍ Client only: sets the turned-on animations to fade in and starts the animation nodes of the active mode. |
| `WorkMode:onSetLowered(lowered: boolean)` | 918 | ✍ Plays or reverses the active mode's lowering animations when the tool is lowered or raised. If the tool is mid-fold the request is postponed. Note: it compares against `self.foldMiddleAnimTime`, whereas other code uses `spec_foldable.foldMiddleAnimTime`, which looks inconsistent. |
| `WorkMode:onFoldStateChanged(direction: integer, moveToMiddle: any)` | 947 | ✍ When unfolding starts, re-arms the repeat flag of the mode animations and asks the attacher vehicle to raise the implement if it is still lowered. |
| `WorkMode:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 973 | ✍ Client only: registers the cycle action `TOGGLE_WORKMODE` and one direct action per mode with an input binding; all start inactive and are enabled later by onUpdate. |
| `WorkMode.actionEventWorkModeChange(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 998 | ✍ Input callback that moves to the next mode, wrapping back to the first one, and applies it via setWorkMode (which sends the event). |
| `WorkMode.actionEventWorkModeChangeDirect(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1012 | ✍ Input callback that selects the mode bound to the triggered action, if it differs from the current one. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onWorkModeChanged` | 99 |
| registerFunction | `loadWorkModeFromXML` | 105 |
| registerFunction | `setWorkMode` | 106 |
| registerFunction | `getWorkMode` | 107 |
| registerFunction | `getIsWorkModeChangeAllowed` | 108 |
| registerFunction | `deactivateWindrowerEffects` | 109 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 115 |
| registerOverwrittenFunction | `getCanBeSelected` | 116 |
| registerOverwrittenFunction | `getAllowsLowering` | 117 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 118 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 119 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 120 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 121 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 122 |
| registerEventListener | `onLoad` | 128 |
| registerEventListener | `onPostLoad` | 129 |
| registerEventListener | `onDelete` | 130 |
| registerEventListener | `onReadStream` | 131 |
| registerEventListener | `onWriteStream` | 132 |
| registerEventListener | `onReadUpdateStream` | 133 |
| registerEventListener | `onWriteUpdateStream` | 134 |
| registerEventListener | `onUpdate` | 135 |
| registerEventListener | `onUpdateTick` | 136 |
| registerEventListener | `onDraw` | 137 |
| registerEventListener | `onTurnedOn` | 138 |
| registerEventListener | `onTurnedOff` | 139 |
| registerEventListener | `onDeactivate` | 140 |
| registerEventListener | `onSetLowered` | 141 |
| registerEventListener | `onFoldStateChanged` | 142 |
| registerEventListener | `onRegisterActionEvents` | 143 |
