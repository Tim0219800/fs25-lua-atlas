---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/BaleCounterHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the session and lifetime bale counters. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class BaleCounterHUDExtension
BaleCounterHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_NORMAL: creates the background overlays and the session/lifetime icons, keeps the vehicle reference and the uppercase localized title, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function BaleCounterHUDExtension.new(vehicle, customMt) end
