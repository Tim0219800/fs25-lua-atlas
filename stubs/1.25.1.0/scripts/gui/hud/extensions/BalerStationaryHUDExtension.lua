---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/BalerStationaryHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the status of a stationary baler with bale wrapper. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class BalerStationaryHUDExtension
BalerStationaryHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays (three-part box) and the baler, bale, grass and wrapped-bale icons, keeps the vehicle together with its baler and baleWrapper specs, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function BalerStationaryHUDExtension.new(vehicle, customMt) end
