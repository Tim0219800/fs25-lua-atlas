---@meta
-- FS25 1.25.1.0 : animals/AnimalLoadingTrigger.lua (generated stub, FS25 Lua Atlas)

---@class AnimalLoadingTrigger
AnimalLoadingTrigger = {}

---@class AnimalLoadingTriggerActivatable
AnimalLoadingTriggerActivatable = {}

---@param schema any
---@param basePath any
function AnimalLoadingTrigger.registerXMLPaths(schema, basePath) end

---@param id integer
function AnimalLoadingTrigger:onCreate(id) end

---@param isServer boolean
---@param isClient boolean
---@return table
function AnimalLoadingTrigger.new(isServer, isClient) end

---@param xmlFile integer
---@param key string
---@param components string
---@param i3dMappings any
function AnimalLoadingTrigger:loadFromXML(xmlFile, key, components, i3dMappings) end

---@param node integer
---@param husbandry any
function AnimalLoadingTrigger:load(node, husbandry) end

function AnimalLoadingTrigger:delete() end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function AnimalLoadingTrigger:triggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

function AnimalLoadingTrigger:updateActivatableObject() end

---@param loadingVehicle table
function AnimalLoadingTrigger:setLoadingTrailer(loadingVehicle) end

function AnimalLoadingTrigger:getAnimals() end

function AnimalLoadingTrigger:openAnimalMenu() end

---@param animalLoadingTrigger any
function AnimalLoadingTriggerActivatable.new(animalLoadingTrigger) end

function AnimalLoadingTriggerActivatable:getIsActivatable() end

function AnimalLoadingTriggerActivatable:run() end

---@param x any
---@param y any
---@param z any
function AnimalLoadingTriggerActivatable:getDistance(x, y, z) end
