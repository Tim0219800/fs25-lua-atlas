---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/DoghouseActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object for a doghouse placeable: lets the player fill the dog food bowl. While active it draws the fill-bowl context hint with the dog name through the mission.
---@class DoghouseActivatable
DoghouseActivatable = {}

--- Creates the activatable for a doghouse placeable and sets the prompt text `action_doghouseFillbowl`.
---@param doghousePlaceable any
function DoghouseActivatable.new(doghousePlaceable) end

--- Tells the doghouse placeable to set its food bowl state to filled (`setFoodBowlState(true)`).
function DoghouseActivatable:run() end

--- Per-frame draw: shows the fill-dog-bowl context hint with the dog name (empty if there is no dog).
function DoghouseActivatable:draw() end

--- Registers this object as a drawable of the mission so `draw` is called.
function DoghouseActivatable:activate() end

--- Removes this object from the mission drawables.
function DoghouseActivatable:deactivate() end
