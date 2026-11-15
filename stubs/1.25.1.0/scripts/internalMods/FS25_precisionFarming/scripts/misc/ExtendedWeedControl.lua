---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedWeedControl
ExtendedWeedControl = {}

---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function ExtendedWeedControl:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

function ExtendedWeedControl:unloadMapData() end

---@param minOctave1 any
---@param numOctave1 any
---@param persistence1 any
---@param minOctave2 any
---@param numOctave2 any
---@param persistence2 any
function ExtendedWeedControl:setWeedNoiseParameters(minOctave1, numOctave1, persistence1, minOctave2, numOctave2, persistence2) end

---@param modifier any
---@param weedFilter any
function ExtendedWeedControl:clearWeedArea(modifier, weedFilter) end

function ExtendedWeedControl:getWeedModifier() end

---@param pfModule any
function ExtendedWeedControl:overwriteGameFunctions(pfModule) end
