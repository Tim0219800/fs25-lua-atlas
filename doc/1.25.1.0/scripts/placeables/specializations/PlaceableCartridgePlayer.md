# placeables/specializations/PlaceableCartridgePlayer.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableCartridgePlayer.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableCartridgePlayer.lua` — FS25 1.25.1.0

✍ Placeable specialization for the in-game computer that cycles through game cartridges. Cartridges are the visible children of an items node; activating the player moves the cartridge content onto a connector node and shows the matching monitor child and light. A trigger node with the player collision bit makes it usable by the local player.

- **PlaceableCartridgePlayer** (l.11)
- **PlaceableCartridgePlayerActivatable** (l.173)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableCartridgePlayer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no prerequisite specializations. |
| `PlaceableCartridgePlayer.registerFunctions(placeableType: any)` | 23 | ✍ Registers `cartridgePlayerTriggerCallback` and `activatePlayer`. |
| `PlaceableCartridgePlayer.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to `onLoad` and `onDelete`. |
| `PlaceableCartridgePlayer.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Declares the `cartridgePlayer` node keys `itemsNode`, `monitorNode`, `monitorLightNode`, `connectorNode`, `triggerNode` and a `play` sound sample. |
| `PlaceableCartridgePlayer:onLoad(savegame: any)` | 52 | ✍ Loads the nodes and, if a trigger exists, checks it has the player collision bit (logs an error and returns nil otherwise) before registering the trigger and activatable. Loads the play sound on clients. Returns self. |
| `PlaceableCartridgePlayer:onDelete()` | 85 | ✍ Removes the activatable and the trigger node, and deletes the sound samples on clients. |
| `PlaceableCartridgePlayer:cartridgePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 100 | ✍ Trigger callback: when the local player enters, adds the activatable to the activatable system; when leaving, removes it. |
| `PlaceableCartridgePlayer:activatePlayer()` | 115 | ✍ Puts the current cartridge back, picks the next visible cartridge (wrapping around), then moves its content to the connector and shows its monitor. Shows a message if there are no cartridges and plays a sound on clients when the selection changed. |
| `PlaceableCartridgePlayerActivatable.new(placeable: any)` | 177 | ✍ Creates the activatable for a cartridge player placeable, with the 'change cartridge' action text. |
| `PlaceableCartridgePlayerActivatable:run()` | 188 | ✍ Activation handler: calls `activatePlayer` on the owning placeable. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `cartridgePlayerTriggerCallback` | 24 |
| registerFunction | `activatePlayer` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
