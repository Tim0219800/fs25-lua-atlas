---@meta
-- FS25 1.25.1.0 : gui/hud/extensions/YarderTowerHUDExtension.lua (generated stub, FS25 Lua Atlas)

--- HUD extension panel for the vehicle info HUD: shows the state of a yarder (cable crane) tower. It is a plain class (not a HUDDisplay subclass) built per vehicle by the HUD; only the constructor is defined here, the remaining methods are supplied elsewhere (UNVERIFIED which file).
---@class YarderTowerHUDExtension
YarderTowerHUDExtension = {}

--- Builds the extension for the given vehicle with priority GS_PRIO_HIGH: creates the background overlays (three-part box) and the carriage, position, tree and yarder icons, keeps the vehicle reference and a title text combining "yarder" with the vehicle name, calls storeScaledValues and re-calls it whenever the UI scale setting changes via the message center.
---@param vehicle table
---@param customMt any
function YarderTowerHUDExtension.new(vehicle, customMt) end
