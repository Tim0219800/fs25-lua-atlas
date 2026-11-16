# handTools/specializations/HandToolTethered.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolTethered.md)*

Source: `dataS/scripts/handTools/specializations/HandToolTethered.lua` — FS25 1.25.1.0

✍ Hand tool specialization for tools bound to a holder by a tether, such as a pressure washer lance. It requires HandToolStorable. The tool is forced to mustBeHeld = true and canBeSaved = false, warns the local player when too far from the holder, and returns to the holder when the player goes beyond the maximum range, enters a vehicle or leaves the game.

- **HandToolTethered** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolTethered.registerXMLPaths(xmlSchema: any)` | 15 | ✍ Registers handTool.tethered XML keys: #warningText (l10n text), #actionRange (default 3 m) and #range (default 5 m, the distance at which the tool snaps back). |
| `HandToolTethered.registerFunctions(handToolType: any)` | 24 | ✍ Registers showRangeWarning, returnToHolder and setAttachedHolder on the hand tool type. |
| `HandToolTethered.registerOverwrittenFunctions(vehicleType: any)` | 32 | ✍ Overrides setHolder on the type. Note: the parameter is named vehicleType in the source although it receives a hand tool type. |
| `HandToolTethered.registerEventListeners(handToolType: any)` | 38 | ✍ Subscribes to onLoad, onDelete, onCarryingPlayerEnteredVehicle, onCarryingPlayerLeftGame and onPreUpdate. |
| `HandToolTethered.prerequisitesPresent(specializations: any)` | 48 | ✍ Returns true only if the HandToolStorable specialization is present. |
| `HandToolTethered:onLoad(xmlFile: any, baseDirectory: any)` | 54 | ✍ Reads the warning text and the two ranges, forces mustBeHeld to true and canBeSaved to false (logging a warning if the XML type had other values) and creates an MD5 identifier used for the blinking warning. |
| `HandToolTethered:onDelete()` | 85 | ✍ Clears the spawnedHandTool reference on the attached holder, if any, so the holder no longer points to this tool. |
| `HandToolTethered:onPreUpdate(dt: any)` | 94 | ✍ While held by a player, measures the distance between the player and the holder node. Beyond the maximum range it calls returnToHolder; beyond the action range, for the local player only, it shows the range warning. |
| `HandToolTethered:setAttachedHolder(holder: any)` | 126 | ✍ Stores the holder this tool is tethered to. It can only be set once; a second call logs a dev warning and is ignored. |
| `HandToolTethered:onCarryingPlayerLeftGame()` | 138 | ✍ Event handler: sends the tool back to its holder when the carrying player leaves the game. |
| `HandToolTethered:onCarryingPlayerEnteredVehicle()` | 144 | ✍ Event handler: sends the tool back to its holder when the carrying player enters a vehicle. |
| `HandToolTethered:setHolder(superFunc: any, holder: any, noEventSend: any)` | 150 | ✍ Override of setHolder. A nil holder is replaced by the attached holder (and ignored if none), so a tethered tool can never be left without a holder. Then it calls the parent implementation. |
| `HandToolTethered:returnToHolder(noEventSend: any)` | 165 | ✍ Puts the tool back into its attached holder through setHolder; does nothing if no holder is attached. The noEventSend flag is passed through. |
| `HandToolTethered:showRangeWarning(holderPlayerDistance: any)` | 176 | ✍ Shows a blinking on-screen warning with the remaining distance before the tool snaps back. Skipped when a GUI is visible or the warning text is empty. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `showRangeWarning` | 25 |
| registerFunction | `returnToHolder` | 26 |
| registerFunction | `setAttachedHolder` | 27 |
| registerOverwrittenFunction | `setHolder` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onCarryingPlayerEnteredVehicle` | 41 |
| registerEventListener | `onCarryingPlayerLeftGame` | 42 |
| registerEventListener | `onPreUpdate` | 43 |
