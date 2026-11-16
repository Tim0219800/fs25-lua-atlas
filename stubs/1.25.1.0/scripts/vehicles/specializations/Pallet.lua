---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pallet.lua (generated stub, FS25 Lua Atlas)

--- Specialization for pallets and big bags whose visible content follows a fill unit. It has no prerequisites. It flags the vehicle as a pallet without player input, shows or hides content objects according to fill percentage, supplies mesh nodes for tension belts, can age-blend pallet textures, and counts toward the pallet slot limit. It is also loaded as an auto-loadable cargo item.
---@class Pallet
Pallet = {}

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function Pallet.prerequisitesPresent(specializations) end

--- Registers the XML paths under vehicle.pallet (fill unit, shape node, link nodes, i3d file, textures, content objects, straps, unload sound) and the savegame pallet age.
function Pallet.initSpecialization() end

--- Registers five vehicle functions. Note: onPalletI3DFileLoaded and updatePalletStraps are registered from Pallet but no such functions are defined in this file, so those entries are nil.
---@param vehicleType any
function Pallet.registerFunctions(vehicleType) end

--- Overrides getMeshNodes, loadComponentFromXML, auto-load size and auto-load, vehicle overview and reset flags, map hotspot visibility and empty-on-reset.
---@param vehicleType any
function Pallet.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to pre-load, load, post-load, delete and fill unit fill level changed events.
---@param vehicleType any
function Pallet.registerEventListeners(vehicleType) end

--- Sets isPallet to true and disables player input on the vehicle.
---@param savegame any
function Pallet:onPreLoad(savegame) end

--- Reads the XML: validates the shape node, optionally loads a shared visual pallet i3d into the link nodes, collects textures, the pallet age (random unless in shop config), content objects (hidden at start), straps and the unload sound. Registers with the pallet slot limit and sets fork joint limits.
---@param savegame table
function Pallet:onLoad(savegame) end

--- If textures are defined, applies one diffuse map to the pallet node, or blends two textures by the pallet age through a custom map and a blendScale parameter.
---@param savegame any
function Pallet:onPostLoad(savegame) end

--- Deletes the sound samples on the client, releases the shared i3d request and removes the pallet from the slot limit.
function Pallet:onDelete() end

--- Saves the pallet age to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Pallet:saveToXMLFile(xmlFile, key, usedModNames) end

--- If the platform has no dynamic pallets, turns a dynamic component into a kinematic rigid body, then calls the parent.
---@param superFunc any
---@param component any
---@param xmlFile any
---@param key any
---@param rootPosition any
---@param i any
function Pallet:loadComponentFromXML(superFunc, component, xmlFile, key, rootPosition, i) end

--- Shows content objects in proportion to the fill percentage (at least one when non-empty), plays the unload sound when an object disappears and flags the tension belt nodes as dirty.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Pallet:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Rebuilds the cached tension belt mesh list when dirty and returns it if not empty; otherwise defers to the parent.
---@param superFunc any
function Pallet:getMeshNodes(superFunc) end

--- Appends to the given table the base tension belt nodes, the visible content objects usable as belt meshes, and extra mesh nodes of the tension belt object spec if present.
---@param nodes any
function Pallet:collectPalletTensionBeltNodes(nodes) end

--- Marks the cached tension belt mesh list as outdated.
function Pallet:setPalletTensionBeltNodesDirty() end

--- Returns the localized pallet title for the info box.
function Pallet:getInfoBoxTitle() end

--- Returns the vehicle's length, height and width as x, y, z, swapping length and width because pallets are loaded rotated by 90 degrees.
---@param superFunc any
function Pallet:getAutoLoadSize(superFunc) end

--- Mounts the pallet kinematically on the auto loader node at the cell centre, rotated 90 degrees about Y, and always returns true.
---@param superFunc any
---@param autoLoader any
---@param node any
---@param posX any
---@param posZ any
---@param sizeX any
---@param sizeZ any
function Pallet:autoLoad(superFunc, autoLoader, node, posX, posZ, sizeX, sizeZ) end

--- Always false: pallets are not listed in the vehicles overview.
---@param superFunc any
function Pallet:getShowInVehiclesOverview(superFunc) end

--- Always false: pallets cannot be reset.
---@param superFunc any
function Pallet:getCanBeReset(superFunc) end

--- Always false: pallets have no visible map hotspot.
---@param superFunc any
function Pallet:getIsMapHotspotVisible(superFunc) end

--- Always false: the fill unit is not emptied on reset.
---@param superFunc any
function Pallet:getFillUnitEmptyOnReset(superFunc) end
