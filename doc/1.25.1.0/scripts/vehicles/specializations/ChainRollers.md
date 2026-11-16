# vehicles/specializations/ChainRollers.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ChainRollers.md)*

Source: `dataS/scripts/vehicles/specializations/ChainRollers.lua` — FS25 1.25.1.0

✍ Specialization for roller chains whose elements are laid out along a hidden spline; the spline control points follow reference nodes that are moved by Cylindered moving tools or parts. Configured under vehicle.chainRollers (maxUpdateDistance and chainRoller entries with elementsNode, endReferenceNode and splineNode children). Updates run in onPostUpdate only when the vehicle is closer than maxUpdateDistance (default 100), and a debug overlay is drawn in the DEBUG_ATTRIBUTES vehicle debug state.

- **ChainRollers** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ChainRollers.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no other specialization is required, although the extra dependent parts hooks only make sense with Cylindered. |
| `ChainRollers.initSpecialization()` | 21 | ✍ Registers, via delayed registration, the chainRollers#splineNodes node-index list on Cylindered movingTool and movingPart entries. |
| `ChainRollers.registerFunctions(vehicleType: any)` | 44 | ✍ Registers loadChainRollerFromXML and updateChainRoller on the vehicle type. |
| `ChainRollers.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Overrides loadExtraDependentParts and updateExtraDependentParts (provided by another specialization, UNVERIFIED which one). |
| `ChainRollers.registerEventListeners(vehicleType: any)` | 58 | ✍ Registers onLoad, onLoadFinished and onPostUpdate. |
| `ChainRollers:onLoad(savegame: any)` | 66 | ✍ Reads maxUpdateDistance and loads every vehicle.chainRollers.chainRoller entry. If the block is absent or no entry loads, it removes the onLoadFinished and onPostUpdate listeners so the vehicle costs nothing. |
| `ChainRollers:onLoadFinished(savegame: any)` | 94 | ✍ Forces one immediate update by calling onPostUpdate with a very large dt so the chains start in their correct pose. |
| `ChainRollers:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 100 | ✍ When the vehicle is within maxUpdateDistance, copies the dirty spline node positions into the spline control points and re-lays the elements of every dirty chain. In the DEBUG_ATTRIBUTES state it draws the spline nodes and curve. |
| `ChainRollers:loadChainRollerFromXML(xmlFile: any, key: any, chainRoller: any)` | 143 | ✍ Loads one chain: elementsNode (its children are the elements), optional endReferenceNode and at least two splineNode entries, then builds a hidden spline from their positions. Returns false with an XML warning if elements or nodes are missing. |
| `ChainRollers:updateChainRoller(chainRoller: any, dt: any)` | 204 | ✍ Places each element at evenly spaced parameters along the spline and orients each one toward the next. The last element is aimed at endReferenceNode when set. The dt argument is not used. |
| `ChainRollers:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 237 | ✍ Calls the parent, then reads chainRollers#splineNodes for the moving part and keeps the nodes on the entry. Returns false if the parent fails. |
| `ChainRollers:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 252 | ✍ Calls the parent, then marks the spline data of each spline node listed on the moving part as dirty so the next post update rebuilds the chain. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadChainRollerFromXML` | 45 |
| registerFunction | `updateChainRoller` | 46 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 52 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 53 |
| registerEventListener | `onLoad` | 59 |
| registerEventListener | `onLoadFinished` | 60 |
| registerEventListener | `onPostUpdate` | 61 |
