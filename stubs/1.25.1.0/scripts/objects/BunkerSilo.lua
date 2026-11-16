---@meta
-- FS25 1.25.1.0 : objects/BunkerSilo.lua (generated stub, FS25 Lua Atlas)

--- Networked Object for a bunker silo (silage clamp) that tracks a rectangular density-map area defined by start, width and height nodes. It goes through four states: FILL (chaff is added and compacted by driving vehicles), CLOSED (covered, fermenting), FERMENTED and DRAIN (opened, output fill type taken out). Fill levels are read from the density-map height system on the server and synchronised to clients. Several constants and helpers (STATE_*, NUM_STATES, COMPACTING_BASE_MASS, MILLISECONDS_PER_DAY, updateCompacting, onHourChanged, showBunkerMessage) are referenced but not defined in this dump (UNVERIFIED). The file ends with the start of BunkerSiloActivatable, whose body is absent.
---@class BunkerSilo : Object
BunkerSilo = {}

--- Networked Object for a bunker silo (silage clamp) that tracks a rectangular density-map area defined by start, width and height nodes. It goes through four states: FILL (chaff is added and compacted by driving vehicles), CLOSED (covered, fermenting), FERMENTED and DRAIN (opened, output fill type taken out). Fill levels are read from the density-map height system on the server and synchronised to clients. Several constants and helpers (STATE_*, NUM_STATES, COMPACTING_BASE_MASS, MILLISECONDS_PER_DAY, updateCompacting, onHourChanged, showBunkerMessage) are referenced but not defined in this dump (UNVERIFIED). The file ends with the start of BunkerSiloActivatable, whose body is absent.
---@class BunkerSiloActivatable
BunkerSiloActivatable = {}

--- Deprecated map callback: only logs an error saying BunkerSilo.onCreate is deprecated and creates nothing.
---@param id integer
function BunkerSilo:onCreate(id) end

--- Constructor. Initialises the area offsets, default fill types (input chaff, output silage, fermenting tarp), counters, the activatable and the FILL state, reserves a dirty flag and subscribes to HOUR_CHANGED. Returns the instance.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function BunkerSilo.new(isServer, isClient, customMt) end

--- Loads the area and innerArea nodes, trigger, accepted/input/output fill types, distanceToCompactedFillLevel, openingLength and wall nodes from XML. Registers the converting area with the density-map manager and divides the compaction distance by the economic difficulty. Returns true.
---@param components table
---@param xmlFile table
---@param key string
---@param i3dMappings table
---@return boolean
function BunkerSilo:load(components, xmlFile, key, i3dMappings) end

--- Removes the interaction trigger, the fixed and converting fill type areas, message subscriptions and the activatable, then calls the parent delete.
function BunkerSilo:delete() end

--- Client side on join: after the parent, reads state (3 bits), the opened front/back flags, fill level, compacted percent (7 bits) and fermenting percent.
---@param streamId integer
---@param connection table
function BunkerSilo:readStream(streamId, connection) end

--- Server side on join: after the parent, writes the same fields that readStream reads.
---@param streamId integer
---@param connection table
function BunkerSilo:writeStream(streamId, connection) end

--- Client side update: if the dirty bit is set, reads state (calling setState with notification on change), fill level, opened flags, then compacted percent in FILL or fermenting percent in CLOSED/FERMENTED.
---@param streamId integer
---@param timestamp integer
---@param connection table
function BunkerSilo:readUpdateStream(streamId, timestamp, connection) end

--- Server side update: writes a flag for the silo dirty bit and, when set, the fields that readUpdateStream expects.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function BunkerSilo:writeUpdateStream(streamId, connection, dirtyMask) end

--- Restores state, fill levels, fermenting time and opened flags from the savegame, recomputes area offsets, and repairs the density map: converts or clears fill types depending on the state, and may switch DRAIN back to FILL when the silo is nearly empty. Returns true.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function BunkerSilo:loadFromXMLFile(xmlFile, key) end

--- Writes state, fillLevel, compactedFillLevel, fermentingTime (percent converted to milliseconds using days per period) and the opened front/back flags to the savegame.
---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function BunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

--- Per-frame update. Shows fill level and compaction or fermenting info when the local player can interact. On the server in FILL state, computes compaction from the distance moved, mass and wheel contact of vehicles in range. Keeps the global bunkerScore at the highest fill level and calls raiseActive.
---@param dt number
function BunkerSilo:update(dt) end

