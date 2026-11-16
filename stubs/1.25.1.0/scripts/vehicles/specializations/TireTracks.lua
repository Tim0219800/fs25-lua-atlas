---@meta
-- FS25 1.25.1.0 : vehicles/specializations/TireTracks.lua (generated stub, FS25 Lua Atlas)

--- Specialization (no prerequisites) that manages tire track decals left by wheels. Other code (wheels, speed rotating parts) registers track nodes here; each one owns a track in g_currentMission.tireTrackSystem. Each update, the track grows with ground colour, depth and dirt data from the wheel physics, or is cut when conditions fail. The engine call getTyreTracksSegmentsCoeff gates it (behaviour of the track system classes itself is UNVERIFIED, not in the dump).
---@class TireTracks
TireTracks = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function TireTracks.prerequisitesPresent(specializations) end

--- Empty: registers nothing.
function TireTracks.initSpecialization() end

--- Registers getAllowTireTracks, addTireTrackNode, removeTireTrackNode and updateTireTrackNode.
---@param vehicleType any
function TireTracks.registerFunctions(vehicleType) end

--- Empty: registers no overridden functions.
---@param vehicleType any
function TireTracks.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onDelete and onUpdate.
---@param vehicleType any
function TireTracks.registerEventListeners(vehicleType) end

--- Initializes the track node list, reads the engine segments coefficient and caches the mission's tire track system.
---@param savegame table
function TireTracks:onPreLoad(savegame) end

--- Destroys every track created by this vehicle in the tire track system.
function TireTracks:onDelete() end

--- While the vehicle is active and has track nodes, updates every track node with the current allow-tracks state.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function TireTracks:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns true when the vehicle is closer than TireTracks.MAX_CREATION_DISTANCE (not defined in this file, UNVERIFIED) and the segments coefficient is above 0.
function TireTracks:getAllowTireTracks() end

--- Registers a track node for a wheel (parent, link node, atlas index, width, radius, inverted flag, optional active callback) and creates its track. Returns the node index, or nil if creation failed.
---@param wheel any
---@param parent any
---@param linkNode any
---@param tireTrackAtlasIndex any
---@param width any
---@param radius any
---@param inverted any
---@param activeFunc any
function TireTracks:addTireTrackNode(wheel, parent, linkNode, tireTrackAtlasIndex, width, radius, inverted, activeFunc) end

--- Clears the track node at the index and updates the has-nodes flag. Note: it does not destroy the track in the track system; that happens in onDelete.
---@param tireTrackNodeIndex any
function TireTracks:removeTireTrackNode(tireTrackNodeIndex) end

--- Cuts the track if disallowed, inactive, not in contact, on a surface that forbids tracks or without dirt; otherwise adds a track point at the tire's ground contact with colour, dirt, depth, direction and contact type.
---@param tireTrackNode any
---@param allowTireTracks any
function TireTracks:updateTireTrackNode(tireTrackNode, allowTireTracks) end
