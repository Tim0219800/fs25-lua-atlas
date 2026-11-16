---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolFlashlight.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for a flashlight that shines from a light node. The light node is relinked to the root node so it is not hidden with the tool, and is repositioned each frame depending on held state and camera (hand, first person camera or third person head). Toggling is synchronized through FlashlightToggleLightEvent. XML keys are under `handTool.flashlight`.
---@class HandToolFlashlight
HandToolFlashlight = {}

--- Registers the XML schema entries of `handTool.flashlight.light` (node, self-illuminated mesh, distance, cone angle, colour, drop-off, IES profile) and the toggle sound.
---@param xmlSchema any
function HandToolFlashlight.registerXMLPaths(xmlSchema) end

--- Registers `setFlashlightIsActive` and `updateTransform` on the hand tool type.
---@param handToolType any
function HandToolFlashlight.registerFunctions(handToolType) end

--- Subscribes to `onLoad`, `onDelete`, `onUpdate` and `onHeldEnd`.
---@param handToolType any
function HandToolFlashlight.registerEventListeners(handToolType) end

--- Always returns true: no prerequisite.
---@param specializations any
function HandToolFlashlight.prerequisitesPresent(specializations) end

--- Resolves the light and mesh nodes, remembers the light's offset and forward axis in its parent, relinks the light to the root node, applies range, colour, drop-off, cone angle and optional IES profile, loads the toggle sound on clients, and starts switched off. Note: the parent and translation of the light node are read before the nil check on that node.
---@param xmlFile any
function HandToolFlashlight:onLoad(xmlFile) end

--- Deletes the light node (which was relinked away from the tool and so is not freed with it), the toggle samples and the original parent node of the light.
function HandToolFlashlight:onDelete() end

--- Every frame, updates the light transform according to the held state and keeps the object active via `raiseActive`.
---@param dt any
function HandToolFlashlight:onUpdate(dt) end

--- Switches the light off without sending an event when the tool stops being held.
function HandToolFlashlight:onHeldEnd() end

--- Sets the active flag, toggles visibility of the light and mesh nodes, plays the toggle sound on a state change (client) and sends a FlashlightToggleLightEvent unless `noEventSend` is set.
---@param isActive any
---@param noEventSend any
function HandToolFlashlight:setFlashlightIsActive(isActive, noEventSend) end

--- Positions and orients the light node. Held: at the tool's light offset. Not held: from the first person camera, otherwise from the third person head node pointing along the model yaw without pitch. Does nothing if nodes or the player are missing.
---@param isHeld any
function HandToolFlashlight:updateTransform(isHeld) end
