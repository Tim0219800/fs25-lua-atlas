# vehicles/specializations/TireTracks.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TireTracks.md)*

Source: `dataS/scripts/vehicles/specializations/TireTracks.lua` — FS25 1.25.1.0

✍ Specialization (no prerequisites) that manages tire track decals left by wheels. Other code (wheels, speed rotating parts) registers track nodes here; each one owns a track in g_currentMission.tireTrackSystem. Each update, the track grows with ground colour, depth and dirt data from the wheel physics, or is cut when conditions fail. The engine call getTyreTracksSegmentsCoeff gates it (behaviour of the track system classes itself is UNVERIFIED, not in the dump).

- **TireTracks** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TireTracks.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: no prerequisite specialization. |
| `TireTracks.initSpecialization()` | 23 | ✍ Empty: registers nothing. |
| `TireTracks.registerFunctions(vehicleType: any)` | 28 | ✍ Registers getAllowTireTracks, addTireTrackNode, removeTireTrackNode and updateTireTrackNode. |
| `TireTracks.registerOverwrittenFunctions(vehicleType: any)` | 37 | ✍ Empty: registers no overridden functions. |
| `TireTracks.registerEventListeners(vehicleType: any)` | 42 | ✍ Subscribes to onPreLoad, onDelete and onUpdate. |
| `TireTracks:onPreLoad(savegame: table)` | 51 | ✍ Initializes the track node list, reads the engine segments coefficient and caches the mission's tire track system. |
| `TireTracks:onDelete()` | 63 | ✍ Destroys every track created by this vehicle in the tire track system. |
| `TireTracks:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 77 | ✍ While the vehicle is active and has track nodes, updates every track node with the current allow-tracks state. |
| `TireTracks:getAllowTireTracks()` | 91 | ✍ Returns true when the vehicle is closer than TireTracks.MAX_CREATION_DISTANCE (not defined in this file, UNVERIFIED) and the segments coefficient is above 0. |
| `TireTracks:addTireTrackNode(wheel: any, parent: any, linkNode: any, tireTrackAtlasIndex: any, width: any, radius: any, inverted: any, activeFunc: any)` | 97 | ✍ Registers a track node for a wheel (parent, link node, atlas index, width, radius, inverted flag, optional active callback) and creates its track. Returns the node index, or nil if creation failed. |
| `TireTracks:removeTireTrackNode(tireTrackNodeIndex: any)` | 126 | ✍ Clears the track node at the index and updates the has-nodes flag. Note: it does not destroy the track in the track system; that happens in onDelete. |
| `TireTracks:updateTireTrackNode(tireTrackNode: any, allowTireTracks: any)` | 134 | ✍ Cuts the track if disallowed, inactive, not in contact, on a surface that forbids tracks or without dirt; otherwise adds a track point at the tire's ground contact with colour, dirt, depth, direction and contact type. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getAllowTireTracks` | 29 |
| registerFunction | `addTireTrackNode` | 30 |
| registerFunction | `removeTireTrackNode` | 31 |
| registerFunction | `updateTireTrackNode` | 32 |
| registerEventListener | `onPreLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onUpdate` | 45 |
