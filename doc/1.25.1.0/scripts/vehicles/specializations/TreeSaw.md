# vehicles/specializations/TreeSaw.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TreeSaw.md)*

Source: `dataS/scripts/vehicles/specializations/TreeSaw.lua` — FS25 1.25.1.0

✍ Specialization for vehicle-mounted saws that cut standing or fallen wood (distinct from the chainsaw hand tool). While turned on, the server looks for a split shape at the configured cut node, waits a delay and then cuts it with ChainsawUtil. Clients play the cut effect and sounds and receive the cutting flag through the update stream. It requires TurnOnVehicle; EffectManager and the split-shape engine functions are not in the dump, so their exact behaviour is UNVERIFIED.

- **TreeSaw** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreeSaw.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has the TurnOnVehicle specialization. |
| `TreeSaw.initSpecialization()` | 23 | ✍ Registers the `vehicle.treeSaw` XML keys: cut and saw sounds, animation nodes, effects, and the cut node with its size, minimum lengths above/below the cut and cut delay in seconds. |
| `TreeSaw.registerEventListeners(vehicleType: any)` | 45 | ✍ Subscribes to onLoad, onDelete, update streams, onUpdate, onUpdateTick, onDraw, onDeactivate, onTurnedOn and onTurnedOff. |
| `TreeSaw:onLoad(savegame: table)` | 61 | ✍ Loads animation nodes, effects and sounds on clients, reads the cut node parameters (delay converted to milliseconds) and resets the cutting state. |
| `TreeSaw:onDelete()` | 95 | ✍ Deletes the effects, sound samples and animation nodes. |
| `TreeSaw:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 107 | ✍ Client only: reads the `isCutting` flag sent by the server. |
| `TreeSaw:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 119 | ✍ Server only: writes the `isCutting` flag every update, without using a dirty mask. |
| `TreeSaw:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 131 | ✍ Server: drops the target if it no longer exists, counts the cut timer down and performs the cut with ChainsawUtil when it reaches 0. Client: plays the wood chip effect and cut sound while the timer is running, stops them otherwise. |
| `TreeSaw:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 187 | ✍ While turned on, looks for a split shape at the cut node, checks farm land access (otherwise sets a warning), and validates the target: the cut must be testable, not too low near the tree base, and leave minimum lengths on both sides. Starts or cancels the cut timer accordingly. |
| `TreeSaw:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 250 | ✍ Shows the 'cutting' info text while cutting and a blinking warning when the tree is on land the farm cannot access. |
| `TreeSaw:onDeactivate()` | 264 | ✍ Clears the current target and cancels the cut timer. |
| `TreeSaw:onTurnedOn()` | 273 | ✍ Client only: starts the animation nodes and the saw sound. |
| `TreeSaw:onTurnedOff()` | 283 | ✍ Clears the target and cancels the timer; on the client also stops animations, effects and sounds. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 46 |
| registerEventListener | `onDelete` | 47 |
| registerEventListener | `onReadUpdateStream` | 48 |
| registerEventListener | `onWriteUpdateStream` | 49 |
| registerEventListener | `onUpdate` | 50 |
| registerEventListener | `onUpdateTick` | 51 |
| registerEventListener | `onDraw` | 52 |
| registerEventListener | `onDeactivate` | 53 |
| registerEventListener | `onTurnedOn` | 54 |
| registerEventListener | `onTurnedOff` | 55 |
