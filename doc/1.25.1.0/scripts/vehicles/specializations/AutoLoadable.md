# vehicles/specializations/AutoLoadable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutoLoadable.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadable.lua` — FS25 1.25.1.0

✍ Marker specialization for vehicles that an AutoLoader vehicle may pick up and mount on its load area. It reports the object's size and bounding box from `self.size` and mounts the object kinematically at a grid position. It has no prerequisite and only sets its flag on the server.

- **AutoLoadable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AutoLoadable.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no prerequisite specialization. |
| `AutoLoadable.registerFunctions(vehicleType: any)` | 21 | ✍ Registers `getAutoLoadIsSupported`, `getAutoLoadIsAllowed`, `getAutoLoadBoundingBox`, `getAutoLoadSize` and `autoLoad` on the vehicle type. |
| `AutoLoadable.registerEventListeners(vehicleType: any)` | 31 | ✍ Subscribes the vehicle to `onLoad`. |
| `AutoLoadable:onLoad(savegame: any)` | 37 | ✍ On the server only, marks the vehicle as supported for auto loading. On clients the flag stays unset. |
| `AutoLoadable:getAutoLoadIsSupported()` | 47 | ✍ Returns the supported flag set at load time (true on the server, nil elsewhere). |
| `AutoLoadable:getAutoLoadIsAllowed()` | 54 | ✍ Always returns true; other specializations can override it to refuse loading. |
| `AutoLoadable:getAutoLoadSize()` | 60 | ✍ Returns the vehicle size as width, height and length, taken from `self.size`. |
| `AutoLoadable:getAutoLoadBoundingBox()` | 71 | ✍ Returns an oriented bounding box in world space: centre, forward and up directions, then half extents. The centre uses the size offsets relative to the root node. |
| `AutoLoadable:autoLoad(autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 85 | ✍ Mounts the vehicle kinematically on the loader's node at the given grid position with zero rotation, and returns true. Note: the Z mount offset adds half of the size height, not the length, which looks like a slip. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getAutoLoadIsSupported` | 22 |
| registerFunction | `getAutoLoadIsAllowed` | 23 |
| registerFunction | `getAutoLoadBoundingBox` | 24 |
| registerFunction | `getAutoLoadSize` | 25 |
| registerFunction | `autoLoad` | 26 |
| registerEventListener | `onLoad` | 32 |