--- Server side, about every 200 to 300 ms: refreshes the fill level and, if it changed, calls updateCompacting. On first call it raises openingLength to at least the default max radius of the output fill type plus 1.
---@param dt number
function BunkerSilo:updateTick(dt) end

--- Reads the fill level from the inner area in the density map, using the fill type that matches the state (input, fermenting, or fermenting plus output). In DRAIN below emptyThreshold it clears the area and returns to FILL with notification.
function BunkerSilo:updateFillLevel() end

--- Changes the silo state and applies its effects. FILL resets compaction and areas, CLOSED converts input to fermenting and erases tire tracks, DRAIN sets the output as fixed fill type. Optionally shows a message, and on the server raises the dirty flag. No effect if the state is unchanged.
---@param state boolean
---@param showNotification boolean
function BunkerSilo:setState(state, showNotification) end

--- Switches to DRAIN with notification, recomputes offsets, then opens the end closer to the given position by converting the fermenting fill type to the output type over openingLength. Marks that end as opened and raises the dirty flag.
---@param px number
---@param py number
---@param pz number
function BunkerSilo:openSilo(px, py, pz) end

--- Scans the area in 1 m slices from the front or the back, starting at the given offset, and returns the offset of the first slice holding the given fill type. Returns the area length minus 1 (at least 0) if none is found.
---@param updateAtFront boolean
---@param offset number
---@param fillType integer
---@return number
function BunkerSilo:getBunkerAreaOffset(updateAtFront, offset, fillType) end

--- Converts the fermenting fill type into the output fill type on a strip of the given length starting at the offset, measured from the front or from the back of the area.
---@param switchAtFront boolean
---@param offset number
---@param length number
function BunkerSilo:switchFillTypeAtOffset(switchAtFront, offset, length) end

--- Returns true if the given world position is nearer to the middle of the front edge (including the front offset) than to the back edge.
---@param ix number
---@param iy number
---@param iz number
---@return boolean
function BunkerSilo:getIsCloserToFront(ix, iy, iz) end

--- Client check on the local player. In information mode it is true for a player on foot in range or for the current vehicle in range and active for input. Otherwise true only for a player on foot in range. False without a local player.
---@param showInformationOnly boolean
---@return boolean
function BunkerSilo:getCanInteract(showInformationOnly) end

--- Returns true when the state is FILL, the fill level is above 0 and the compacted percent is at least 100.
---@return boolean
function BunkerSilo:getCanCloseSilo() end

--- Returns true if the state is FERMENTED or DRAIN and the end closer to the local interaction position is not opened yet. False if there is no interaction position.
---@return boolean
function BunkerSilo:getCanOpenSilo() end

--- Clears everything from the density-map height system over the silo area defined by the start, width and height nodes.
function BunkerSilo:clearSiloArea() end

--- Returns the local player position when on foot in range, or the first component node position of the current vehicle in range. Returns nil otherwise, including without a local player.
---@return number
---@return number
---@return number
function BunkerSilo:getInteractionPosition() end

--- Trigger callback on enter or leave. Tracks the local player and Vehicle objects in range, adds or removes the activatable accordingly and sets or clears the vehicle's bunker silo interactor callback (for shovels).
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function BunkerSilo:interactionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Callback from a vehicle (shovel) whose fill level changed. Only reacts to negative deltas: on an opened end it extends the opened strip past the tool position by openingLength and updates the front or back offset.
---@param self table
---@param vehicle table
---@param fillDelta integer
---@param fillType integer
---@param x any
---@param y any
---@param z any
function BunkerSilo.onChangedFillLevelCallback(self, vehicle, fillDelta, fillType, x, y, z) end

--- Registers the XML schema: area and innerArea nodes, wallLeft and wallRight nodes with collision, interactionTrigger node, acceptedFillTypes, inputFillType, outputFillType, distanceToCompactedFillLevel (default 100) and openingLength (default 5).
---@param schema any
---@param basePath any
function BunkerSilo.registerXMLPaths(schema, basePath) end

--- Registers the savegame attributes state (0 FILL, 1 CLOSED, 2 FERMENTED, 3 DRAIN), fillLevel, compactedFillLevel, fermentingTime, openedAtFront and openedAtBack.
---@param schema any
---@param basePath any
function BunkerSilo.registerSavegameXMLPaths(schema, basePath) end
