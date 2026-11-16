---@meta
-- FS25 1.25.1.0 : animals/DogPetActivatable.lua (generated stub, FS25 Lua Atlas)

--- Small activatable object that lets the player pet a dog. It shows the localized action_petAnimal text, is always activatable, and measures distance through the dog, then calls Dog:pet when run.
---@class DogPetActivatable
DogPetActivatable = {}

--- Creates the activatable for a dog with the localized pet action text.
---@param dog any
function DogPetActivatable.new(dog) end

--- Always returns true; availability is decided elsewhere, for example by the dog registering or removing the activatable.
function DogPetActivatable:getIsActivatable() end

--- Returns the distance from the given world position to the dog, delegated to Dog:getDistanceTo.
---@param posX any
---@param posY any
---@param posZ any
function DogPetActivatable:getDistance(posX, posY, posZ) end

--- Calls pet on the dog.
function DogPetActivatable:run() end
