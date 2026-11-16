---@meta
-- FS25 1.25.1.0 : misc/BaleManager.lua (generated stub, FS25 Lua Atlas)

--- Map-bound manager (extends AbstractManager) that lists every bale type: size, fill types with capacity, variations and the shared i3d. Bale types come from the map file referenced by map.bales#filename and from mods through loadModBaleFromXML. It also runs bale fermentation timers on the server and offers cheat console commands (gsBaleAdd, gsBaleAddAll, gsBaleList) when g_addCheatCommands is set.
---@class BaleManager : AbstractManager
BaleManager = {}

--- Creates the manager and builds the two XML schemas, bale and mapBales, registering their paths. The schemas are stored on the class table, not on the instance.
---@param customMt any
---@return table
function BaleManager.new(customMt) end

--- Resets the lists of bale types, pending mod bales and running fermentations.
function BaleManager:initDataStructures() end

--- Reads map.bales#filename, loads the map bale list, then loads queued mod bales, computes SEND_NUM_BITS from the bale count and starts async shared i3d loads for each type. Registers the cheat console commands if enabled. Returns false when the map defines no bales xml.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function BaleManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Callback for the shared bale i3d: stores the root as sharedRoot, logs an error if the first child's collision group or mask differs from CollisionPreset.BALE, and removes the node from physics.
---@param i3dNode integer
---@param failedReason integer
---@param bale Bale
function BaleManager:baleLoaded(i3dNode, failedReason, bale) end

--- Frees the bale shared data, removes the gsBaleAdd and gsBaleList console commands, then calls the parent. Note: gsBaleAddAll is registered at load but not removed here.
function BaleManager:unloadMapData() end

--- Releases each bale type's shared i3d request and deletes its shared root node.
function BaleManager:unloadBaleData() end

--- Iterates map.bales.bale entries of the given XML file and calls loadBaleFromXML for each; always returns true.
---@param xmlFile any
---@param baseDirectory any
function BaleManager:loadBales(xmlFile, baseDirectory) end

--- Loads one bale type from a map XML key: resolves #filename, reads #isAvailable (default true), loads the bale xml and adds the type to the list. Logs an XML error and returns false on failure.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function BaleManager:loadBaleFromXML(xmlFile, key, baseDirectory) end

--- Queues a mod bale (xml filename, base directory, custom environment, isAvailable) in modBalesToLoad; the data is only parsed later in loadMapData. Logs an XML error and returns false if #filename is missing.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param customEnvironment any
function BaleManager:loadModBaleFromXML(xmlFile, key, baseDirectory, customEnvironment) end

--- Fills a bale type from its xml: i3d file (must exist), round or square flag, rounded sizes, max stack height, visual sizes, fill types with capacity and variations (default id DEFAULT). Returns false with an XML error when a file is missing, sizes required for the shape are zero, or no i3d is set; unknown fill types only warn.
---@param bale XMLFile
---@param xmlFile XMLFile
---@param baseDirectory any
---@return table
function BaleManager:loadBaleDataFromXML(bale, xmlFile, baseDirectory) end

--- Server only. Advances every fermentation by dt times the effective time scale, calls the bale's onFermentationUpdate when the whole-percent value changes, and on completion calls onFermentationUpdate(1) and onFermentationEnd then removes the entry.
---@param dt number
function BaleManager:update(dt) end

--- Adds a fermentation timer for a bale with a start time and maximum time. The max time is set to 0 when Platform.gameplay.hasBaleFermentation is false and is multiplied by the mission's economicDifficulty.
---@param bale table
---@param currentTime number
---@param maxTime number
function BaleManager:registerFermentation(bale, currentTime, maxTime) end

--- Returns the elapsed fermentation time stored for the bale, or 0 if it has none.
---@param bale table
---@return number
function BaleManager:getFermentationTime(bale) end

--- Removes every fermentation entry belonging to the given bale.
---@param bale table
function BaleManager:removeFermentation(bale) end

--- Finds the index of an available bale type matching fill type, shape and size. With a customEnvironment it searches that mod's bales first, then the bales without custom environment. Returns nil if none matches.
---@param fillTypeIndex integer
---@param isRoundbale boolean
---@param width number
---@param height number
---@param length number
---@param diameter number
---@param customEnvironment string
---@return integer
function BaleManager:getBaleIndex(fillTypeIndex, isRoundbale, width, height, length, diameter, customEnvironment) end

