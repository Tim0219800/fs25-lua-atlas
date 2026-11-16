# gui/dialogs/AnimalWorkerDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/AnimalWorkerDialog.md)*

Source: `dataS/scripts/gui/dialogs/AnimalWorkerDialog.lua` — FS25 1.25.1.0

✍ MessageDialog subclass for managing the hireable worker tasks of an animal husbandry: one row per task with schedule, cost, number of animals needing work, an on/off toggle and a run-now button. Toggles change a working copy only; the calling code must apply it, send it over the network and handle the immediate run. Unsubscribes from PlaceableHusbandryAnimalWorkerPerformAnswerEvent on close. Row building and info refreshing live in assignTaskRows and refreshInfo, not in this file (UNVERIFIED).

- **AnimalWorkerDialog** inherits from `MessageDialog` (l.20)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalWorkerDialog:onGuiSetupFinished()` | 80 | ✍ After GUI setup, detaches the task row template from the layout and the focus manager, and records the authored maximum box height and the remaining frame height for later shrinking. |
| `AnimalWorkerDialog:delete()` | 93 | ✍ Deletes the unlinked row template, then the dialog itself, since the template is no longer owned by the layout. |
| `AnimalWorkerDialog:onOpen()` | 111 | ✍ If a husbandry is set, builds the task rows with assignTaskRows, restarts the refresh timer and refreshes the info at once. Does nothing more when husbandry is nil. |
| `AnimalWorkerDialog:onClose()` | 126 | ✍ Clears the pending row and unsubscribes from the perform-answer event. Husbandry and callbacks are cleared too, except during a GUI reload (g_gui.currentlyReloading) so the state survives. |
| `AnimalWorkerDialog:update(dt: number)` | 147 | ✍ While open with a husbandry, counts down the refresh timer by dt (ms) and calls refreshInfo each time it elapses (AnimalWorkerDialog.INFO_REFRESH_INTERVAL, defined elsewhere). |
