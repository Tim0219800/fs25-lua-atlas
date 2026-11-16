# handTools/specializations/HandToolHorseBrush.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolHorseBrush.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHorseBrush.lua` — FS25 1.25.1.0

✍ Hand tool specialization for the horse brush. The owning player targets animals (collision flag ANIMAL, 3 m range) and, while the activate input is held, brushes the animal under the crosshair; cleaning is sent to the server as AnimalCleanEvent with an accumulated amount. Needs the husbandry system and farm access rights. Note: `onHeldEnd` is registered as a listener but no such function exists in this file, and `treeTypeCrosshair` used in `onDraw` is never assigned here.

- **HandToolHorseBrush** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHorseBrush.registerXMLPaths(xmlSchema: any)` | 14 | ✍ Registers `handTool.horseBrush#node` (the brush node) and the `cleaning` sound samples. |
| `HandToolHorseBrush.registerEventListeners(handToolType: any)` | 25 | ✍ Subscribes to `onLoad`, `onDelete`, `onUpdate`, `onDraw`, `onHeldStart`, `onHeldEnd` and `onRegisterActionEvents`. |
| `HandToolHorseBrush.prerequisitesPresent(specializations: any)` | 37 | ✍ Always returns true: no prerequisite. |
| `HandToolHorseBrush:onLoad(xmlFile: any)` | 43 | ✍ Initialises detection distance (3), brush node and rest position, client sound and crosshairs, a dirty flag, a cleaning rate of 0.01 per millisecond and the action text. |
| `HandToolHorseBrush:onDelete()` | 74 | ✍ Frees the sound samples and both crosshair overlays. |
| `HandToolHorseBrush:onUpdate(dt: any)` | 91 | ✍ For the owner, finds the targeted husbandry cluster, enables the action, animates the brush node while cleaning and raises a dirty flag when the target changes. Clients play or stop the sound; while a target is set it accumulates time and sends AnimalCleanEvent to the server each time the sum exceeds 5. |
| `HandToolHorseBrush:onDraw()` | 168 | ✍ Renders the brush crosshair when an animal is targeted, otherwise the default crosshair; also renders `treeTypeCrosshair` if set (never set in this file). |
| `HandToolHorseBrush:onRegisterActionEvents()` | 184 | ✍ Registers the ACTIVATE_HANDTOOL input with `onBrushAction`, very high priority, initially inactive and with empty text. Skipped when the tool is not active for input. |
| `HandToolHorseBrush:onBrushAction(_: any, inputValue: any)` | 200 | ✍ Input callback: sets the cleaning flag to true while the input value is positive. |
| `HandToolHorseBrush:onHeldStart()` | 207 | ✍ For the owning player only, adds an ANIMAL target type to the player's targeter, with minimum 0.5 and the detection distance. |
| `HandToolHorseBrush.getHusbandryAndClusterFromNode(carryingPlayer: any, node: any)` | 234 | ✍ Maps a targeted collision node to its animal husbandry and animal cluster. Returns both only if the farm may access the husbandry and the cluster supports dirt change and a name; otherwise returns nil, nil. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 26 |
| registerEventListener | `onDelete` | 27 |
| registerEventListener | `onUpdate` | 28 |
| registerEventListener | `onDraw` | 29 |
| registerEventListener | `onHeldStart` | 30 |
| registerEventListener | `onHeldEnd` | 31 |
| registerEventListener | `onRegisterActionEvents` | 32 |
