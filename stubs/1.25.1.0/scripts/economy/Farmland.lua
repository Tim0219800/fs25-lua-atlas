---@meta
-- FS25 1.25.1.0 : economy/Farmland.lua (generated stub, FS25 Lua Atlas)

--- Data object for one purchasable farmland parcel: id, name, area, price, NPC, owner farm and map hotspot. Loaded from the map farmlands XML by FarmlandManager. updatePrice is called here but not defined in this file.
---@class Farmland
Farmland = {}

--- Constructor. Starts not owned, with no indicator position, no field and no bounding box.
---@param customMt any
---@return table
function Farmland.new(customMt) end

--- Reads one farmland from XML (#id, #indicatorPosition, #name, #areaInHa default 2.5, #price or #priceScale, #npcName, #showOnFarmlandsScreen, #defaultFarmProperty). Returns false with an XML error if the id is missing or 0.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Farmland:load(xmlFile, key) end

--- Removes and deletes the map hotspot of this farmland, if one exists.
function Farmland:delete() end

--- Stores the world X/Z position of the farmland indicator and moves the map hotspot to it when present.
---@param xWorldPos number
---@param zWorldPos number
function Farmland:setIndicatorPosition(xWorldPos, zWorldPos) end

--- Sets the area in hectares and recomputes the price, unless the farmland has a fixed price.
---@param areaInHa number
function Farmland:setArea(areaInHa) end
