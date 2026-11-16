---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RandomlyMovingParts.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that wiggles nodes (rotation and/or translation) in a pseudo-random way while the vehicle drives, e.g. sowing machine parts bouncing over the ground. Configured under vehicle.randomlyMovingParts in the vehicle XML, with presets for the noise shape. Client-only at runtime: the update listener is removed on servers without client or when no part loads. Optionally tied to a ground reference node of another specialization.
---@class RandomlyMovingParts
RandomlyMovingParts = {}

--- Always returns true: this specialization has no prerequisite on other specializations.
---@param specializations table
---@return boolean
function RandomlyMovingParts.prerequisitesPresent(specializations) end

--- Registers the vehicle XML schema entries for randomlyMovingParts: max update distance, per-part node, speed, fade, preset, noise, bump, rotation and translation settings, and sub-nodes that follow the same value.
function RandomlyMovingParts.initSpecialization() end

--- Registers loadRandomlyMovingPartFromXML, updateRandomlyMovingPart and getIsRandomlyMovingPartActive on the vehicle type.
---@param vehicleType any
function RandomlyMovingParts.registerFunctions(vehicleType) end

--- Subscribes the specialization to the onLoad and onUpdate vehicle events.
---@param vehicleType any
function RandomlyMovingParts.registerEventListeners(vehicleType) end

--- Reads the max update distance and every randomlyMovingPart entry from the XML into spec.nodes. Removes the onUpdate listener if not a client or if no part was loaded.
---@param savegame table
function RandomlyMovingParts:onLoad(savegame) end

--- Each frame, if the vehicle is closer than the max update distance and its last speed exceeds 0.1, updates every part through updateRandomlyMovingPart.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function RandomlyMovingParts:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one part: node, optional ground reference node (index starts at 0 in the XML key, 0 triggers a warning), speed scale with random variance, fade time, noise preset, bumps, rotation and translation limits and linked sub-nodes. Returns false if the node is unknown or no axis is given. Note: sub-node rotation and translation attributes are read from the part key, not the sub-node key, which looks like a bug.
---@param part table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RandomlyMovingParts:loadRandomlyMovingPartFromXML(part, xmlFile, key) end

--- Advances one part: computes speed (from moved distance, or from dt if not speed dependent), fades the weight in or out depending on activity, handles random bumps, sums three sine waves into a delta and applies it to the part and its sub-nodes through a local helper (updateNodeData, whose body is not in the dump).
---@param part table
---@param dt number
---@return boolean
function RandomlyMovingParts:updateRandomlyMovingPart(part, dt) end

--- Returns true, or, when the part has a ground reference node, whether that node is currently active via getIsGroundReferenceNodeActive.
---@param part table
---@return boolean
function RandomlyMovingParts:getIsRandomlyMovingPartActive(part) end
