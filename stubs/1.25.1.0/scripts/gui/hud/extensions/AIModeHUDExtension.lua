---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/AIModeHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the selected AI mode and AI state of a vehicle. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class AIModeHUDExtension
AIModeHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_VERY_HIGH: creates the background overlays, a separator line, keeps the vehicle plus its aiModeSelection and aiDrivable specs and caches the localized mode/state texts, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function AIModeHUDExtension.new(vehicle, customMt) end
