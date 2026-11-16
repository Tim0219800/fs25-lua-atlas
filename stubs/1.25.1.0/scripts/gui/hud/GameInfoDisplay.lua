---@meta
-- FS25 1.25.1.0 : gui/hud/GameInfoDisplay.lua (generated stub, FS25 Lua Atlas)

--- Top-right HUD info bar showing money, calendar date, weather (current and upcoming), clock with hands and a fast-forward indicator. Derived from HUDDisplay. This file creates the overlays (weather slice ids per WeatherType) and the scaled layout only; the update and draw code is not in this file (UNVERIFIED).
---@class GameInfoDisplay : HUDDisplay
GameInfoDisplay = {}

--- Constructor. Creates the money and info background slices, calendar/weather/clock/fast-forward overlays with HUD colours and a table mapping each WeatherType (sun, partly cloudy, cloudy, rain, snow, hail, twister, thunder) to its icon slice.
function GameInfoDisplay.new() end

--- Positions the bar at the top-right HUD anchor and computes all scaled sizes and offsets (65 px bar height, 48 px icons, text sizes and offsets, clock hands, fast-forward icon, separator and spacing).
function GameInfoDisplay:storeScaledValues() end
