---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/hud/ExtendedSprayerHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD box shown in the vehicle input help for sprayers and spreaders with the Precision Farming ExtendedSprayer specialization. Depending on the loaded fill type it shows a pH gradient (lime) or a nitrogen gradient, with current, target and planned values, the application rate, the soil type and an explanatory text. Reads the soil, pH and nitrogen maps of g_precisionFarming. Created per vehicle with low priority (GS_PRIO_LOW).
---@class ExtendedSprayerHUDExtension
ExtendedSprayerHUDExtension = {}

--- Constructor taking the vehicle: grabs the ExtendedSprayer spec and the soil, pH and nitrogen maps, creates gradient, bar, flag and background overlays, loads the many HUD texts, and subscribes to colorblind and UI scale changes. Note: it subscribes self.storeScaledValues to the UI_SCALE setting and calls it, but that method is not defined in this file (UNVERIFIED where it comes from).
---@param vehicle table
---@param customMt any
function ExtendedSprayerHUDExtension.new(vehicle, customMt) end

--- Deletes all overlays, unsubscribes from the message center and clears the vehicle and spec references.
function ExtendedSprayerHUDExtension:delete() end

--- When the colorblind flag changes, stores it and asks the pH map and the nitrogen map to rebuild their minimap on next update. Note: the source doc comment says it determines whether the extension is drawn, which does not match what the code does.
---@param isActive any
function ExtendedSprayerHUDExtension:setColorBlindMode(isActive) end

--- Returns the box height: the base display height plus the extra height needed for the change line and description text.
---@return number
function ExtendedSprayerHUDExtension:getHeight() end

--- Draws the box. With lime loaded it shows pH, otherwise nitrogen (solid, liquid, slurry or manure). Computes the application rate, actual, planned and target positions on the gradient, the soil type and a description, then the footer. Returns the Y below the box, or posY without the spec. Note: the source doc comment mentions a mixing wagon, which looks like a copy-paste leftover.
---@param inputHelpDisplay any
---@param posX any
---@param posY any
function ExtendedSprayerHUDExtension:draw(inputHelpDisplay, posX, posY) end
