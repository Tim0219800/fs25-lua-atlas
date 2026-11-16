# vehicles/specializations/WoodCrusher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WoodCrusher.md)*

Source: `dataS/scripts/vehicles/specializations/WoodCrusher.lua` — FS25 1.25.1.0

✍ Specialization for machines that pull logs through a trigger, cut them at a cut node and turn them into wood chips in a fill unit. It requires TurnOnVehicle and FillUnit. Most logic lives in reusable static functions (`loadWoodCrusher`, `updateWoodCrusher`, ...) taking an explicit spec table, so other specializations can embed a crusher. Crushing, forces and trigger bookkeeping run on the server; effects, sounds and animations run on the client, with a single boolean in the update stream telling clients whether crushing is happening. XML root is `vehicle.woodCrusher`.

- **WoodCrusher** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodCrusher.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type has both the TurnOnVehicle and FillUnit specializations. |
| `WoodCrusher.initSpecialization()` | 25 | ✍ Registers the XML schema: the shared crusher paths under `vehicle.woodCrusher`, plus `#moveColDisableCollisionPairs` and `#fillUnitIndex`. |
| `WoodCrusher.registerWoodCrusherXMLPaths(schema: any, key: any)` | 39 | ✍ Registers crusher XML paths under a given key: cut and drum nodes, move triggers and collisions, move speed (m/s) and force (kN), down force nodes, auto turn-on, crush effects, animation nodes and start/stop/work/idle sounds. |
| `WoodCrusher.registerFunctions(vehicleType: any)` | 72 | ✍ Registers the vehicle function `onCrushedSplitShape`. |
| `WoodCrusher.registerOverwrittenFunctions(vehicleType: any)` | 78 | ✍ Overrides `getDirtMultiplier`, `getWearMultiplier`, `getCanBeTurnedOn`, `getConsumingLoad` and `getRequiresPower`. |
| `WoodCrusher.registerEventListeners(vehicleType: any)` | 88 | ✍ Subscribes to onLoad, onDelete, the read/write update stream, onUpdate, onUpdateTick, onTurnedOn and onTurnedOff. |
| `WoodCrusher:onLoad(savegame: table)` | 102 | ✍ Loads the crusher from the vehicle XML. If `#moveColDisableCollisionPairs` is true (default), disables collision between every component and each move collision node. Reads the fill unit index (default 1). |
| `WoodCrusher:onDelete()` | 121 | ✍ Releases triggers, effects, sounds and animations through `deleteWoodCrusher`. |
| `WoodCrusher:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 130 | ✍ Client side: reads one boolean from the server and sets the crushing timer to 1000 ms or 0. |
| `WoodCrusher:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 146 | ✍ Server side: writes one boolean telling whether the crushing timer is above zero. |
| `WoodCrusher:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 158 | ✍ Runs `updateWoodCrusher` with the vehicle's current turned-on state. |
| `WoodCrusher:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 167 | ✍ Runs `updateTickWoodCrusher`, then on the server, if automatic motor start is enabled in the savegame and `#automaticallyTurnOn` is set: starts the motor (own or attacher's) and turns the crusher on while logs are in the move triggers when unattended, and turns it off after a 3 s delay once empty. |
| `WoodCrusher:onTurnedOn()` | 224 | ✍ Event handler: delegates to `turnOnWoodCrusher`. |
| `WoodCrusher:onTurnedOff()` | 231 | ✍ Event handler: delegates to `turnOffWoodCrusher`. |
| `WoodCrusher:getCanBeTurnedOn(superFunc: any) → boolean` | 238 | ✍ Returns false when the crusher is configured to turn on automatically (manual switching is blocked); otherwise defers to the parent implementation. |
| `WoodCrusher:getConsumingLoad(superFunc: any)` | 249 | ✍ Adds one load unit (and one to the count) to the parent result while crushing is in progress. The count is incremented even when idle. |
| `WoodCrusher:getRequiresPower(superFunc: any)` | 262 | ✍ Returns true whenever the crusher is turned on; otherwise uses the parent result. |
| `WoodCrusher:getDirtMultiplier(superFunc: any) → number` | 273 | ✍ Adds the vehicle's work dirt multiplier to the parent value while crushing. |
| `WoodCrusher:getWearMultiplier(superFunc: any) → number` | 287 | ✍ Adds the vehicle's work wear multiplier to the parent value while crushing. |
| `WoodCrusher:onCrushedSplitShape(splitType: table, volume: number)` | 302 | ✍ Adds wood chips to the fill unit for a crushed volume (volume x liters per volume x chips per liter of the split type). Volume is reduced by vehicle damage times `WoodCrusher.DAMAGED_YIELD_DECREASE`. |
| `WoodCrusher.loadWoodCrusher(self: table, woodCrusher: table, xmlFile: XMLFile, rootNode: integer, i3dMappings: table)` | 319 | ✍ Loads all crusher data from XML into a spec table: nodes, move triggers (warns if the TREE collision bit is missing), move collisions, down force nodes, effects, animations and sounds. Registers triggers on the server. Also warns about deprecated FS17/FS19 XML keys. |
| `WoodCrusher.deleteWoodCrusher(self: any, woodCrusher: any)` | 453 | ✍ Removes move and down force triggers and deletes effects, sounds and animations of a crusher table. |
| `WoodCrusher.updateWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 474 | ✍ Server, while on: crushes shapes queued in `crushNodes`, applies down force to logs in the trigger, tracks the largest log height to move the drum reference node smoothly (0.0003 m per ms), and keeps the vehicle active while logs are present or crushing runs. |
| `WoodCrusher.updateTickWoodCrusher(self: number, woodCrusher: any, dt: number, isTurnedOn: any)` | 541 | ✍ Server, while on: tests each log against the cut plane; crushes it whole if 0.4 or less remains below, or splits it when 0.2 or more lies above; jitters move collision nodes. Then decrements the crushing timer and, on clients, starts or stops the chip effect and the work sound. |
| `WoodCrusher.turnOnWoodCrusher(self: any, woodCrusher: any)` | 608 | ✍ On turn-on: the server sets friction velocity on move collision nodes (pulling logs in); the client stops sounds, plays the start sample then idle, and starts animations. |
| `WoodCrusher.turnOffWoodCrusher(self: any, woodCrusher: any)` | 629 | ✍ On turn-off: the server crushes any queued shapes and zeroes friction velocity; the client stops effects, sounds and animations and plays the stop sample. |
| `WoodCrusher.crushSplitShape(self: integer, woodCrusher: any, shape: integer)` | 657 | ✍ Server: if the shape's split type yields wood chips, reads its volume, deletes the shape, sets the 1000 ms crushing timer and calls `onCrushedSplitShape`. Does nothing for other types. |
| `WoodCrusher.woodCrusherSplitShapeCallback(self: integer, shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 676 | ✍ Callback of `splitShape`: queues the resulting shape for crushing if it is not the part below the cut, and notifies `g_treePlantManager` of the new split shape. |
| `WoodCrusher.woodCrusherMoveTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 691 | ✍ Move trigger callback: for dynamic non-vehicle bodies whose split type gives wood chips, counts enters and leaves per body in `moveTriggerNodes` and raises the vehicle's active state on enter. |
| `WoodCrusher.woodCrusherDownForceTriggerCallback(self: integer, triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 722 | ✍ Same bookkeeping as the move trigger callback, but per down force node whose extra trigger matches, storing counts in that node's `triggerNodes`. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onCrushedSplitShape` | 73 |
| registerOverwrittenFunction | `getDirtMultiplier` | 79 |
| registerOverwrittenFunction | `getWearMultiplier` | 80 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 81 |
| registerOverwrittenFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getRequiresPower` | 83 |
| registerEventListener | `onLoad` | 89 |
| registerEventListener | `onDelete` | 90 |
| registerEventListener | `onReadUpdateStream` | 91 |
| registerEventListener | `onWriteUpdateStream` | 92 |
| registerEventListener | `onUpdate` | 93 |
| registerEventListener | `onUpdateTick` | 94 |
| registerEventListener | `onTurnedOn` | 95 |
| registerEventListener | `onTurnedOff` | 96 |
