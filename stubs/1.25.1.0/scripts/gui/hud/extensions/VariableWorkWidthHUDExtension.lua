---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/VariableWorkWidthHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the partial working width sections of a variable work width implement. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class VariableWorkWidthHUDExtension
VariableWorkWidthHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays, a progress bar and a separator, keeps the vehicle and its variableWorkWidth spec, stores the section count and the uppercase title, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function VariableWorkWidthHUDExtension.new(vehicle, customMt) end
