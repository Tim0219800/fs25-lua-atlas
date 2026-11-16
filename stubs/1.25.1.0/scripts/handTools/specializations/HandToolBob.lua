---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolBob.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization that adds a procedural first-person bob to chosen nodes of the tool: a constant slow idle sway plus a walking sway that scales with the player's speed. It is only applied for the local player in first person, and the node is restored to its rest position otherwise. Nodes are configured under `handTool.bob.node(?)`; HandToolMotorized can overwrite `updateBobNode` to add its vibration.
---@class HandToolBob
HandToolBob = {}

--- Registers the XML schema entries for `handTool.bob.node(?)`: target node, vertical/horizontal amplitudes, frequency, reference speed and the three idle parameters, with the class constants as defaults.
---@param xmlSchema table
function HandToolBob.registerXMLPaths(xmlSchema) end

--- Registers the specialization functions `getIsBobActive`, `updateBobNode` and `resetBobNode` on the hand tool type.
---@param handToolType table
function HandToolBob.registerFunctions(handToolType) end

--- Subscribes the specialization to `onLoad`, `onUpdate` and `onHeldEnd`.
---@param handToolType table
function HandToolBob.registerEventListeners(handToolType) end

--- Always returns true: this specialization has no prerequisite.
---@param specializations table
---@return boolean
function HandToolBob.prerequisitesPresent(specializations) end

--- Reads every `handTool.bob.node` entry, resolves its node (warning and skipping if missing), stores its rest translation and parameters, and initialises phase state. Reference speed is clamped to at least 0.0001.
---@param xmlFile table
function HandToolBob:onLoad(xmlFile) end

--- Each frame, if the tool has bob nodes, determines whether bobbing is active and gets the carrying player's graphical speed, then calls `updateBobNode` for every node.
---@param dt number
function HandToolBob:onUpdate(dt) end

--- Resets all bob nodes to their rest pose when the tool stops being held, since `onUpdate` no longer runs then.
function HandToolBob:onHeldEnd() end

--- Returns true only when the tool is held by the local player and that player's camera is in first person.
---@return boolean
function HandToolBob:getIsBobActive() end

--- Advances one node's idle and walk phases, smooths the speed factor, and sets the node translation to rest plus sinusoidal X/Y offsets. When inactive it resets the node once. The `speed` argument is in m/s.
---@param bobNode table
---@param dt number
---@param isActive boolean
---@param speed number
function HandToolBob:updateBobNode(bobNode, dt, isActive, speed) end

--- Puts the node back to its stored rest translation and clears phase, speed factor, bobbing flag and offsets.
---@param bobNode table
function HandToolBob:resetBobNode(bobNode) end
