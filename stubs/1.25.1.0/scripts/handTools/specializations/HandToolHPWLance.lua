---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHPWLance.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for the high pressure washer lance. It requires HandToolTethered. While activated, the owning client raycasts forward against vehicles; the server cleans the targeted vehicle and charges running costs to the farm. State and target are synchronised through the update stream. XML keys are under `handTool.highPressureWasherLance`.
---@class HandToolHPWLance
HandToolHPWLance = {}

--- Registers the lance XML entries: raycast node, wash distance, wash multiplier, price per minute, plus effects and the washing sound.
---@param xmlSchema any
function HandToolHPWLance.registerXMLPaths(xmlSchema) end

--- Registers `onWashAction`, `setIsActivated` and `onLanceCallback` on the hand tool type.
---@param handToolType any
function HandToolHPWLance.registerFunctions(handToolType) end

--- Overrides `getCanBeDropped` so the lance can never be dropped.
---@param vehicleType any
function HandToolHPWLance.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to `onLoad`, `onDelete`, `onWriteUpdateStream`, `onReadUpdateStream`, `onUpdate`, `onRegisterActionEvents`, `onHeldEnd` and `onDebugDraw`.
---@param handToolType any
function HandToolHPWLance.registerEventListeners(handToolType) end

--- Returns true only if the HandToolTethered specialization is present.
---@param specializations any
function HandToolHPWLance.prerequisitesPresent(specializations) end

--- Reads raycast node, wash distance (default 10 m), multiplier (default 1) and price (default 10 per minute, stored per second). On clients loads water-typed effects and the washing sound. Initialises state and a dirty flag.
---@param xmlFile any
---@param baseDirectory any
function HandToolHPWLance:onLoad(xmlFile, baseDirectory) end

--- Deletes the effects and the washing sound sample.
function HandToolHPWLance:onDelete() end

--- Writes the activation flag. When sending to the server, also writes the targeted vehicle object id if there is one. The dirty mask is not consulted, so the flag is written every time.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolHPWLance:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads the activation flag and, on the server side of the connection, the targeted vehicle id (ignored if the reader is the owning player), then applies the state with `setIsActivated`.
---@param streamId any
---@param timestamp any
---@param connection any
function HandToolHPWLance:onReadUpdateStream(streamId, timestamp, connection) end

--- While activated: the owner fires an asynchronous raycast forward over `washDistance`, updates the action text with the target type and flags changes. On the server it cleans the target vehicle proportionally to the multiplier and `dt`, and charges the farm expenses and a VEHICLE_RUNNING_COSTS money change.
---@param dt any
function HandToolHPWLance:onUpdate(dt) end

--- Raycast callback: ignores hits that are not vehicles and keeps the first vehicle that allows washing by high pressure washer as the target (stops reporting). Otherwise continues; no hit clears the target.
---@param nodeId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function HandToolHPWLance:onLanceCallback(nodeId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Sets the activation state, only if it changed and a player carries the tool. The owner marks it for sync. Starts or stops the water effects and washing sound.
---@param isActivated any
function HandToolHPWLance:setIsActivated(isActivated) end

--- Registers the ACTIVATE_HANDTOOL input (callback on press and release) with very high priority and a text built from the tool's `activateText`.
function HandToolHPWLance:onRegisterActionEvents() end

--- Input callback: activates the lance while the input value is positive, deactivates it otherwise.
---@param _ any
---@param inputValue any
function HandToolHPWLance:onWashAction(_, inputValue) end

--- Overwritten function: always returns false.
---@param superFunc any
function HandToolHPWLance:getCanBeDropped(superFunc) end

--- Deactivates the lance and returns the tool to its holder with the flag set to true.
function HandToolHPWLance:onHeldEnd() end

--- Adds debug lines showing the activation state and the targeted vehicle type name; returns the updated y position.
---@param x any
---@param y any
---@param textSize any
function HandToolHPWLance:onDebugDraw(x, y, textSize) end
