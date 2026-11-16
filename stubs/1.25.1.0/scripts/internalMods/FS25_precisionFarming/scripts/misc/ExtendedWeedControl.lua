---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/ExtendedWeedControl.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming extension of weed handling. It loads a weed noise bitmap (shared/weedNoise.grle) used to keep patchy weed areas, clears weeds on sowing, and overrides herbicide spraying so spot spraying skips preventive stages. It overrides FSDensityMapUtil, Sprayer, FieldUpdateTask and FieldState, and relies on the weedSystem, whose source is not in this dump.
---@class ExtendedWeedControl
ExtendedWeedControl = {}

--- Creates and loads the weed noise bit vector map and builds a filter on it. If loading fails it logs an error and returns false. Note: on success it returns nothing (nil), not true.
---@param _ any
---@param _ any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function ExtendedWeedControl:loadFromXML(_, _, baseDirectory, configFileName, mapFilename) end

--- Drops the filters, deletes the noise bit vector map and, on the server, removes the pfWeedSetNoiseParameters console command (its registration is not in this file).
function ExtendedWeedControl:unloadMapData() end

--- Developer tool: regenerates the noise map from two Perlin noise filters with the given octave and persistence parameters, and saves weedNoise.grle in the user profile folder. Missing parameters keep previous values.
---@param minOctave1 any
---@param numOctave1 any
---@param persistence1 any
---@param minOctave2 any
---@param numOctave2 any
---@param persistence2 any
function ExtendedWeedControl:setWeedNoiseParameters(minOctave1, numOctave1, persistence1, minOctave2, numOctave2, persistence2) end

--- Sets to 0 the pixels of the modifier's area that match both the noise filter and the given weed filter.
---@param modifier any
---@param weedFilter any
function ExtendedWeedControl:clearWeedArea(modifier, weedFilter) end

--- Lazily creates, then returns, the weed density modifier, along with dense and sparse weed filters. Returns nil if the map has no weed.
function ExtendedWeedControl:getWeedModifier() end

--- Overrides FSDensityMapUtil.setSowingWeedArea (clears dense and sparse weeds), Sprayer.processSprayerArea (remembers spot spraying), FSDensityMapUtil.updateHerbicideArea (rewrites it, no preventive stages when spot spraying), FieldUpdateTask.prepare and FieldState.update (weed state sampled in a 20 m square).
---@param pfModule any
function ExtendedWeedControl:overwriteGameFunctions(pfModule) end
