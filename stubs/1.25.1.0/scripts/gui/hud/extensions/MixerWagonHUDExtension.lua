---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/MixerWagonHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the mixing ratio of a mixer wagon. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class MixerWagonHUDExtension
MixerWagonHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays (three-part box), a progress bar and a marker, keeps the vehicle and its mixerWagon spec, builds one status entry (icon, fill level, min/max percentage) per mixer fill type whose first fill type exists, and sets a title with the vehicle full name, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function MixerWagonHUDExtension.new(vehicle, customMt) end
