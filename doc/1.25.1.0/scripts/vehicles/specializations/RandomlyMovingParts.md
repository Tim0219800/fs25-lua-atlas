# vehicles/specializations/RandomlyMovingParts.lua

*[Version française](../../../fr/scripts/vehicles/specializations/RandomlyMovingParts.md)*

Source: `dataS/scripts/vehicles/specializations/RandomlyMovingParts.lua` — FS25 1.25.1.0

✍ Vehicle specialization that wiggles nodes (rotation and/or translation) in a pseudo-random way while the vehicle drives, e.g. sowing machine parts bouncing over the ground. Configured under vehicle.randomlyMovingParts in the vehicle XML, with presets for the noise shape. Client-only at runtime: the update listener is removed on servers without client or when no part loads. Optionally tied to a ground reference node of another specialization.

- **RandomlyMovingParts** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `RandomlyMovingParts.prerequisitesPresent(specializations: table) → boolean` | 34 | ✍ Always returns true: this specialization has no prerequisite on other specializations. |
| `RandomlyMovingParts.initSpecialization()` | 40 | ✍ Registers the vehicle XML schema entries for randomlyMovingParts: max update distance, per-part node, speed, fade, preset, noise, bump, rotation and translation settings, and sub-nodes that follow the same value. |
| `RandomlyMovingParts.registerFunctions(vehicleType: any)` | 97 | ✍ Registers loadRandomlyMovingPartFromXML, updateRandomlyMovingPart and getIsRandomlyMovingPartActive on the vehicle type. |
| `RandomlyMovingParts.registerEventListeners(vehicleType: any)` | 105 | ✍ Subscribes the specialization to the onLoad and onUpdate vehicle events. |
| `RandomlyMovingParts:onLoad(savegame: table)` | 113 | ✍ Reads the max update distance and every randomlyMovingPart entry from the XML into spec.nodes. Removes the onUpdate listener if not a client or if no part was loaded. |
| `RandomlyMovingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 137 | ✍ Each frame, if the vehicle is closer than the max update distance and its last speed exceeds 0.1, updates every part through updateRandomlyMovingPart. |
| `RandomlyMovingParts:loadRandomlyMovingPartFromXML(part: table, xmlFile: XMLFile, key: string) → boolean` | 154 | ✍ Loads one part: node, optional ground reference node (index starts at 0 in the XML key, 0 triggers a warning), speed scale with random variance, fade time, noise preset, bumps, rotation and translation limits and linked sub-nodes. Returns false if the node is unknown or no axis is given. Note: sub-node rotation and translation attributes are read from the part key, not the sub-node key, which looks like a bug. |
| `RandomlyMovingParts:updateRandomlyMovingPart(part: table, dt: number) → boolean` | 328 | ✍ Advances one part: computes speed (from moved distance, or from dt if not speed dependent), fades the weight in or out depending on activity, handles random bumps, sums three sine waves into a delta and applies it to the part and its sub-nodes through a local helper (updateNodeData, whose body is not in the dump). |
| `RandomlyMovingParts:getIsRandomlyMovingPartActive(part: table) → boolean` | 386 | ✍ Returns true, or, when the part has a ground reference node, whether that node is currently active via getIsGroundReferenceNodeActive. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadRandomlyMovingPartFromXML` | 98 |
| registerFunction | `updateRandomlyMovingPart` | 99 |
| registerFunction | `getIsRandomlyMovingPartActive` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onUpdate` | 107 |
