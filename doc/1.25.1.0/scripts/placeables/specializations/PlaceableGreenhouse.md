# placeables/specializations/PlaceableGreenhouse.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableGreenhouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableGreenhouse.lua` — FS25 1.25.1.0

✍ Placeable specialization for a greenhouse that shows plant models on planting places and animates their growth while the production is running. Plants are loaded from small XML files per fill type, cloned onto place nodes, and advanced through growth stages by a timer scaled to game time; without water (production missing inputs) they wither. It also runs periodic watering effects and sound on clients. It is driven by production events, so it is meant to be combined with a production point.

- **PlaceableGreenhouse** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableGreenhouse.getRandomGrowthInterval()` | 23 | ✍ Returns a random integer between PlaceableGreenhouse.GROWTH_INTERVAL_MIN and GROWTH_INTERVAL_MAX, used as the next growth step duration (units defined elsewhere: UNVERIFIED). |
| `PlaceableGreenhouse.getRandomWateringInterval()` | 29 | ✍ Returns a random integer between WATERING_INTERVAL_MIN and WATERING_INTERVAL_MAX, used as the delay before the next watering (units defined elsewhere: UNVERIFIED). |
| `PlaceableGreenhouse.prerequisitesPresent(specializations: table) → boolean` | 39 | ✍ No prerequisite: always returns true. |
| `PlaceableGreenhouse.initSpecialization()` | 45 | ✍ Builds the XML schema for greenhouse plant files: i3d filename, growing stage nodes, withered node and i3d mappings. |
| `PlaceableGreenhouse.registerFunctions(placeableType: any)` | 58 | ✍ Registers the plant loading, placement and growth stage methods on the placeable type. |
| `PlaceableGreenhouse.registerEventListeners(placeableType: any)` | 69 | ✍ Subscribes to load, delete, finalize-placement, output fill types changed, production status changed and update events. |
| `PlaceableGreenhouse.registerXMLPaths(schema: any, basePath: any)` | 80 | ✍ Declares plants per fill type (xmlFilename), plant spaces and parent nodes with the useRandomYRot flag, the watering sound and the effect nodes. |
| `PlaceableGreenhouse:onLoad(savegame: any)` | 97 | ✍ Loads plant definitions per known fill type, registers planting places from nodes and from the children of parent nodes, and on clients the watering sound and effects. Creates a growth timer and a watering timer, both scaled by the effective game time scale; the watering effect runs for WATERING_DURATION and the timer restarts only while water is available. |
| `PlaceableGreenhouse:addPlantPlace(node: any, useRandomYRot: any)` | 183 | ✍ Adds a planting place node (random Y rotation by default) to the list, with no fill type and no stage yet. |
| `PlaceableGreenhouse:loadPlantFromXml(xmlFilename: any)` | 195 | ✍ Loads a plant XML file and starts an asynchronous shared i3d load. Returns the plant table immediately; its stage indices are filled later by plantI3DLoadedCallback. Always returns a table, even if the XML failed to load. |
| `PlaceableGreenhouse:plantI3DLoadedCallback(i3dNode: any, failedReason: any, args: any)` | 232 | ✍ Loading callback: on success stores the i3d node and records growing stages and the withered stage as child indices. Then deletes the plant XML file and finishes the loading task. |
| `PlaceableGreenhouse:onDelete()` | 269 | ✍ Releases everything: unfinished plant XML files, both timers, shared i3d requests, plant nodes, effects and sound samples. |
| `PlaceableGreenhouse:onFinalizePlacement()` | 305 | ✍ Flags the plant distribution as dirty and starts the watering timer. |
| `PlaceableGreenhouse:onUpdate()` | 313 | ✍ Recomputes the plant distribution when it is flagged dirty. |
| `PlaceableGreenhouse:onOutputFillTypesChanged(outputs: any, state: any)` | 321 | ✍ Production event: adds or removes the changed output fill types in the active set when a plant exists for them, marks the distribution dirty once synchronized and wakes the update loop. |
| `PlaceableGreenhouse:onProductionStatusChanged(production: any, status: any)` | 345 | ✍ Production event: the greenhouse has water unless the status is MISSING_INPUTS. When this changes it refreshes plant stages; the watering timer runs only with water and at least one active fill type. |
| `PlaceableGreenhouse:updatePlantDistribution()` | 364 | ✍ Assigns an active fill type to each planting place in round-robin order and refreshes stages. Note: the index (i % count) + 1 means the first place receives the second type when several types are active. |
| `PlaceableGreenhouse:setPlantAtPlace(fillType: any, plantPlace: any)` | 386 | ✍ If the place holds a different fill type, deletes its current stage nodes and clones the new plant's stage meshes onto the place node (all stages, visibility set later). |
| `PlaceableGreenhouse:updatePlantsStage()` | 418 | ✍ Does nothing without active fill types. Starts or stops the growth timer depending on water, then moves every place to the next growing stage (wrapping to the first after the last), or to the withered stage without water, and toggles stage visibility. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPlantFromXml` | 59 |
| registerFunction | `plantI3DLoadedCallback` | 60 |
| registerFunction | `addPlantPlace` | 61 |
| registerFunction | `updatePlantDistribution` | 62 |
| registerFunction | `setPlantAtPlace` | 63 |
| registerFunction | `updatePlantsStage` | 64 |
| registerEventListener | `onLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onFinalizePlacement` | 72 |
| registerEventListener | `onOutputFillTypesChanged` | 73 |
| registerEventListener | `onProductionStatusChanged` | 74 |
| registerEventListener | `onUpdate` | 75 |
