---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/WorkModeHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the selected work mode of an implement. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class WorkModeHUDExtension
WorkModeHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays and a separator line, keeps the vehicle reference and the localized work mode text, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function WorkModeHUDExtension.new(vehicle, customMt) end
