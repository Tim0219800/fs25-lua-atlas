# placeables/specializations/PlaceableInfoTrigger.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableInfoTrigger.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableInfoTrigger.lua` — FS25 1.25.1.0

✍ Placeable specialization that shows an info box on the HUD while the local player stands in a trigger. It raises the onInfoTriggerEnter and onInfoTriggerLeave events, and calls updateInfo each frame so other specializations can append lines. The box is shown to the owner farm, or to everyone if showAllPlayers is set, and only on platforms enabling placeable info.

- **PlaceableInfoTrigger** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ No prerequisite: always returns true. |
| `PlaceableInfoTrigger.registerEvents(placeableType: any)` | 24 | ✍ Declares the onInfoTriggerEnter and onInfoTriggerLeave events. |
| `PlaceableInfoTrigger.registerEventListeners(placeableType: any)` | 31 | ✍ Subscribes to load, delete, finalize-placement and draw events. |
| `PlaceableInfoTrigger.registerFunctions(placeableType: any)` | 40 | ✍ Registers updateInfo and onInfoTriggerCallback on the placeable type. |
| `PlaceableInfoTrigger.registerXMLPaths(schema: any, basePath: any)` | 47 | ✍ Declares infoTrigger#triggerNode and infoTrigger#showAllPlayers. |
| `PlaceableInfoTrigger:onLoad(savegame: table)` | 57 | ✍ Reads the trigger node (warns if its collision mask lacks the player bit) and showAllPlayers, and creates the HUD key-value box when the platform shows placeable info. |
| `PlaceableInfoTrigger:onDelete()` | 77 | ✍ Removes the trigger, stops showing info, removes the drawable and destroys the HUD box. |
| `PlaceableInfoTrigger:onFinalizePlacement()` | 95 | ✍ Registers the trigger callback on the trigger node once the placeable is placed. |
| `PlaceableInfoTrigger:onDraw()` | 104 | ✍ While the player is inside and allowed to see it, collects lines via updateInfo and fills the HUD box (title is the placeable name, lines can be accentuated), then shows it for the next frame. The info list is emptied each frame. |
| `PlaceableInfoTrigger:onInfoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 134 | ✍ Trigger callback reacting only to the local player root node: on enter sets showInfo, registers drawing and raises onInfoTriggerEnter; on leave undoes this and raises onInfoTriggerLeave. Ignored on a dedicated server. |
| `PlaceableInfoTrigger:updateInfo(info: any)` | 156 | ✍ Empty hook: other specializations override it to add entries (title, text, accentuate) to the info table. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onInfoTriggerEnter` | 25 |
| registerEvent | `onInfoTriggerLeave` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
| registerEventListener | `onDraw` | 35 |
| registerFunction | `updateInfo` | 41 |
| registerFunction | `onInfoTriggerCallback` | 42 |
