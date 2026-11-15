---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TireTracks.lua (stub généré, atlas Lua FS25)

---@class TireTracks
TireTracks = {}

---@param specializations any
function TireTracks.prerequisitesPresent(specializations) end

function TireTracks.initSpecialization() end

---@param vehicleType any
function TireTracks.registerFunctions(vehicleType) end

---@param vehicleType any
function TireTracks.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function TireTracks.registerEventListeners(vehicleType) end

---@param savegame table
function TireTracks:onPreLoad(savegame) end

function TireTracks:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TireTracks:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function TireTracks:getAllowTireTracks() end

---@param wheel any
---@param parent any
---@param linkNode any
---@param tireTrackAtlasIndex any
---@param width any
---@param radius any
---@param inverted any
---@param activeFunc any
function TireTracks:addTireTrackNode(wheel, parent, linkNode, tireTrackAtlasIndex, width, radius, inverted, activeFunc) end

---@param tireTrackNodeIndex any
function TireTracks:removeTireTrackNode(tireTrackNodeIndex) end

---@param tireTrackNode any
---@param allowTireTracks any
function TireTracks:updateTireTrackNode(tireTrackNode, allowTireTracks) end
