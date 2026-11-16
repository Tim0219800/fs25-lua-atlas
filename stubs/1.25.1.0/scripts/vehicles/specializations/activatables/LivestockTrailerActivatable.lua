---@meta
-- FS25 1.25.1.0 : vehicles/specializations/activatables/LivestockTrailerActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable attached to a livestock trailer so the player can open the animal management screen for it. It holds a reference to the trailer and only becomes selectable when animals or rideables are present and nobody is blocking input. Client-side UI helper; it does not itself transfer animals.
---@class LivestockTrailerActivatable
LivestockTrailerActivatable = {}

--- Creates the activatable for the given livestock trailer and stores the localized prompt text `action_openLivestockTrailerMenu`.
---@param livestockTrailer any
function LivestockTrailerActivatable.new(livestockTrailer) end

--- Returns false while the trailer has a loading trigger. Otherwise true when there are rideables in the trigger or animals aboard, and the trailer or one of those rideables is active for input.
function LivestockTrailerActivatable:getIsActivatable() end

--- Points `g_animalScreen` at this trailer (no husbandry, not a dealer view) and opens the `AnimalScreen` GUI.
function LivestockTrailerActivatable:run() end
