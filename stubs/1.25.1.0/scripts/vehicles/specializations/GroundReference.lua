---@meta
-- FS25 1.25.1.0 : vehicles/specializations/GroundReference.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for soil-working tools: it declares reference nodes and tracks whether each one is at or below the terrain surface (or the height-map material surface), and optionally only while the tool is lowered. The result drives the power multiplier (load) and lets speed-rotating parts such as wheels or tines turn only while touching the ground. The state is computed on the server and sent to clients in the update stream.
---@class GroundReference
GroundReference = {}

--- Always returns true: no prerequisite on other specializations.
---@param specializations any
function GroundReference.prerequisitesPresent(specializations) end

--- Registers the XML schema of a ground reference node (node, threshold, only-when-lowered, charge value, force factor, max activation depth) and the groundReferenceNodeIndex attribute on speed rotating parts. The base path constant is defined outside this file (UNVERIFIED).
function GroundReference.initSpecialization() end

--- Empty: the specialization registers no custom events.
---@param vehicleType any
function GroundReference.registerEvents(vehicleType) end

--- Registers the node loading, update and query functions (including forward speed) on the vehicle type.
---@param vehicleType any
function GroundReference.registerFunctions(vehicleType) end

--- Overrides getPowerMultiplier, loadSpeedRotatingPartFromXML and getIsSpeedRotatingPartActive so ground contact influences load and rotating parts.
---@param vehicleType any
function GroundReference.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onReadUpdateStream, onWriteUpdateStream and onUpdateTick.
---@param vehicleType any
function GroundReference.registerEventListeners(vehicleType) end

--- Loads all groundReferenceNode entries, then normalizes the charge values and force factors so each set sums to 1. If no node exists, removes the onUpdateTick listener.
---@param savegame any
function GroundReference:onLoad(savegame) end

--- Client side: reads one boolean per reference node from the stream and stores it as the node's active state.
---@param streamId any
---@param timestamp any
---@param connection any
function GroundReference:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the active state of every reference node into the update stream sent to clients.
---@param streamId any
---@param connection any
---@param dirtyMask any
function GroundReference:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Every tick, refreshes the active state of every ground reference node.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function GroundReference:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one reference node from XML (node, threshold, lowered-only flag, charge value, force factor, max depth). Returns true on success, false when the node is missing. Marks the vehicle as using force factors if any is given.
---@param xmlFile any
---@param baseName any
---@param entry any
function GroundReference:loadGroundReferenceNode(xmlFile, baseName, entry) end

--- Server only. A node is active when the tool is lowered (if required) and the node lies below terrain height, or below the height-map material height, by the threshold but not deeper than the max activation depth.
---@param groundReferenceNode any
function GroundReference:updateGroundReferenceNode(groundReferenceNode) end

--- Returns the reference node table at the given 1-based index, or nil.
---@param refNodeIndex any
function GroundReference:getGroundReferenceNodeFromIndex(refNodeIndex) end

--- Returns whether the given reference node is currently active (touching the ground).
---@param groundReferenceNode any
function GroundReference:getIsGroundReferenceNodeActive(groundReferenceNode) end

--- Returns the threshold height of the given reference node, in meters.
---@param groundReferenceNode any
function GroundReference:getIsGroundReferenceNodeThreshold(groundReferenceNode) end

--- Returns the vehicle's last speed if the indexed node is active and the vehicle moves forward, otherwise 0. Used by rotating parts tied to a reference node.
---@param groundReferenceNodeIndex any
function GroundReference:getGroundReferenceNodeForwardSpeed(groundReferenceNodeIndex) end

--- Scales the parent power multiplier by the ground contact: the sum of force factors of active nodes if any are configured, else the charge value of the last active node. Note: with no active node the factor is 0.
---@param superFunc any
function GroundReference:getPowerMultiplier(superFunc) end

--- Extends the parent loader to read groundReferenceNodeIndex for a speed rotating part, warning if the index is 0 since indices start at 1.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function GroundReference:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Returns false for a rotating part whose linked reference node is inactive. Warns and clears the link if the index is unknown, then falls back to the parent check.
---@param superFunc any
---@param speedRotatingPart any
function GroundReference:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end
