---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SlopeCompensation.lua (generated stub, FS25 Lua Atlas)

--- Specialization that tilts parts of a vehicle to follow the slope, either from the height difference between two groups of wheels (raycasts under the wheels) or from a reference node angle. It requires Wheels, adds a "slopeCompensation" configuration type, drives an animation, a rotation node and/or animation parts per compensation node, and saves the last angle. It also registers an animation value type "slopeCompensationLevel". Note: `updateSlopeCompensationAngle` is registered as a vehicle function and called every update, but no function of that name is defined in this file (its body is absent from the dump); where it is defined is UNVERIFIED.
---@class SlopeCompensation
SlopeCompensation = {}

--- Returns true only if the vehicle type has the Wheels specialization.
---@param specializations any
function SlopeCompensation.prerequisitesPresent(specializations) end

--- Registers the "slopeCompensation" configuration type, the XML schema (base and per-configuration), the delayed AnimatedVehicle part attributes (`slopeCompensationNodeIndex`, start/end level) and the savegame `lastAngle` per compensation node.
function SlopeCompensation.initSpecialization() end

--- Declares the schema under a base path: update threshold, high update frequency flag, and each `compensationNode` (wheels or wheel nodes, angle limits, speed, inversion, heights, animation name, reference and rotation nodes with axes, animation parts with min/max rotation and translation).
---@param schema any
---@param basePath any
function SlopeCompensation.registerXMLPaths(schema, basePath) end

--- Registers `loadSlopeCompensationWheels`, `loadSlopeCompensationNodeFromXML`, `getSlopeCompensationAngle`, `getSlopeCompensationAngleScale`, `updateSlopeCompensationAngle` and `setSlopeCompensationNodeAngle`.
---@param vehicleType any
function SlopeCompensation.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onLoadFinished, onUpdate, onUpdateTick and onRegisterAnimationValueTypes.
---@param vehicleType any
function SlopeCompensation.registerEventListeners(vehicleType) end

--- Reads the threshold and update frequency, loads the compensation nodes from the base XML and from the selected configuration (which can override threshold and frequency). Removes unused listeners: all if no node, onUpdateTick if high frequency, otherwise onUpdate.
---@param savegame any
function SlopeCompensation:onLoad(savegame) end

--- Primes each node's animation by stepping it through times 0, 1 and 0.5, then restores the saved angle of each node from the savegame, or sets 0 for a new vehicle.
---@param savegame any
function SlopeCompensation:onLoadFinished(savegame) end

--- Saves the last applied angle of each compensation node.
---@param xmlFile any
---@param key any
---@param usedModNames any
function SlopeCompensation:saveToXMLFile(xmlFile, key, usedModNames) end

--- For each node, clamps the detected angle to its limits, scales it, optionally inverts it, updates the target when the change exceeds the threshold, moves the current angle toward the target at the node speed (with an easing factor) and applies it, then calls `updateSlopeCompensationAngle`.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SlopeCompensation:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs the same logic as onUpdate (used when high update frequency is off).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function SlopeCompensation:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Registers the animation value type "slopeCompensationLevel" (float): it reads or writes the `compensationLevel` of the node chosen by `slopeCompensationNodeIndex` and reapplies the current angle when it changes.
function SlopeCompensation:onRegisterAnimationValueTypes() end

--- Resolves one side's wheels from a wheel index, a wheel node and/or a list of wheel nodes. Returns true, the list of wheel drive nodes and the largest wheel radius, or false with a warning if a wheel is not found or none is defined.
---@param xmlFile any
---@param key any
---@param indexName any
---@param nodeName any
---@param nodesName any
function SlopeCompensation:loadSlopeCompensationWheels(xmlFile, key, indexName, nodeName, nodesName) end

--- Loads one compensation node: if both wheel groups resolve, sets up raycast callbacks that compute the ground angle between the two groups (static bodies only); also reads reference and rotation nodes, angle limits (swapped and inverted if min is above max), speed, animation, heights and animation parts. Always returns true.
---@param compensationNode any
---@param xmlFile any
---@param key any
function SlopeCompensation:loadSlopeCompensationNodeFromXML(compensationNode, xmlFile, key) end

--- Returns the last detected slope angle of the given compensation node.
---@param compensationNode any
function SlopeCompensation:getSlopeCompensationAngle(compensationNode) end

--- Returns 1 by default; meant to be overridden to scale the compensation of a node.
---@param compensationNode any
function SlopeCompensation:getSlopeCompensationAngleScale(compensationNode) end

--- Applies an angle to a node: maps it to a 0..1 position between min and max, drives the animation, sets the rotation node on its axis, and moves animation parts (rotation and/or translation, side-dependent, blended with the compensation level). Stores it as the node's last angle.
---@param compensationNode any
---@param angle any
function SlopeCompensation:setSlopeCompensationNodeAngle(compensationNode, angle) end

--- Debug helper: adds one line per compensation node with its clamped detected angle in degrees.
---@param values any
function SlopeCompensation:updateDebugValues(values) end