--- Returns isRoundbale, width, height, length, diameter and maxStackHeight for a bale xml, using the visual sizes when the flag is true. Unknown files give false, 0, 0, 0, 0, 1.
---@param xmlFilename any
---@param useVisualInfomation any
function BaleManager:getBaleInfoByXMLFilename(xmlFilename, useVisualInfomation) end

--- Tests one bale type against a request: same round or square shape, the fill type is listed, and each non-nil size equals the type's size after rounding to 2 decimals (width and diameter for round, width, height and length for square).
---@param bale any
---@param fillTypeIndex any
---@param isRoundbale any
---@param width any
---@param height any
---@param length any
---@param diameter any
function BaleManager:getIsBaleMatching(bale, fillTypeIndex, isRoundbale, width, height, length, diameter) end

--- Wraps getBaleIndex and returns the matching bale xml filename together with its index, or nil when nothing matches.
---@param fillTypeIndex integer
---@param isRoundbale boolean
---@param width number
---@param height number
---@param length number
---@param diameter number
---@param customEnvironment any
---@return integer
function BaleManager:getBaleXMLFilename(fillTypeIndex, isRoundbale, width, height, length, diameter, customEnvironment) end

--- Returns the index of the bale type with the given xml filename, or nil.
---@param xmlFilename any
function BaleManager:getBaleTypeIndexByXMLFilename(xmlFilename) end

--- Returns the xml filename of the bale type at the given index, or nil if the index is invalid.
---@param baleIndex any
function BaleManager:getBaleXMLFilenameByIndex(baleIndex) end

--- Returns whether the bale type at the index is round, or nil if the index is invalid.
---@param baleIndex any
function BaleManager:getIsRoundBale(baleIndex) end

--- Returns the capacity defined for a fill type on the bale type at the given index; 0 when the bale or fill type is unknown.
---@param baleIndex integer
---@param fillTypeIndex integer
---@return number
function BaleManager:getBaleCapacityByBaleIndex(baleIndex, fillTypeIndex) end

--- Returns a list of the capacities of every bale type that supports the fill type (one entry per matching bale type, duplicates possible).
---@param fillTypeIndex any
function BaleManager:getPossibleCapacitiesForFillType(fillTypeIndex) end

--- Console command gsBaleAdd (server only): spawns a bale of the given fill type, shape and size about 4 m in front of the local player and 5 m up, with optional wrap state and mod name; defaults to STRAW. Note: the height argument is also passed as the diameter.
---@param fillTypeName any
---@param isRoundbale any
---@param width any
---@param height any
---@param length any
---@param wrapState any
---@param modName any
function BaleManager:consoleCommandAddBale(fillTypeName, isRoundbale, width, height, length, wrapState, modName) end

--- Console command gsBaleAddAll (server only): reloads data/maps/maps_bales.xml, clears the shared i3d cache and, once every i3d is loaded, spawns one physics-free bale per type, fill type and variation in a grid with 3D debug labels and optional size boxes. Replaces previously spawned debug bales.
---@param drawSizeBox any
function BaleManager:consoleCommandAddBaleAll(drawSizeBox) end

--- Console command gsBaleList: prints each bale type's xml, shape, non-zero sizes and fill type names to the log.
function BaleManager:consoleCommandListBales() end

--- Registers the bale xml schema paths: i3d filename, size and visual size, mountable object settings, uvId, bale meshes, fill types (capacity, mass, materials, wrapping), variations, fermenting (output fill type, wrapping requirement, time in in-game days) and packed bale data.
---@param schema any
function BaleManager.registerBaleXMLPaths(schema) end

--- Registers the texture paths (diffuse, normal, alpha, baleNormal, netWrapDiffuse, netWrapNormal) under a base path, with fill-type-array flags for diffuse and normal; shared by fill types and variations.
---@param schema any
---@param basePath any
function BaleManager.registerBaleTextureXMLPaths(schema, basePath) end

--- Registers the map-level schema paths map.bales.bale(?)#filename and #isAvailable.
---@param schema any
function BaleManager.registerMapBalesXMLPaths(schema) end
