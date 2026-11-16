---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableMultiBunkerSilo.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for bunker silos that may contain several BunkerSilo objects chosen by a configuration, with optional side walls. Extendable silos of the same type and owner snap next to each other when being placed and hide the walls between them. It registers a bunkerSilo configuration type and registers itself with the mission placeable system; BunkerSilo itself is defined elsewhere.
---@class PlaceableMultiBunkerSilo
PlaceableMultiBunkerSilo = {}

--- Always returns true: no prerequisite specialization is required.
---@param specializations table
---@return boolean
function PlaceableMultiBunkerSilo.prerequisitesPresent(specializations) end

--- Registers the placeable configuration type bunkerSilo (with its localised label) in the placeable configuration manager.
function PlaceableMultiBunkerSilo.initSpecialization() end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream, onWriteStream and onSell.
---@param placeableType any
function PlaceableMultiBunkerSilo.registerEventListeners(placeableType) end

--- Registers updateBunkerSiloWalls, setWallVisibility and getIsBunkerSiloExtendable on the placeable type.
---@param placeableType any
function PlaceableMultiBunkerSilo.registerFunctions(placeableType) end

--- Overrides getPlacementPosition, getPlacementRotation, getHasOverlap, startPlacementCheck, canBeSold and setOwnerFarmId.
---@param placeableType any
function PlaceableMultiBunkerSilo.registerOverwrittenFunctions(placeableType) end

--- Declares the bunkerSilo XML keys: isExtendable, siloToSiloDistance, snapDistance (default 1.1 times the distance), sell warning text, wallLeft/wallBack/wallRight node and collision, and per-configuration BunkerSilo entries.
---@param schema any
---@param basePath any
function PlaceableMultiBunkerSilo.registerXMLPaths(schema, basePath) end

--- Registers savegame keys for each bunkerSilo entry by delegating to BunkerSilo.registerSavegameXMLPaths.
---@param schema any
---@param basePath any
function PlaceableMultiBunkerSilo.registerSavegameXMLPaths(schema, basePath) end

--- Loads wall nodes, the sell warning text and one BunkerSilo per entry of the selected configuration, then reads isExtendable and the spacing values (error and ERROR loading state if siloToSiloDistance is missing). Note: the back wall is read from wallRight and then overwrites spec.wallRight from wallBack, so spec.wallBack is never set.
---@param savegame table
function PlaceableMultiBunkerSilo:onLoad(savegame) end

--- Restores walls of neighbouring silos, deletes all BunkerSilo objects and removes this placeable from the placeable system's bunker silo list.
function PlaceableMultiBunkerSilo:onDelete() end

--- Hides walls shared with neighbouring silos, registers each BunkerSilo as a network object with the owner farm, and adds the placeable to the placeable system's bunker silo list.
function PlaceableMultiBunkerSilo:onFinalizePlacement() end

--- Client side on join: reads object id and stream data of each BunkerSilo and finishes its client registration.
---@param streamId any
---@param connection any
function PlaceableMultiBunkerSilo:onReadStream(streamId, connection) end

--- Server side on join: writes object id and stream data of each BunkerSilo and registers it in the connection stream.
---@param streamId any
---@param connection any
function PlaceableMultiBunkerSilo:onWriteStream(streamId, connection) end

--- Savegame loading: loads each BunkerSilo from its indexed bunkerSilo key; returns false if any of them fails.
---@param xmlFile any
---@param key any
function PlaceableMultiBunkerSilo:loadFromXMLFile(xmlFile, key) end

--- Savegame saving: writes each BunkerSilo under an indexed bunkerSilo key.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableMultiBunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

--- Shows or hides the left, back and right walls (node visibility and static/none collision body). Note: each flag is combined with the current state by 'or', so a wall that is visible cannot be hidden this way, and the right wall uses the left flag.
---@param isLeftVisible any
---@param isBackVisible any
---@param isRightVisible any
function PlaceableMultiBunkerSilo:setWallVisibility(isLeftVisible, isBackVisible, isRightVisible) end

--- Returns whether this silo was declared extendable in the XML.
function PlaceableMultiBunkerSilo:getIsBunkerSiloExtendable() end

--- For other extendable silos of the same config file and farm within siloToSiloDistance + 0.5 m, calls setWallVisibility on the neighbour: hides the facing wall on placement, shows it when deleting.
---@param isDeleting any
function PlaceableMultiBunkerSilo:updateBunkerSiloWalls(isDeleting) end

--- Override: calls the parent, then sets the same owner farm on every BunkerSilo without sending an event.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableMultiBunkerSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

--- When sold, clears the silo area of each BunkerSilo.
function PlaceableMultiBunkerSilo:onSell() end

--- Override: always returns true, plus the sell warning text if any BunkerSilo still has fill level above zero, else nil.
---@param superFunc any
function PlaceableMultiBunkerSilo:canBeSold(superFunc) end

--- Override: after the parent, for extendable silos finds the nearest silo of the local farm and same config within snapDistance, storing it and the side (sign of local x) for snapping.
---@param superFunc function
---@param x number?
---@param y number?
---@param z number?
---@param rotY number?
function PlaceableMultiBunkerSilo:startPlacementCheck(superFunc, x, y, z, rotY) end

--- Override: when a snapping silo was found, wraps the overlap check so that hits on that silo are ignored; otherwise passes the check through to the parent.
---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceableMultiBunkerSilo:getHasOverlap(superFunc, x, y, z, rotY, checkFunc) end

--- Override: returns the parent rotation, replaced by the snapping silo's Y orientation when one was found.
---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableMultiBunkerSilo:getPlacementRotation(superFunc, x, y, z) end

--- Override: returns the parent position, replaced by a point at siloToSiloDistance to the side of the snapping silo when one was found.
---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableMultiBunkerSilo:getPlacementPosition(superFunc, x, y, z) end
