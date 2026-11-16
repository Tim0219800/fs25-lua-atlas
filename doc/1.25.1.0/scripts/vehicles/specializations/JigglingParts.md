# vehicles/specializations/JigglingParts.lua

*[Version française](../../../fr/scripts/vehicles/specializations/JigglingParts.md)*

Source: `dataS/scripts/vehicles/specializations/JigglingParts.lua` — FS25 1.25.1.0

✍ Vehicle specialization that makes parts such as sowing coulters shake while working, by driving shader parameters (frequency and amplitude) on a node. The shake speed follows the vehicle speed and the amplitude fades in and out. A part can be tied to a ground reference node so it only jiggles while that node touches the ground (needs the GroundReference specialization for this).

- **JigglingParts** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `JigglingParts.prerequisitesPresent(specializations: any)` | 16 | ✍ Always returns true: no prerequisite on other specializations. |
| `JigglingParts.initSpecialization()` | 22 | ✍ Registers the XML schema of a jiggling part: node, speed scale, shader parameter names, component indices, amplitude scale and ground reference node index. The base path constant is defined outside this file (UNVERIFIED). |
| `JigglingParts.registerFunctions(vehicleType: any)` | 42 | ✍ Registers loadJigglingPartsFromXML, isJigglingPartActive and updateJigglingPart on the vehicle type. |
| `JigglingParts.registerEventListeners(vehicleType: any)` | 50 | ✍ Subscribes the specialization to onLoad and onUpdate. |
| `JigglingParts:onLoad(savegame: any)` | 57 | ✍ Loads all jigglingPart entries from vehicle.jigglingParts. If none is valid, removes the onUpdate listener. |
| `JigglingParts:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 83 | ✍ Each frame, updates active parts with ground contact, and lets inactive parts fade out while their amplitude is still above zero. |
| `JigglingParts:loadJigglingPartsFromXML(jigglingPart: any, xmlFile: any, key: any)` | 96 | ✍ Loads one jiggling part (node, speed and amplitude scales, shader parameter names and components, reference node index) and initialises its state. Returns false with a warning if the node is missing. |
| `JigglingParts:isJigglingPartActive(jigglingPart: any)` | 124 | ✍ Resolves the linked ground reference node on first call (warning if not found) and returns false if that node is not touching the ground, true otherwise. |
| `JigglingParts:updateJigglingPart(jigglingPart: any, dt: any, groundContact: any)` | 152 | ✍ Advances the shake phase in proportion to the vehicle speed, ramps the amplitude up or down (about 100 ms), then writes current and previous-frame values to the node's shader parameters (previous one used for motion data). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadJigglingPartsFromXML` | 43 |
| registerFunction | `isJigglingPartActive` | 44 |
| registerFunction | `updateJigglingPart` | 45 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onUpdate` | 52 |
