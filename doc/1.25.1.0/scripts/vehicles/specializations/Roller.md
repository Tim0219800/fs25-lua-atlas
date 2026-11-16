# vehicles/specializations/Roller.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Roller.md)*

Source: `dataS/scripts/vehicles/specializations/Roller.lua` — FS25 1.25.1.0

✍ Roller specialization (soil and grass rollers). No effects or particles of its own: the file loads neither EffectManager nor animationNodes; only a work sound sample (vehicle.roller.sounds.work) is handled client side. Any dust/soil from a roller therefore comes from other specializations (WorkParticles, via getDoGroundManipulation, see below). WORK: processRollerArea first erases tire tracks (eraseTireTrack, including on a distant client), then, except on a client farther than Roller.CLIENT_DM_UPDATE_RADIUS (constant not defined in this file: value UNVERIFIED), calls updateGrassRollerArea (grass roller) and/or updateRollerArea (soil roller, with the tool direction angle converted to a density map angle). Since the FSDensityMapUtil functions have no body in the dump, their exact effect on the terrain is UNVERIFIED. CONDITIONS: the area is active only if the tool is lowered (onlyActiveWhenLowered, true by default) and 2000 ms have passed since attaching (startActivationTimeout); spec.isWorking = speed > 0.5 (unit of getLastSpeed: km/h per vanilla usage, not re-read in Vehicle). getDoGroundManipulation (override) returns true only if isWorking: it is the switch that WorkParticles.lua:238 checks together with isOnField to enable its ground particles (WorkParticles.getDoGroundManipulation returns true by default, WorkParticles.lua:311). WEATHER/MOISTURE: no data read. NETWORK: no synchronized variable; the dirtyFlag is allocated but never raised in this file. dt: unused outside the signature. EXTENSION POINTS: registered functions processRollerArea, updateRollerAIRequirements; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getIsWorkAreaActive; events onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing. Work area type: roller. Default speed limit: 15.

- **Roller** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Roller.initSpecialization()` | 31 | ✍ Declares the "roller" configuration (design choice) and the roller work area type (3 booleans of addWorkAreaType, meaning not re-read), then registers the XML schema under vehicle.roller and under each rollerConfiguration. |
| `Roller.registerRollerXMLPaths(schema: any, basePath: any)` | 46 | ✍ Registers the XML keys of a roller: directionNode, onlyActiveWhenLowered (true), isSoilRoller (true), isGrassRoller (false), usingAIRequirements (true) and the work sounds. |
| `Roller.prerequisitesPresent(specializations: any)` | 57 | ✍ Requires the WorkArea specialization. |
| `Roller.registerFunctions(vehicleType: any)` | 63 | ✍ Registers processRollerArea and updateRollerAIRequirements on the vehicle type. |
| `Roller.registerOverwrittenFunctions(vehicleType: any)` | 70 | ✍ Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier and getIsWorkAreaActive. |
| `Roller.registerEventListeners(vehicleType: any)` | 80 | ✍ Subscribes to onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing and onEndWorkAreaProcessing. |
| `Roller:onLoad(savegame: any)` | 91 | ✍ Reads the roller configuration (or vehicle.roller as fallback), the direction node, the soil/grass modes (soil by default if nothing is given), the onlyActiveWhenLowered option, loads the work sound client side, sets the activation delay (2000 ms) and initializes the AI requirements. |
| `Roller:onDelete()` | 142 | ✍ Frees the sound samples. Note: if no sound was loaded (dedicated server), spec.samples is nil; the behaviour of deleteSamples on nil is not verified (not verified in game). |
| `Roller:processRollerArea(workArea: any, dt: any)` | 149 | ✍ Erases the tire tracks of the area, then (except on a distant client) applies the roller to the density map: grass and/or soil with the tool angle. Sets spec.isWorking to true if speed > 0.5. Returns the area actually processed (may be nil if neither soil nor grass mode is active: case not re-read). |
| `Roller:updateRollerAIRequirements()` | 177 | ✍ Declares to the AI the required ground types and the forbidden crops depending on the mode (soil/grass); ignored if the roller is combined with a sowing machine that uses the AI requirements. Unrelated to effects. |
| `Roller:doCheckSpeedLimit(superFunc: any)` | 239 | ✍ Applies the vehicle speed limit also while the roller is working (isWorking), in addition to the parent logic. |
| `Roller:getDoGroundManipulation(superFunc: any)` | 247 | ✍ Returns true only if the roller is working (isWorking); used by WorkParticles to allow ground particles. No crop or weather condition. |
| `Roller:getDirtMultiplier(superFunc: any)` | 254 | ✍ Adds the work dirt multiplier when isWorking (not proportional to speed, unlike some other tools). |
| `Roller:getWearMultiplier(superFunc: any) → number` | 268 | ✍ Adds the work wear multiplier when isWorking. |
| `Roller:getIsWorkAreaActive(superFunc: any, workArea: any)` | 281 | ✍ For the ROLLER area: inactive during the post-attach delay, or if the tool must be lowered and is not; otherwise delegates to the parent. |
| `Roller:onStartWorkAreaProcessing(dt: any)` | 298 | ✍ Before each processing pass: computes the density map angle from the tool direction and resets isWorking to false. |
| `Roller:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 309 | ✍ Client side: starts or stops the work sound depending on isWorking. No visual effect. |
| `Roller:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 332 | ✍ Arms the 2000 ms activation delay after attaching. |
| `Roller:onDeactivate()` | 339 | ✍ Stops the work sound. |
| `Roller.getDefaultSpeedLimit()` | 347 | ✍ Default speed limit: 15. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processRollerArea` | 64 |
| registerFunction | `updateRollerAIRequirements` | 65 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 71 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 72 |
| registerOverwrittenFunction | `getDirtMultiplier` | 73 |
| registerOverwrittenFunction | `getWearMultiplier` | 74 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 75 |
| registerEventListener | `onLoad` | 81 |
| registerEventListener | `onDelete` | 82 |
| registerEventListener | `onPostAttach` | 83 |
| registerEventListener | `onDeactivate` | 84 |
| registerEventListener | `onStartWorkAreaProcessing` | 85 |
| registerEventListener | `onEndWorkAreaProcessing` | 86 |
