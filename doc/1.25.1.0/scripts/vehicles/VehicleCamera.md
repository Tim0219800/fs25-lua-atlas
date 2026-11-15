# vehicles/VehicleCamera.lua

Source: `dataS/scripts/vehicles/VehicleCamera.lua` — FS25 1.25.1.0

- **VehicleCamera** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleCamera.new(vehicle: Vehicle, customMt: table?) → table` | 23 |  |
| `VehicleCamera:loadFromXML(xmlFile: XMLFile, key: string, savegame: any, cameraIndex: any) → boolean` | 69 |  |
| `VehicleCamera:onPostLoad(savegame: table)` | 320 |  |
| `VehicleCamera:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 368 |  |
| `VehicleCamera:delete()` | 386 |  |
| `VehicleCamera:zoomSmoothly(offset: number)` | 409 |  |
| `VehicleCamera:raycastCallback(transformId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number)` | 441 |  |
| `VehicleCamera:update(dt: number)` | 452 |  |
| `VehicleCamera:onActivate()` | 693 |  |
| `VehicleCamera:setLODDebugState(state: any, zoom: any)` | 791 |  |
| `VehicleCamera:setCameraYDebugState(state: any, height: any)` | 817 |  |
| `VehicleCamera:onDeactivate()` | 844 |  |
| `VehicleCamera:actionEventLookUpDown(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 899 |  |
| `VehicleCamera:touchEventLookUpDown(value: any)` | 918 |  |
| `VehicleCamera:touchEventZoomInOut(value: any)` | 927 |  |
| `VehicleCamera:touchEventLookLeftRight(value: any)` | 935 |  |
| `VehicleCamera:actionEventLookLeftRight(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 944 |  |
| `VehicleCamera:resetCamera()` | 964 |  |
| `VehicleCamera:updateRotateNodeRotation()` | 997 |  |
| `VehicleCamera:setSeparateCameraPose()` | 1030 |  |
| `VehicleCamera:getTiltDirectionOffset()` | 1076 |  |
| `VehicleCamera:getCollisionDistance() → boolean, number, number, number, number, number` | 1094 |  |
| `VehicleCamera:onActiveCameraSuspensionSettingChanged(newState: boolean)` | 1212 |  |
| `VehicleCamera:onFovySettingChanged()` | 1228 |  |
| `VehicleCamera:onCameraCollisionDetectionSettingChanged(newState: boolean)` | 1238 |  |
| `VehicleCamera.registerCameraXMLPaths(schema: any, basePath: any)` | 1285 |  |
| `VehicleCamera.registerCameraSavegameXMLPaths(schema: any, basePath: any)` | 1321 |  |
| `VehicleCamera.consoleCommandLODDebug()` | 1334 |  |
| `VehicleCamera.consoleCommandCameraYDebug(height: any)` | 1345 |  |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.55)
- subscribes `MessageType.SETTING_CHANGED` (l.58)
- subscribes `MessageType.SETTING_CHANGED` (l.59)
