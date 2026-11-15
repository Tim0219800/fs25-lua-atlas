---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Crawlers.lua (stub généré, atlas Lua FS25)

---@class Crawlers
Crawlers = {}

---@param specializations table
---@return boolean
function Crawlers.prerequisitesPresent(specializations) end

function Crawlers.initSpecialization() end

---@param vehicleType any
function Crawlers.registerFunctions(vehicleType) end

---@param vehicleType any
function Crawlers.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function Crawlers.registerEventListeners(vehicleType) end

---@param savegame table
function Crawlers:onLoad(savegame) end

---@param savegame table
function Crawlers:onLoadFinished(savegame) end

function Crawlers:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Crawlers:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function Crawlers:onWheelConfigurationChanged() end

---@param crawler any
---@param dt any
function Crawlers:updateCrawler(crawler, dt) end

---@param xmlFile XMLFile
---@param key any
function Crawlers:loadCrawlerFromXML(xmlFile, key) end

---@param crawler any
---@param xmlFilename any
---@param linkNode any
function Crawlers:loadCrawlerFromConfigFile(crawler, xmlFilename, linkNode) end

---@param i3dNode any
---@param failedReason any
---@param args any
function Crawlers:onCrawlerI3DLoaded(i3dNode, failedReason, args) end

---@param crawler table
---@param lastName string
---@param useOnlyRotation boolean
---@return number
function Crawlers:getCrawlerWheelMovedDistance(crawler, lastName, useOnlyRotation) end

---@param superFunc any
---@param node any
function Crawlers:validateWashableNode(superFunc, node) end

---@param crawler any
function Crawlers.getShallowWaterParameters(crawler) end
