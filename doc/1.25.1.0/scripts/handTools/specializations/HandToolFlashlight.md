# handTools/specializations/HandToolFlashlight.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolFlashlight.md)*

Source: `dataS/scripts/handTools/specializations/HandToolFlashlight.lua` — FS25 1.25.1.0

✍ Hand tool specialization for a flashlight that shines from a light node. The light node is relinked to the root node so it is not hidden with the tool, and is repositioned each frame depending on held state and camera (hand, first person camera or third person head). Toggling is synchronized through FlashlightToggleLightEvent. XML keys are under `handTool.flashlight`.

- **HandToolFlashlight** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolFlashlight.registerXMLPaths(xmlSchema: any)` | 17 | ✍ Registers the XML schema entries of `handTool.flashlight.light` (node, self-illuminated mesh, distance, cone angle, colour, drop-off, IES profile) and the toggle sound. |
| `HandToolFlashlight.registerFunctions(handToolType: any)` | 32 | ✍ Registers `setFlashlightIsActive` and `updateTransform` on the hand tool type. |
| `HandToolFlashlight.registerEventListeners(handToolType: any)` | 39 | ✍ Subscribes to `onLoad`, `onDelete`, `onUpdate` and `onHeldEnd`. |
| `HandToolFlashlight.prerequisitesPresent(specializations: any)` | 48 | ✍ Always returns true: no prerequisite. |
| `HandToolFlashlight:onLoad(xmlFile: any)` | 54 | ✍ Resolves the light and mesh nodes, remembers the light's offset and forward axis in its parent, relinks the light to the root node, applies range, colour, drop-off, cone angle and optional IES profile, loads the toggle sound on clients, and starts switched off. Note: the parent and translation of the light node are read before the nil check on that node. |
| `HandToolFlashlight:onDelete()` | 105 | ✍ Deletes the light node (which was relinked away from the tool and so is not freed with it), the toggle samples and the original parent node of the light. |
| `HandToolFlashlight:onUpdate(dt: any)` | 123 | ✍ Every frame, updates the light transform according to the held state and keeps the object active via `raiseActive`. |
| `HandToolFlashlight:onHeldEnd()` | 130 | ✍ Switches the light off without sending an event when the tool stops being held. |
| `HandToolFlashlight:setFlashlightIsActive(isActive: any, noEventSend: any)` | 136 | ✍ Sets the active flag, toggles visibility of the light and mesh nodes, plays the toggle sound on a state change (client) and sends a FlashlightToggleLightEvent unless `noEventSend` is set. |
| `HandToolFlashlight:updateTransform(isHeld: any)` | 160 | ✍ Positions and orients the light node. Held: at the tool's light offset. Not held: from the first person camera, otherwise from the third person head node pointing along the model yaw without pitch. Does nothing if nodes or the player are missing. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setFlashlightIsActive` | 33 |
| registerFunction | `updateTransform` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onDelete` | 41 |
| registerEventListener | `onUpdate` | 42 |
| registerEventListener | `onHeldEnd` | 43 |
