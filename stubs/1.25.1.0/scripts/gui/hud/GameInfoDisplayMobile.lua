---@meta
-- FS25 1.25.1.0 : gui/hud/GameInfoDisplayMobile.lua (stub généré, atlas Lua FS25)

---@class GameInfoDisplayMobile : HUDDisplayElement
GameInfoDisplayMobile = {}

---@param hud string
---@param hudAtlasPath string
---@param moneyUnit any
---@param controlHudAtlasPath any
function GameInfoDisplayMobile.new(hud, hudAtlasPath, moneyUnit, controlHudAtlasPath) end

---@param vehicle any
function GameInfoDisplayMobile:setVehicle(vehicle) end

function GameInfoDisplayMobile:onOpenShop() end

function GameInfoDisplayMobile:onOpenMap() end

function GameInfoDisplayMobile:onOpenMenu() end

function GameInfoDisplayMobile:onOpenHelp() end

---@param moneyUnit integer
function GameInfoDisplayMobile:setMoneyUnit(moneyUnit) end

---@param missionInfo table
function GameInfoDisplayMobile:setMissionInfo(missionInfo) end

---@param environment table
function GameInfoDisplayMobile:setEnvironment(environment) end

---@param isVisible any
function GameInfoDisplayMobile:setMoneyVisible(isVisible) end

---@param isVisible any
function GameInfoDisplayMobile:setTimeVisible(isVisible) end

---@param isVisible any
function GameInfoDisplayMobile:setTemperatureVisible(isVisible) end

---@param isVisible any
function GameInfoDisplayMobile:setWeatherVisible(isVisible) end

---@param isVisible any
function GameInfoDisplayMobile:setTutorialVisible(isVisible) end

---@param progress number
function GameInfoDisplayMobile:setTutorialProgress(progress) end

function GameInfoDisplayMobile:draw() end

---@param uiScale any
function GameInfoDisplayMobile:setScale(uiScale) end

---@param scale scale
---@return number
---@return number
function GameInfoDisplayMobile.getBackgroundPositionAndSize(scale) end

function GameInfoDisplayMobile.createBackground() end
