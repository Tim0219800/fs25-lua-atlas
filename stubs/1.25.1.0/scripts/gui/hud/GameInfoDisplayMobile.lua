---@meta
-- FS25 1.25.1.0 : gui/hud/GameInfoDisplayMobile.lua (generated stub, FS25 Lua Atlas)

--- Top HUD bar for the mobile/touch layout, derived from HUDDisplayElement. It spans the screen width inside the safe-frame insets and hosts menu, shop, map and help buttons plus weather, money and fuel/fitness elements. The create* helpers, updateInsets and updateButtonPosition are called here but not defined in this file (UNVERIFIED). The button handlers forward to g_currentMission toggles unless the sleep manager is sleeping.
---@class GameInfoDisplayMobile : HUDDisplayElement
GameInfoDisplayMobile = {}

--- Constructor taking the HUD, the HUD atlas path, the money unit and the control atlas path. Creates the background frame, builds the buttons and weather/money/fuel elements through create* helpers and subscribes to MessageType.INSETS_CHANGED.
---@param hud string
---@param hudAtlasPath string
---@param moneyUnit any
---@param controlHudAtlasPath any
function GameInfoDisplayMobile.new(hud, hudAtlasPath, moneyUnit, controlHudAtlasPath) end

--- Stores the controlled vehicle, flags whether it has the Rideable specialization, and shows the fuel/fitness element only when a vehicle is set.
---@param vehicle any
function GameInfoDisplayMobile:setVehicle(vehicle) end

--- Button handler calling g_currentMission:onToggleStore(); ignored while the sleep manager is sleeping.
function GameInfoDisplayMobile:onOpenShop() end

--- Button handler calling g_currentMission:onToggleMap(); ignored while the sleep manager is sleeping.
function GameInfoDisplayMobile:onOpenMap() end

--- Button handler calling g_currentMission:onToggleMenu(); ignored while the sleep manager is sleeping.
function GameInfoDisplayMobile:onOpenMenu() end

--- Button handler calling g_currentMission:onToggleHelp(); ignored while the sleep manager is sleeping.
function GameInfoDisplayMobile:onOpenHelp() end

--- Sets the currency unit (GS_MONEY_EURO, POUND or DOLLAR); any other value falls back to dollar.
---@param moneyUnit integer
function GameInfoDisplayMobile:setMoneyUnit(moneyUnit) end

--- Stores the MissionInfo reference used for base information; it should not be modified.
---@param missionInfo table
function GameInfoDisplayMobile:setMissionInfo(missionInfo) end

--- Stores the environment reference used for weather display; its class is not in the SDK dump (UNVERIFIED).
---@param environment table
function GameInfoDisplayMobile:setEnvironment(environment) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param isVisible any
function GameInfoDisplayMobile:setMoneyVisible(isVisible) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param isVisible any
function GameInfoDisplayMobile:setTimeVisible(isVisible) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param isVisible any
function GameInfoDisplayMobile:setTemperatureVisible(isVisible) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param isVisible any
function GameInfoDisplayMobile:setWeatherVisible(isVisible) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param isVisible any
function GameInfoDisplayMobile:setTutorialVisible(isVisible) end

--- Empty stub: the body is empty in this version, so it has no effect.
---@param progress number
function GameInfoDisplayMobile:setTutorialProgress(progress) end

--- Runs every registered text draw function in textElements, then draws the parent element.
function GameInfoDisplayMobile:draw() end

--- Applies a uniform UI scale, recomputes the bar position and size, stores the original position, repositions the shop/menu/map/help buttons relative to the bar corner and moves the help highlight.
---@param uiScale any
function GameInfoDisplayMobile:setScale(uiScale) end

--- Returns x, y, width and height of the bar: it fills the screen width minus the larger of the safe-frame inset and the scaled offset on each side, and sits at the top edge.
---@param scale scale
---@return number
---@return number
function GameInfoDisplayMobile.getBackgroundPositionAndSize(scale) end

--- Creates an image-less overlay with the computed bar rectangle, used as a positioning frame.
function GameInfoDisplayMobile.createBackground() end
