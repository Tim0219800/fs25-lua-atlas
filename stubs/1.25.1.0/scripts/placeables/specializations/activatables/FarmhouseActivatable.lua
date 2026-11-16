---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/FarmhouseActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object on a farmhouse placeable that lets the player go to sleep. It is available when the placeable allows the local farm to sleep and nobody is already sleeping, and it opens the sleep dialog of the sleep manager.
---@class FarmhouseActivatable
FarmhouseActivatable = {}

--- Creates the activatable for a placeable and sets the prompt text `ui_inGameSleep`.
---@param placeable any
function FarmhouseActivatable.new(placeable) end

--- Returns true if the placeable allows the local farm to sleep and the sleep manager is not already sleeping.
function FarmhouseActivatable:getIsActivatable() end

--- Opens the sleep dialog through `g_sleepManager:showDialog()`.
function FarmhouseActivatable:run() end
