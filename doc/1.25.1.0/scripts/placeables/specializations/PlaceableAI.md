# placeables/specializations/PlaceableAI.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableAI.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableAI.lua` — FS25 1.25.1.0

✍ Placeable specialization (`spec_ai`) that integrates a placeable with the AI system: it marks AI navigation update areas dirty, registers road splines, and manages obstacle boxes that can be switched on and off by animated objects (for example gates). Server-side work goes through `g_currentMission.aiSystem`, whose class is not in the dump (UNVERIFIED). It has no prerequisite specialization, but obstacle activation needs `spec_animatedObjects`.

- **PlaceableAI** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableAI.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Prerequisite check; always returns true, so this specialization has no required companions. |
| `PlaceableAI.registerFunctions(placeableType: any)` | 24 | ✍ Registers the specialization's functions on the placeable type: `setObstacleActive`, `loadAIUpdateArea`, `loadAISpline`, `loadAIObstacle` and `updateAIUpdateAreas`. |
| `PlaceableAI.registerEventListeners(placeableType: any)` | 34 | ✍ Subscribes to the placeable events `onLoad`, `onPostLoad`, `onDelete` and `onFinalizePlacement`. |
| `PlaceableAI.registerXMLPaths(schema: any, basePath: any)` | 43 | ✍ Registers the `.ai` XML schema: update areas (start/end nodes), splines (node, max width, height, turning radius) and obstacles (node, size, offset, and the linked animated object by index or saveId with normalized start/end times). |
| `PlaceableAI:onLoad(savegame: table)` | 66 | ✍ Loads the update areas, splines and obstacles from the XML into `spec_ai`, keeping only those that load successfully. Logs a warning if no `placeable.ai.updateAreas` entry exists. |
| `PlaceableAI:onPostLoad(savegame: any)` | 103 | ✍ If animated objects and an AI navigation map exist, links each obstacle to its animated object (by index or saveId, with warnings if missing) and appends a hook to the object's `setAnimTime` that activates the obstacle while the animation time is within its start and end times. |
| `PlaceableAI:onDelete()` | 145 | ✍ Server only: if flagged, marks the AI update areas dirty, removes the placeable's road splines from the AI system and deactivates any active obstacles. |
| `PlaceableAI:loadAIUpdateArea(xmlFile: any, key: any, area: any)` | 175 | ✍ Reads start and end nodes, converts them into root-local coordinates and stores the area center and X/Z size. Returns false with an XML warning if a node is missing. |
| `PlaceableAI:loadAISpline(xmlFile: any, key: any, spline: any)` | 212 | ✍ Reads the spline node, hides it, and stores the optional maximum width, height and turning radius. Returns false with a warning if the node is missing. |
| `PlaceableAI:loadAIObstacle(xmlFile: any, key: any, obstacle: any)` | 236 | ✍ Reads an obstacle node, size, offset, animated object link (saveId or index) and start/end times. Returns false with a warning if the node is missing, a non-rigid-body node has no size, the link or times are missing, or start is not before end. |
| `PlaceableAI:onFinalizePlacement()` | 282 | ✍ Server only: refreshes AI update areas when the placeable is newly placed (or not from a valid savegame, or during a reload), registers its road splines, and applies the initial obstacle state from each linked animation time. |
| `PlaceableAI:setObstacleActive(obstacle: any, active: any)` | 312 | ✍ Adds the obstacle box to the AI system (node, offset, size) or removes it, and records the active state. Does nothing if there is no AI system. |
| `PlaceableAI:updateAIUpdateAreas()` | 328 | ✍ Server only: converts each stored area to a world-space bounding rectangle and calls `aiSystem:setAreaDirty` so AI navigation is recomputed there. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setObstacleActive` | 25 |
| registerFunction | `loadAIUpdateArea` | 26 |
| registerFunction | `loadAISpline` | 27 |
| registerFunction | `loadAIObstacle` | 28 |
| registerFunction | `updateAIUpdateAreas` | 29 |
| registerEventListener | `onLoad` | 35 |
| registerEventListener | `onPostLoad` | 36 |
| registerEventListener | `onDelete` | 37 |
| registerEventListener | `onFinalizePlacement` | 38 |
