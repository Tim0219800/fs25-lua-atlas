---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/hud/ExtendedCombineHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD box shown in the vehicle input help for combine harvesters that carry the Precision Farming ExtendedCombine specialization. It displays the last yield (t/ha with a rating bar colored by a gradient), the worked area since the last reset and the total worked area. It is created per vehicle with a low priority (GS_PRIO_LOW).
---@class ExtendedCombineHUDExtension
ExtendedCombineHUDExtension = {}

--- Constructor taking the vehicle: grabs spec_combine and the ExtendedCombine spec, creates the background, separator, bar and icon overlays, reads the colorblind setting and subscribes to colorblind and UI scale changes. Note: it subscribes self.storeScaledValues to the UI_SCALE setting and calls it, but that method is not defined in this file (UNVERIFIED where it comes from).
---@param vehicle table
---@param customMt any
function ExtendedCombineHUDExtension.new(vehicle, customMt) end

--- Deletes all overlays, unsubscribes from the message center and clears the vehicle and spec references.
function ExtendedCombineHUDExtension:delete() end

--- Stores the new colorblind flag when it changes; it is used to pick the gradient when drawing. Note: the source doc comment says it determines whether the extension is drawn, which does not match what the code does.
---@param isActive any
function ExtendedCombineHUDExtension:setColorBlindMode(isActive) end

--- Returns the height of this HUD box in screen space (0 until it has been computed).
---@return number
function ExtendedCombineHUDExtension:getHeight() end

--- Draws the box at posX/posY: last yield with unit, yield percentage with a gradient bar (rating = (yield% - 50) / (potential - 50)), worked area since reset and total worked area. Returns the new Y below the box, or posY unchanged without the spec. Note: the source doc comment mentions a mixing wagon, which looks like a copy-paste leftover.
---@param inputHelpDisplay any
---@param posX any
---@param posY any
function ExtendedCombineHUDExtension:draw(inputHelpDisplay, posX, posY) end
