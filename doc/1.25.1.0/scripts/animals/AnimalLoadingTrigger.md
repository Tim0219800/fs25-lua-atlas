# animals/AnimalLoadingTrigger.lua

*[Version française](../../fr/scripts/animals/AnimalLoadingTrigger.md)*

Source: `dataS/scripts/animals/AnimalLoadingTrigger.lua` — FS25 1.25.1.0

✍ Trigger zone where a player or a livestock trailer can open the animal screen, either at a husbandry or at an animal dealer. It can be created from a scenegraph node (user attributes isDealer, animalTypes, title) or from XML. It registers an activatable with the mission's activatable objects system, checks the tradeAnimals permission and farm ownership, and can auto-activate on platforms that enable it. The file also defines the helper class AnimalLoadingTriggerActivatable.

- **AnimalLoadingTrigger** (l.13)
- **AnimalLoadingTriggerActivatable** (l.251)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalLoadingTrigger.registerXMLPaths(schema: any, basePath: any)` | 19 | ✍ Registers the XML schema entries `#node`, `#isDealer`, `#animalTypes` and `#title` (default ui_farm) under the given base path. |
| `AnimalLoadingTrigger:onCreate(id: integer)` | 29 | ✍ Scenegraph creation callback: builds a trigger for the node, loads it, and adds it to the non-updateable list on success, otherwise deletes it. |
| `AnimalLoadingTrigger.new(isServer: boolean, isClient: boolean) → table` | 45 | ✍ Creates the trigger object (an Object subclass) with no node, not a dealer, disabled, no loading vehicle, and a new activatable. It stores the current map mod name for text lookups. |
| `AnimalLoadingTrigger:loadFromXML(xmlFile: integer, key: string, components: string, i3dMappings: any)` | 71 | ✍ Loads the trigger node, dealer flag, allowed animal types (space-separated names resolved through the animal system) and title from XML, then registers the trigger callback. Returns false with an XML warning if the node is missing. |
| `AnimalLoadingTrigger:load(node: integer, husbandry: any)` | 111 | ✍ Loads the same settings from the user attributes of the scenegraph node, keeps the optional husbandry, registers the trigger callback, enables the trigger and returns true. Unknown animal type names are logged as warnings. |
| `AnimalLoadingTrigger:delete()` | 145 | ✍ Removes the activatable from the mission, removes the trigger node and clears the husbandry reference. |
| `AnimalLoadingTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 163 | ✍ Engine trigger callback on enter or leave. A vehicle supporting animals becomes the loading trailer (auto-activating and braking on some platforms); on leave it is released and the animal screen is told if its target left. For the local player it tracks range and refreshes the activatable. |
| `AnimalLoadingTrigger:updateActivatableObject()` | 205 | ✍ Adds the activatable to the mission when a loading vehicle or the player is in range, and removes it otherwise. |
| `AnimalLoadingTrigger:setLoadingTrailer(loadingVehicle: table)` | 216 | ✍ Replaces the current loading vehicle: unregisters this trigger from the old one and registers it on the new one through setLoadingTrigger when available, then refreshes the activatable. |
| `AnimalLoadingTrigger:getAnimals()` | 232 | ✍ Returns the list of allowed animal type indices (dealer only), or nil if no restriction was configured. Despite the name it returns types, not animals. |
| `AnimalLoadingTrigger:openAnimalMenu()` | 238 | ✍ Opens AnimalScreen for the husbandry, loading vehicle and dealer flag, and remembers the vehicle as the activated target. Client-side UI call. |
| `AnimalLoadingTriggerActivatable.new(animalLoadingTrigger: any)` | 255 | ✍ Creates the activatable for a trigger with the localized text animals_openAnimalScreen as action label. |
| `AnimalLoadingTriggerActivatable:getIsActivatable()` | 266 | ✍ True only if the trigger is enabled, no GUI is open, the player has the tradeAnimals permission, the husbandry (if any) belongs to the player's farm, and the player is in range or in the loading vehicle's root vehicle. |
| `AnimalLoadingTriggerActivatable:run()` | 295 | ✍ Opens the animal menu, unless the guided tour is running, in which case an info dialog says the feature is disabled. |
| `AnimalLoadingTriggerActivatable:getDistance(x: any, y: any, z: any)` | 306 | ✍ Returns the 3D distance from the given point to the trigger node, or infinity if the node does not exist. |
