# objects/BunkerSilo.lua

*[Version française](../../fr/scripts/objects/BunkerSilo.md)*

Source: `dataS/scripts/objects/BunkerSilo.lua` — FS25 1.25.1.0

✍ Networked Object for a bunker silo (silage clamp) that tracks a rectangular density-map area defined by start, width and height nodes. It goes through four states: FILL (chaff is added and compacted by driving vehicles), CLOSED (covered, fermenting), FERMENTED and DRAIN (opened, output fill type taken out). Fill levels are read from the density-map height system on the server and synchronised to clients. Several constants and helpers (STATE_*, NUM_STATES, COMPACTING_BASE_MASS, MILLISECONDS_PER_DAY, updateCompacting, onHourChanged, showBunkerMessage) are referenced but not defined in this dump (UNVERIFIED). The file ends with the start of BunkerSiloActivatable, whose body is absent.

- **BunkerSilo** inherits from `Object` (l.7)
- **BunkerSiloActivatable** (l.1005)

## Functions

| Function | Line | Description |
|---|---|---|
| `BunkerSilo:onCreate(id: integer)` | 24 | ✍ Deprecated map callback: only logs an error saying BunkerSilo.onCreate is deprecated and creates nothing. |
| `BunkerSilo.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 34 | ✍ Constructor. Initialises the area offsets, default fill types (input chaff, output silage, fermenting tarp), counters, the activatable and the FILL state, reserves a dirty flag and subscribes to HOUR_CHANGED. Returns the instance. |
| `BunkerSilo:load(components: table, xmlFile: table, key: string, i3dMappings: table) → boolean` | 87 | ✍ Loads the area and innerArea nodes, trigger, accepted/input/output fill types, distanceToCompactedFillLevel, openingLength and wall nodes from XML. Registers the converting area with the density-map manager and divides the compaction distance by the economic difficulty. Returns true. |
| `BunkerSilo:delete()` | 181 | ✍ Removes the interaction trigger, the fixed and converting fill type areas, message subscriptions and the activatable, then calls the parent delete. |
| `BunkerSilo:readStream(streamId: integer, connection: table)` | 199 | ✍ Client side on join: after the parent, reads state (3 bits), the opened front/back flags, fill level, compacted percent (7 bits) and fermenting percent. |
| `BunkerSilo:writeStream(streamId: integer, connection: table)` | 216 | ✍ Server side on join: after the parent, writes the same fields that readStream reads. |
| `BunkerSilo:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 233 | ✍ Client side update: if the dirty bit is set, reads state (calling setState with notification on change), fill level, opened flags, then compacted percent in FILL or fermenting percent in CLOSED/FERMENTED. |
| `BunkerSilo:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 260 | ✍ Server side update: writes a flag for the silo dirty bit and, when set, the fields that readUpdateStream expects. |
| `BunkerSilo:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 285 | ✍ Restores state, fill levels, fermenting time and opened flags from the savegame, recomputes area offsets, and repairs the density map: converts or clears fill types depending on the state, and may switch DRAIN back to FILL when the silo is nearly empty. Returns true. |
| `BunkerSilo:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 379 | ✍ Writes state, fillLevel, compactedFillLevel, fermentingTime (percent converted to milliseconds using days per period) and the opened front/back flags to the savegame. |
| `BunkerSilo:update(dt: number)` | 391 | ✍ Per-frame update. Shows fill level and compaction or fermenting info when the local player can interact. On the server in FILL state, computes compaction from the distance moved, mass and wheel contact of vehicles in range. Keeps the global bunkerScore at the highest fill level and calls raiseActive. |
| `BunkerSilo:updateTick(dt: number)` | 481 | ✍ Server side, about every 200 to 300 ms: refreshes the fill level and, if it changed, calls updateCompacting. On first call it raises openingLength to at least the default max radius of the output fill type plus 1. |
| `BunkerSilo:updateFillLevel()` | 508 | ✍ Reads the fill level from the inner area in the density map, using the fill type that matches the state (input, fermenting, or fermenting plus output). In DRAIN below emptyThreshold it clears the area and returns to FILL with notification. |
| `BunkerSilo:setState(state: boolean, showNotification: boolean)` | 541 | ✍ Changes the silo state and applies its effects. FILL resets compaction and areas, CLOSED converts input to fermenting and erases tire tracks, DRAIN sets the output as fixed fill type. Optionally shows a message, and on the server raises the dirty flag. No effect if the state is unchanged. |
| `BunkerSilo:openSilo(px: number, py: number, pz: number)` | 631 | ✍ Switches to DRAIN with notification, recomputes offsets, then opens the end closer to the given position by converting the fermenting fill type to the output type over openingLength. Marks that end as opened and raises the dirty flag. |
| `BunkerSilo:getBunkerAreaOffset(updateAtFront: boolean, offset: number, fillType: integer) → number` | 656 | ✍ Scans the area in 1 m slices from the front or the back, starting at the given offset, and returns the offset of the first slice holding the given fill type. Returns the area length minus 1 (at least 0) if none is found. |
| `BunkerSilo:switchFillTypeAtOffset(switchAtFront: boolean, offset: number, length: number)` | 689 | ✍ Converts the fermenting fill type into the output fill type on a strip of the given length starting at the offset, measured from the front or from the back of the area. |
| `BunkerSilo:getIsCloserToFront(ix: number, iy: number, iz: number) → boolean` | 720 | ✍ Returns true if the given world position is nearer to the middle of the front edge (including the front offset) than to the back edge. |
| `BunkerSilo:getCanInteract(showInformationOnly: boolean) → boolean` | 740 | ✍ Client check on the local player. In information mode it is true for a player on foot in range or for the current vehicle in range and active for input. Otherwise true only for a player on foot in range. False without a local player. |
| `BunkerSilo:getCanCloseSilo() → boolean` | 772 | ✍ Returns true when the state is FILL, the fill level is above 0 and the compacted percent is at least 100. |
| `BunkerSilo:getCanOpenSilo() → boolean` | 779 | ✍ Returns true if the state is FERMENTED or DRAIN and the end closer to the local interaction position is not opened yet. False if there is no interaction position. |
| `BunkerSilo:clearSiloArea()` | 798 | ✍ Clears everything from the density-map height system over the silo area defined by the start, width and height nodes. |
| `BunkerSilo:getInteractionPosition() → number, number, number` | 849 | ✍ Returns the local player position when on foot in range, or the first component node position of the current vehicle in range. Returns nil otherwise, including without a local player. |
| `BunkerSilo:interactionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 875 | ✍ Trigger callback on enter or leave. Tracks the local player and Vehicle objects in range, adds or removes the activatable accordingly and sets or clears the vehicle's bunker silo interactor callback (for shovels). |
| `BunkerSilo.onChangedFillLevelCallback(self: table, vehicle: table, fillDelta: integer, fillType: integer, x: any, y: any, z: any)` | 927 | ✍ Callback from a vehicle (shovel) whose fill level changed. Only reacts to negative deltas: on an opened end it extends the opened strip past the tool position by openingLength and updates the front or back offset. |
| `BunkerSilo.registerXMLPaths(schema: any, basePath: any)` | 967 | ✍ Registers the XML schema: area and innerArea nodes, wallLeft and wallRight nodes with collision, interactionTrigger node, acceptedFillTypes, inputFillType, outputFillType, distanceToCompactedFillLevel (default 100) and openingLength (default 5). |
| `BunkerSilo.registerSavegameXMLPaths(schema: any, basePath: any)` | 992 | ✍ Registers the savegame attributes state (0 FILL, 1 CLOSED, 2 FERMENTED, 3 DRAIN), fillLevel, compactedFillLevel, fermentingTime, openedAtFront and openedAtBack. |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.75)
