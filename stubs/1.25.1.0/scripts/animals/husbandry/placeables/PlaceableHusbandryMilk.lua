---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryMilk.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that makes a husbandry produce milk and optionally hosts milking robots. It requires `PlaceableHusbandry` and `PlaceableHusbandryAnimals`, adds a `milk` placeable configuration type, and reads `husbandry.milk` (or a selected `milkConfiguration`). The output per fill type comes from the animal subtypes' `milk` curve, is added to the husbandry storage on the server, and production stops when any milk tank is full.
---@class PlaceableHusbandryMilk
PlaceableHusbandryMilk = {}

--- Returns true only if both `PlaceableHusbandry` and `PlaceableHusbandryAnimals` are present.
---@param specializations table
---@return boolean
function PlaceableHusbandryMilk.prerequisitesPresent(specializations) end

--- Registers the `milk` configuration type with the placeable configuration manager.
function PlaceableHusbandryMilk.initSpecialization() end

--- Registers the method `onMilkingRobotLoaded`.
---@param placeableType any
function PlaceableHusbandryMilk.registerFunctions(placeableType) end

--- Registers overrides of `updateOutput`, `updateProduction`, `updateInfo` and `getConditionInfos`.
---@param placeableType any
function PlaceableHusbandryMilk.registerOverwrittenFunctions(placeableType) end

--- Subscribes to `onLoad`, `onDelete`, `onFinalizePlacement` and `onHusbandryAnimalsUpdate`.
---@param placeableType any
function PlaceableHusbandryMilk.registerEventListeners(placeableType) end

--- Registers the milk XML paths twice, under `husbandry.milk` and under each `milkConfiguration(?)`, through `registerMilkXMLPaths` (not defined in the SDK dump, UNVERIFIED).
---@param schema any
---@param basePath any
function PlaceableHusbandryMilk.registerXMLPaths(schema, basePath) end

--- Picks the milk configuration (falling back to the base node), reads `hasMilkProduction`, collects the milk fill types of the animal type's subtypes, and creates each milking robot from its class, file and link node (skipped with a warning if invalid).
---@param savegame any
function PlaceableHusbandryMilk:onLoad(savegame) end

--- Callback when a milking robot finishes loading: completes the loading task.
---@param robot any
---@param args any
function PlaceableHusbandryMilk:onMilkingRobotLoaded(robot, args) end

--- Deletes every milking robot.
function PlaceableHusbandryMilk:onDelete() end

--- If milk production is enabled, warns about milk fill types missing from the husbandry storage and forwards the placement finalization to each milking robot.
function PlaceableHusbandryMilk:onFinalizePlacement() end

--- Override: on the server adds milk per fill type to the husbandry storage (production factor times global factor times liters per hour times time adjustment), then calls the parent.
---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryMilk:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

--- Override: returns the parent's factor, but forced to 0 if any milk fill type has no free capacity left.
---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryMilk:updateProduction(superFunc, foodFactor) end

--- Recomputes the liters per hour of each milk fill type from the clusters (milk curve at the animal's age times animal count, divided by 24) and rebuilds the active fill type list.
---@param clusters any
function PlaceableHusbandryMilk:onHusbandryAnimalsUpdate(clusters) end

--- Override: appends the stored liters of each active milk fill type to the info list.
---@param superFunc any
---@param infoTable any
function PlaceableHusbandryMilk:updateInfo(superFunc, infoTable) end

--- Override: appends one fill entry per active milk fill type (level and clamped ratio, inverted bar).
---@param superFunc any
function PlaceableHusbandryMilk:getConditionInfos(superFunc) end
