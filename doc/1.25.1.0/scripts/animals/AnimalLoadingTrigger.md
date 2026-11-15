# animals/AnimalLoadingTrigger.lua

Source: `dataS/scripts/animals/AnimalLoadingTrigger.lua` — FS25 1.25.1.0

- **AnimalLoadingTrigger** (l.13)
- **AnimalLoadingTriggerActivatable** (l.251)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AnimalLoadingTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 |  |
| `AnimalLoadingTrigger:onCreate(id: integer)` | 29 |  |
| `AnimalLoadingTrigger.new(isServer: boolean, isClient: boolean) → table` | 45 |  |
| `AnimalLoadingTrigger:loadFromXML(xmlFile: integer, key: string, components: string, i3dMappings: any)` | 71 |  |
| `AnimalLoadingTrigger:load(node: integer, husbandry: any)` | 111 |  |
| `AnimalLoadingTrigger:delete()` | 145 |  |
| `AnimalLoadingTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 163 |  |
| `AnimalLoadingTrigger:updateActivatableObject()` | 205 |  |
| `AnimalLoadingTrigger:setLoadingTrailer(loadingVehicle: table)` | 216 |  |
| `AnimalLoadingTrigger:getAnimals()` | 232 |  |
| `AnimalLoadingTrigger:openAnimalMenu()` | 238 |  |
| `AnimalLoadingTriggerActivatable.new(animalLoadingTrigger: any)` | 255 |  |
| `AnimalLoadingTriggerActivatable:getIsActivatable()` | 266 |  |
| `AnimalLoadingTriggerActivatable:run()` | 295 |  |
| `AnimalLoadingTriggerActivatable:getDistance(x: any, y: any, z: any)` | 306 |  |
