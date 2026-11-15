# handTools/specializations/HandToolFlashlight.lua

Source: `dataS/scripts/handTools/specializations/HandToolFlashlight.lua` — FS25 1.25.1.0

- **HandToolFlashlight** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolFlashlight.registerXMLPaths(xmlSchema: any)` | 17 |  |
| `HandToolFlashlight.registerFunctions(handToolType: any)` | 32 |  |
| `HandToolFlashlight.registerEventListeners(handToolType: any)` | 39 |  |
| `HandToolFlashlight.prerequisitesPresent(specializations: any)` | 48 |  |
| `HandToolFlashlight:onLoad(xmlFile: any)` | 54 |  |
| `HandToolFlashlight:onDelete()` | 105 |  |
| `HandToolFlashlight:onUpdate(dt: any)` | 123 |  |
| `HandToolFlashlight:onHeldEnd()` | 130 |  |
| `HandToolFlashlight:setFlashlightIsActive(isActive: any, noEventSend: any)` | 136 |  |
| `HandToolFlashlight:updateTransform(isHeld: any)` | 160 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setFlashlightIsActive` | 33 |
| registerFunction | `updateTransform` | 34 |
| registerEventListener | `onLoad` | 40 |
| registerEventListener | `onDelete` | 41 |
| registerEventListener | `onUpdate` | 42 |
| registerEventListener | `onHeldEnd` | 43 |
