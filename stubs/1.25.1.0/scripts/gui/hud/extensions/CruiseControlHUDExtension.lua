---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/CruiseControlHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the cruise control controls. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class CruiseControlHUDExtension
CruiseControlHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_VERY_LOW: creates the background overlays and a separator line, keeps the vehicle reference and the uppercase "change speed" text (toggle/change input elements start as nil), calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function CruiseControlHUDExtension.new(vehicle, customMt) end
