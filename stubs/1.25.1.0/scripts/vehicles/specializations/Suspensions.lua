---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Suspensions.lua (generated stub, FS25 Lua Atlas)

--- Specialization for non-wheel suspensions such as cabin, seat or driver character, with no prerequisites. Each suspension node is a client-side spring/damper simulation, per axis, driven by the acceleration of a reference point on the parent component and applied as a rotation or translation to a node. Nodes are read from vehicle.suspensions.suspension in the vehicle XML and are only updated within a configurable distance.
---@class Suspensions
Suspensions = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function Suspensions.prerequisitesPresent(specializations) end

--- Registers the XML schema of a suspension node (node, character torso, weight, rotation/translation limits, velocity difference, X/Y/Z spring parameters, inversion, server-only) and vehicle.suspensions#maxUpdateDistance.
function Suspensions.initSpecialization() end

--- Registers loadSuspensionNodeFromXML, getSuspensionNodeFromIndex, getIsSuspensionNodeActive and setSuspensionNodeCharacter.
---@param vehicleType any
function Suspensions.registerFunctions(vehicleType) end

--- Subscribes to onLoad, onUpdate, onEnterVehicle and onVehicleCharacterChanged.
---@param vehicleType any
function Suspensions.registerEventListeners(vehicleType) end

--- Client only: loads every suspension node (skipping server-only ones on pure clients), reads the max update distance and flags suspensions available. Disabled with a warning where the platform forbids suspension nodes. Removes update/enter/character listeners when none are available.
---@param savegame any
function Suspensions:onLoad(savegame) end

--- For vehicles within the max update distance, computes the acceleration of each node's reference point, then integrates a spring/damper per axis with an implicit Euler step (physics dt on the server, frame dt otherwise), clamps to the limits and applies rotation or translation.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Suspensions:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Fills a suspension node table from XML: node and parent component, weight, limits, spring parameters (multiplied by 1000), flags. Returns false if the node is unusable or has no rotation or translation limits.
---@param xmlFile any
---@param key any
---@param suspensionNode any
function Suspensions:loadSuspensionNodeFromXML(xmlFile, key, suspensionNode) end

--- Returns the suspension node table at the given index, or nil if no suspension is available.
---@param suspensionIndex any
function Suspensions:getSuspensionNodeFromIndex(suspensionIndex) end

--- Returns true if the suspension node has both a node and a parent component.
---@param suspensionNode any
function Suspensions:getIsSuspensionNodeActive(suspensionNode) end

--- For nodes using the character torso, points the node to the character model's third-person suspension node and recomputes its parent component and reference offset.
---@param suspensionNode any
---@param character any
function Suspensions:setSuspensionNodeCharacter(suspensionNode, character) end

--- When someone enters the vehicle, binds the vehicle character (if any) to every suspension node.
---@param isControlling any
function Suspensions:onEnterVehicle(isControlling) end

--- For character-torso nodes, rebinds the new character or clears the node when the character is removed.
---@param character any
function Suspensions:onVehicleCharacterChanged(character) end

--- Debug-time check callback: logs an XML error when a collision shape is a child of a suspension node, which can keep the vehicle from sleeping. It is only referenced from a debug-only block.
---@param collisionNode any
---@param xmlFile any
---@param nodeName any
function Suspensions.subCollisionErrorFunction(collisionNode, xmlFile, nodeName) end

--- Returns the current vertical translation of the seat suspension (node 2 if it is a non-rotational, non-torso node, else node 1), or 0 if rotational or missing. Note: the name is spelled 'Modfier' in the source.
function Suspensions:getSuspensionModfier() end
