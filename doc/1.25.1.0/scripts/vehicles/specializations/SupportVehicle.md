# vehicles/specializations/SupportVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SupportVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/SupportVehicle.lua` — FS25 1.25.1.0

✍ Specialization for implements that spawn a helper 'support vehicle' (for example a transport trolley) when detached and remove it again when attached. It requires AttacherJoints and Mountable. The server loads the support vehicle from the store through VehicleLoadingData, attaches the tool to it and tracks it. XML keys live under vehicle.supportVehicle (filename, joint indices, offsets, configurations).

- **SupportVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SupportVehicle.prerequisitesPresent(specializations: any)` | 15 | ✍ Returns true only if the vehicle type has both AttacherJoints and Mountable. |
| `SupportVehicle.initSpecialization()` | 21 | ✍ Registers the XML schema: support vehicle filename, attacher joint indices, terrain offset (0.2), spawn offset (0.75) and a list of configuration name/id pairs. |
| `SupportVehicle.registerFunctions(vehicleType: any)` | 39 | ✍ Registers addSupportVehicle, enableSupportVehicle and removeSupportVehicle on the vehicle type. |
| `SupportVehicle.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Overrides getAllowMultipleAttachments, resolveMultipleAttachments, getShowAttachableMapHotspot, getIsReadyToFinishDetachProcess and startDetachProcess. |
| `SupportVehicle.registerEventListeners(vehicleType: any)` | 57 | ✍ Subscribes to onLoad, onDelete, onUpdate and onPostDetach. |
| `SupportVehicle:onLoad(savegame: any)` | 66 | ✍ Reads offsets and joint indices, resolves the support vehicle store item (warns if missing), precomputes four footprint corners for height checks and reads configuration pairs. Removes the delete/update/post-detach listeners on clients or when no store item exists. |
| `SupportVehicle:onDelete()` | 128 | ✍ Removes the support vehicle unless the vehicle is being reconfigured. |
| `SupportVehicle:onPostDetach(attacherVehicle: table, implement: table)` | 138 | ✍ After detachment, enables the pending support vehicle by attaching the tool to it. |
| `SupportVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 144 | ✍ On the first update (not during a vehicle reload): spawns a support vehicle if unattached, or adopts the current attacher as support vehicle if its config file matches, reducing component mass. Runs once. |
| `SupportVehicle:addSupportVehicle(isDetach: any)` | 167 | ✍ Asynchronously loads the support vehicle at the input attacher joint (shifted by the spawn offset when detaching), placed on terrain height plus offset. Does nothing if one exists or is loading. |
| `SupportVehicle:supportVehicleLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 199 | ✍ Load callback: stores the loaded vehicle and enables it unless the load came from a detach. If the owner vehicle was deleted meanwhile, deletes the loaded vehicles. Clears the loading flag. |
| `SupportVehicle:enableSupportVehicle()` | 222 | ✍ Positions the loaded support vehicle and this tool using joint offsets, then attaches the tool to it and selects the tool. Reduces component mass. Deletes the support vehicle if the needed joints are missing. |
| `SupportVehicle:removeSupportVehicle()` | 282 | ✍ Deletes the current support vehicle if still alive, clears the reference, and on the server restores normal component mass. |
| `SupportVehicle:getAllowMultipleAttachments(superFunc: any)` | 296 | ✍ Override returning true when a support vehicle filename is configured, so the attach dialog can still be shown while attached. |
| `SupportVehicle:resolveMultipleAttachments(superFunc: any)` | 302 | ✍ Override: on the server removes the support vehicle first, then calls the parent. |
| `SupportVehicle:getShowAttachableMapHotspot(superFunc: any)` | 312 | ✍ Override: with a support vehicle, shows the hotspot only if that support vehicle itself has no attacher vehicle; otherwise uses the parent. |
| `SupportVehicle:getIsReadyToFinishDetachProcess(superFunc: any)` | 322 | ✍ Override: detach may finish only if the parent allows it and the support vehicle is either not loading or already loaded. |
| `SupportVehicle:startDetachProcess(superFunc: any, noEventSend: any)` | 329 | ✍ Override: unless the vehicle is being deleted, requests a support vehicle spawn for the detach, then calls the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `addSupportVehicle` | 40 |
| registerFunction | `enableSupportVehicle` | 41 |
| registerFunction | `removeSupportVehicle` | 42 |
| registerOverwrittenFunction | `getAllowMultipleAttachments` | 48 |
| registerOverwrittenFunction | `resolveMultipleAttachments` | 49 |
| registerOverwrittenFunction | `getShowAttachableMapHotspot` | 50 |
| registerOverwrittenFunction | `getIsReadyToFinishDetachProcess` | 51 |
| registerOverwrittenFunction | `startDetachProcess` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onDelete` | 59 |
| registerEventListener | `onUpdate` | 60 |
| registerEventListener | `onPostDetach` | 61 |
