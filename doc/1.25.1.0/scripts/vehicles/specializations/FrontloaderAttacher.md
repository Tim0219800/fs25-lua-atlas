# vehicles/specializations/FrontloaderAttacher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FrontloaderAttacher.md)*

Source: `dataS/scripts/vehicles/specializations/FrontloaderAttacher.lua` — FS25 1.25.1.0

✍ Specialization for tractors with a selectable frontloader attacher configuration. On the server, attaching a frontloader-type implement locks the configured front axis component joint (rotation limits set to 0), and detaching restores the saved limits. Requires AttacherJoints.

- **FrontloaderAttacher** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FrontloaderAttacher.prerequisitesPresent(specializations: any)` | 15 | ✍ Requires the AttacherJoints specialization. |
| `FrontloaderAttacher.registerEventListeners(vehicleType: any)` | 21 | ✍ Subscribes to load, pre-attach implement and pre-detach implement events. |
| `FrontloaderAttacher.initSpecialization()` | 29 | ✍ Registers the "frontloader" vehicle configuration type and the XML attributes frontAxisLimitJoint and frontAxisJoint of a frontloader configuration's attacherJoint. |
| `FrontloaderAttacher:onLoad(savegame: any)` | 44 | ✍ Reads the active frontloader configuration to find the front axis component joint that should be limited while a frontloader is attached (index must exist, else XML warning). Removes the attach/detach listeners on clients or when no such joint is set. |
| `FrontloaderAttacher:onPreDetachImplement(implement: any)` | 70 | ✍ Server: when a frontloader-type implement is detached, restores the front axis joint's rotation limits saved at attach time on all three axes. |
| `FrontloaderAttacher:onPreAttachImplement(attachable: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 92 | ✍ Server: when a frontloader-type implement is attached, saves the front axis joint's rotation limits and locks its three rotation limits to 0 so the axle no longer pivots. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 22 |
| registerEventListener | `onPreDetachImplement` | 23 |
| registerEventListener | `onPreAttachImplement` | 24 |
