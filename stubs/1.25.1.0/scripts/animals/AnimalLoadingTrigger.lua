---@meta
-- FS25 1.25.1.0 : animals/AnimalLoadingTrigger.lua (generated stub, FS25 Lua Atlas)

--- Trigger zone where a player or a livestock trailer can open the animal screen, either at a husbandry or at an animal dealer. It can be created from a scenegraph node (user attributes isDealer, animalTypes, title) or from XML. It registers an activatable with the mission's activatable objects system, checks the tradeAnimals permission and farm ownership, and can auto-activate on platforms that enable it. The file also defines the helper class AnimalLoadingTriggerActivatable.
---@class AnimalLoadingTrigger
AnimalLoadingTrigger = {}

--- Trigger zone where a player or a livestock trailer can open the animal screen, either at a husbandry or at an animal dealer. It can be created from a scenegraph node (user attributes isDealer, animalTypes, title) or from XML. It registers an activatable with the mission's activatable objects system, checks the tradeAnimals permission and farm ownership, and can auto-activate on platforms that enable it. The file also defines the helper class AnimalLoadingTriggerActivatable.
---@class AnimalLoadingTriggerActivatable
AnimalLoadingTriggerActivatable = {}

--- Registers the XML schema entries `#node`, `#isDealer`, `#animalTypes` and `#title` (default ui_farm) under the given base path.
---@param schema any
---@param basePath any
function AnimalLoadingTrigger.registerXMLPaths(schema, basePath) end

--- Scenegraph creation callback: builds a trigger for the node, loads it, and adds it to the non-updateable list on success, otherwise deletes it.
---@param id integer
function AnimalLoadingTrigger:onCreate(id) end

--- Creates the trigger object (an Object subclass) with no node, not a dealer, disabled, no loading vehicle, and a new activatable. It stores the current map mod name for text lookups.
---@param isServer boolean
---@param isClient boolean
---@return table
function AnimalLoadingTrigger.new(isServer, isClient) end

--- Loads the trigger node, dealer flag, allowed animal types (space-separated names resolved through the animal system) and title from XML, then registers the trigger callback. Returns false with an XML warning if the node is missing.
---@param xmlFile integer
---@param key string
---@param components string
---@param i3dMappings any
function AnimalLoadingTrigger:loadFromXML(xmlFile, key, components, i3dMappings) end

--- Loads the same settings from the user attributes of the scenegraph node, keeps the optional husbandry, registers the trigger callback, enables the trigger and returns true. Unknown animal type names are logged as warnings.
---@param node integer
---@param husbandry any
function AnimalLoadingTrigger:load(node, husbandry) end

--- Removes the activatable from the mission, removes the trigger node and clears the husbandry reference.
function AnimalLoadingTrigger:delete() end

--- Engine trigger callback on enter or leave. A vehicle supporting animals becomes the loading trailer (auto-activating and braking on some platforms); on leave it is released and the animal screen is told if its target left. For the local player it tracks range and refreshes the activatable.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function AnimalLoadingTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

--- Adds the activatable to the mission when a loading vehicle or the player is in range, and removes it otherwise.
function AnimalLoadingTrigger:updateActivatableObject() end

--- Replaces the current loading vehicle: unregisters this trigger from the old one and registers it on the new one through setLoadingTrigger when available, then refreshes the activatable.
---@param loadingVehicle table
function AnimalLoadingTrigger:setLoadingTrailer(loadingVehicle) end

--- Returns the list of allowed animal type indices (dealer only), or nil if no restriction was configured. Despite the name it returns types, not animals.
function AnimalLoadingTrigger:getAnimals() end

--- Opens AnimalScreen for the husbandry, loading vehicle and dealer flag, and remembers the vehicle as the activated target. Client-side UI call.
function AnimalLoadingTrigger:openAnimalMenu() end

--- Creates the activatable for a trigger with the localized text animals_openAnimalScreen as action label.
---@param animalLoadingTrigger any
function AnimalLoadingTriggerActivatable.new(animalLoadingTrigger) end

--- True only if the trigger is enabled, no GUI is open, the player has the tradeAnimals permission, the husbandry (if any) belongs to the player's farm, and the player is in range or in the loading vehicle's root vehicle.
function AnimalLoadingTriggerActivatable:getIsActivatable() end

--- Opens the animal menu, unless the guided tour is running, in which case an info dialog says the feature is disabled.
function AnimalLoadingTriggerActivatable:run() end

--- Returns the 3D distance from the given point to the trigger node, or infinity if the node does not exist.
---@param x any
---@param y any
---@param z any
function AnimalLoadingTriggerActivatable:getDistance(x, y, z) end
